#!/bin/bash

# Written by Filip Oščádal <filip@mxd.cz> <http://mxd.cz/>
# Distributed under license GPLv3+ GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY. YOU USE AT YOUR OWN RISK. THE AUTHOR
# WILL NOT BE LIABLE FOR DATA LOSS, DAMAGES, LOSS OF PROFITS OR ANY
# OTHER  KIND OF LOSS WHILE USING OR MISUSING THIS SOFTWARE.
# See the GNU General Public License for more details.


# check syntax
if [ $# -eq 0 ]
then
  echo -e "\nConvert FLAC files to MP3 recursively.\n\nSyntax: $(basename $0) <folder>\n"
  exit 1
fi
if [ -n "$1" ]
then
  if [ -d "$1" ]
  then
    cd "$1"
  else
    echo -e "Invalid folder: $1\n"
    exit 1
  fi
fi

# check for installed app
which flac >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo -e "Installing flac package...\n"
  sudo apt-get install flac
fi
which flac >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo -e "Flac is not installed!\n"
  exit 1
fi
# check for installed app
which lame >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo -e "Installing lame package...\n"
  sudo apt-get install lame
fi
which lame >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo -e "Lame is not installed!\n"
  exit 1
fi

# recurse any directories first
for i in *
do
  if [ -d "$i" ]
  then
    echo "Recursing into directory: $i"
    $0 "$i"
  fi
done

# convert recursively
for i in *.flac
do
  if [ -d "$i" ]
  then
    echo "Recursing into directory: $i"
    $0 "$i"
  fi
  if [ -f "$i" ]
  then
    echo "Converting: $i"
    /usr/bin/flac -d "$i"
    /usr/bin/lame -b 320 "${i%.flac}.wav" "${i%.flac}.mp3"
  fi
done

sync

echo -e "\nDone.\n"
exit 0

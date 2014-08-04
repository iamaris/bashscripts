#!/bin/bash

cat data.txt | while read line
do
  echo $line; 
done


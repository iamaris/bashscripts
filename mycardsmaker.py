#!/usr/bin/python
import subprocess
 
#subprocess.call(["df","-h","./"])
#subprocess.call("df -h", shell=True)

f = open('data.txt','r')
data = f.readlines()
f.close()
for a in data:
   #print len(a.split())
   b = a.split()
   c = ["./makecards.sh",b[0],b[1],b[2],b[3],b[4],b[5],b[6],b[7],b[8]]
   print c
   subprocess.call(c)
#subprocess.call(["./makecards.sh","400","25"])

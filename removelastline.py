#!/usr/bin/env python
import os, sys

readFile = open("file")

lines = readFile.readlines()

readFile.close()
w = open("file",'w')

w.writelines([item for item in lines[:-6]])

w.close()

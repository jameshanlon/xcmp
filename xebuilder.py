#!/usr/bin/python

# NOTE: .write("string") doesn't work in python3, need to use bytes(...)

import sys
import os
import struct
import StringIO

def writeSection(out, coreNumber, fn):

  jtagIndex = 0
  loadAddress = 0

  # ELF sector
  elfSector = StringIO.StringIO()
  elfSector.write(struct.pack("H", jtagIndex))
  elfSector.write(struct.pack("H", coreNumber))
  elfSector.write(struct.pack("L", loadAddress))
  f = open(fn,"rb")
  data = f.read()
  f.close()
  elfSector.write(data)
  elfSector.seek(0, os.SEEK_END)
  elfSectorSize = elfSector.tell()
  elfSector.seek(0)
  
  # Sector contents block
  contentsBlock = StringIO.StringIO()
  padding = 4 - (elfSectorSize % 4)
  contentsBlock.write(struct.pack("B", padding)) # Padding
  contentsBlock.write("\0\0\0") # Reserved
  contentsBlock.write(elfSector.getvalue())
  elfSector.close()
  for i in range(0, padding):
    contentsBlock.write("\0")
  contentsBlock.write("\0\0\0\0") # Disable CRC check
  contentsBlock.seek(0, os.SEEK_END)
  contentsBlockSize = contentsBlock.tell()
  contentsBlock.seek(0)

  # Sector header
  out.write("\x02\0")
  out.write("\0\0")
  out.write(struct.pack("L", contentsBlockSize))
  out.write(contentsBlock.getvalue())
  contentsBlock.close()

  # GOTO section
  out.write("\x05\0")
  out.write("\0\0")
  out.write("\x14\0\0\0\0\0\0\0")
  out.write("\0\0\0\0")
  out.write("%c\0" % jtagIndex)
  out.write("%c\0" % coreNumber)
  out.write("\0\0\0\0\0\0\0\0")
  out.write("\0\0\0\0") # CRC
  f.close()

if len(sys.argv) < 5:
  print("ERROR: Usage:"+sys.argv[0]+" <num-cores> core0elf core1elf core2elf")
  sys.exit(1)

numCores = int(sys.argv[1])
out = open("a.xe", "wb")

# XE header
out.write("XMOS\1\0\0\0")

# List of sectors
writeSection(out, 0, sys.argv[2])
writeSection(out, 1, sys.argv[3])
for i in range(2, numCores):
  #print("Core %d" % i)
  writeSection(out, i, sys.argv[4]) 

# End of file
out.write("\x55\x55")
out.write("\0\0")
out.write("\0\0\0\0\0\0\0\0")
out.close()


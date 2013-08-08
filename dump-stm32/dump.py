#!/usr/bin/python
import serial
import binascii

ser = serial.Serial('/dev/ttyACM0', 115200)
f = open('stm32_rng.dat', 'wb')
for i in xrange(65536):
	ser.write("\n")
	x = ser.read(32)
	f.write(binascii.unhexlify(x))

ser.close()

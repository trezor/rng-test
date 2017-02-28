DATA=$(wildcard *.dat)

all: dieharder ent rngtest

dieharder: $(DATA:%.dat=%.dieharder)

ent: $(DATA:%.dat=%.ent)

rngtest: $(DATA:%.dat=%.rngtest)

%.dieharder: %.dat
	dieharder -a -f $< > $@

%.ent: %.dat
	ent $< > $@

%.rngtest: %.dat
	cat $< | rngtest 2> $@ || true

osrandom:
	for i in 1 2 3 4; do dd if=/dev/random bs=64K count=1 of=dev_random_$$i.dat iflag=fullblock; done

osurandom:
	for i in 1 2 3 4 5 6 7 8; do dd if=/dev/urandom bs=1M count=1 of=dev_urandom_$$i.dat iflag=fullblock; done

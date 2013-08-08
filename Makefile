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

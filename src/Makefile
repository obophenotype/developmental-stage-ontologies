ONTS = mmusdv hsapdv zfs

#all: $(patsubst %, %/%.owl, $(ONTS))

all: mmusdv/mmusdv.owl hsapdv/hsapdv.owl zfs/zfs.owl

%.owl: %.obo
	obolib-obo2owl $< -o $@

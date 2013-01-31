ONTS = mmusdv hsapdv zfs

#all: $(patsubst %, %/%.owl, $(ONTS))

all: mmusdv/mmusdv.owl hsapdv/hsapdv.owl zfs/zfs.owl

%.owl: %.obo
	obolib-obo2owl $< -o $@

mmusdv/mmusdv.png: mmusdv/mmusdv.obo
	blip ontol-subset -i mmusdv/mmusdv.obo -n % -to png -u ontol_config_fbdv -cr part_of -rel part_of -rel preceded_by > $@

hsapdv/hsapdv.png: hsapdv/hsapdv.obo
	blip ontol-subset -i hsapdv/hsapdv.obo -n % -to png -u ontol_config_fbdv -cr part_of -rel part_of -rel preceded_by > $@

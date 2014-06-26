OWLTOOLS:=owltools

BRIDGE_PARAMS_SUFFIX:=-bridge-params.tsv
BRIDGE_UBERON_SUFFIX:=-bridge-to-uberon.obo
COMPOSITE_UBERON_SUFFIX:=-uberon.obo

ONT_PREFIXES:= acardv btaudv drerdv ggaldv ggordv hsapdv mdomdv metadv mmuldv mmusdv oanadv olatdv pdumdv ppandv ppygdv ptrodv rnordv sscrdv tnigdv xtrodv zfs

define make_all_targets
$1/$1.owl $1/$1$(COMPOSITE_UBERON_SUFFIX) 
endef

all: $(foreach d,$(ONT_PREFIXES),$(call make_all_targets,$d))

clean: 
	$(foreach o, $(ONT_PREFIXES), -@rm -f $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))

%.owl: %.obo
	@$(OWLTOOLS) $< -o $@ 

%$(COMPOSITE_UBERON_SUFFIX): %$(BRIDGE_PARAMS_SUFFIX) %.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	util/make-bridge-axioms.pl $$taxId "$$speciesName" $*.obo > $*$(BRIDGE_UBERON_SUFFIX); \
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $*.obo $*$(BRIDGE_UBERON_SUFFIX) --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $@

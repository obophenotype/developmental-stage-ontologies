OWLTOOLS:=/Users/admin/Documents/workspace/owltools/OWLTools-Runner/bin/owltools
RM:= rm -f

BRIDGE_PARAMS_SUFFIX:=-bridge-params.tsv
BRIDGE_UBERON_SUFFIX:=-bridge-to-uberon.obo
COMPOSITE_UBERON_SUFFIX:=-uberon.obo

MMULDV_PREFIX:=mmuldv/mmuldv

all: $(MMULDV_PREFIX).owl $(MMULDV_PREFIX)$(COMPOSITE_UBERON_SUFFIX)

%.owl: %.obo
	$(OWLTOOLS) $< -o $@ 

%$(COMPOSITE_UBERON_SUFFIX): %$(BRIDGE_PARAMS_SUFFIX) %.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	util/make-bridge-axioms.pl $$taxId "$$speciesName" $*.obo > $*$(BRIDGE_UBERON_SUFFIX); \
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $*.obo $*$(BRIDGE_UBERON_SUFFIX) --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $@

clean: 
	-@$(RM) $(MMULDV_PREFIX).owl $(MMULDV_PREFIX)$(BRIDGE_UBERON_SUFFIX) $(MMULDV_PREFIX)$(COMPOSITE_UBERON_SUFFIX)

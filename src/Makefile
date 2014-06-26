OBO:=http://purl.obolibrary.org/obo/
OWLTOOLS:=owltools

all: mmuldv/mmuldv-uberon.obo

%.owl: %.obo
	$(OWLTOOLS) $< -o $@ 
.PRECIOUS: %.owl

# We do not need specifically an owl version for this task, 
# but this allows to make sure the owl version is generated.
# The perl script only read OBO files.
%-uberon.obo: %-bridge-params.tsv %.owl %.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	util/make-bridge-axioms.pl $$taxId "$$speciesName" $*.obo > $*-bridge-to-uberon.obo; \
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $*.owl $*-bridge-to-uberon.obo --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $@

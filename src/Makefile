OBO=http://purl.obolibrary.org/obo

#add a file named utils/owltools.vmoptions to define JVM options
OWLTOOLS:=util/owltools


BRIDGE_PARAMS_SUFFIX:=-bridge-params.tsv
BRIDGE_UBERON_SUFFIX:=-bridge-to-uberon.obo
COMPOSITE_UBERON_SUFFIX:=-uberon.obo

ONT_PREFIXES:= acardv btaudv cfamdv cpordv danadv dmojdv dpsedv dsimdv dvirdv dyakdv ecabdv eeurdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv ocundv olatdv ppandv ppygdv ptrodv rnordv sscrdv tnigdv

#trick inspired from http://blog.jgc.org/2012/01/using-gnu-makes-define-and-eval-to.html
all: $(foreach d,$(ONT_PREFIXES), $d/$d.owl $d/$d$(COMPOSITE_UBERON_SUFFIX))

DERIVED = $(foreach o, $(ONT_PREFIXES), $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))

clean: 
	@rm -f $(DERIVED)
#	$(foreach o, $(ONT_PREFIXES), @rm -f $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))

%.owl: %.obo
	@$(OWLTOOLS) $< -o $@ 

%$(COMPOSITE_UBERON_SUFFIX): %$(BRIDGE_PARAMS_SUFFIX) %.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	util/make-bridge-axioms.pl $$taxId "$$speciesName" $*.obo > $*$(BRIDGE_UBERON_SUFFIX); \
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $*.obo $*$(BRIDGE_UBERON_SUFFIX) --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $@

ALL_OBO := $(patsubst %, */%.obo,$(ONT_PREFIXES))
ssso-merged.obo: $(ALL_OBO)
	@$(OWLTOOLS) --create-ontology $(OBO)/uberon/stages-merged.owl $^ --merge-support-ontologies -o -f obo --no-check $@

ALL_COMPOSITE_OBO := $(patsubst %, */%-uberon.obo,$(ONT_PREFIXES))
ssso-merged-uberon.obo: $(ALL_COMPOSITE_OBO)
	owltools --create-ontology $(OBO)/uberon/ssso-merged-uberon.owl $^ --merge-support-ontologies -o -f obo --no-check $@

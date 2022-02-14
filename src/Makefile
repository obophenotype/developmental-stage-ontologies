OBO=http://purl.obolibrary.org/obo

#add a file named utils/owltools.vmoptions to define JVM options
OWLTOOLS:=util/owltools


BRIDGE_PARAMS_SUFFIX:=-bridge-params.tsv
BRIDGE_UBERON_SUFFIX:=-bridge-to-uberon.obo
COMPOSITE_UBERON_SUFFIX:=-uberon.obo

#ONT_PREFIXES:= acardv btaudv cfamdv cpordv danadv dmojdv dpsedv dsimdv dvirdv dyakdv ecabdv eeurdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv olatdv ppandv ppygdv ptrodv rnordv sscrdv tnigdv
#ONT_PREFIXES:= acardv btaudv cfamdv cpordv dpsedv dsimdv ecabdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv olatdv ppandv ptrodv rnordv sscrdv
ONT_PREFIXES:= acardv btaudv cfamdv cpordv dpsedv dsimdv ecabdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv ppandv ptrodv rnordv sscrdv

#trick inspired from http://blog.jgc.org/2012/01/using-gnu-makes-define-and-eval-to.html
all: $(foreach d,$(ONT_PREFIXES), $d/$d.owl $d/$d$(COMPOSITE_UBERON_SUFFIX)) ssso-merged.obo ssso-merged-uberon.obo

DERIVED = $(foreach o, $(ONT_PREFIXES), $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))

clean: 
	@rm -f $(DERIVED)
#	$(foreach o, $(ONT_PREFIXES), @rm -f $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))
	@rm -f external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX)
	@rm -f external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX)
	@rm -f ssso-merged.obo
	@rm -f ssso-merged-uberon.obo

%.owl: %.obo
	@$(OWLTOOLS) $< -o $@ 

%$(BRIDGE_UBERON_SUFFIX): %$(BRIDGE_PARAMS_SUFFIX) %.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	util/make-bridge-axioms.pl $$taxId "$$speciesName" $*.obo > $*$(BRIDGE_UBERON_SUFFIX)

%$(COMPOSITE_UBERON_SUFFIX): %$(BRIDGE_PARAMS_SUFFIX) %.obo %$(BRIDGE_UBERON_SUFFIX)
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $*.obo $*$(BRIDGE_UBERON_SUFFIX) --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $@

# cURL command, to download files only if more recently changed
# (it was not working correctly with wget in our case)
# -s: silent, no progress bar displayed;
# -S: if silent, still shows error message if it fails;
# -L: in case of redirection, follow it and redo the request, this is necessary to correctly get modification date;
# -f: in case of error do not display the document returned.
# -R: make the local file have the same timestamp as remote file
# Sould be used with option -z filename: download remote file only if more recent than the provided file
# And with -o option to choose output file name.
# See variable APPEND_CURL_COMMAND.
CURL := curl -s -S -L -f -R
# variable to append to cURL command to download a file only if remote file more recent than targeted file,
# download in a temp file and move to stable location on success; delete temp file on error
# Variable to be recursively expanded.
# -z filename: download remote file only if last modification date more recent that modification date of downloadfile
# -o filename: store downloaded file into filename
# Redirect stderr of mv to /dev/null in case the file was not redownloaded so that the temp file does not exist
APPEND_CURL_COMMAND = -z $@ -o $@.tmp && mv -f $@.tmp $@ 2>/dev/null || rm -f $@.tmp $@

external_ontologies/zfs/zfs.obo:
	@$(CURL) http://purl.obolibrary.org/obo/zfs.obo $(APPEND_CURL_COMMAND)
external_ontologies/zfs/uberon-bridge-to-zfs.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-zfs.obo $(APPEND_CURL_COMMAND)
external_ontologies/fbdv/fbdv.obo:
	@$(CURL) http://purl.obolibrary.org/obo/fbdv.obo $(APPEND_CURL_COMMAND)
external_ontologies/fbdv/uberon-bridge-to-fbdv.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-fbdv.obo $(APPEND_CURL_COMMAND)

external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX): external_ontologies/zfs/zfs.obo external_ontologies/zfs/uberon-bridge-to-zfs-modified.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "Danio" -t NCBITaxon:7954 -o -f obo --no-check $@

external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX): external_ontologies/fbdv/fbdv-modified.obo external_ontologies/fbdv/uberon-bridge-to-fbdv-modified.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "fruit fly" -t NCBITaxon:7227 -o -f obo --no-check $@

external_ontologies/wbls/wbls$(COMPOSITE_UBERON_SUFFIX): external_ontologies/wbls/wbls-modified.obo external_ontologies/wbls/uberon-bridge-to-wbls-modified.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies --reasoner elk --merge-species-ontology -s "nematode" -t NCBITaxon:6237 -o -f obo --no-check $@
#	$(OWLTOOLS)  --create-ontology uberon/bridge/$@.temp $^ --merge-support-ontologies --reasoner elk -o -f obo --no-check $@
#	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $@.temp --reasoner elk --merge-species-ontology -s "nematodes" -t NCBITaxon:6237 -o -f obo --no-check $@

ALL_OBO := $(patsubst %, */%.obo,$(ONT_PREFIXES))
ssso-merged.obo: life-stages-minimal.obo $(ALL_OBO) external_ontologies/zfs/zfs.obo external_ontologies/fbdv/fbdv-modified.obo
	@$(OWLTOOLS) --create-ontology $(OBO)/uberon/stages-merged.owl $^ --merge-support-ontologies -o -f obo --no-check $@

ALL_COMPOSITE_OBO := $(patsubst %, */%-uberon.obo,$(ONT_PREFIXES))
ssso-merged-uberon.obo: life-stages-minimal.obo $(ALL_COMPOSITE_OBO) external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX) external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX) external_ontologies/wbls/wbls-uberon-modified.obo
	@$(OWLTOOLS) --create-ontology $(OBO)/uberon/ssso-merged-uberon.owl $^ --merge-support-ontologies -o -f obo --no-check $@

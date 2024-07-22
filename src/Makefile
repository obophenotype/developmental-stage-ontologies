.PHONY: clean

OBO=http://purl.obolibrary.org/obo

#add a file named utils/owltools.vmoptions to define JVM options
OWLTOOLS:=util/owltools


BRIDGE_PARAMS_SUFFIX:=-bridge-params.tsv
BRIDGE_UBERON_SUFFIX:=-bridge-to-uberon.obo
COMPOSITE_UBERON_SUFFIX:=-uberon.obo

#ONT_PREFIXES:= acardv btaudv cfamdv cpordv danadv dmojdv dpsedv dsimdv dvirdv dyakdv ecabdv eeurdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv olatdv pdumdv ppandv ppygdv ptrodv rnordv sscrdv tnigdv
ONT_PREFIXES:= acardv btaudv cfamdv cpordv dpsedv dsimdv ecabdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv ppandv ptrodv rnordv sscrdv ssaldv

#trick inspired from http://blog.jgc.org/2012/01/using-gnu-makes-define-and-eval-to.html
all: $(foreach d,$(ONT_PREFIXES), $d/$d.owl $d/$d$(COMPOSITE_UBERON_SUFFIX)) ssso-merged.obo ssso-merged-uberon.obo

DERIVED = $(foreach o, $(ONT_PREFIXES), $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))

clean: 
	@rm -f $(DERIVED)
#	$(foreach o, $(ONT_PREFIXES), @rm -f $o/$o.owl $o/$o$(BRIDGE_UBERON_SUFFIX) $o/$o$(COMPOSITE_UBERON_SUFFIX))
	@rm -f external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX)
	@rm -f external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX)
	@rm -f external_ontologies/xao/xao-dev-stages$(COMPOSITE_UBERON_SUFFIX)
	@rm -f external_ontologies/wbls/wbls$(COMPOSITE_UBERON_SUFFIX)
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
	@$(CURL) https://raw.githubusercontent.com/obophenotype/developmental-stage-ontologies/master/src/zfs/zfs.obo $(APPEND_CURL_COMMAND)
external_ontologies/zfs/uberon-bridge-to-zfs.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-zfs.obo $(APPEND_CURL_COMMAND)
external_ontologies/fbdv/fbdv.obo:
	@$(CURL) http://purl.obolibrary.org/obo/fbdv.obo $(APPEND_CURL_COMMAND)
external_ontologies/fbdv/uberon-bridge-to-fbdv.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-fbdv.obo $(APPEND_CURL_COMMAND)
external_ontologies/wbls/wbls.obo:
	@$(CURL) http://purl.obolibrary.org/obo/wbls.obo $(APPEND_CURL_COMMAND)
external_ontologies/wbls/uberon-bridge-to-wbls.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-wbls.obo $(APPEND_CURL_COMMAND)
external_ontologies/xao/uberon-bridge-to-xao.obo:
	@$(CURL) http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-xao.obo $(APPEND_CURL_COMMAND)

external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX): external_ontologies/zfs/zfs.obo external_ontologies/zfs/uberon-bridge-to-zfs.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "Danio" -t NCBITaxon:7954 -o -f obo --no-check $@

external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX): external_ontologies/fbdv/fbdv.obo external_ontologies/fbdv/uberon-bridge-to-fbdv.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "fruit fly" -t NCBITaxon:7227 -o -f obo --no-check $@

external_ontologies/wbls/wbls$(COMPOSITE_UBERON_SUFFIX): external_ontologies/wbls/wbls.obo external_ontologies/wbls/uberon-bridge-to-wbls.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies --reasoner elk --merge-species-ontology -s "nematode" -t NCBITaxon:6237 -o -f obo --no-check $@

external_ontologies/xao/xao-dev-stages$(COMPOSITE_UBERON_SUFFIX): external_ontologies/xao/xao-dev-stages.obo external_ontologies/xao/uberon-bridge-to-xao.obo
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies --reasoner elk --merge-species-ontology -s "Xenopus" -t NCBITaxon:8353 -o -f obo --no-check $@

ALL_OBO := $(patsubst %, */%.obo,$(ONT_PREFIXES))
ssso-merged.obo: life-stages-minimal.obo $(ALL_OBO) external_ontologies/zfs/zfs.obo external_ontologies/fbdv/fbdv.obo external_ontologies/wbls/wbls.obo external_ontologies/xao/xao-dev-stages.obo
	@$(OWLTOOLS) --create-ontology $(OBO)/uberon/stages-merged.owl $^ --merge-support-ontologies -o -f obo --no-check $@

ALL_COMPOSITE_OBO := $(patsubst %, */%$(COMPOSITE_UBERON_SUFFIX),$(ONT_PREFIXES))
ssso-merged-uberon.obo: life-stages-minimal.obo $(ALL_COMPOSITE_OBO) external_ontologies/zfs/zfs$(COMPOSITE_UBERON_SUFFIX) external_ontologies/fbdv/fbdv$(COMPOSITE_UBERON_SUFFIX) external_ontologies/wbls/wbls$(COMPOSITE_UBERON_SUFFIX) external_ontologies/xao/xao-dev-stages$(COMPOSITE_UBERON_SUFFIX)
	@$(OWLTOOLS) --create-ontology $(OBO)/uberon/ssso-merged-uberon.owl $^ --merge-support-ontologies -o -f obo --no-check $@

.PRECIOUS:  ssso-merged.obo
.PRECIOUS:  ssso-merged-uberon.obo
.PRECIOUS:  sscrdv/sscrdv.owl
.PRECIOUS:  sscrdv/sscrdv-bridge-to-uberon.obo
.PRECIOUS:  rnordv/rnordv.owl
.PRECIOUS:  rnordv/rnordv-bridge-to-uberon.obo
.PRECIOUS:  ptrodv/ptrodv.owl
.PRECIOUS:  ptrodv/ptrodv-bridge-to-uberon.obo
.PRECIOUS:  ppandv/ppandv.owl
.PRECIOUS:  ppandv/ppandv-bridge-to-uberon.obo
.PRECIOUS:  ocundv/ocundv.owl
.PRECIOUS:  ocundv/ocundv-bridge-to-uberon.obo
.PRECIOUS:  oaridv/oaridv.owl
.PRECIOUS:  oaridv/oaridv-bridge-to-uberon.obo
.PRECIOUS:  oanadv/oanadv.owl
.PRECIOUS:  oanadv/oanadv-bridge-to-uberon.obo
.PRECIOUS:  mmusdv/mmusdv.owl
.PRECIOUS:  mmusdv/mmusdv-bridge-to-uberon.obo
.PRECIOUS:  mmuldv/mmuldv.owl
.PRECIOUS:  mmuldv/mmuldv-bridge-to-uberon.obo
.PRECIOUS:  mdomdv/mdomdv.owl
.PRECIOUS:  mdomdv/mdomdv-bridge-to-uberon.obo
.PRECIOUS:  Makefile
.PRECIOUS:  hsapdv/hsapdv.owl
.PRECIOUS:  hsapdv/hsapdv-bridge-to-uberon.obo
.PRECIOUS:  ggordv/ggordv.owl
.PRECIOUS:  ggordv/ggordv-bridge-to-uberon.obo
.PRECIOUS:  ggaldv/ggaldv.owl
.PRECIOUS:  ggaldv/ggaldv-bridge-to-uberon.obo
.PRECIOUS:  fcatdv/fcatdv.owl
.PRECIOUS:  fcatdv/fcatdv-bridge-to-uberon.obo
.PRECIOUS:  external_ontologies/zfs/zfs.obo
.PRECIOUS:  external_ontologies/zfs/zfs-uberon.obo
.PRECIOUS:  external_ontologies/zfs/uberon-bridge-to-zfs.obo
.PRECIOUS:  olatdv/olatdv-bridge-to-uberon.obo
.PRECIOUS:  pdumdv/pdumdv-bridge-to-uberon.obo
.PRECIOUS:  external_ontologies/xao/xao-dev-stages-uberon.obo
.PRECIOUS:  external_ontologies/xao/uberon-bridge-to-xao.obo
.PRECIOUS:  external_ontologies/wbls/wbls.obo
.PRECIOUS:  external_ontologies/wbls/wbls-uberon.obo
.PRECIOUS:  external_ontologies/wbls/uberon-bridge-to-wbls.obo
.PRECIOUS:  external_ontologies/fbdv/uberon-bridge-to-fbdv.obo
.PRECIOUS:  external_ontologies/fbdv/fbdv.obo
.PRECIOUS:  external_ontologies/fbdv/fbdv-uberon.obo
.PRECIOUS:  ecabdv/ecabdv.owl
.PRECIOUS:  ecabdv/ecabdv-bridge-to-uberon.obo
.PRECIOUS:  dsimdv/dsimdv.owl
.PRECIOUS:  dsimdv/dsimdv-bridge-to-uberon.obo
.PRECIOUS:  dpsedv/dpsedv.owl
.PRECIOUS:  dpsedv/dpsedv-bridge-to-uberon.obo
.PRECIOUS:  cpordv/cpordv.owl
.PRECIOUS:  cpordv/cpordv-bridge-to-uberon.obo
.PRECIOUS:  cfamdv/cfamdv.owl
.PRECIOUS:  cfamdv/cfamdv-bridge-to-uberon.obo
.PRECIOUS:  btaudv/btaudv.owl
.PRECIOUS:  btaudv/btaudv-bridge-to-uberon.obo
.PRECIOUS:  acardv/acardv.owl
.PRECIOUS:  acardv/acardv-bridge-to-uberon.obo

.PHONY: github-release
github-release:
	FILES=""; \
	for dir in *; do \
		if [ -d "$$dir" ]; then \
			for ext in owl obo; do \
				if [ -f "$$dir/`basename $$dir`.$$ext" ]; then \
					FILES="$$FILES $$dir/`basename $$dir`.$$ext"; \
				fi; \
			done; \
		fi; \
	done; \
	FILES="$$FILES ssso-merged-uberon.obo ssso-merged.obo"; \
	test $(GHVERSION); \
	ls -alt $$FILES; \
	gh release create $(GHVERSION) --notes "TBD." --title "$(GHVERSION)" --draft $$FILES

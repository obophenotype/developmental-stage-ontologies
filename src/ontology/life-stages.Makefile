ONT_PREFIXES = acardv btaudv cfamdv cpordv dpsedv dsimdv ecabdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv ppandv ptrodv rnordv sscrdv ssaldv zfs
ONT_PREFIXES_EXTERNAL = fbdv wbls xao #zfs SHOULD BE ADDED HERE BUT STILL DEBATE WHERE SOURCE OF TRUTH IS

# The components are primary release artefacts in this repo, so they get proper versioning
$(COMPONENTSDIR)/%.owl: $(COMPONENTSDIR)/%.obo
	$(ROBOT) \
		merge --input $< \
		annotate \
		-V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION) \
		--ontology-iri $(ONTBASE)/$@ \
		convert -o $@ --format ofn --output $@
.PRECIOUS: $(COMPONENTSDIR)/%.owl

$(COMPONENTSDIR)/%.json: $(COMPONENTSDIR)/%.owl
	$(ROBOT) convert --input $< --format json --output $@
.PRECIOUS: $(COMPONENTSDIR)/%.json

#ALL_MANUALLY_CURATED_COMPONENTS := $(foreach f,$(ONT_PREFIXES), $(COMPONENTSDIR)/$(f).obo)
ALL_MANUALLY_CURATED_COMPONENTS_OFN := $(foreach f,$(ONT_PREFIXES), $(COMPONENTSDIR)/$(f).owl)
ALL_MANUALLY_CURATED_COMPONENTS_JSON := $(foreach f,$(ONT_PREFIXES), $(COMPONENTSDIR)/$(f).json)

$(COMPONENTSDIR)/merged-manual.owl: $(ALL_MANUALLY_CURATED_COMPONENTS_OFN)
	$(ROBOT) merge $(foreach f,$^, -i $(f)) --output $@

$(COMPONENTSDIR)/%-bridge-to-uberon.obo: $(COMPONENTSDIR)/%.obo $(COMPONENTSDIR)/%-bridge-params.tsv
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $(COMPONENTSDIR)/$*-bridge-params.tsv; \
	IFS=$$IFS_OLD; \
	../util/make-bridge-axioms.pl $$taxId "$$speciesName" $< > $(TMPDIR)/$*-bridge-to-uberon.obo
	$(ROBOT) merge --input $(TMPDIR)/$*-bridge-to-uberon.obo convert --format obo --output $@


# @matentzn: I am leaving this in COMPONENTSDIR so it can be reviewed during release
# We could also decide not to do commit this
$(COMPONENTSDIR)/%-uberon.obo: $(COMPONENTSDIR)/%-bridge-params.tsv $(COMPONENTSDIR)/%.obo $(COMPONENTSDIR)/%-bridge-to-uberon.obo
	@IFS_OLD=$$IFS; \
	IFS=$$"	"; \
	read speciesName taxId < $<; \
	IFS=$$IFS_OLD; \
	$(OWLTOOLS) --create-ontology uberon/bridge/$@ $(COMPONENTSDIR)/$*.obo $(COMPONENTSDIR)/$*-bridge-to-uberon.obo --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "$$speciesName" -t $$taxId -o -f obo --no-check $(TMPDIR)/$*-uberon.obo
	$(ROBOT) merge --input $(TMPDIR)/$*-uberon.obo convert --format obo --output $@

$(TMPDIR)/%-uberon.ofn: $(COMPONENTSDIR)/%-uberon.obo
	$(ROBOT) convert --input $< --format ofn --output $@
.PRECIOUS: $(TMPDIR)/%-uberon.ofn

$(TMPDIR)/fbdv-uberon.ofn: $(IMPORTDIR)/fbdv_import.owl $(IMPORTDIR)/uberon-bridge-to-fbdv_import.owl
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies  --reasoner elk --merge-species-ontology -s "fruit fly" -t NCBITaxon:7227 -o -f obo --no-check $(TMPDIR)/fbdv-uberon.obo
	$(ROBOT) convert --input $(TMPDIR)/fbdv-uberon.obo --format ofn --output $@

$(TMPDIR)/wbls-uberon.ofn: $(IMPORTDIR)/wbls_import.owl $(IMPORTDIR)/uberon-bridge-to-wbls_import.owl
	$(OWLTOOLS)  --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies --reasoner elk --merge-species-ontology -s "nematode" -t NCBITaxon:6237 -o -f obo --no-check $(TMPDIR)/wbls-uberon.obo
	$(ROBOT) convert --input $(TMPDIR)/wbls-uberon.obo --format ofn --output $@

$(TMPDIR)/xao-uberon.ofn: $(IMPORTDIR)/xao_import.owl $(IMPORTDIR)/uberon-bridge-to-xao_import.owl
	$(OWLTOOLS) --create-ontology uberon/bridge/$@ $^ --merge-support-ontologies --reasoner elk --merge-species-ontology -s "Xenopus" -t NCBITaxon:8353 -o -f obo --no-check $(TMPDIR)/xao-uberon.obo
	$(ROBOT) convert --input $(TMPDIR)/xao-uberon.obo --format ofn --output $@

#### Release files

ALL_EXTERNALLY_CURATED_COMPONENTS := $(foreach f,$(ONT_PREFIXES_EXTERNAL), $(IMPORTDIR)/$(f)_import.owl)

ssso-merged.owl: $(COMPONENTSDIR)/life-stages-minimal.owl $(COMPONENTSDIR)/merged-manual.owl $(ALL_EXTERNALLY_CURATED_COMPONENTS)
	@$(ROBOT) \
		merge $(foreach f,$^, -i $(f)) \
	 	annotate \
			-V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION) \
			--ontology-iri $(OBO)/uberon/stages-merged.owl -o $@

ALL_MANUALLY_CURATED_COMPONENTS_COMPOSITE_OFN := $(foreach f,$(ONT_PREFIXES), $(TMPDIR)/$(f)-uberon.ofn)
ALL_EXTERNALLY_CURATED_COMPONENTS_COMPOSITE_OFN := $(foreach f,$(ONT_PREFIXES_EXTERNAL), $(TMPDIR)/$(f)-uberon.ofn)

ssso-merged-uberon.owl: $(COMPONENTSDIR)/life-stages-minimal.owl $(ALL_MANUALLY_CURATED_COMPONENTS_COMPOSITE_OFN) $(ALL_EXTERNALLY_CURATED_COMPONENTS_COMPOSITE_OFN)
	@$(ROBOT) \
		merge $(foreach f,$^, -i $(f)) \
	 	annotate \
			-V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION) \
			--ontology-iri $(OBO)/uberon/ssso-merged-uberon.owl -o $@

#### Pipeline targets

prepare_release: $(ALL_MANUALLY_CURATED_COMPONENTS_JSON)

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

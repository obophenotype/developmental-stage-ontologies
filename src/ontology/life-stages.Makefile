#### Components

# Active ontologies that should be released.
# Any ontology listed here should also have a corresponding `Import`
# statement in the -edit file, and a corresponding entry in the XML
# catalog.
ONT_PREFIXES = AcarDv BtauDv CfamDv ChirDv CporDv DpseDv DsimDv EcabDv FcatDv GgalDv GgorDv HsapDv MdomDv MmulDv MmusDv OanaDv OariDv OcunDv PpanDv PtroDv RnorDv SsalDv SscrDv ZFS

ONT_PREFIXES_LC = $(shell echo $(ONT_PREFIXES) | tr [:upper:] [:lower:])
ONT_OBO_FILES = $(foreach ont,$(ONT_PREFIXES_LC),$(COMPONENTSDIR)/$(ont).obo)
ONT_OWL_FILES = $(foreach ont,$(ONT_PREFIXES_LC),$(COMPONENTSDIR)/$(ont).owl)
ONT_JSON_FILES = $(foreach ont,$(ONT_PREFIXES_LC),$(COMPONENTSDIR)/$(ont).json)

# The components are primary release artefacts in this repo, so they get proper versioning
$(COMPONENTSDIR)/%.owl: $(COMPONENTSDIR)/%.obo .FORCE
	$(ROBOT) \
		merge --input $< \
		annotate \
		-V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION) \
		--ontology-iri $(ONTBASE)/$@ \
		convert --format ofn --output $@
.PRECIOUS: $(COMPONENTSDIR)/%.owl

$(COMPONENTSDIR)/%.json: $(COMPONENTSDIR)/%.owl .FORCE
	$(ROBOT) convert --input $< --format json --output $@


#### SSSOM Mapping set
# Automatically generated from the xrefs
$(MAPPINGDIR)/life-stages.sssom.tsv: $(SRC) $(ONT_OBO_FILES) | all_robot_plugins
	$(ROBOT) merge -i $< \
		 remove $(foreach pfx,$(ONT_PREFIXES),--base-iri http://purl.obolibrary.org/obo/$(pfx)_) \
		        --axioms external \
		 sssom:xref-extract --mapping-file $@ -v \
		                    --map-prefix-to-predicate 'UBERON semapv:crossSpeciesExactMatch' \
		                    $(foreach pfx,$(ONT_PREFIXES),--prefix '$(pfx): http://purl.obolibrary.org/obo/$(pfx)_')


#### Pipeline targets

# All files to release:
# * the ODK-generated assets (life-stages-{full,base});
# * the individual components (unusual but as mentioned above, they are
#   not merely components but primary release artefacts in their own
#   rights;
# * the SSSOM mapping set (needs to be explicitly included because of a
#   bug in ODK 1.5)
MAIN_FILES_RELEASE = $(foreach n, $(RELEASE_ASSETS), ../../$(n)) \
                     $(ONT_OBO_FILES) $(ONT_OWL_FILES) $(ONT_JSON_FILES) \
                     $(MAPPINGDIR)/life-stages.sssom.tsv

prepare_release: $(ONT_JSON_FILES) $(MAPPINGDIR)/life-stages.sssom.tsv

.PHONY: github-release
github-release:
	test $(GHVERSION)
	ls -alt $(MAIN_FILES_RELEASE)
	gh release create $(GHVERSION) --notes "TBD." --title "$(GHVERSION)" --draft $(MAIN_FILES_RELEASE)

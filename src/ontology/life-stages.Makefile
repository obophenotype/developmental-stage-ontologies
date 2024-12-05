#### Components

ONT_PREFIXES = acardv btaudv cfamdv cpordv dpsedv dsimdv ecabdv fcatdv ggaldv ggordv hsapdv mdomdv mmuldv mmusdv oanadv oaridv ocundv ppandv ptrodv rnordv sscrdv ssaldv zfs
ONT_OBO_FILES = $(foreach ont,$(ONT_PREFIXES),$(COMPONENTSDIR)/$(ont).obo)
ONT_OWL_FILES = $(foreach ont,$(ONT_PREFIXES),$(COMPONENTSDIR)/$(ont).owl)
ONT_JSON_FILES = $(foreach ont,$(ONT_PREFIXES),$(COMPONENTSDIR)/$(ont).json)

# The components are primary release artefacts in this repo, so they get proper versioning
$(COMPONENTSDIR)/%.owl: $(COMPONENTSDIR)/%.obo
	$(ROBOT) \
		merge --input $< \
		annotate \
		-V $(ONTBASE)/releases/$(VERSION)/$@ --annotation owl:versionInfo $(VERSION) \
		--ontology-iri $(ONTBASE)/$@ \
		convert --format ofn --output $@
.PRECIOUS: $(COMPONENTSDIR)/%.owl

$(COMPONENTSDIR)/%.json: $(COMPONENTSDIR)/%.owl
	$(ROBOT) convert --input $< --format json --output $@
.PRECIOUS: $(COMPONENTSDIR)/%.json


#### SSSOM Mapping set
# Automatically generated from the xrefs
$(MAPPINGDIR)/life-stages.sssom.tsv: $(SRC) $(ONT_OBO_FILES) | all_robot_plugins
	$(ROBOT) merge -i $< \
		 sssom:xref-extract --mapping-file $@ -v \
		                    --map-prefix-to-predicate 'UBERON semapv:crossSpeciesExactMatch' \
		                    --prefix 'AcarDv: http://purl.obolibrary.org/obo/AcarDv_' \
		                    --prefix 'BtauDv: http://purl.obolibrary.org/obo/BtauDv_' \
		                    --prefix 'CfamDv: http://purl.obolibrary.org/obo/CfamDv_' \
		                    --prefix 'CporDv: http://purl.obolibrary.org/obo/CporDv_' \
		                    --prefix 'DanaDv: http://purl.obolibrary.org/obo/DanaDv_' \
		                    --prefix 'DpseDv: http://purl.obolibrary.org/obo/DpseDv_' \
		                    --prefix 'DsimDv: http://purl.obolibrary.org/obo/DsimDv_' \
		                    --prefix 'EcabDv: http://purl.obolibrary.org/obo/EcabDv_' \
		                    --prefix 'FcatDv: http://purl.obolibrary.org/obo/FcatDv_' \
		                    --prefix 'GgalDv: http://purl.obolibrary.org/obo/GgalDv_' \
		                    --prefix 'GgorDv: http://purl.obolibrary.org/obo/GgorDv_' \
		                    --prefix 'MdomDv: http://purl.obolibrary.org/obo/MdomDv_' \
		                    --prefix 'MmulDv: http://purl.obolibrary.org/obo/MmulDv_' \
		                    --prefix 'OanaDv: http://purl.obolibrary.org/obo/OanaDv_' \
		                    --prefix 'OariDv: http://purl.obolibrary.org/obo/OariDv_' \
		                    --prefix 'OcunDv: http://purl.obolibrary.org/obo/OcunDv_' \
		                    --prefix 'PpanDv: http://purl.obolibrary.org/obo/PpanDv_' \
		                    --prefix 'PtroDv: http://purl.obolibrary.org/obo/PtroDv_' \
		                    --prefix 'RnorDv: http://purl.obolibrary.org/obo/RnorDv_' \
		                    --prefix 'SsalDv: http://purl.obolibrary.org/obo/SsalDv_' \
		                    --prefix 'SscrDv: http://purl.obolibrary.org/obo/SscrDv_'



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

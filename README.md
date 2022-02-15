[![Build Status](https://travis-ci.org/obophenotype/developmental-stage-ontologies.svg?branch=master)](https://travis-ci.org/obophenotype/developmental-stage-ontologies)
[![DOI](https://zenodo.org/badge/13996/obophenotype/developmental-stage-ontologies.svg)](https://zenodo.org/badge/latestdoi/13996/obophenotype/developmental-stage-ontologies)

# Developmental stage ontologies

This repository hosts developmental stage ontologies developed for many animal species, as well as a merge of all these ontologies into the structure of Uberon. This notably includes [hsapdv.obo](src/hsapdv/hsapdv.obo) for human, and [mmusdv.obo](src/mmusdv/mmusdv.obo) for mouse.

## Ontology development

For documentation about development of developmental stage ontologies, see https://github.com/obophenotype/developmental-stage-ontologies/wiki

## life-stages-minimal

[life-stages-minimal.obo](src/life-stages-minimal.obo) is the core structure of developmental stages in Uberon. It is in this structure that all species-specific developmental stage ontologies will be merged.

## Species-specific developmental stage ontologies

### Namespaces

All species-specific developmental stage ontologies developed as part of this project are present in the [src folder](src/), each in a subdirectory. The nomanclature for naming these ontologies is: first letter of genus name + three first letters of species name + 'dv' suffix. For example, for Homo sapiens, the corresponding namespace is hsapdv, and files related to this ontology are present in [src/hsapdv/](src/hsapdv/).

### Source files

In each species-specific ontology folder, there are two files used to generate the necessary downstream files:

* namespace.obo (for instance, [hsapdv.obo](src/hsapdv/hsapdv.obo)): the source ontology file in OBO format
  * in this ontology, each term has an ID corresponding to the namespace.
  * Terms that are mappable to Uberon terms present in [life-stages-minimal.obo](src/life-stages-minimal.obo) have an xref to the corresponding Uberon term.
* namespace-bridge-params.tsv (for instance, [hsapdv-bridge-params.tsv](src/hsapdv/hsapdv-bridge-params.tsv)): a file with one row and two columns separated by a tab, where the first column contains the species common name (for instance, "human"), and the second column contains the NCBI Taxon ID (for instance, "NCBITaxon:9606")

### Generated files

For each of this directory, the [Makefile](src/Makefile) will generate several downstream files:

* namespace.owl (for instance, [hsapdv.owl](src/hsapdv/hsapdv.owl)): the source ontology in OWL format
* namespace-bridge-to-uberon.obo (for instance, [hsapdv-bridge-to-uberon.obo](src/hsapdv/hsapdv-bridge-to-uberon.obo)): a bridge file allowing to merge the species-specific ontology within the structure of [life-stages-minimal.obo](src/life-stages-minimal.obo). For ontologies developed as part of this project, this bridge is automatically produced using the xrefs in the source ontology, while for external ontologies this bridge is generated probably manually.
* namespace-uberon.obo (for instance, [hsapdv-uberon.obo](src/hsapdv/hsapdv-uberon.obo)): the species-specific ontology merged withing the structure of [life-stages-minimal.obo](src/life-stages-minimal.obo).

## External ontologies

Some ontologies are not developed as part of this project, but are merged within Uberon nevertheless. The necessary files are present in [src/external_ontologies/](src/external_ontologies/), with one subdirectory for each ontology:

* [src/external_ontologies/fbdv/](src/external_ontologies/fbdv/) for Drosophila melanogaster
* [src/external_ontologies/wbls/](src/external_ontologies/wbls/) for C. elegans
* [src/external_ontologies/xao/](src/external_ontologies/xao/) for Xenopus
* [src/external_ontologies/zfs/](src/external_ontologies/zfs/) for zebrafish

### Source files

In each subdirectory, a bridge file is provided (for instance, [uberon-bridge-to-zfs.obo](src/external_ontologies/zfs/uberon-bridge-to-zfs.obo)), allowing the merge into the structure of [life-stages-minimal.obo](src/life-stages-minimal.obo).

Note: in some cases, an adaptation of this bridge file has been necessary and is provided as uberon-bridge-to-xxx-modified.obo ((for instance, [uberon-bridge-to-zfs-modified.obo](src/external_ontologies/zfs/uberon-bridge-to-zfs-modified.obo))

### Generated files

In each subdirectory, the [Makefile](src/Makefile) allows to generate the merge of the original ontology and of [life-stages-minimal.obo](src/life-stages-minimal.obo).

## Merge process

Once a merged ontology has been generated for each species, the [Makefile](src/Makefile) allows to produced merges of all of them:

* [ssso-merged.obo](src/ssso-merged.obo): it is the union of all the unmerged species-specific ontologies and of [life-stages-minimal.obo](src/life-stages-minimal.obo)
* [ssso-merged-uberon.obo](src/ssso-merged-uberon.obo): it is the merge of the merged species-specific ontologies within the structure of [life-stages-minimal.obo](src/life-stages-minimal.obo)

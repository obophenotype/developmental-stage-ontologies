[![Build Status](https://travis-ci.org/obophenotype/developmental-stage-ontologies.svg?branch=master)](https://travis-ci.org/obophenotype/developmental-stage-ontologies)
[![DOI](https://zenodo.org/badge/13996/obophenotype/developmental-stage-ontologies.svg)](https://zenodo.org/badge/latestdoi/13996/obophenotype/developmental-stage-ontologies)

# Developmental stage ontologies

This repository hosts developmental stage ontologies developed for many animal species. This notably includes [hsapdv.obo](src/hsapdv/hsapdv.obo) for human, and [mmusdv.obo](src/mmusdv/mmusdv.obo) for mouse.

## Ontology development

For documentation about development of developmental stage ontologies, see https://github.com/obophenotype/developmental-stage-ontologies/wiki

## Species-specific developmental stage ontologies

### Namespaces

All species-specific developmental stage ontologies developed as part of this project are present in the [src/ontology/components folder](src/ontology/components). The nomenclature for naming these ontologies is: first letter of genus name + three first letters of species name + 'dv' suffix. For example, for Homo sapiens, the corresponding namespace is `hsapdv`.

### Source files

For each species-specific ontology, there is one source file in OBO format. The source file is in the aforementioned `src/ontology/components` folder and is named after the namespace of the ontology. For example, the source file for the _Homo sapiens_ ontology is [src/ontology/components/hsapdv.obo](src/ontology/components/hsapdv.obo).

### Generated files

For each species-specific ontology, the [Makefile](src/ontology/Makefile) will generate several a version of the ontology in the RDF/OWL format, and a version in the OBOGraph-JSON format.

In addition, a single ontology, called `life-stages` will also be produced. That ontology will contain the terms from all the individual species-specific ontologies.

Lastly, a file named [life-stages.sssom.tsv](src/mappings/life-stages.sssom.tsv) will also be produced. That file will contain the mappings between the species-specific terms defined in the ontologies from this repository, and the corresponding taxon-neutral terms in Uberon. Those mappings are automatically derived from cross-references carried by the species-specific terms.

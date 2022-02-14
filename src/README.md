

## TODO

The Bgee pipeline jar allows to generate a human-friendly report to visualize the dev. stages for a specific species, either from the species-specific ontology, or from the merged ontologie if taxon constraints are provided. Problem is, the Bgee pipeline currently requires each ontology to be exactly a tree by part_of relations, with all stages that can be ordered related to each other. The consequence for the merged ontology is also that each term must have one and only one part_of direct parent. So for instance it is not possible to have a relation UBERON:0034919 "juvenile stage" part_of UBERON:0007221 "neonate stage" in mammalia, and UBERON:0034919 part_of UBERON:0000112 "sexually immature stage" in all other species, as it is the case in Uberon; or, to have different species-specific ontologies leading to have different part_of relations for a UBERON term after the merge, for instance, if in one species the term merged with UBERON:0000112 "sexually immature stage" is part_of the term merged with UBERON:0000066 "fully formed stage", and in another species part_of UBERON:0000092 "post-embryonic stage": this would lead to have UBERON:0000112 "sexually immature stage" both part_of UBERON:0000066 "fully formed stage" and part_of UBERON:0000092 "post-embryonic stage" in the merged ontology (which in this case is simply a relation reduction problem, but it could be messier in other cases).

As a consequence:
* no longer a tree, parameter strict or not, two different report types or one single?

To write:
* xrefs from UBERON to species-specific terms should be managed in the bridge ontology, check with Chris
* the make target for each species should also generate the report for that species
* the mak target for each species should merge with life-stage-minimal with taxon constraints provided in format for Bgee pipeline
* We could add part_of relations for species-specific terms in the bridge. But then maybe we also need to do relation reduction

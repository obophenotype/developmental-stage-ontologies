## Diff between ssso-merged-uberon.obo and ssso-merged-uberon-modified.obo

* HsapDv:0000002 was not correctly merged with UBERON:0000068, merging it. As a result, addition of XRefs for UBERON:0000068 to: EV:0300001, FMA:72652, HP:0011460.
* MmusDv:0000002 was not correctly merged with UBERON:0000068, merging it.
* RnorDv:0000003 was not correctly merged with UBERON:0000068, merging it.
* SscrDv:0000079 was not correctly merged with UBERON:0000068, merging it.
* Fix an error of mapping for RnorDv:0000060 (mapped to UBERON:007222 instead of UBERON:0007222)
* Relations outgoing from obsolete RnorDv:0000004 removed.

All the previous corrections have been applied to the source species-specific ontologies

* Removal of incorrect relation UBERON:0000106 part_of UBERON:0000107
* Replacement of relations UBERON:0004728 is_a UBERON:0000069, UBERON:0004729 is_a UBERON:0000069, UBERON:0004730 is_a UBERON:0000069, UBERON:0009849 is_a UBERON:0004728, with part_of relations
* Removal of relation UBERON:0007221 part_of UBERON:0000112, and addition without GCI of UBERON:0007221 part_of UBERON:0018685 (because we should have UBERON:0007221 part_of UBERON:0018685, and UBERON:0018685 part_of UBERON:0000112)
* Removal of some unnecessary GCI relations
* Removal of UBERON:0001062, UBERON:0014406, UBERON:0014856, UBERON:0014857, UBERON:0014858, UBERON:0014860, UBERON:0014861, UBERON:0014862, UBERON:0014863, UBERON:0018378
* removal of relations "ends_at_start_of"
* replacement of relations "starts_at_end_of" with "preceded_by"
* XAO manually added (XAO was not included in src/external_ontologies during generation)

## TODO

The Bgee pipeline jar allows to generate a human-friendly report to visualize the dev. stages for a specific species, either from the species-specific ontology, or from the merged ontologie if taxon constraints are provided. Problem is, the Bgee pipeline currently requires each ontology to be exactly a tree by part_of relations, with all stages that can be ordered related to each other. The consequence for the merged ontology is also that each term must have one and only one part_of direct parent. So for instance it is not possible to have a relation UBERON:0034919 "juvenile stage" part_of UBERON:0007221 "neonate stage" in mammalia, and UBERON:0034919 part_of UBERON:0000112 "sexually immature stage" in all other species, as it is the case in Uberon; or, to have different species-specific ontologies leading to have different part_of relations for a UBERON term after the merge, for instance, if in one species the term merged with UBERON:0000112 "sexually immature stage" is part_of the term merged with UBERON:0000066 "fully formed stage", and in another species part_of UBERON:0000092 "post-embryonic stage": this would lead to have UBERON:0000112 "sexually immature stage" both part_of UBERON:0000066 "fully formed stage" and part_of UBERON:0000092 "post-embryonic stage" in the merged ontology (which in this case is simply a relation reduction problem, but it could be messier in other cases).

As a consequence:
* no longer a tree, parameter strict or not, two different report types or one single?

To write:
* the make target for each species should also generate the report for that species
* the make target for each species should merge with life-stage-minimal with taxon constraints provided in format for Bgee pipeline
* We could add part_of relations for species-specific terms in the bridge. But then maybe we also need to do relation reduction

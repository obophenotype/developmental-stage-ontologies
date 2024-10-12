This directory contains the developmental and life stage ontologies that are not maintained
in this repository, but are included into the final merge within the structure of Uberon.

TODO: add only_in_taxon constraints to all terms for ZFS and FBdv through the bridge file, as it is already done for WBls and all in-house ontologies.
TODO: define the metastage ontology as a graph and not as an ordered tree, because we have to cheat a lot to accomodate WBls. For instance, C. elegans after larval L2 stage can divert into either classical L3 stage, or dauer L3 stage (L3d) if exposed to overcrowed conditions with limiting food. We cannot provide one absolute ordering of all stages. Or also, Wbls has a hierarchy per stage by minutes post cleavage, and a hierarchy per stage by number of cells; we had to keep only stages by number of cells, and mapped the other stages to blastula/gastrula/etc.
TODO: to help reconcile the ontologies as a graph, write code displaying ontology with a tabulated format, ordered as much as possible by preceded_by relations, displaying the preceded_by relations to see when a term is not ordered.

Ontology home pages:
* ZFS: http://obofoundry.org/ontology/zfs.html
* FBdv: http://obofoundry.org/ontology/fbdv.html

Source ontologies:
* ZFS: http://purl.obolibrary.org/obo/zfs.obo
* FBdv: http://purl.obolibrary.org/obo/fbdv.obo

Bridges from Uberon to these ontologies:
* ZFS: http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-zfs.obo
* FBdv: http://purl.obolibrary.org/obo/uberon/bridge/uberon-bridge-to-fbdv.obo

## Modifications made to FBdv for consistency with the Uberon life stage structure, and for easier merging:
* get rid of relations "substage_of" and "occurent_part_of", it doesn't integrate well with Uberon life stage
  * delete the [Typedef] substage_of and occurent_part_of
  * replace all relationships substage_of with part_of
* Add part_of relations to all terms that have no part_of relations, except for the root, that we define as FBdv:00000000. Terms affected: FBdv:00005286 egg stage, FBdv:00005289 embryonic stage, FBdv:00005336 larval stage, FBdv:00005369 adult stage, FBdv:00007001 P-stage, FBdv:00007026 mature adult stage, FBdv:00007011 embryonic cycle. Exception: FBdv:00004886 oogenesis is part_of FBdv:00005286 egg stage; FBdv:00007000 spermatogenesis is removed.
* get rid of FBdv:00007012, it is inconsistently used as compared to the structure of Uberon life stages. Since FBdv:00005259 is the superclass of FBdv:00007012, we will replace all relations is_a FBdv:00007012 with relations is_a FBdv:00005259
  * terms that have no part_of relations, but an is_a relation to FBdv:00007012 or FBdv:00007024 or FBdv:00007009: remove is_a relation to FBdv:00007012 or FBdv:00007024 or FBdv:00007009, add relations part_of FBdv:00000000, and is_a FBdv:00005259. Exception: FBdv:00004886 oogenesis is part_of FBdv:00005286 egg stage; FBdv:00007000 spermatogenesis is removed.
  * terms that have some part_of relations to other terms, and an is_a relation to FBdv:00007012 or FBdv:00007024 or FBdv:00007009: replace it with an is_a relation to FBdv:00005259
  * Remove terms FBdv:00007012 and FBdv:00007024 and FBdv:00007009
  * In bridge to Uberon, replace the mapping to FBdv:00007012 with a mapping to FBdv:00005259
* FBdv:00007011 embryonic cycle:
  * Remove the term FBdv:00007011
  * Replace all relations is_a FBdv:00007011 with is_a FBdv:00005259
  * Remove terms FBdv:00007022 embryonic cycle interphase and FBdv:00007023 embryonic cycle M-phase (and any terms that are part_of FBdv:00007011)
  * Replace all relations is_a FBdv:00007022 and is_a FBdv:00007023 with is_a FBdv:00005259
* FBdv:00007013 age:
  * remove term FBdv:00007013 age
  * remove terms that are is_a FBdv:00007013 age: so far, only FBdv:00007014 adult age in days
  * replace the is_a relations to these terms with an is_a FBdv:00005259
* Remove the alt_id FBdv_root:00000000 from FBdv:00000000
* Remove the alt_id FBdv:00007010 from FBdv:00005259
* Term FBdv:00005288 fertilized egg is not anymore part_of egg stage but part_of FBdv:00005289 embryo

## Modifications made to WBls

* Remove all terms and branches unrelated to C. elegans: terms for Brugia, Strongyloides, Onchocerca, Platyhelminthes (including Digenean and Cestoda, including children hanging WBls:0000709 schistosomulum and its substages)
* Remap all stages per minutes to their parent through xref, or through intersection_of to the UBERON term if their parent is already mapped in the bridge ontology, then delete them.
* Map all the stages with name "... occurrung during ..." to the root UBERON:0000105 in the bridge ontology (IDs WBls:0000803 to WBls:0000821, and WBls:0000824)
* Map also the stages "stage by number of cells" (WBls:0000823) and "stage by minutes" (WBls:0000822) to this root in the bridge ontology
* Map the stages male/hermaphrodite adult into their parent: WBls:0000056 "adult male Ce" and WBls:0000057 "adult hermaphrodite Ce" into WBls:0000041 "adult Ce"; Since WBls:0000041 is itself merged into UBERON:0000066 "fully formed stage", WBls:0000056 and WBls:0000057 should be merged with UBERON:0000066 through intersection_of in the bridge ontology.
* Map through xref WBls:0000073 "L4 larva male Ce" into its parent WBls:0000038 "L4 larva Ce"
* WBls:0000004 "proliferating embryo Ce": wormbase considers cleavage to be all stages of cell divisions of the enbryo, while Uberon considers cleve to be only the first celle divisions. WBls:0000004 is parent of both blastula, gastrula, and late cleavage stage embryo Ce. This does not correspond to the structure of Uberon. For this reason, we deleted WBls:0000004. 
  * WBls:0000005 "blastula embryo Ce" has been made part_of WBls:0000003 ! embryo Ce
  * WBls:0000010 "gastrulating embryo Ce" has been made part_of WBls:0000003 ! embryo Ce
  * WBls:0000014 "late cleavage stage embryo Ce" has been made part_of WBls:0000003 ! embryo Ce
  * WBls:0000015 "elongating embryo Ce" has been made starts_at_end_of WBls:0000014 ! late cleavage stage embryo Ce
  * Term WBls:0000004 has been deleted
  * an xref to WBls:0000004 has been added to UBERON:0000068 embryo
* Then we correct the part_of/is_a relations. We look at all of them by generating the merged wbls-uberon.obo ontology, and using grep on this files, e.g., `grep "relationship: part_of " wbls-uberon.obo | sort | uniq`.
  * is_a relations: they should all point to UBERON:0000105, so any other is_a relation needs to be transformed into part_of relations or modified/deleted. For instance, we have merged the terms LX larval stage into their subclass LX larva Ce through xref, and remove the is_a relations to the LX larval stages, and then the terms themselves. We have transformed the relations `is_a: WBls:0000664 ! microfilaria` into part_of, and add `is_a: UBERON:0000105`. Same with `is_a: WBls:0000666`

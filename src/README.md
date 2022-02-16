## Modifications made to external ontologies

### `FBdv:00007001 P-stage`

#### Modifications

* This term has been removed from the ontology
* All its children terms (`FBdv:00005342 prepupal stage`, `FBdv:00005349 pupal stage`, `FBdv:00006011 pharate adult stage`) were mapped to its parent term `UBERON:0000092 post-embryonic stage`
* An xref to `FBdv:00007001 P-stage` has been artificially added to `UBERON:0000092 post-embryonic stage`, in order to not loose annotations mapped to this term.

#### Motivation

Bgee currently stores the developmental stage ontology as a nested set model, which has several limitations. Notably, a term can only have one parent through a `part_of` relation, in any species. In the other Drosophila species used in Bgee, the term `UBERON:0000070 pupal stage` is a child of `UBERON:0000092 post-embryonic stage`. In FBdv, it is a child of `FBdv:00007001 P-stage` (`FBdv:00005349 pupal stage` mapped to `UBERON:0000070`).

As a result, either we would:

* keep the term `FBdv:00005349 pupal stage` unmapped to `UBERON:0000070`. This would mean that we couldn't compare the pupal stages in Drosophila melanogaster and other Drosophila species (currently, in Bgee, mapping between developmental stages is not captured through formal annotations as [for the anatomical similarity mappings](https://github.com/BgeeDB/anatomical-similarity-annotations/), but simply by considering UBERON terms equivalent in different species)
* Discard the term `FBdv:00007001 P-stage` so that the term `FBdv:00005349 pupal stage`, mapped to `UBERON:0000070`, would be a child of `UBERON:0000092 post-embryonic stage`, as in other Drosophila species.

#### Long-term fix

* allows formal mapping between developmental stages
* and/or stop storing the developmental stage ontology as a nested set model, so that a term can have different parents in different species.

### `preceded_by` relations for larval terms in WBls

#### Modifications

* We have arbitrarily assigned some `preceded_by` relations to terms in WBls. The resulting structure is:

```
    UBERON:0004729 nematode larval stage
        WBls:0000024 L1 larva Ce (C elegans)
        WBls:0000026 L1-L2 molt Ce (C elegans)
            WBls:0000025 L1-L2 lethargus Ce (C elegans)
            WBls:0000042 L1-L2 ecdysis Ce (C elegans)
        WBls:0000043 L1-L2d molt Ce (C elegans)
            WBls:0000044 L1-L2d lethargus Ce (C elegans)
            WBls:0000045 L1-L2d ecdysis Ce (C elegans)
        WBls:0000027 L2 larva Ce (C elegans)
        WBls:0000046 L2d larva Ce (C elegans)
        WBls:0000029 L2-L3 molt Ce (C elegans)
            WBls:0000028 L2-L3 lethargus Ce (C elegans)
            WBls:0000047 L2-L3 ecdysis Ce (C elegans)
        WBls:0000031 L2d-dauer molt Ce (C elegans)
            WBls:0000030 L2d-dauer lethargus Ce (C elegans)
            WBls:0000048 L2d-dauer ecdysis Ce (C elegans)
        WBls:0000053 L2d-L3 molt Ce (C elegans)
            WBls:0000054 L2d-L3 lethargus Ce (C elegans)
            WBls:0000055 L2d-L3 ecdysis Ce (C elegans)
        WBls:0000035 L3 larva Ce (C elegans)
        WBls:0000032 dauer larva Ce (C elegans)
        WBls:0000037 L3-L4 molt Ce (C elegans)
            WBls:0000036 L3-L4 lethargus Ce (C elegans)
            WBls:0000049 L3-L4 ecdysis Ce (C elegans)
        WBls:0000052 post dauer stage Ce (C elegans)
        WBls:0000034 postdauer-L4 molt Ce (C elegans)
            WBls:0000033 postdauer-L4 lethargus Ce (C elegans)
            WBls:0000051 postdauer-L4 ecdysis Ce (C elegans)
        WBls:0000038 L4 larva Ce (C elegans)
        WBls:0000040 L4-adult molt Ce (C elegans)
            WBls:0000039 L4-adult lethargus Ce (C elegans)
            WBls:0000050 L4-adult ecdysis (C elegans)
```

#### Motivation

* See https://github.com/obophenotype/developmental-stage-ontologies/issues/30

#### Long-term fix

Either we could:

* subclassing the problematic WBls classes (see https://github.com/obophenotype/developmental-stage-ontologies/issues/30#issuecomment-234290607)
* and/or stop storing the developmental stage ontology as a nested set model in Bgee, so that a term can have any precedence relations (e.g., `preceded_by (Dauer OR L3)`)

### `preceded_by` relations between some `embryonic cycle` terms in FBdv

#### Modifications

* We have arbitrarily assigned some `preceded_by` relations to the terms `FBdv:00005312 embryonic cycle 14`, `FBdv:00005315 embryonic cycle 15`, and `FBdv:00005316 embryonic cycle 16`. The resulting structure is:

```
    UBERON:0000068 embryo stage
        [...]
        UBERON:0000109 gastrula stage (mapped to `FBdv:00005317 gastrula stage`)

        FBdv:00005312 embryonic cycle 14 (Drosophila)
            FBdv:00005313 embryonic cycle 14A (Drosophila)
            FBdv:00005314 embryonic cycle 14B (Drosophila)
        FBdv:00005315 embryonic cycle 15 (Drosophila)
        FBdv:00005316 embryonic cycle 16 (Drosophila)

        FBdv:00005321 extended germ band stage
        [...]
```

#### Motivation

* See https://github.com/FlyBase/drosophila-anatomy-developmental-ontology/issues/37, notably https://github.com/FlyBase/drosophila-anatomy-developmental-ontology/issues/37#issuecomment-111154721

#### Long-term fix

Either:

* we could simply discard these terms, as in Bgee release 13. In practice they are not used in annotations (see comment of the related terms, e.g.: "The asynchronous nature of cycle 14 divisions means that this is not very useful for annotating stage")
* or we could stop storing the developmental stage ontology as a nested set model in Bgee, so that a term can have no precedence relations


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

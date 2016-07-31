# Known issues in composite developmental stage ontology for Bgee release 14.0

## `FBdv:00007001 P-stage`

### Modifications

* This term has been removed from the ontology
* All its children terms (`FBdv:00005342 prepupal stage`, `FBdv:00005349 pupal stage`, `FBdv:00006011 pharate adult stage`) were mapped to its parent term `UBERON:0000092 post-embryonic stage` 
* An xref to `FBdv:00007001 P-stage` has been artificially added to `UBERON:0000092 post-embryonic stage`, in order to not loose annotations mapped to this term.

### Motivation

Bgee currently stores the developmental stage ontology as a nested set model, which has several limitations. Notably, a term can only have one parent through a `part_of` relation, in any species. In the other Drosophila species used in Bgee, the term `UBERON:0000070 pupal stage` is a child of `UBERON:0000092 post-embryonic stage`. In FBdv, it is a child of `FBdv:00007001 P-stage` (`FBdv:00005349 pupal stage` mapped to `UBERON:0000070`). 

As a result, either we would: 

* keep the term `FBdv:00005349 pupal stage` unmapped to `UBERON:0000070`. This would mean that we couldn't compare the pupal stages in Drosophila melanogaster and other Drosophila species (currently, in Bgee, mapping between developmental stages is not captured through formal annotations as [for the anatomical similarity mappings](https://github.com/BgeeDB/anatomical-similarity-annotations/), but simply by considering UBERON terms equivalent in different species)
* Discard the term `FBdv:00007001 P-stage` so that the term `FBdv:00005349 pupal stage`, mapped to `UBERON:0000070`, would be a child of `UBERON:0000092 post-embryonic stage`, as in other Drosophila species.

### Long-term fix

* allows formal mapping between developmental stages
* and/or stop storing the developmental stage ontology as a nested set model, so that a term can have different parents in different species.



## Human prime/early/late/aged adult stage

### Modifications

* The term `UBERON:0018241 prime adult stage` was not used for human, and we kept the current structure of the HsapDv ontology (as of July 2016)
* Same for the term `UBERON:0007222 late adult stage`

So, instead of having the following structure, similar to other mammalian species: 

    UBERON:0000113 post-juvenile adult stage
        HsapDv:0000086 adolescent stage
        UBERON:0018241 prime adult stage
            HsapDv:0000088 human early adulthood stage
            HsapDv:0000092 human middle aged stage
        UBERON:0007222 late adult stage

We have the structure: 

    UBERON:0000113 post-juvenile adult stage
        HsapDv:0000086 adolescent stage (human)
        HsapDv:0000087 human adult stage (human)
            HsapDv:0000088 human early adulthood stage (human)
            HsapDv:0000091 human late adulthood stage (human)
                HsapDv:0000092 human middle aged stage (human)
                HsapDv:0000093 human aged stage (corresponding to `UBERON:0007222 late adult stage`, but we cannot currently map it, see Motivation)

* This mean that we currently cannot compare prime/late adult stage between human and other species (currently, in Bgee, mapping between developmental stages is not captured through formal annotations as [for the anatomical similarity mappings](https://github.com/BgeeDB/anatomical-similarity-annotations/), but simply by considering UBERON terms equivalent in different species). 

### Motivation

* See https://github.com/obophenotype/developmental-stage-ontologies/issues/33 for issues for mapping to `UBERON:0018241 prime adult stage`
* See https://github.com/obophenotype/developmental-stage-ontologies/issues/39 for issues for mapping to `UBERON:0007222 late adult stage`
* Bgee currently stores the developmental stage ontology as a nested set model, which has several limitations. Notably, a term can only have one parent through a `part_of` relation, in any species. In other mammalian species, `UBERON:0007222 late adult stage` is a child of `UBERON:0000113 post-juvenile adult stage`. In the current HsapDv (as of July 2016), it is a child of `HsapDv:0000091 human late adulthood stage`, child of `HsapDv:0000087 human adult stage`, child of `UBERON:0000113 post-juvenile adult stage`...
* We have too many annotations to `HsapDv:0000087`, `HsapDv:0000088`, `HsapDv:0000091`, `HsapDv:0000092`, HsapDv:0000093` to simply drop these terms for the current release.

### Long-term fix

* Revamping of the HsapDv structure, to follow the same structure as for other mammalian species. 
* Update of the Bgee annotations to map to new structure



## Mouse prime/early/late/aged adult stage

### Modifications

* The term `UBERON:0018241 prime adult stage` was not used for mouse, and we kept the current structure of the MmusDv ontology (as of July 2016)
* Same for the term `UBERON:0007222 late adult stage`

So, instead of having the following structure, similar to other mammalian species: 

    UBERON:0000113 post-juvenile adult stage
        UBERON:0018241 prime adult stage
            MmusDv:0000061 early adult stage
            MmusDv:0000075 middle aged stage (mouse)
        UBERON:0007222 late adult stage

We have the structure: 

    UBERON:0000113 post-juvenile adult stage
        MmusDv:0000061 early adult stage
        MmusDv:0000097 late adult stage
            MmusDv:0000075 middle aged stage
            MmusDv:0000076 aged adult stage (corresponding to `UBERON:0007222 late adult stage`, but we cannot currently map it, see Motivation)

* This mean that we currently cannot compare prime/late adult stage between mouse and other species (currently, in Bgee, mapping between developmental stages is not captured through formal annotations as [for the anatomical similarity mappings](https://github.com/BgeeDB/anatomical-similarity-annotations/), but simply by considering UBERON terms equivalent in different species). 

### Motivation

* See https://github.com/obophenotype/developmental-stage-ontologies/issues/40
* Bgee currently stores the developmental stage ontology as a nested set model, which has several limitations. Notably, a term can only have one parent through a `part_of` relation, in any species. In other mammalian species, `UBERON:0007222 late adult stage` is a child of `UBERON:0000113 post-juvenile adult stage`. In the current MmusDv (as of July 2016), it is a child of `MmusDv:0000097 late adult stage`, child of `UBERON:0000113 post-juvenile adult stage`...
* We have too many annotations to `MmusDv:0000061`, `MmusDv:0000097`, `MmusDv:0000075`, `MmusDv:0000076` to simply drop these terms for the current release.

### Long-term fix

* Revamping of the MmusDv structure, to follow the same structure as for other mammalian species
* Update of the Bgee annotations to map to new structure



## Terms per decades in HsapDv

### Modifications

* The terms grouping years per decade (e.g., `HsapDv:0000235 first decade human stage`), notably needed for capturing GTEx public-access annotations, were currently not included. 

### Motivation

* See https://github.com/obophenotype/developmental-stage-ontologies/issues/34
* None of the decade terms useful for capturing GTEx annotations could fall in the current structure of the ontology, for a term to have only one parent (Bgee currently stores the developmental stage ontology as a nested set model, a term can have only one parent in any species).

### Long-term fix

* As part of the complete revamping of HsapDv
* and/or stop storing the developmental stage ontology as a nested set model, so that a term can have several parents



## `preceded_by` relations for larval terms in WBls

### Modifications

* We have arbitrarily assigned some `preceded_by` relations to terms in WBls. The resulting structure is: 

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

### Motivation

* See https://github.com/obophenotype/developmental-stage-ontologies/issues/30

### Long-term fix

Either we could: 

* subclassing the problematic WBls classes (see https://github.com/obophenotype/developmental-stage-ontologies/issues/30#issuecomment-234290607)
* and/or stop storing the developmental stage ontology as a nested set model in Bgee, so that a term can have any precedence relations (e.g., `preceded_by (Dauer OR L3)`)




## `preceded_by` relations between some `embryonic cycle` terms in FBdv

### Modifications

* We have arbitrarily assigned some `preceded_by` relations to the terms `FBdv:00005312 embryonic cycle 14`, `FBdv:00005315 embryonic cycle 15`, and `FBdv:00005316 embryonic cycle 16`. The resulting structure is: 

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

### Motivation

* See https://github.com/FlyBase/drosophila-anatomy-developmental-ontology/issues/37, notably https://github.com/FlyBase/drosophila-anatomy-developmental-ontology/issues/37#issuecomment-111154721

### Long-term fix

Either: 

* we could simply discard these terms, as in Bgee release 13. In practice they are not used in annotations (see comment of the related terms, e.g.: "The asynchronous nature of cycle 14 divisions means that this is not very useful for annotating stage")
* or we could stop storing the developmental stage ontology as a nested set model in Bgee, so that a term can have no precedence relations

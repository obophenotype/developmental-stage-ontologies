## Files in this directory

* dev_stage_ontology.obo: the ontology used for insertion into Bgee release 15, which is a modification of [ssso-merged-uberon-modified.obo](/src/ssso-merged-uberon-modified.obo)
* report.md: display nicely formatted useful information about the ontology after insertion into the Bgee database

## Modifications of ssso-merged-uberon-modified.obo for dev_stage_ontology.obo

* merge of MdomDv:0000005 with UBERON:0034919

* merge of OariDv:0000005 with UBERON:0034919

* Addition of XRef to TS stages:

```
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000005> "TS02"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000006> "TS03"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000008> "TS04"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000009> "TS05"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000010> "TS06"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000011> "TS07"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000012> "TS08"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000014> "TS09"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000015> "TS10"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000019> "TS12"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000020> "TS13"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000021> "TS14"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000022> "TS15"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000023> "TS16"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000024> "TS17"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000025> "TS18"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000026> "TS19"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000027> "TS20"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000028> "TS21"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000029> "TS22"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000032> "TS23"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000033> "TS24"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000034> "TS25"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/MmusDv_0000035> "TS26"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000106> "TS01"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000110> "TS11"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000112> "TS28"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0007221> "TS27"^^xsd:string)
```

* addition of XRefs to the root of the ontology:

```
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "AcarDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "BtauDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "CfamDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "CporDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "DpseDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "DsimDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "EcabDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "FBdv:00005259"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "FBdv:00007000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "FcatDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "GgalDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "GgorDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "HsapDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "MdomDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "MmulDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "MmusDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "OanaDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "OariDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "OcunDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "PpanDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "PtroDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "RnorDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "SscrDv:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000001"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000002"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000059"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000075"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000101"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000803"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000804"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000805"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000806"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000807"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000808"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000809"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000810"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000811"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000812"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000813"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000814"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000815"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000816"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000817"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000818"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000819"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000820"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000821"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000822"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000823"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "WBls:0000824"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "ZFS:0000000"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000104> "ZFS:0100000"^^xsd:string)
```

* Addition of other XRefs:

```
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000111> "XAO:1000007"^^xsd:string)
+ AnnotationAssertion(<http://www.geneontology.org/formats/oboInOwl#hasDbXref> <http://purl.obolibrary.org/obo/UBERON_0000112> "WBls:0000058"^^xsd:string)
```

* Removal of class UBERON:0000105

* Change of partonomy for RnorDv (probably it was because of the incorrect mapping from to UBERON:0007222 fixed in ssso-merged-uberon-modified.obo)

```
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000034> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000035> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000036> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000037> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000038> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000039> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000040> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000044> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000045> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000046> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
+ SubClassOf(<http://purl.obolibrary.org/obo/RnorDv_0000047> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/UBERON_0007222>))
```

* Change of partonomy for FBdv (see diff)

* change of partonomy for WBls (see diff)

* change of partonomy for XAO (see diff)

* replacement of taxon NCBITaxon_8364 with NCBITaxon_8353, change of taxon constraints for XAO:

```
+ SubClassOf(ObjectIntersectionOf(<http://purl.obolibrary.org/obo/UBERON_0000068> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/NCBITaxon_8353>)) ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/RO_0002087> <http://purl.obolibrary.org/obo/XAO_1000082>))
+ SubClassOf(ObjectIntersectionOf(<http://purl.obolibrary.org/obo/UBERON_0000106> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/NCBITaxon_8353>)) ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/RO_0002087> <http://purl.obolibrary.org/obo/XAO_1000082>))
+ SubClassOf(ObjectIntersectionOf(<http://purl.obolibrary.org/obo/UBERON_0007232> ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/BFO_0000050> <http://purl.obolibrary.org/obo/NCBITaxon_8353>)) ObjectSomeValuesFrom(<http://purl.obolibrary.org/obo/RO_0002087> <http://purl.obolibrary.org/obo/XAO_1000028>))
```

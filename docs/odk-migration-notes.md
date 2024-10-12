# Notes from ODK migration

The following notes have been created by `@matentzn`.

- SSLSO stands for species specific life stage ontology
- Deleted `external/bgee` directory which did not seem connected to the pipeline (commit `e24df8de7bbe55a158c13f1df00f1422d4a16b3f`). The old README in that directory said "Directory `bgee/` contains a working copy of the composite metazoan dev. stage ontology adapted for Bgee", not sure what that means.
- Deleted various release files from the old pipeline (commit `b62f4a2975df540289ecb22fcd2dc39556434d11`)
- `life-stages-minimal.obo` has be redefined as `component/life-stages-minimal.owl`. This file is highly questionable, and I would deeply suggest to  review the purpose of its existence.
- In the ODK config, we had to set "allow_equivalents" to "all" due to some bad interactions between WBLS and XAO mappings (I think). I would suggest to review this decision eventually.
- Added a normalisation step to all OBO file outputs (loading and safing with ROBOT) to canonicalise their rendering.
- Added a JSON and OWL output for all SSLSO

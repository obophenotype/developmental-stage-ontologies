## Individual species-specific ontologies

This folder contains the individual life stage ontologies for each
species.

This is where editing should take place: to change the contents of a
species-specific ontology, edit the corresponding OBO file (e.g., edit
`dsimdv.obo` to modify the _D. simulans_ ontology).

Do _not_ edit the `.owl` or `.json` files. Those files are automatically
generated from the corresponding OBO files, and any manual modification
would be erased the next time the release pipeline is run.

Editors _may_ also edit the `life-stages-edit.owl` file in Protégé, but
in that case they should be careful to save any newly introduced axiom
in the component it should belong to.

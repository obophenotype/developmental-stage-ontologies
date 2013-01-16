
This repository is for the collection of species-specific stage
ontologies.

This repository is primarily for the developers of these
ontologies. End-users should access these ontologies via their standard
purls; for example:

 * http://purl.obolibrary.org/obo/zfs.obo
 * http://purl.obolibrary.org/obo/zfs.owl

Or via dedicated web interfaces (e.g. ZFIN) or OntoBee
(e.g. http://purl.obolibrary.org/obo/ZFS_0000044 - NOTE: doesn't
currently work)

== Multi-species stage ontologies ==

Two versions are available here:

 * http://purl.obolibrary.org/obo/uberon/subsets/life-stages-core.obo
 * http://purl.obolibrary.org/obo/uberon/subsets/life-stages-composite.obo

(OWL available soon)

The core includes only high-level grouping classes (`zygote stage`,
`gastrula stage`, `embryonic stage`, etc).

The composite version includes species-specific stages hanging off as
leaf nodes from the generic stages. No attempt is made to map stages
at a more granular level (e.g. between human Carnegie and mouse
Theiler).

These ontologies are described here:

 * http://purl.obolibrary.org/obo/uberon/references/reference_0000036

== Guidelines for contributors of stage ontologies ==

This repository is provided for the community of species-specific
anatomy ontology developers who require a corresponding developmental
stage ontology. There is no requirement to use this
repository. However, consolidating here brings certain benefits -
shared infrastructure (tracker etc). It also allows members of the
core team to make modifications to your ontology, with your approval.

Below is a draft set of guidelines for submitters of species-specific
ontologies, in order of preference:

STRONGLY RECOMMENDED:

 * uses prefixed IDs according to pre-existing scheme or proposed scheme
 * logically consistent with core uberon generic stages	
 * isa-complete
 * correct usage of isa and part_of
 * ontology is available from VCS repository (such as this one)
 * ontology is responsive to requests for changes (e.g. via the tracker on this site)
 * use standard OBO naming conventions
 * names stages such that they won't be confused with corresponding structures (e.g. 'embryo stage' vs embryo)

BONUS:

 * includes temporal ordering relations TBD
 * ontology is not flat (ie includes 'embryo', 'larva', 'adult')
 * includes numeric timing info using OWL datatypes (e.g. has_day 23^^xsd:int)

All of these are open to discussion. Please email the obo-anatomy list or the owners of this repository with comments.

== Identifiers ==

All IDs should follow the OBO ID policy.

We are considering a generic scheme whereby all new stage ontologies have ID spaces such as:

 * HsapDv - human
 * MmusDv - mouse
 * etc

Of course pre-existing ID spaces (ZFS, WBls, etc) will remain.

== Use of OWL and OBO ==

Contributors of stage ontologies should use whatever they are most
comfortable for the edit version of their ontology. The infrastructure
will take care of generating the alternate format version.

We are interested in moving the edit version to OWL as this allows us
to record quantitative information (e.g. days post fertlization) not
possible in OBO. Currently this is not a high priority.

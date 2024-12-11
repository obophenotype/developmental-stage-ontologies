# Contributing to Developmental Stages Ontology

:+1: First of all: Thank you for taking the time to contribute!

The following is a set of guidelines for contributing to LIFE-STAGES. 
These guidelines are not strict rules. Use your best judgment, and feel free to propose 
changes to this document in a pull request.

## Table Of Contents

- [Guidelines for Contributions and Requests](#contributions)
    * [Reporting problems with the ontology](#reporting-bugs)
    * [Requesting new terms](#requesting-terms)
    * [Adding new terms by yourself](#adding-terms)
- [Best practices](#best-practices)
    * [How to write a great issue?](#great-issues)
    * [How to create a great pull/merge request?](#great-pulls)

<a id="contributions"></a>

## Guidelines for Contributions and Requests

<a id="reporting-bugs"></a>

### Reporting problems with the ontology

Please use our [Issue Tracker](https://github.com/obophenotype/noname/issues/) for reporting problems with the ontology. 
To learn how to write a good issue [see here](#great-issues).

<a id="requesting-terms"></a>

### Requesting new terms

Before you write a new request, please consider the following: 

- **Does the term already exist?** Before submitting suggestions for new ontology terms, check whether the term exist, 
either as a primary term or a synonym term. You can search for your term using [OLS](http://www.ebi.ac.uk/ols/ontologies/life-stages).
- **Can you provide a definition for the term?** It should be very clear what the term means, and you should be
able to provide a concise definition, ideally with a scientific reference.
- **Is the ontology in scope for the term?** Sometimes, it is hard to tell whether a term "belongs" in
and ontology. A rule of thumb is "if a similar term already exists, the new term is probably in scope."
It can be very helpful to mention a very similar concept as part of the term request!

#### Who can request a term?

Anyone can request new terms. However, there is not guarantee that your term will be added automatically. Since this is a 
community resource, it is often necessary to do at least some of the work of adding the term yourself, see below.

#### How to write a new term request

Request a new term _via_ the GitHub [Issue Tracker](https://github.com/obophenotype/noname/issues/).

It is important to remember that it takes a lot of time for curators to process issues submitted to the tracker.
To make this work easier, please always use issue templates if they are available (https://github.com/obophenotype/noname/issues/new/choose).

For how to write a good term request, please read the [best practices carefully](#great-issues).

<a id="adding-terms"></a>

### How to add a new term

If you have never editted this ontology before, first follow a [general tutorial](https://oboacademy.github.io/obook/lesson/contributing-to-obo-ontologies)

**Process**:

1. Clone the repository (In case you are not an offical team member, create a fork first)
1. Create new branch in git, for example `git checkout -b issue123`
1. Find the species-specific ontology you want to add a new term to in the `src/ontology/components` folder. For example, if you need a term for the _Drosophila simulans_ ontology, you need the `src/ontology/components/dsimdv.obo` file.
1. Open the file from the previous step in your favourite editor, i.e. [Protege](https://protege.stanford.edu/). **Careful:** Only edit the `.obo` file! Do not touch the `.owl` and `.json` files, any modification to those files would be lost upon the next release of the ontology.
1. Perform your edit and save your changes
1. Commit changes to branch
1. Push changes upstream
1. Create pull request

## Best Practices

<a id="great-issues"></a>

### How to write great issues?

Please refer to the [OBO Academy term request guide](https://oboacademy.github.io/obook/howto/term-request/).

<a id="great-pulls"></a>

### How to create a great pull/merge request?

Please refer to the [OBO Academy best practices](https://oboacademy.github.io/obook/howto/github-create-pull-request/)

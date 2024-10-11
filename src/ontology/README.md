# Developer Documentation

These notes are for the EDITORS of life-stages

This project was created using the [ontology development kit](https://github.com/INCATools/ontology-development-kit). See the site for details.

For more details on ontology management, please see the 
[OBO Academy Tutorials](https://oboacademy.github.io/obook/), the
[OBO tutorial](https://github.com/jamesaoverton/obo-tutorial) or the [Gene Ontology Editors Tutorial](https://go-protege-tutorial.readthedocs.io/en/latest/)

This documentation has been superceded by the ODK automatic documentation, which you can
activate by adding:

```
documentation:
  documentation_system: mkdocs
```

to your Makefile and running:

```
sh run.sh make update_repo
```
(Unix)

```
run.bat make update_repo
```
(Windows)

## Running a release:

Right now the release process is broken and needs to be redone, ideally in an ODK setup.

- `cd src`
- `sh odk.sh make all -B` (this will fail)
- Discard any changes in Git that resulted in the deletion of files
- `sh odk.sh make all` (without -B)
- Ensure no file is deleted, make a PR, get it reviewed by a member of the Uberon team
- Merge into master
- Locally pull changes on master
- Run `make github-release GHVERSION=v202X-MM-DD` (fill in the correct version)

## OLD NOTES

Clean this up when we get a chance.

* the make target for each species should also generate the report for that species
* the make target for each species should merge with life-stage-minimal with taxon constraints provided 
* We could add part_of relations for species-specific terms in the bridge. But then maybe we also need to do relation reduction

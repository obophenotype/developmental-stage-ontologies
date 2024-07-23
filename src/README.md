# Developer Documentation

## Running a release:

Right now the release process is broken and needs to be redone, ideally in an ODK setup.

- `cd src`
- `sh odk.sh make all -B` (this will fail)
- Discard any changes in Git that resulted in the deletion of files
- `sh odk.sh make all` (without -B)



## OLD NOTES

Clean this up when we get a chance.

* the make target for each species should also generate the report for that species
* the make target for each species should merge with life-stage-minimal with taxon constraints provided 
* We could add part_of relations for species-specific terms in the bridge. But then maybe we also need to do relation reduction

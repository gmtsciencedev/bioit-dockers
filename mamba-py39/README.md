# Micromanba base for GMT Science docker

Micromamba provides an excellent basis for anaconda dependant dockers, however in our hands, using a non root user causes numerous issues with very little security enhancement (as being able to run a docker is being able to be root in our context of use).

Plus we add some utilities that are useful
- procps which is required for Nextflow,
- curl, gzip, bzip2, pigz and **new** GNU parallel which are all very useful in pipeline context.

## Changelog

### v1.1.0c
- added GNU parallel
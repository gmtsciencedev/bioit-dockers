Source: https://github.com/gmtsciencedev/bioit-dockers

A simple kraken2 + bracken docker.

# Database

The database is not included in the image you must download it manually:

GTDB r207 : http://ftp.tue.mpg.de/ebio/projects/struo2/GTDB_release207/kraken2/

Put the content in /resource dir in example below

# Usage

A typical use for kraken2:

```bash
docker run -it -v /resource:/resource -v /output:/output -v /input:/input \
    gmtscience/kraken2bracken
    sh -c "kraken2 --use-names --threads ${CPU} --db /resource/ --report /output/${name}.report \
        /input/${name}.fa > /output/${name}.kraken"
```

# metaphlan4 docker

Source: https://github.com/gmtsciencedev/bioit-dockers

A simple metaphlan 4.0.5 (and not humann) docker.
/!\ Humann 3.6 does not work (yet?) in latest version: use our docker version 4.0.3.1 for humann.

## changelog

### v4.0.5
Updated metaphlan to 4.0.5, and base to mamba-py29 v1.1.0c (which include GNU parallel)

### v4.0.3.1
Metaphlan updated to 4.0.3, updated humann to 3.6 and combine-csv added (used to create synthesis when using GTDB conversion)

## databases

databases are two big to stay in docker so we propose to download them from Zenodo:

### Metaphlan latest version

Metaphlan resource: https://zenodo.org/record/7689167#.Y_-EaoDP1Bs

### Metaphlan 4.0.3 and Humann

AFAWK, Humann is not compatible with Metaphlan 4.0.5, you must use our previous release of this docker (4.0.3.1) together with these resources:

Metaphlan resource: https://zenodo.org/record/7537081#.Y8LBN6fP1Bs

Humann resource: https://zenodo.org/record/7536792#.Y8KXPqfP1Bs

Metaphlan resource is mandatory for any use of metaphlan or humann. Humann resource is required only for humann. Both resources should be un-archived in a folder and this folder mounted as "/resource" in docker. With scitq, you just have to provide the S3 path of the .tgz archive(s) with -r (you'll have to push the .tgz archive(s) to an S3 bucket of your own though, you cannot use Zenodo directly).

Metaphlan must be launched with `--offline --bowtie2db /resource/metaphlan/bowtie2`.
Humann, similarly, must be launched with `--metaphlan-options "--offline --bowtie2db /resource/metaphlan/bowtie2"`.
## manual installation of databases
You need the database to make this docker work, so first run the container like this:


```bash
mkdir /some/empty/path
chmod a+rwx /some/empty/path
docker run --rm -it -v /some/empty/path:/resource gmtscience/metaphlan4 install_database.sh 
```

This will install the database in a humann subfolder of /some/empty/path (all of them, humann and metaphlan) as recommanded in https://huttenhower.sph.harvard.edu/humann

When you run your docker next time, remount the resource folder in the same place (here /input and /output follow the conventions of scitq, but do as you please - remember to be permissive with these directories as the default user is "mambauser" (uid 1000, gid 1000) ):

```bash
docker run --rm -it -v /some/empty/path:/resource -v /input:/input -v /output:/output gmtscience/metaphlan4 humann -i /input/sample_reads.fastq -o /output/sample_results
```

For scitq, just tar.gz the humann directory that will appear and put that as a resource on S3:
```bash
cd /some/empty/path
tar cvzf humann.tgz humann
aws s3 cp humann.tgz s3://path/to/resource/humann.tgz
```

And when launching a scitq task, do not forget to add the resource with `-r s3://path/to/resource/humann.tgz -r s3://path/to/resource/metaphlan4.tgz`

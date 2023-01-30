# meteor

Meteor is INRAE MetaGenoPolis internal pipeline.


Docker Source: https://github.com/gmtsciencedev/bioit-dockers

Meteor sources: https://forgemia.inra.fr/metagenopolis/meteor


## building resource

In this example we will use the IGC2 catalog with meteor.

First, you will need the IGC2.fna.gz file here:
https://entrepot.recherche.data.gouv.fr/dataset.xhtml?persistentId=doi:10.15454/FLANUP


This small python script will reindex the catalog, creating the IGC2_reindexed.fa catalog that we will use.
```python
import gzip
with gzip.open('IGC2.fna.gz','rt',encoding='utf-8') as source:
    with open('IGC2_reindexed.fa','w', encoding='utf-8') as reindexed:
        with open('IGC2_index.tsv','w', encoding='utf-8') as index:
            index.write('number\tannotation\n')
            n = 1
            for line in source.readlines():
                if line.startswith('>'):
                    name=line[1:].strip()
                    reindex.write(f'>{n}\n')
                    index.write(f'{n}\t{name}\n')
                    n += 1
                else:
                    reindex.write(line)
```


Place the IGC2_reindexed.fa file in a folder, lets say `/resource`.

Next build the index with:

```bash
docker run --rm -it -v /resource:/resource gmtscience/meteor MeteorReferenceBuilder.rb -i IGC2_reindexed.fa -1 -p /resource -n IGC2
```

You will need around 30GB of memory for this building step.



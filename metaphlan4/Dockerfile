FROM gmtscience/mamba-py39:1.1.0c
USER root
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN micromamba install -c conda-forge -c bioconda -c biobakery metaphlan=4.0.5 humann=3.6 seqtk=1.3 && \
    micromamba clean --all --yes

RUN humann_config --update database_folders nucleotide /resource/humann/chocophlan
RUN humann_config --update database_folders protein /resource/humann/uniref
RUN humann_config --update database_folders utility_mapping /resource/humann/utility_mapping

COPY install_database.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/install_database.sh

RUN pip install combine-csv
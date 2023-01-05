FROM mamba-py39:1.1.0b
USER root
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN micromamba install -c conda-forge -c bioconda kraken2 bracken && \
    micromamba clean --all --yes
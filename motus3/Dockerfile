FROM mamba-py39:1.1.0b
USER root
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN micromamba install -c conda-forge -c bioconda motus=3.0.3 && \
    micromamba clean --all --yes
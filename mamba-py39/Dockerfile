FROM mambaorg/micromamba:1.1.0
USER root
ENV MAMBA_ALWAYS_YES=true
RUN echo -e 'Dir::Cache "";nDir::Cache::archives "";' > /etc/apt/apt.conf.d/00_disable-cache-directories && \
    apt update && apt install -y curl bzip2 gzip pigz procps 
RUN echo root > "/etc/arg_mamba_user"
ENV MAMBA_USER=root
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN micromamba install -c conda-forge -c bioconda python=3.9 && \
    micromamba clean --all --yes

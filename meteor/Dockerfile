FROM mamba-py39

RUN apt update && apt -y install build-essential git ruby

ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN micromamba install -c conda-forge -c bioconda bowtie2==2.5.0

RUN cd /opt && git clone -b 'v3.2' --single-branch --depth 1 https://forgemia.inra.fr/metagenopolis/meteor.git

RUN cd /opt/meteor/meteor-pipeline/src && \
    make && \
    cp build/meteor-counter build/meteor-profiler ../meteor.rb /usr/local/bin && \
    cp ../../data_preparation_tools/* /usr/local/bin/ && \
    gem install inifile




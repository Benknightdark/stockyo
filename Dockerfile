FROM ubuntu:18.04
################## BEGIN INSTALLATION ######################

# apt update and install global requirements
RUN apt-get update     && \
    apt-get install -y software-properties-common && \
    apt-get install -y    \
    autotools-dev     \
    automake          \
    cmake             \
    curl              \
    fuse              \
    git               \
    wget              \
    zip               \
    build-essential   \
    gcc               \
    pkg-config        \
    csh               \
    tcsh              \
    byacc             \
    flex              \
    liblzma-dev       \
    lib1g-dev         \
    libblas-dev       \
    liblapack-dev     \
    gfortran          \
    libfreetype6-dev  \
    libpng-dev        \
    libjpeg8-dev
RUN apt-get install -y  python3\
    python3-pip \
    python3-dev\
    python3.7-venv
COPY /bioapps /bioapps
WORKDIR /bioapps/
ENV PATH /bioapps/netMHC-4.0:$PATH

WORKDIR /bioapps/bioawk-master
RUN make
ENV PATH /bioapps/bioawk-master:$PATH

CMD ["/bin/bash"]

# change workdir
WORKDIR /var/data
RUN chmod 777 /var/data
RUN python3 -m venv test
RUN . test/bin/activate && pip3 install --upgrade pip && pip3 install -vU setuptools && pip3 install jupyter
RUN . test/bin/activate && pip3 install numpy && pip3 install plotly
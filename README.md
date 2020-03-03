# DockerizedOpenSpiel
A dockerfile template containing the OpenSpiel RL environment.

## Dockerfile

```Dockerfile
FROM ubuntu:20.04
RUN apt update
RUN dpkg --add-architecture i386 && apt update
RUN apt-get -y install \
    clang \
    curl \
    cmake \
    git \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    sudo
RUN git clone -b 'master' --single-branch --depth 15 https://github.com/deepmind/open_spiel.git open_spiel
WORKDIR open_spiel
RUN ./install.sh
RUN mkdir -p build && \
    cd build && \
    cmake -DPython_TARGET_VERSION=${PYVERSION} -DCMAKE_CXX_COMPILER=`which clang++` ../open_spiel && \
    make -j4
RUN pip3 install absl-py scipy
COPY . build
WORKDIR /open_spiel/build
RUN ls
CMD run.sh
```

## Installation 

```bash
git clone https://github.com/yarncraft/DockerizedOpenSpiel.git
cd DockerizedOpenSpiel

docker build -t openspiel .
docker run openspiel examples/example --game=tic_tac_toe
```

## Acknowledgements
Special thanks to Edward Lockhart https://github.com/elkhrt for helping out!

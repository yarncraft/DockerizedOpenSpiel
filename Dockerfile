FROM ubuntu:18.04
RUN apt update
RUN dpkg --add-architecture i386 && apt update
RUN apt-get -y install \
    clang \
    curl \
    git \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    sudo

RUN sudo pip3 install --upgrade pip
RUN sudo pip3 install matplotlib

# clone repository and install
RUN git clone -b 'master' --single-branch --depth 15 https://github.com/deepmind/open_spiel.git open_spiel
WORKDIR open_spiel
RUN ./install.sh

RUN pip3 install --upgrade setuptools testresources 
RUN pip3 install --upgrade -r requirements.txt
RUN pip3 install --upgrade cmake

# build (and test)
RUN mkdir -p build && \
    cd build && \
    cmake -DPython_TARGET_VERSION=${PYVERSION} -DCMAKE_CXX_COMPILER=`which clang++` ../open_spiel && \
    make -j4
    #ctest -j4 # add this in order to run the tests, takes a long time and a single fail will cancel the build
COPY . build

ENV PYTHONPATH=${PYTHONPATH}:/open_spiel/
ENV PYTHONPATH=${PYTHONPATH}:/open_spiel/build/python

#RUN python3 ./open_spiel/python/examples/matrix_game_example.py
WORKDIR ./open_spiel

FROM ubuntu:18.04

# Install Python, Git, Pip
RUN apt-get update && apt-get -y install sudo && apt-get -y install git
RUN sudo apt-get -y install python3-dev python3-pip
RUN sudo pip3 install -U virtualenv
RUN sudo pip3 install --upgrade pip
RUN sudo pip3 install matplotlib

WORKDIR /
RUN mkdir openspiel
COPY open_spiel/ /openspiel
WORKDIR openspiel

# Execute installation script
RUN chmod +x install.sh
RUN sed -i -e 's/apt-get install/apt-get install -y/g' ./install.sh
RUN ./install.sh

# Create Virtual Environment
RUN virtualenv -p python3 venv
RUN /bin/bash -c "source venv/bin/activate"

# Version Checks
RUN python3 --version
RUN pip3 --version
RUN virtualenv --version

# Installing Python Dependencies
RUN pip3 install --no-cache -r requirements.txt
RUN pip3 install --no-cache cmake

# Run tests
RUN ./open_spiel/scripts/build_and_run_tests.sh

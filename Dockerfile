FROM ubuntu:18.04

RUN apt-get update && apt-get install -y software-properties-common &&  \
    apt-get install -y openjdk-8-jdk libxext-dev libxrender-dev libxtst-dev wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# Install libgtk as a separate step so that we can share the layer above with
# the netbeans image
RUN apt-get update && apt-get install -y git libgtk2.0-0 libcanberra-gtk-module curl mc python3-pip locales

RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz | tar -xz -C /tmp && mv /tmp/docker/* /usr/bin && rm -rf /tmp/docker
RUN pip3 install git+https://github.com/ansible/ansible.git@v2.5.9

RUN locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN mkdir -p /home/developer 

ENV HOME /home/developer

WORKDIR /home/developer



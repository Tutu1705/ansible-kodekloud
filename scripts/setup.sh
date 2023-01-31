#!/usr/bin/env bash


yum install epel-release -y && \
yum update -y && \
yum groupinstall "Development Tools" -y && \
yum install wget openssl-devel libffi-devel bzip2-devel -y

wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz && \
tar xvf Python-3.9.13.tgz && \
cd Python-3.9*/ && \

./configure --enable-optimizations
make altinstall



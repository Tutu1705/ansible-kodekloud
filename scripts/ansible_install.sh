#!/usr/bin/env bash

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
runuser -l vagrant -c 'python3.9 get-pip.py --user && python3.9 -m pip install --user ansible'



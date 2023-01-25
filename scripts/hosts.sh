#!/usr/bin/env bash

printf "127.0.0.1 localhost $(hostname)\n::1 localhost $(hostname)" > /etc/hosts
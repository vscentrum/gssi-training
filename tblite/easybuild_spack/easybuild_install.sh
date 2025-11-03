#!/bin/bash

PREFIX=$VSC_DATA/gssi/easybuild
mkdir -p $PREFIX

python3 -m venv $PREFIX/venv
source $PREFIX/venv/bin/activate
pip install easybuild

eb --version

#!/bin/bash

PREFIX=$VSC_DATA/gssi
cd $PREFIX
source spack/share/spack/setup-env.sh

spack list tblite
spack info tblite
spack graph tblite

# build and install tblite (incl. required dependencies) with system compiler
spack install tblite@0.4.0 +python

# build and install tblite (incl. required dependencies) with GCC 13
# spack install gcc@13
# spack install tblite@0.4.0 +python %gcc@13

# load tblite to use it
spack load tblite +python

# run tblite command
which tblite
tblite --version

# use tblite Python bindings
python -c "from tblite.library import get_version; print(get_version())"

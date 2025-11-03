#!/bin/bash

PREFIX=$VSC_DATA/gssi/easybuild
source $PREFIX/venv/bin/activate

export EASYBUILD_PREFIX=$VSC_DATA/easybuild
export EASYBUILD_BUILDPATH=/tmp/$USER/easybuild/build

# show current configuration
eb --show-config

eb --search tblite

# check for missing dependencies
eb tblite-0.4.0-gfbf-2024a.eb --missing

# build + install tblite (incl. missing dependencies)
# note: --rebuild option is used because this module is already available in central software stack
eb tblite-0.4.0-gfbf-2024a.eb --robot --rebuild

# make module available and load it
module use $PREFIX/modules/all
module load tblite/0.4.0-gfbf-2024a

# run tblite command
which tblite
tblite --version

# use tblite Python bindings
python -c "from tblite.library import get_version; print(get_version())"

#!/bin/bash -l

export APPTAINER_CACHEDIR=/tmp/$USER/apptainer_cachedir
export APPTAINER_TMPDIR=/tmp/$USER/apptainer_tmpdir
mkdir -p "$APPTAINER_TMPDIR"

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}"
INSTALLDIR=$BASEDIR/hpc-container-wrapper/tblite-0.4.0
mkdir -p "$INSTALLDIR"

module load hpc-container-wrapper

echo "Building and installing Apptainer image + wrappers in $INSTALLDIR"
conda-containerize new --prefix "$INSTALLDIR" "$SCRIPT_DIR/environment.yml"

export PATH="$INSTALLDIR/bin:$PATH"

echo "--- Running tblite executable in container installed in $INSTALLDIR"
tblite --version

python -c "import tblite"

if [[ $? -eq 0 ]]; then
    echo "Import of tblite python package succeeded!"
else
    echo "Import of tblite python package failed!"
    exit 1
fi

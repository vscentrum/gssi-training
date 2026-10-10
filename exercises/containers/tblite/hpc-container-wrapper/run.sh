#!/bin/bash -l

RUNSCRIPT="$1"
if [[ -z $RUNSCRIPT ]]; then
    echo "A Python script to run has to be provided as first argument"
    exit 1
fi

if [[ ! -f $RUNSCRIPT ]]; then
    echo "Failed to find Python script to run ${RUNSCRIPT}"
    exit 1
fi

BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}"
INSTALLDIR="$BASEDIR/hpc-container-wrapper/tblite-0.4.0"

if [[ ! -d $INSTALLDIR ]]; then
    echo "Installation directory ${INSTALLDIR} does not exist, use install.sh to create it first"
    exit 1
fi

export PATH="$INSTALLDIR/bin:$PATH"

python "$RUNSCRIPT"

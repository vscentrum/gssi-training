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
IMAGEDIR="$BASEDIR/apptainer_definition_file"
IMAGE="$IMAGEDIR/tblite-0.4.0.sif"

if [[ ! -f $IMAGE ]]; then
    echo "Apptainer image $IMAGE does not exist, use install.sh to create it first"
    exit 1
fi

apptainer run "$IMAGE" python "$RUNSCRIPT"

#!/bin/bash -l

RUNSCRIPT=$1
if [ $RUNSCRIPT == "" ]
then
    echo "A Python script to run has to be provided as first argument"
    exit 1
fi

if [ ! -f $RUNSCRIPT ]
then
    echo "Failed to find Python script to run ${RUNSCRIPT}"
    exit 1
fi

BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}"
VENVDIR=${BASEDIR}/venv_tblite
if [ ! -d $VENVDIR ];
then
    echo "venv directory ${VENVDIR} does not exist, use install.sh to create it first"
    exit 1
fi

# Activate venv
source ${VENVDIR}/venv_tblite/bin/activate

python $RUNSCRIPT

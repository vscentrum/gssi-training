#!/bin/bash -l

BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}"
VENVDIR=${BASEDIR}/venv_tblite
echo "Setting up Python venv in ${VENVDIR}"
if [ -d $VENVDIR ];
then
    echo "venv directory ${VENVDIR} already exists, skipping creation"
else
    python -m venv ${VENVDIR}/venv_tblite
fi


source ${VENVDIR}/venv_tblite/bin/activate
python -m pip install --upgrade pip
python -m pip install tblite==0.4.0

python -c "import tblite"
if [ $? -eq 0 ]; then
    echo "Import of tblite python package succeeded!"
else
    echo "Import of tblite python package failed!"
    exit 1
fi

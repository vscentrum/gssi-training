#!/bin/bash -l

export APPTAINER_CACHEDIR=/tmp/$USER/apptainer_cachedir
export APPTAINER_TMPDIR=/tmp/$USER/apptainer_tmpdir
mkdir -p "$APPTAINER_TMPDIR"

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}"
IMAGEDIR="$BASEDIR/apptainer_definition_file"
mkdir -p "$IMAGEDIR"
IMAGE="$IMAGEDIR/tblite-0.4.0.sif"

echo "Building Apptainer image $IMAGE"

if [[ -f $IMAGE ]]; then
    echo "Image already exists, will overwrite"
fi

apptainer build --force --fakeroot "$IMAGE" "$SCRIPT_DIR/tblite-0.4.0.def" >"$IMAGEDIR/build.log"

echo "--- Inspecting $IMAGE"
apptainer inspect "$IMAGE"

echo "--- Showing help for $IMAGE"
apptainer run-help "$IMAGE"

echo "--- Testing $IMAGE"
apptainer test "$IMAGE"

echo "--- Running tblite executable in $IMAGE"
apptainer run "$IMAGE" tblite --version

apptainer run "$IMAGE" python -c "import tblite"

if [[ $? -eq 0 ]]; then
    echo "Import of tblite python package succeeded!"
else
    echo "Import of tblite python package failed!"
    exit 1
fi

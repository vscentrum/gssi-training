prefix=${BASEDIR}/micromamba
eval "$(${prefix}/bin/micromamba shell hook -s posix)"
micromamba activate myfirstenv
python $1
micromamba deactivate

prefix=${BASEDIR}/micromamba
mkdir -p ${prefix}
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -C ${prefix} -xvj bin/micromamba
eval "$(${prefix}/bin/micromamba shell hook -s posix)"
micromamba info
micromamba create -n myfirstenv tblite-python=0.4.0 -y -q
micromamba activate myfirstenv
tblite --version
python -c 'from tblite.library import get_version; print(get_version())'
micromamba deactivate

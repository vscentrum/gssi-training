module load Miniforge3/25.3.0-3
cat ~/.condarc
conda info
conda create -n myfirstenv -y
source activate myfirstenv
conda env list
conda search tblite-python
conda install tblite-python==0.4.0 -y
tblite --version
which tblite
ldd $(which tblite)
which python
python -c 'from tblite.library import get_version; print(get_version())'
conda install "libblas=*=*mkl" -y
ls -l $(dirname $(which tblite))/../lib/liblapack.so.3
conda deactivate
conda clean --all -y
printf "dependencies:\n  - conda-tree=1.1.1\n" > ${TMPDIR}/environment.yaml
conda env create -n mysecondenv -f ${TMPDIR}/environment.yaml -y
source activate mysecondenv
conda-tree -n myfirstenv deptree
conda deactivate

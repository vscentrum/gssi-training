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
conda deactivate

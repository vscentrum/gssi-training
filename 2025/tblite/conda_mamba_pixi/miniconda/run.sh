prefix=${BASEDIR}/miniconda
export PATH=${prefix}/miniconda/bin:${PATH}
source activate myfirstenv
python $1
conda deactivate

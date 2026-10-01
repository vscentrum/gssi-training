prefix=${BASEDIR}/pixi
export PATH=${prefix}/bin:${PATH}
script=${PWD}/$1
cd ${prefix}/pixi_envs/myfirstenv
pixi run python ${script}
cd -

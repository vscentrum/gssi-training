prefix=${BASEDIR}/pixi
curl -fsSL https://pixi.sh/install.sh | PIXI_NO_PATH_UPDATE=y PIXI_HOME=${prefix} sh
export PATH=${prefix}/bin:${PATH}
pixi init ${prefix}/pixi_envs/myfirstenv
cd ${prefix}/pixi_envs/myfirstenv
pixi add tblite-python==0.4.0
pixi list
cat pixi.toml
pixi run tblite --version
pixi run python -c 'from tblite.library import get_version; print(get_version())'
cd -

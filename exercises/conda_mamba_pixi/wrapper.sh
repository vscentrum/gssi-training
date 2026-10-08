export BASEDIR="${GSSI_BASEDIR:-$VSC_DATA}/conda"
echo "Using ${BASEDIR} as base directory"
rm -rf ${BASEDIR}
mkdir -p ${BASEDIR}

rm -rf ~/.conda
cat <<-EOF > ~/.condarc
channels:
  - conda-forge
envs_dirs:
  - ${BASEDIR}/conda_envs
pkgs_dirs:
  - ${BASEDIR}/conda_pkgs
EOF

directory=$1

if [ ! -d "${directory}" ]; then
  echo "An existing directory has to be provided as first argument"
fi

# Print each line in color and then execute it
echo -e "\nLaunching ${directory}/install.sh"
while read -r line; do
  printf "\n\n"
  echo -e "\033[33m\$ ${line}\n\033[0m"
  eval "${line}"
done < ${directory}/install.sh

echo -e "\nLaunching ${directory}/run.sh"
bash ${directory}/run.sh ../demoscripts/tblite-single-point-GFN2-xTB.py

# tblite

This directory demonstrates the different approaches to installing
[tblite](https://tblite.readthedocs.io/en/latest/) and its Python bindings,
which is used as a running example in this training.

## Developer guidelines

The different installation approaches each have their own subdirectory. This
subdirectory has to contain the following bash scripts:

- `install.sh`: this installs tblite. By default, `$VSC_DATA` is used as the
  base directory, but in case the `$GSSI_BASEDIR` variable is set it should
  be used instead.
  - The install script should be idempotent, it should succeed if an existing
    installation is already present.
  - The install script can also print useful feedback about the installation
    if desired.
- `run.sh`: this runs the Python script that is provided as the first
  command-line argument, making use of the installation done by `install.sh`

As an example, here are the commands you would execute to test the `python_venv_pip`
approach, assuming you are in the `tblite` subdirectory of the repository:

```
export GSSI_BASEDIR=${VSC_DATA}/gssi-tests
bash python_venv_pip/install.sh
bash python_venv_pip/run.sh demoscripts/tblite-single-point-GFN2-xTB.py
```

The last command should print an energy of -42.14746315838075.

### Known problems

- `python_venv_pip`
  - The pip package for `tblite==0.4.0` is only available for `python>=3.7`.
    The installation will fail on the VUB and KU Leuven/UHasselt Rocky8 nodes
    (which on the VUB cluster is only the case for login nodes, *not* for the
    compute nodes).

### TODO

- [ ] Add benchmark script

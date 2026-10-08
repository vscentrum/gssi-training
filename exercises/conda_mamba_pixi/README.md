# Conda / Mamba / Pixi

This exercise focuses on Conda environments (and their Pixi equivalents).

You can find the relevant documentation in the `Conda / Mamba / Pixi` section of
the [GSSI training material](https://vscentrum.github.io/gssi-training) and in
the ["Conda-based environment managers" page on VSCDocs](
https://docs.vscentrum.be/compute/software/installing_software/conda_based_managers.html).

## First steps

You can start with configuring Miniforge, creating a Conda environment and
installing software packages in it. You can go about this by either applying
the commands from the training material or by using the scripts included here
(best done in an interactive job):

```bash
cd ${VSC_DATA}/gssi-training/exercises/conda_mamba_pixi
export GSSI_BASEDIR=/tmp
bash wrapper.sh miniforge
```

Note that the wrapper script:

- removes the `~/.conda` directory (contains some cached settings)
- (over)writes the `~/.condarc` file

So consider backing up your `~/.condarc` if necessary (or modify `wrapper.sh`).

## Other packages

The scripts and slides use the [tblite](https://tblite.readthedocs.io/en/latest/)
package and its Python bindings as an example. You can substitute
`tblite(-python)` with your software package of interest. Use a `conda search`
command or browse the [conda-forge package index](https://conda-forge.org/packages)
to see whether it is indeed available as a Conda package.

## Other Conda implementations

If interested, you can repeat this exercise with Miniconda, Micrombamba
and/or Pixi (see the respective subdirectories).

## Other features to try

* Take a look at the output of the `conda info` command.

* If your Conda environment includes BLAS (as will be the case if you
  installed `tblite`), find out which BLAS implementation got installed
  by looking at the output of `conda list`. It is likely to be OpenBLAS -
  you can try changing it to the Intel MKL implementation using
  `conda install "libblas=*=*mkl"`.

* Create a separate Conda environment with the `conda-tree` package in it.
  Activate it and use it to analyze the dependency tree of your first Conda
  environment.

* Clean your package and other caches with `conda clean --all`.

## Homework: microarchitectural optimizations

* Using one of the Conda implementations, create a new environment and install
  the latest version of the eigensolver package ELPA with Open MPI support
  (with all packages taken from the conda-forge channel).

* Execute `elpa2_print_kernels` and compare the output with what you get if you
  use the same command from a centrally installed module
  (e.g. `ELPA/2023.05.001-foss-2023a`).

* Explain why the Conda installation offers ELPA2 kernels with AVX2 but not with
  AVX512 instructions, even if `conda info` indicates your CPU would support it
  (tip: look at [its conda-forge feedstock](
  https://github.com/conda-forge/elpa-feedstock)).

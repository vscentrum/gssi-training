# EasyBuild & Spack

Try completing the following exercises in your VSC account.

## EasyBuild

* [install EasyBuild](https://docs.easybuild.io/installation/) in a Python virtual environment, including some optional dependencies like `rich` and `archspec`;
* [configure EasyBuild](https://docs.easybuild.io/configuration/) to use `$VSC_DATA/easybuild` for software installations, module files, and sources, and `/tmp/$USER/easybuild` as location for (temporary) build directories;
* install `tblite-0.4.0-gfbf-2024a.eb` on top of the modules that are available centrally (you will need to use the `--rebuild` since the corresponding module is likely already available);
* create an easyconfig file for the [latest version of `tblite`](https://pypi.org/project/tblite/) (0.7.0) using the `gfbf/2026.1` toolchain, starting from `tblite-0.4.0-gfbf-2024a.eb`;
  * use your easyconfig to check how many modules need to be installed before tblite 0.7.0 can be installed;
  * try installing tblite 0.7.0 with your easyconfig file;
  * load the resulting module for tblite 0.7.0, and run an [example](https://tblite.readthedocs.io/en/latest/tutorial/python/singlepoint.html#first-calculation);

## Spack

* [install Spack](https://spack.readthedocs.io/en/latest/getting_started.html) in your VSC account (*not* in your home directory!);
* set up your environment to start using Spack;
* make Spack aware of the available system compilers;
* try installing tblite 0.7.0 with Spack, make sure that the Python bindings are also installed;
* set up your environment to use the installed tblite 0.7.0, and run an [example](https://tblite.readthedocs.io/en/latest/tutorial/python/singlepoint.html#first-calculation);

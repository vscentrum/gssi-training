# Installing R packages

This exercise aims to give you hands-on experience with installing R
packages and contrasting some different approaches. It should take
approximately 30 minutes to an hour to complete (potentially more when also
conducting the benchmark exercises). To get started, choose an R package that
has at least one non-trivial dependency and ideally includes some compiled
code (written in C, C++ or Fortran). It is recommended to choose an R package
related to your area of research, but if you are really lacking inspiration,
you can complete this exercise using the
[dplyr](https://github.com/tidyverse/dplyr) package.

You can find the relevant documentation in the "R and Julia" section of the
[GSSI training material](https://vscentrum.github.io/gssi-training) and in the
[R package management section on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/r_package_management.html).

Here are the different methods you can use to install R packages on a VSC
cluster:

- using centrally installed R packages from software modules
  (e.g., `R-bundle-CRAN`, `R-bundle-Bioconductor`, or dedicated modules for
  specific packages; use `module spider` to find a package)
- using `install.packages()` in a personal R library, e.g., under `$VSC_DATA`
  with `R_LIBS_USER` set in `~/.Renviron`
- installing specific package versions or packages from Git repositories,
  e.g., with `install_version()` from the `remotes` package,
  `devtools::install_github()`, or `R CMD INSTALL` from a source tarball
- using `vsc-rproject`, the tool to create and manage RStudio Projects from
  the command line (see
  [vsc-Rproject on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/vsc_rproject.html))
- using a Conda-based environment with R (see
  [conda-based environment managers on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/conda_based_managers.html))
- using an Apptainer container (see the
  [building containers exercise](../containers))

> **_NOTE:_** Make sure to keep the different installations separated, mixing
> approaches will likely cause problems

After trying the different installation approaches, compare them with respect
to the following characteristics:

- ease of use
- time it takes to install the package
- disk space and number of files consumed by the installation
- reproducibility
- portability (e.g., does the same installation work on different clusters,
  partitions or CPU microarchitectures? R packages with compiled code are
  sensitive to the `-march` compiler flag that was used at installation time)
- performance: ideally, use a benchmark (check if the source of the chosen
  package includes one) to compare runtimes for the different installations.
  Try to explain possible differences from a theoretical point of view and
  connect to what you observe in practice.

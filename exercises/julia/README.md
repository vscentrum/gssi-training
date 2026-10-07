# Installing Julia packages

This exercise aims to give you hands-on experience with installing Julia
packages and contrasting some different approaches. It should take
approximately 30 minutes to an hour to complete (potentially more when also
conducting the benchmark exercises). To get started, choose a Julia package
with a non-trivial dependency tree. It is recommended to choose a Julia
package related to your area of research, but if you are really lacking
inspiration, you can complete this exercise using the
[TightBindingToolkit](https://github.com/jdheather/TightBindingToolkit.jl) package.

You can find the relevant documentation in the "R and Julia" section of the
[GSSI training material](https://vscentrum.github.io/gssi-training) and in the
[Julia package management section on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/julia.html).

Here are the different methods you can use to install Julia packages on a VSC
cluster:

- using centrally installed Julia packages from software modules
  (use `module spider` to find them; note that these packages are usable in
  Julia but are not part of your own project environment)
- using `Pkg.add()` in the shared environment of your personal depot
  (by default `~/.julia`; consider moving the depot to `$VSC_DATA` to avoid
  filling up the quota of your home directory)
- using a Julia project environment (`Pkg.activate()` + `Pkg.add()`, which
  creates a `Project.toml` and `Manifest.toml` in your project directory)
- using a Julia project environment on top of a software module, inheriting
  the packages already provided by that module (see the "Julia environment on
  top of software module" section in the
  [Julia package management section on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/julia.html))
- using an Apptainer container (see the
  [building containers exercise](../containers))

> **_NOTE:_** Make sure to keep the different installations separated, mixing
> approaches will likely cause problems. Also be aware that Julia package
> installations can consume a lot of disk space, and that precompiling
> packages takes a significant amount of time and compute resources.

After trying the different installation approaches, compare them with respect
to the following characteristics:

- ease of use
- time it takes to install the package (including precompilation)
- disk space and number of files consumed by the installation
- reproducibility
- portability (e.g., does the same environment work on different clusters or
  with different Julia versions? Note that depots and project environments
  are tied to the major and minor version of Julia used to create them)
- performance: ideally, use a benchmark (check if the source of the chosen
  package includes one) to compare runtimes for the different installations.
  Try to explain possible differences from a theoretical point of view and
  connect to what you observe in practice.

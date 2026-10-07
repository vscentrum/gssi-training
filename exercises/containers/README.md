# Building Apptainer containers

This exercise aims to give you hands-on experience with building Apptainer
containers and contrasting some different approaches. It should take
approximately 30 minutes to an hour to complete (potentially more when also
conducting the benchmark exercises). It is recommended to choose a software
package related to your area of research, but if you are really lacking
inspiration, you can complete this exercise using the
[astropy](https://github.com/astropy/astropy) package.

You can find the relevant documentation in the "Building Containers" section of
the [GSSI training material](https://vscentrum.github.io/gssi-training) and in
the [Building Containers section on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/containers.html#building-apptainer-containers).

Here are the different methods you can use to build an Apptainer container on a
VSC cluster:

- interactively from a base image
- from an Apptainer definition file
- using `hpc-container-wrapper`
- via a Docker image created from a Dockerfile (if you have access to Docker or Podman)

When building with `hpc-container-wrapper`, however, only `Conda` or `pip` can be used.

For the other methods, `astropy` can be installed in the container in different ways:

- with a Python package manager (e.g. `pip`)
    - requires installing the package manager in the container
    - see the [Python package management section on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/python_package_management.html#)
- with `Conda`
    - requires installing Conda in the container
    - see [Conda on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/conda_based_managers.html#)
- with `EasyBuild` (advanced)
    - requires installing EasyBuild in the container
    - an easyconfig is available in the EasyBuild repository
    - see [EasyBuild on VSCDocs](https://docs.vscentrum.be/compute/software/installing_software/easybuild_spack.html#id2)

Configure the container environment and `runscript` to ensure the following runs successfully:

```bash
apptainer run <image.sif> <app-command>
```

For `astropy`, you can use `python3 -c 'import astropy; print(astropy.__file__)'` as app-command.

After trying the different installation approaches, compare them with respect
to the following characteristics:

- ease of use
- time it takes to build the container
- disk space and number of files consumed by the installation
- reproducibility
- portability (e.g., does the same installation work on different architectures?)
- performance: ideally, use a benchmark (check if the source of the chosen
  package includes one) to compare runtimes for the different installations.
  Try to explain possible differences from a theoretical point of view and
  connect to what you observe in practice.
  > **_NOTE:_** In case you chose `astropy` as the example to work with, have
  a look at the [astropy-benchmarks](https://github.com/astropy/astropy-benchmarks)
  repository.

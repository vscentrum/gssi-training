# Manual compilation exercises

These exercises show different ways of compiling software from source on an HPC system.

- [Compile software with Rust](Rust.md)
- [Compile software with Go](Go.md)
- [Build software with CMake and Ninja](CMake_Ninja.md)

The exact build procedure depends on the software and the build system it uses. 
Before starting, inspect the source tree and check the project documentation for installation or build instructions.

### Where to compile

As a general rule, compile software on compute nodes rather than login nodes, even for relatively small builds. 
If you want to use optimizations for a specific CPU architecture, compile on hardware that matches the nodes where you intend to run the software.

Larger projects can require significant CPU and memory resources during compilation.

### More information
For more information about compiling and installing software on VSC systems, 
see the [VSC documentation on compiling software](https://docs.vscentrum.be/compute/software/installing_software/compiling_software.html)
and the [GSSI training material](https://vscentrum.github.io/gssi-training).

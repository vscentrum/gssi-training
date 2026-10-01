# Conda / Mamba / Pixi

These are scripts for demoing the Conda/Mamba/Pixi part of the training.

Example usage (preferably in an interactive job):

```bash
export GSSI_BASEDIR=/tmp
bash wrapper.sh miniforge
```

Note that the wrapper script:

- removes the `~/.conda` directory (contains some cached settings)
- (over)writes the `~/.condarc` file

So consider backing up your `~/.condarc` if necessary (or modify `wrapper.sh`).

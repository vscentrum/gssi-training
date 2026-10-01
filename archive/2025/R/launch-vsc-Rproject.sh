#!/bin/bash

# 1. Load vsc-Rproject
module load vsc-Rproject

# 2. Set modules
echo "R/4.4.2-gfbf-2024a" > my-rproject-modules.txt
echo "R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2" >> my-rproject-modules.txt

# 3. Create project
mkdir -p $VSC_DATA/Rprojects
rm -rf $VSC_DATA/Rprojects/MyProject/
vsc-rproject create MyProject --modules="my-rproject-modules.txt"

# 4. Activate Project
vsc-rproject activate MyProject

# 5. Use Project
cd $VSC_RPROJECT
R

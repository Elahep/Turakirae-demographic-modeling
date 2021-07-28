#!/bin/bash
#SBATCH --account=uoo02782
#SBATCH --job-name=simulations
#SBATCH --partition=large
#SBATCH --time=30:00:00
#SBATCH --mem=10G
#SBATCH --output=/nesi/nobackup/uoo02782/Onito/Felix_modeling/tendbot1equal2_62generations/delimitR_62gen.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=uoo02782
#SBATCH --cpus-per-task=8

module load R
srun Rscript fastsimcoalsims.R

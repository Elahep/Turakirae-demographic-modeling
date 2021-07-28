#!/bin/bash
#SBATCH --account=uoo02782
#SBATCH --job-name=fscsims_p
#SBATCH --partition=large
#SBATCH --time=20:00:00
#SBATCH --mem=10G
#SBATCH --output=/nesi/nobackup/uoo02782/Onito/Felix_modeling/tendbot1equal2_62generations/makeprior.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ellie.parvizi@gmail.com
#SBATCH --cpus-per-task=14

module load Python
module load R
srun Rscript makeprior.R

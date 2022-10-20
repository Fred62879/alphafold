#!/bin/bash
#SBATCH --array=0
#SBATCH --time=6:00:00
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=40000
#SBATCH --cpus-per-task=8
#SBATCH --account=def-gsponer
#SBATCH --job-name=alphafold_full_dibs_poly_g_6_gpu
#SBATCH --output=./output/%x-%j.out

DOWNLOAD_DIR=/datashare/alphafold
REPO_DIR=~/scratch/fred862/code/bioinfo/alphafold
#DOWNLOAD_DIR=~/scratch/fred862/data/bioinfo/input/database
OUTPUT_DIR=~/scratch/fred862/data/bioinfo/output/dibs_af_full/poly_g_6
INPUT_DIR=~/scratch/fred862/data/bioinfo/input/seq_to_pred/dibs/poly_g_6
FASTA_FN=~/scratch/fred862/data/bioinfo/input/seq_to_pred/dibs/pdb_cho0.npy
EXCLUDE_FN=~/scratch/fred862/data/bioinfo/input/seq_to_pred/dibs/pdb_exclude0.npy

module load gcc/9.3.0 openmpi/4.0.3 cuda/11.4 cudnn/8.2.0 kalign/2.03 hmmer/3.2.1 openmm-alphafold/7.5.1 hh-suite/3.3.0 python/3.8

source ~/env/alphafold_env/bin/activate

python ${REPO_DIR}/run_alphafold.py \
       --batch_sz=10 \
       --batch_id=$SLURM_ARRAY_TASK_ID \
       --run_feature=False \
       --use_gpu_relax=True \
       --use_precomputed_msas=True \
       --model_preset=monomer_casp14 \
       --max_template_date=2020-05-14 \
       --fasta_dir=${INPUT_DIR} \
       --data_dir=${DOWNLOAD_DIR} \
       --output_dir=${OUTPUT_DIR} \
       --fasta_names_fn=${FASTA_FN} \
       --fasta_exclude_fn=${EXCLUDE_FN} \
       --kalign_binary_path=${EBROOTKALIGN}/bin/kalign \
       --pdb70_database_path=${DOWNLOAD_DIR}/pdb70/pdb70 \
       --jackhmmer_binary_path=${EBROOTHMMER}/bin/jackhmmer \
       --hhblits_binary_path=${EBROOTHHMINSUITE}/bin/hhblits \
       --hhsearch_binary_path=${EBROOTHHMINSUITE}/bin/hhsearch \
       --template_mmcif_dir=${DOWNLOAD_DIR}/pdb_mmcif/mmcif_files \
       --obsolete_pdbs_path=${DOWNLOAD_DIR}/pdb_mmcif/obsolete.dat \
       --uniref90_database_path=${DOWNLOAD_DIR}/uniref90/uniref90.fasta  \
       --mgnify_database_path=${DOWNLOAD_DIR}/mgnify/mgy_clusters_2018_12.fa \
       --uniclust30_database_path=${DOWNLOAD_DIR}/uniclust30/uniclust30_2018_08/uniclust30_2018_08  \
       --bfd_database_path=${DOWNLOAD_DIR}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt

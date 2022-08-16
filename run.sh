#!/bin/bash

#DOWNLOAD_DIR=/datashare/alphafold
REPO_DIR=~/scratch/fred862/code/bioinfo/alphafold
OUTPUT_DIR=~/scratch/fred862/data/bioinfo/alphafold/output
DOWNLOAD_DIR=~/scratch/fred862/data/bioinfo/alphafold/input/database
INPUT_DIR=~/scratch/fred862/data/bioinfo/alphafold/input/seq_to_pred

module load gcc/9.3.0 openmpi/4.0.3 cuda/11.4 cudnn/8.2.0 kalign/2.03 hmmer/3.2.1 openmm-alphafold/7.5.1 hh-suite/3.3.0 python/3.8

source ~/env/alphafold_env/bin/activate

python ${REPO_DIR}/run_alphafold.py \
       --run_feature=True \
       --use_gpu_relax=False \
       --use_precomputed_msas=False \
       --model_preset=monomer_casp14 \
       --max_template_date=2020-05-14 \
       --data_dir=${DOWNLOAD_DIR} \
       --output_dir=${OUTPUT_DIR} \
       --fasta_paths=${INPUT_DIR}/1.fasta \
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

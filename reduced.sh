#!/bin/bash

# Set the path to download dir
#DOWNLOAD_DIR=/datashare/alphafold
REPO_DIR=~/scratch/fred862/code/bioinfo/alphafold
DOWNLOAD_DIR=~/scratch/fred862/data/bioinfo/input/database
INPUT_DIR=~/scratch/fred862/data/bioinfo/input/seq_to_pred/idr_84/poly_g_6
OUTPUT_DIR=~/scratch/fred862/data/bioinfo/output/idr_84_af_reduced

module load gcc/9.3.0 openmpi/4.0.3 cuda/11.4 cudnn/8.2.0 kalign/2.03 hmmer/3.2.1 openmm-alphafold/7.5.1 hh-suite/3.3.0 python/3.8

source ~/env/alphafold_env/bin/activate

python ${REPO_DIR}/run_alphafold.py \
       --fasta_lo=0 \
       --fasta_hi=6 \
       --run_feature=True \
       --use_gpu_relax=True \
       --db_preset=reduced_dbs \
       --use_precomputed_msas=True \
       --model_preset=monomer_casp14 \
       --max_template_date=2020-05-14 \
       --fasta_dir=${INPUT_DIR} \
       --data_dir=${DOWNLOAD_DIR} \
       --output_dir=${OUTPUT_DIR} \
       --kalign_binary_path=${EBROOTKALIGN}/bin/kalign \
       --pdb70_database_path=${DOWNLOAD_DIR}/pdb70/pdb70 \
       --jackhmmer_binary_path=${EBROOTHMMER}/bin/jackhmmer \
       --hhblits_binary_path=${EBROOTHHMINSUITE}/bin/hhblits \
       --hhsearch_binary_path=${EBROOTHHMINSUITE}/bin/hhsearch \
       --template_mmcif_dir=${DOWNLOAD_DIR}/pdb_mmcif/mmcif_files \
       --obsolete_pdbs_path=${DOWNLOAD_DIR}/pdb_mmcif/obsolete.dat \
       --uniref90_database_path=${DOWNLOAD_DIR}/uniref90/uniref90.fasta  \
       --mgnify_database_path=${DOWNLOAD_DIR}/mgnify/mgy_clusters_2018_12.fa \
       --small_bfd_database_path=${DOWNLOAD_DIR}/small_bfd/bfd-first_non_consensus_sequences.fasta

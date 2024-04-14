#!/bin/bash
GPU_ID=0
data_dir=C:/Users/admin/Desktop/MPhil/transferlearning/code/DeepDA/seed_dataset_office

# Define the list of algorithms
declare -a algorithms=("DAN" "BNM" "DAAN" "DANN" "DeepCoral" "DSAN")

# Remaining combinations for this script
declare -a src_domains=("batch_1" "batch_2" "batch_2" "batch_3" "batch_3")
declare -a tgt_domains=("batch_3" "batch_1" "batch_3" "batch_1" "batch_2")

# Loop through each algorithm
for alg in "${algorithms[@]}"; do
    # Create a directory for the algorithm if it doesn't exist
    mkdir -p results/$alg
    
    # Loop through the remaining combinations
    for i in "${!src_domains[@]}"; do
        src="${src_domains[$i]}"
        tgt="${tgt_domains[$i]}"
        log_file_name="results/${alg}/${alg}-${src}-${tgt}.csv"
        CUDA_VISIBLE_DEVICES=$GPU_ID python main.py --config ${alg}/${alg}.yaml --data_dir $data_dir --src_domain $src --tgt_domain $tgt --log_file_name $log_file_name
    done
done
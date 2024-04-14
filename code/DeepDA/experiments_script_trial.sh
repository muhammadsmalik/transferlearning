#!/usr/bin/env bash
GPU_ID=0
data_dir=C:/Users/admin/Desktop/MPhil/transferlearning/code/DeepDA/seed_dataset_office
# DAN
## Batch 1 to 2
CUDA_VISIBLE_DEVICES=$GPU_ID python main.py --config DAN/DAN.yaml --data_dir $data_dir --src_domain batch_1 --tgt_domain batch_2 --log_file_name results/DAN-batch-1-2.csv
## Batch 3 to 2
CUDA_VISIBLE_DEVICES=$GPU_ID python main.py --config DAN/DAN.yaml --data_dir $data_dir --src_domain batch_3 --tgt_domain batch_2 --log_file_name results/DAN-batch-3-2.csv
## Batch 1 to 3
CUDA_VISIBLE_DEVICES=$GPU_ID python main.py --config DAN/DAN.yaml --data_dir $data_dir --src_domain batch_1 --tgt_domain batch_3 --log_file_name results/DAN-batch-1-3.csv
## Batch 2 to 3
CUDA_VISIBLE_DEVICES=$GPU_ID python main.py --config DAN/DAN.yaml --data_dir $data_dir --src_domain batch_2 --tgt_domain batch_3 --log_file_name results/DAN-batch-2-3.csv


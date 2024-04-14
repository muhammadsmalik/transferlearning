import pandas as pd
import os
import shutil

# Define the paths
source_path = 'data/seed_dataset_new/Images'
target_base_path = 'code/DeepDA/seed_dataset_office'
csv_files = {
    'batch_1': ['train.csv', 'val.csv'],
    'batch_2': ['test.csv'],
    'batch_3': ['test_2.csv']
}

# Function to process each CSV file
def process_csv(batch, csv_file):
    df = pd.read_csv(os.path.join('data/seed_dataset_new', csv_file))
    for index, row in df.iterrows():
        filename = row['filename']
        label = row['label']
        # Construct source and target paths
        source_file_path = os.path.join(source_path, filename)
        target_dir_path = os.path.join(target_base_path, batch, label)
        target_file_path = os.path.join(target_dir_path, filename)
        
        # Create the target directory if it doesn't exist
        os.makedirs(target_dir_path, exist_ok=True)
        
        # Copy the file from the source to the target
        shutil.copy(source_file_path, target_file_path)

# Process each CSV file for each batch
for batch, csv_list in csv_files.items():
    for csv_file in csv_list:
        process_csv(batch, csv_file)

#!/bin/bash
# 🔄 Backup Script with optional Zip/Unzip functionality

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR="backup-$DATE"

echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "Copying all .txt files from Documents/..."
cp Documents/*.txt "$BACKUP_DIR"/

echo "Backup completed! Files saved in: $BACKUP_DIR"

# Ask user if they want to compress the backup
echo "Do you want to compress this backup into a .tar.gz file? (y/n)"
read compress

if [[ $compress == "y" || $compress == "Y" ]]; then
    tar -czf "$BACKUP_DIR.tar.gz" "$BACKUP_DIR"
    echo "Backup compressed into: $BACKUP_DIR.tar.gz"
    
    # Ask if user wants to unzip it back
    echo "Do you want to extract (unzip) it back? (y/n)"
    read extract

    if [[ $extract == "y" || $extract == "Y" ]]; then
        mkdir -p "extracted-$DATE"
        tar -xzf "$BACKUP_DIR.tar.gz" -C "extracted-$DATE"
        echo "Backup extracted into: extracted-$DATE"
    fi
fi


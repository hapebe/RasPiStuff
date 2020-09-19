#!/bin/bash
sudo ./mount-sf-feodora.sh
sudo rsync -av /home/hapebe/sassnitz/feodora /mnt/feodora/import
sudo rm /mnt/feodora/Thumbs.db

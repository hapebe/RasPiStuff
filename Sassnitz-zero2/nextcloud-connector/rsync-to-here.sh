#!/bin/bash
# -n would mean: dry-run (for testing...)
# -v would mean: verbose (list individual file paths)
rsync -a sassn:/home/sassn/Projects/Sassnitz-zero2/photos/*.jpg /home/hapebe/Nextcloud/Photos/Sassnitz-2026/

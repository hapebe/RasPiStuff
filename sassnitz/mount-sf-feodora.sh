#!/bin/bash
#
# mounts the virtualbox shared folder "e_feodora" for exporting
# the local store of images here to the import folder of the
# PHP/drupal system
#
sudo mount -t vboxsf e_feodora /mnt/feodora

# PVE VMA extract

Image with all the necessary dependencies to extract a "backup" file from ProxmoxVE.

The image exposes `/backup` as a good place to mount the folder with the backup.

Uncrompress the archive with:

> $ lzop -d ./file.vma.lzo -p

Then extract the archive with 

> $ vma extract ./file.vma -v ./vmaextract

There should now be two file in `vmaextract`:

- config_file
- raw_backup_file

# PVE VMA extract

Image with all the necessary dependencies to extract/verify a "backup" file from Proxmox VE.

The image exposes `/backup` as a good place to mount the folder with the backup.


Uncrompress the archive with:

> $ unzstd ./file.vma.zst

Or directly print it 

> $ zstdcat ./file.vma.zst

Then extract the archive with 

> $ vma extract ./file.vma -v ./vmaextract

Or verify it 

> $ zstdcat ./file.vma.zst | vma verify -v -

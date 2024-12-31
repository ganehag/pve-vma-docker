# PVE VMA extract

Image with all the necessary dependencies to extract/verify a "backup" file from Proxmox VE.

The image exposes `/backup` as a good place to mount the folder with the backup.

To build the image, run `docker build . -t pve-vma-extract`

make sure the interested backup file is present in this <path_to_the_backup_folder> which is mounted to the docker container.

Now start the container using `docker run -it -v <path_to_the_backup_folder>:/backup pve-vma-extract:latest`

Once inside the docker container, uncrompress the archive using `unzstd /backup/<file>.vma.zst`

Then extract the archive using `vma extract ./<file>.vma -v ./vmaextract`

To verify it, run `zstdcat ./<file>.vma.zst | vma verify -v -`


## Post extraction steps

After running the extraction, if everything went well, a .raw file and a .config file is created. 

` file *.raw` - this will tell you want kind of file it is (eg: DOS/MBR boot sector)

` fdisk -l *.raw` - this will show you all the partitions that are present in this image

`sudo losetup -Pf --show disk-drive-scsi0.raw` - this will create a loop device under /dev which can now be mounted on your system

`sudo mount /dev/loop0 /mnt`

Now you can read all the files of the pve vm image under the `/mnt` directory.

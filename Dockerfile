FROM debian:jessie

WORKDIR /tmp

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget libglib2.0-0 libiscsi2 librbd1 libaio1 lzop glusterfs-common && \
  echo deb "http://download.proxmox.com/debian wheezy pve" >> /etc/apt/sources.list && \
  wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add - && \
  apt-get update && \
  apt-get download pve-qemu-kvm && \
  dpkg --fsys-tarfile ./pve-qemu-kvm*.deb | tar xOf - ./usr/bin/vma > ./vma && \
  chmod u+x ./vma && \
  mv ./vma /usr/local/bin && \
  ln -sf /usr/lib/x86_64-linux-gnu/libiscsi.so.2 /usr/lib/x86_64-linux-gnu/libiscsi.so.1 && \
  mkdir -p /backup && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /backup

VOLUME /backup


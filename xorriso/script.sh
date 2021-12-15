mkdir -p iso/nocloud/

xorriso -osirrox on -indev "ubuntu-20.04.3-live-server-amd64.iso" -extract / iso && chmod -R +w iso

touch iso/nocloud/meta-data

cp user-data iso/nocloud/user-data

sed -i 's|---|autoinstall ds=nocloud\\\;s=/cdrom/nocloud/ ---|g' iso/boot/grub/grub.cfg
sed -i 's|---|autoinstall ds=nocloud;s=/cdrom/nocloud/ ---|g' iso/isolinux/txt.cfg

md5sum iso/.disk/info > iso/md5sum.txt
sed -i 's|iso/|./|g' iso/md5sum.txt

xorriso -as mkisofs -r \
  -V Ubuntu\ custom\ amd64 \
  -o ubuntu-20.04.3-live-server-amd64-autoinstall.iso \
  -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot \
  -boot-load-size 4 -boot-info-table \
  -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot \
  -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
  -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin  \
  iso/boot iso



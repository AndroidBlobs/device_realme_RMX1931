#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:3ceabc84191caba63d1337f51e282de6ad2593d4; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:7fc3637b86c23ea56092cb349110ed4fb2c3255d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:3ceabc84191caba63d1337f51e282de6ad2593d4 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi

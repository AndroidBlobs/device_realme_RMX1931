#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:8f6cc224ca91c36d3c4c57c6e3c7015fe6728949; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:f60ba33a142b4f87ce839d31e508b36faf8630ab \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:8f6cc224ca91c36d3c4c57c6e3c7015fe6728949 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi

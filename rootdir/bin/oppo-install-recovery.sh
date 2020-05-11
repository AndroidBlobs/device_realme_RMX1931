#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:e80fefa15f42b33b64b9e348a6bf6469c02e798b; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:f49dde75316c9ac8ac153ed0235c922be994f219 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:e80fefa15f42b33b64b9e348a6bf6469c02e798b && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi

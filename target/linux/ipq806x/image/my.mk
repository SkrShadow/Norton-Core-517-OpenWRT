define Device/askey_rt4230w
	$(call Device/DniImage)
	DEVICE_DTS := qcom-ipq8065-rt4230w
	KERNEL_SIZE := 4096k
	NETGEAR_BOARD_ID := RT4230W
	NETGEAR_HW_ID := 29764958+0+512+1024+4x4+4x4+cascade
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	BOARD_NAME := rt4230w
        SUPPORTED_DEVICES += rt4230w
	DEVICE_TITLE := Askey RT4230W
	DEVICE_PACKAGES := ath10k-firmware-qca9984
endef
TARGET_DEVICES += askey_rt4230w

define Device/ruijie_rg-mtfi-m520
	DEVICE_DTS := qcom-ipq8064-rg-mtfi-m520
	KERNEL_SIZE := 4096k
	BLOCKSIZE := 64k
	BOARD_NAME := rg-mtfi-m520
	DEVICE_TITLE := Ruijie RG-MTFi-M520
	SUPPORTED_DEVICES += rg-mtfi-m520
	KERNEL_SUFFIX := -uImage
	KERNEL = kernel-bin | append-dtb | uImage none | pad-to $${KERNEL_SIZE}
	KERNEL_NAME := zImage
	IMAGES := sysupgrade.bin factory.bin mmcblk0p3-rootfs.bin mmcblk0p2-kernel.bin
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to $$$${BLOCKSIZE} | sysupgrade-tar rootfs=$$$$@ | append-metadata
	IMAGE/mmcblk0p2-kernel.bin := append-kernel | pad-to $$$${KERNEL_SIZE}
	IMAGE/mmcblk0p3-rootfs.bin := append-rootfs | pad-rootfs
	IMAGE/factory.bin := qsdk-ipq-factory-nor
	DEVICE_PACKAGES := ath10k-firmware-qca988x e2fsprogs kmod-fs-ext4 losetup
endef
TARGET_DEVICES += ruijie_rg-mtfi-m520

define Device/core-517
	DEVICE_DTS := qcom-ipq8065-core-517
	KERNEL_SIZE := 4096k
	BLOCKSIZE := 64k
	BOARD_NAME := core-517
	DEVICE_TITLE := Nortor Core 517
	SUPPORTED_DEVICES += core-517
	DEVICE_PACKAGES := ath10k-firmware-qca9984 e2fsprogs kmod-fs-ext4 losetup
	$(call Device/FitImage)
	IMAGES := mmcblk0p10-rootfs.bin mmcblk0p9-kernel.bin sysupgrade.bin
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to $$$${BLOCKSIZE} | sysupgrade-tar rootfs=$$$$@ | append-metadata
	IMAGE/mmcblk0p9-kernel.bin := pad-extra 40 | append-kernel | pad-to $$$${KERNEL_SIZE}
	IMAGE/mmcblk0p10-rootfs.bin := append-rootfs | pad-rootfs
endef
TARGET_DEVICES += core-517

include vendor/twrp/config/BoardConfigKernel.mk
include vendor/twrp/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
    ifeq ($(BOARD_BOOT_HEADER_VERSION),3)
         # GENERIC_KERNEL_CMDLINE += twrpfastboot=1
         # Patched out for Infinix X695C (MT6785) — twrpfastboot=1 in boot header
         # prevents normal boot to Android homescreen (TWRP ForceNormalBoot() inverts
         # this flag's meaning and always lands in recovery). LK already sets
         # force_normal_boot=1 dynamically when booting system, so we don't need
         # twrpfastboot=1 to enter recovery via Power+VolDown key combo.
    else
        # INTERNAL_KERNEL_CMDLINE += twrpfastboot=1
        # Patched out for the same reason above.
    endif
endif

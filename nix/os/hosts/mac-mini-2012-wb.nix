# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:
let
  data-raid0 = ''
    ARRAY /dev/md0 level=raid0 num-devices=2 metadata=1.2 name=worldbringer:0 UUID=b9f89ee8:d7ab1bd6:5540a20a:13150975
      devices=/dev/sda,/dev/sdb
    PROGRAM ${pkgs.coreutils}/bin/true
  '';
in {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "firewire_ohci" "usbhid" "usb_storage" "uas" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # boot.swraid.enable = true;
  # boot.swraid.mdadmConf = data-raid0;

  # environment.etc = { "mdadm.conf".text = data-raid0; };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4d5a4ccc-bd54-40b7-a097-59ace2adb7ee";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F6FE-DB9C";
      fsType = "vfat";
    };

   fileSystems."/data" =
   { device = "/dev/disk/by-uuid/9bb40438-37bd-4bd5-8623-0ae82973337e";
     fsType = "ext4";
   };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/fd4b9f01-9315-47d3-b2b8-1e93da899c49"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0f0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
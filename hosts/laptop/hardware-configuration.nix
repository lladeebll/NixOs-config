# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/19b5d121-92c2-4619-844d-5a03c511c938";
      fsType = "btrfs";
      options = [ "subvol=@" "noatime" "space_cache=v2" "compress=zstd" "ssd" "discard=async" "commit=120" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/de46d656-0a3e-4bb2-a77f-234c76284fcc";
      fsType = "btrfs";
      options = [ "subvol=@log" "noatime" "space_cache=v2" "compress=zstd" "commit=120" ];
      neededForBoot = true;
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/de46d656-0a3e-4bb2-a77f-234c76284fcc";
      fsType = "btrfs";
      options = [ "subvol=@home" "noatime" "space_cache=v2" "compress=zstd" "commit=120" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/19b5d121-92c2-4619-844d-5a03c511c938";
      fsType = "btrfs";
      options = [ "subvol=@persist" "noatime" "space_cache=v2" "compress=zstd" "ssd" "discard=async" "commit=120" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/19b5d121-92c2-4619-844d-5a03c511c938";
      fsType = "btrfs";
      options = [ "subvol=@nix" "noatime" "space_cache=v2" "compress=zstd" "ssd" "discard=async" "commit=120" ];
    };

  fileSystems."/.snapshots" =
    { device = "/dev/disk/by-uuid/19b5d121-92c2-4619-844d-5a03c511c938";
      fsType = "btrfs";
      options = [ "subvol=@.snapshots" "noatime" "space_cache=v2" "compress=zstd" "ssd" "discard=async" "commit=120" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/20BE-3619";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

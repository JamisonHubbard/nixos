{
    config,
    lib,
    pkgs,
    modulesPath,
    ...
}: {
    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [
        "kvm-intel"
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
    ];
    boot.extraModulePackages = [];

    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    boot.supportedFilesystems = [ "ntfs" ];

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.prime = {
        sync.enable = true;
        amdgpuBusId = "PCI:0:0:0";
        nvidiaBusId = "PCI:1:0:0";
    };

    fileSystems."/" = {
        device = "/dev/disk/by-uuid/764e403a-3e87-4b18-9cb2-a04933a97d58";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/5522-1A1C";
        fsType = "vfat";
        options = [
            "fmask=0077"
            "dmask=0077"
        ];
    };

    fileSystems."/mnt/ntfs" = {
        device = "/dev/disk/by-uuid/2E5A4F9D5A4F6127";
        fsType = "ntfs-3g";
        options = [ "rw" "uid=1000" ];
    };

    swapDevices = [
        { device = "/dev/disk/by-uuid/24a3d7bb-a5f0-465a-ba40-8bddfb40f758"; }
    ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

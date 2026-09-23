{ self, inputs, ... }: {

  flake.nixosModules.nixos-qemu-module = { pkgs, ... }:

  let
    stateVersion = "26.05";
  in
  {
    environment.systemPackages = [
      pkgs.vim
      pkgs.firefox
    ];

    users.users.nixos = {
      isNormalUser = true;
      shell = pkgs.fish;
    };
    home-manager.users.nixos = self.homeModules.nixos-module;

    system.stateVersion = "${stateVersion}";
  };

}
#  {
#
##    imports = [
##      # Hardware
##      self.nixosModules.hardware-nixos-qemu
##      # System
##      (self.modules.nixos.systemd)
##      (self.modules.nixos.settings)
##      (self.modules.nixos.ssh)
##      (self.modules.nixos.xserver)
##      (self.modules.nixos.kde-plasma)
##      (self.modules.nixos.localization)
##      (self.modules.nixos.system-packages)
##      # Users
##      (self.modules.nixos.nixos)
##      (self.modules.nixos.michael)
##      # (self.modules.nixos.root)
##      # Look and Feel
##      # (self.modules.nixos.look-and-feel-plasma)
##    ];
#
#    boot.loader.grub.enable = true;
#    boot.loader.grub.device = "/dev/sda";
#    boot.loader.grub.useOSProber = true;
#
#    boot.kernelPackages = pkgs.linuxPackages_latest;
#
#    networking.hostName = "nixos-qemu";
#    networking.networkmanager.enable = true;
#
#    system.stateVersion = "${stateVersion}";
#
#  };

}

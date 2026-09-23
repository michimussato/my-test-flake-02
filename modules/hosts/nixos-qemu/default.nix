{ self, inputs, ... }: {

  # This is your system configuration entry-point
  flake.nixosConfigurations.nixos-qemu = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nixos-qemu-module
      self.nixosModules.myHomeManager
    ];
  };

}

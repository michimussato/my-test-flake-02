{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.nixos-2 = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.nixos-2-module
      {
        # probably not necessary if defined in configuration.nix
        # home.username = "nixos";
        # home.homeDirectory = "/home/nixos";
        home.stateVersion = "26.05";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.nixos-2-module = { pkgs, ... }: {
#    programs.bash.enable = false;
    programs.bash.shellAliases.ll = "ls -l";
    programs.bash.shellAliases.tri = "tree .";

#    programs.fish.enable = true;
    programs.fish.shellAliases.ll = "ls -l";
    programs.fish.shellAliases.tri = "tree .";

    home.packages = [
      pkgs.btop
      pkgs.zsh
      # pkgs.fish
    ];
    home.stateVersion = "26.05";
  };

}

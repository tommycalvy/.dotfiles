{ 
   self,
   nix-darwin,
   nixpkgs,
   home-manager,
   ...
}@inputs:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  pkgs.vim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      services.karabiner-elements.enable = true;

      nixpkgs.overlays = [
	(final: prev: {
	  karabiner-elements = prev.karabiner-elements.overrideAttrs (old: {
	    version = "14.13.0";

	    src = prev.fetchurl {
	      inherit (old.src) url;
	      hash = "sha256-gmJwoht/Tfm5qMecmq1N6PSAIfWOqsvuHU8VDJY8bLw=";
	    };
	  });
	})
      ];

      security.pam.enableSudoTouchIdAuth = true;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Tommys-MacBook-Pro
    darwinConfigurations."Tommys-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        home-manager.darwinModules.home-manager
        {
	  home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tommycalvy = import ./home.nix;
	}
      ];
    };
  };


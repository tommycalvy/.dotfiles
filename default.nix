{ 
	self,
	nix-darwin,
	nixpkgs,
	home-manager,
	...
}@inputs:
let
    tlcvim = (import ./nvim { inherit inputs; }).homeModules.default;
	configuration = { pkgs, ... }: {

		# Necessary for using flakes on this system.
		nix.settings.experimental-features = "nix-command flakes";

		# Set Git commit hash for darwin-version.
		system.configurationRevision = self.rev or self.dirtyRev or null;

		# Used for backwards compatibility, please read the changelog before changing.
		# $ darwin-rebuild changelog
		system.stateVersion = 5;

		# The platform the configuration will be used on.
		nixpkgs.hostPlatform = "aarch64-darwin";

		users.users.tommycalvy = {
			name = "tommycalvy";
			home = "/Users/tommycalvy";
		};

		# Karabiner-Elements doesn't work with latest version
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
	darwinConfigurations."Tommys-MacBook-Pro" = import ./home-manager { inherit inputs configuration tlcvim; };
}


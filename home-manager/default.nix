{ inputs, configuration, tlcvim, ... }: 
let
  inherit (inputs) nixpkgs home-manager nix-darwin;
in
nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    configuration
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.tommycalvy = import ./home.nix;
      home-manager.extraSpecialArgs = { inherit tlcvim; };
    }
  ];
}

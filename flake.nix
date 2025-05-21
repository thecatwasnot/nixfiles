{
  description = "Cole's Modern Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    persist-retro.url = "github:Geometer1729/persist-retro";

    # In order to build system images and artifacts supported by nixos-generators.
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix";

    sops-nix.url = "github:Mic92/sops-nix";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;

        snowfall = {
          meta = {
            name = "stardust";
            title = "StarDust";
          };
          namespace = "stardust";
        };
      };
    in
    lib.mkFlake {
      inherit inputs;
      src = ./.;

      systems.modules.nixos = with inputs; [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
      ];

      systems.hosts.pulsar.modules = with inputs; [
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-pc-ssd
        stylix.nixosModules.stylix
      ];

      # Use treefmt to format entire repo
      outputs-builder =
        channels:
        let
          treefmtEval = inputs.treefmt.lib.evalModule channels.nixpkgs ./treefmt.nix;
        in
        {
          formatter = treefmtEval.config.build.wrapper;
          checks.formatting = treefmtEval.config.build.check inputs.self;
        };
    };
}

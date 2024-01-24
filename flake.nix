{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ 
            go

            pkg-config

            libGL 
            xorg.libX11.dev 
            xorg.libXcursor 
            xorg.libXi 
            xorg.libXinerama 
            xorg.libXrandr 
            xorg.libXxf86vm 
            
            wayland
            libxkbcommon
          ];

          shellHook = ''
            ${pkgs.go}/bin/go version
          '';

        };

        
      });



}

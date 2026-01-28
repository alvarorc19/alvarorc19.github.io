{
  description = "nodejs environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    pythonPackages = pkgs.python3Packages;
  in {
    devShells."${system}".default =
      pkgs.mkShell rec
      {
        name = "nodejs for astro";
        nativeBuildInputs = with pkgs; [
          nodejs
        ];

        buildInputs = with pkgs; [
          nodePackages.pnpm
          nodePackages.typescript
          nodePackages.typescript-language-server
          nodePackages."@tailwindcss/language-server"
          nodePackages."@astrojs/language-server"
        ];
      };
  };
}

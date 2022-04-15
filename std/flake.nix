{
  inputs = {
    std.url = "github:divnix/std";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = {std, ...} @ inputs:
    std.grow {
      inherit inputs;
      cellsFrom = ./cells;
      systems = ["x86_64-linux" "x86_64-darwin"];
      organelles = [
        (std.functions "library")
        (std.functions "lib")
      ];
    };
}
{
  description = "Nix: Coding development environment";
  inputs = {
    haskell-flake-env = {
      url = "path:./haskell";
    };
    python-flake-env = {
      url = "path:./python";
    };
    rust-flake-env = {
      url = "path:./rust";
    };
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/7d71001b796340b219d1bfa8552c81995017544a";
  };

  outputs = { self, nixpkgs, flake-utils, haskell-flake-env, python-flake-env, rust-flake-env }:
    with nixpkgs.lib;
    {
      packages = { } // (nixpkgs.lib.recursiveUpdate haskell-flake-env.packages
        (nixpkgs.lib.recursiveUpdate
          rust-flake-env.packages
          python-flake-env.packages
        ));
    };
}

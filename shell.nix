let 
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    overlays = [ 
      (import ./nix/dotnet-overlay.nix) 
      (import sources.nixpkgs-mozilla) 
    ]; 
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    dotnet-sdk
    (rustChannelOf { date = "2020-09-26"; channel = "nightly"; }).rust
    # keep this line if you use bash
    bashInteractive
  ];
}

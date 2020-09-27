self: super: {
  dotnet-sdk = super.dotnet-sdk.overrideAttrs (oldAttrs: rec {
    system = "x86_64-linux";
    src = super.fetchurl {
      url = "https://download.visualstudio.microsoft.com/download/pr/e5536fae-e963-4fa6-a203-15604c7d703a/d0968c03feeeed41c2428854e13c0085/dotnet-sdk-5.0.100-rc.1.20452.10-linux-x64.tar.gz";
      sha512 = "d7e709dacc4bb188c2380060d24bfb5b791240dc33af8499fb4a31e1885a9377dad1d1ebc76847432ea67d5e4ac832a31679dc293e09fa6dade28f5fbbe4db9b";
    };
    meta.platforms = super.stdenv.lib.platforms.linux;
  });
}
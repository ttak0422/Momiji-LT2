self: super: 

let
  stdenv = self.pkgs.stdenv;
  url = {
    x86_64-linux =
      "https://download.visualstudio.microsoft.com/download/pr/820db713-c9a5-466e-b72a-16f2f5ed00e2/628aa2a75f6aa270e77f4a83b3742fb8/dotnet-sdk-5.0.100-linux-x64.tar.gz";
    aarch64-linux =
      "https://download.visualstudio.microsoft.com/download/pr/27840e8b-d61c-472d-8e11-c16784d40091/ae9780ccda4499405cf6f0924f6f036a/dotnet-sdk-5.0.100-linux-arm64.tar.gz";
    x86_64-darwin =
      "https://download.visualstudio.microsoft.com/download/pr/0871336f-9a83-4ce4-80ca-625d03003369/2eb78456e0b106e9515dc03898d3867a/dotnet-sdk-5.0.100-osx-x64.tar.gz";
  };
  sha512 = {
    x86_64-linux =
      "bec37bfb327c45cc01fd843ef93b22b556f753b04724bba501622df124e7e144c303a4d7e931b5dbadbd4f7b39e5adb8f601cb6293e317ad46d8fe7d52aa9a09";
    aarch64-linux =
      "03ea4cc342834a80f29b3b59ea1d7462e1814311dc6597bf2333359061b9b24f5ce98ed6ebf8d7ca05d42db31baba8ed8d4dec30a576fd818b3c0041c86d2937";
    x86_64-darwin =
      "69ccc7c686ac06f6c658d118f59cf1a0e7284b4570375dd88d3e3043098e311745922301f2650d159624d09c4d39a1f3cbdd5daee0e408eef915de839e3bce8f";
  };
in {
  dotnet-sdk = super.dotnet-sdk.overrideAttrs (oldAttrs: rec {
    version = "5.0.100";
    src = super.fetchurl {
      url = url."${stdenv.hostPlatform.system}" or (throw
        "Missing url for host system: ${stdenv.hostPlatform.system}");
      sha512 = sha512."${stdenv.hostPlatform.system}" or (throw
        "Missing hash for host system: ${stdenv.hostPlatform.system}");
    };
  });
}

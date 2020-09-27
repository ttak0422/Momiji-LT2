#! /usr/bin/env nix-shell
#! nix-shell --pure -i python -p "python38.withPackages (ps: [ ps.requests ps.beautifulsoup4 ])"
#! nix-shell --pure -i python -p python3 -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/20.03.tar.gz

import requests
from bs4 import BeautifulSoup
 
url = "https://nixos.org/"
 
response = requests.get(url)
response.encoding = response.apparent_encoding
bs = BeautifulSoup(response.text, 'html.parser')
for i in bs.select("h2"):
    print(i.getText())
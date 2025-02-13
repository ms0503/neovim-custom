# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
{
  bzl_darwin = {
    pname = "bzl_darwin";
    version = "1.5.1";
    src = fetchurl {
      url = "https://get.bzl.io/darwin_amd64/v1.5.1/bzl";
      sha256 = "sha256-NcvXCUECIXDLR4sNoqhCiaQVQJv2qQc5he4240ffDXE=";
    };
  };
  bzl_linux = {
    pname = "bzl_linux";
    version = "1.5.1";
    src = fetchurl {
      url = "https://get.bzl.io/linux_amd64/v1.5.1/bzl";
      sha256 = "sha256-yLpNjvxjs3796uG8yG5FoCve72Svv66wtIssxMEpsOI=";
    };
  };
  cmake-language-server = {
    pname = "cmake-language-server";
    version = "0.1.11";
    src = fetchurl {
      url = "https://github.com/regen100/cmake-language-server/archive/refs/tags/v0.1.11.tar.gz";
      sha256 = "sha256-Z8CuR0nTZ/Xzx5+WmuE1X22sbCh6ybv7Lirc++V/cBM=";
    };
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "d783191eaa75215beae0c80319fcce5e6b3beeda";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "d783191eaa75215beae0c80319fcce5e6b3beeda";
      fetchSubmodules = false;
      sha256 = "sha256-XpUsbj1boDfbyE8C6SdOvZdkd97682VVC81fvQ5WA/4=";
    };
    date = "2024-11-02";
  };
  hlchunk-nvim = {
    pname = "hlchunk-nvim";
    version = "1.3.0";
    src = fetchurl {
      url = "https://github.com/shellRaining/hlchunk.nvim/archive/refs/tags/v1.3.0.tar.gz";
      sha256 = "sha256-eYwifigTRrXrW6xpFqLlqYFAftt64yweRGvvAvE7o5U=";
    };
  };
  schemastore-nvim = {
    pname = "schemastore-nvim";
    version = "97b08f928d355bd6d5dee595fdf667b5bfb6329f";
    src = fetchFromGitHub {
      owner = "B0o";
      repo = "SchemaStore.nvim";
      rev = "97b08f928d355bd6d5dee595fdf667b5bfb6329f";
      fetchSubmodules = false;
      sha256 = "sha256-DapFNX9JgWas3ofMM/BCXewv+SWv0v9d8TpiwCRd0BU=";
    };
    date = "2025-02-12";
  };
  ts-error-translator-nvim = {
    pname = "ts-error-translator-nvim";
    version = "1.2.0";
    src = fetchurl {
      url = "https://github.com/dmmulroy/ts-error-translator.nvim/archive/refs/tags/v1.2.0.tar.gz";
      sha256 = "sha256-lM/fbs5iGBBnPcKsKolpvamJjZxDC+x69OBAoUIz4lE=";
    };
  };
  vim-jb-lua = {
    pname = "vim-jb-lua";
    version = "c3ab5d8039e137070fc48a2e9b7931d9dedaa9fa";
    src = fetchFromGitHub {
      owner = "ms0503";
      repo = "vim-jb.lua";
      rev = "c3ab5d8039e137070fc48a2e9b7931d9dedaa9fa";
      fetchSubmodules = false;
      sha256 = "sha256-TuQgrhN/4hDn3iKF2jPWdq4KBchx1CMo8hM9tcKRMM4=";
    };
    date = "2025-02-13";
  };
  vimdoc-ja = {
    pname = "vimdoc-ja";
    version = "7e381730febb695fb58c9d6c8fd867226180ca2d";
    src = fetchFromGitHub {
      owner = "vim-jp";
      repo = "vimdoc-ja";
      rev = "7e381730febb695fb58c9d6c8fd867226180ca2d";
      fetchSubmodules = false;
      sha256 = "sha256-x3UxwC16jWqlaVBWGCdc6g5bLOZJMtd6fqTUkM5cedA=";
    };
    date = "2025-02-12";
  };
}

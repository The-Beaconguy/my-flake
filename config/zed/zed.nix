{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "rust" "java" "golangci-lint"];
  };
}

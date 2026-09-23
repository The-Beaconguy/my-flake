{
  username,
  flakedir,
  ...
}: {
  programs.nh = {
    enable = true;
    flake = "/home/${username}/${flakedir}";
  };
}

{...}: {
  home.file.".config/pypr/config.toml".text = ''
     [pyprland]
    plugins = ["scratchpads", "fetch_client_menu"]

    [scratchpads.term]
    animation = "fromLeft"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 75%"
    max_size = "1920px 100%"
    margin = 50
    [menu]
    command = "rofi -dmenu -i -p 'Windows'"
     format = "{class}: {title} [{workspace}]"
  '';
}

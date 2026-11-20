{pkgs}:
pkgs.writeShellScriptBin "OCR-to-clipboard-arabic" ''
  grim -g "$(slurp)" - | tesseract -l ara stdin stdout | wl-copy
''

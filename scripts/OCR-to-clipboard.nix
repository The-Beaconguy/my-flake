{pkgs}:
pkgs.writeShellScriptBin "OCR-to-clipboard" ''
  grim -g "$(slurp)" - | tesseract -l eng stdin stdout | wl-copy
''

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  # exec sway
  exec Hyprland
fi

# Created by `pipx` on 2024-10-22 08:49:32
#export PATH="$PATH:/home/rickroll/.local/bin"

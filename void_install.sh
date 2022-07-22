#!/bin/sh

echo
echo Installing packages
echo
sudo xbps-install -Syu xbps
sudo xbps-install -Syuf void-repo-nonfree xfce4 zsh cargo Vulkan-Headers rofi xmodmap ranger git curl kitty neofetch picom helix btop lightdm lightdm-gtk3-greeter base-devel cairo-devel clthreads-devel libxcb-devel cmake gdb ninja xcb-proto xcb-util-devel xcb-util-cursor-devel xcb-util-keysyms-devel xcb-util-wm-devel gtkmm-devel zoxide
sudo xbps-remove -Fy xfdesktop

echo
echo Moving around config files
echo
  mkdir -p ~/.config/helix/
  cp config.toml ~/.config/helix/config.toml
  
  mkdir -p   ~/.config/hypr/
  cp hypr.conf ~/.config/hypr/hypr.conf
  sudo mkdir -p /usr/share/xsessions/
  sudo cp hypr.desktop /usr/share/xsessions/hypr.desktop
  sudo cp Hypr /usr/local/bin/Hypr
  sudo chmod +x /usr/local/bin/Hypr
  
  sudo mkdir -p /usr/lib/helix/runtime/themes/
  sudo cp onedark.toml /usr/lib/helix/runtime/themes/
  
  sudo cp helperScript /usr/share/helperScript
  sudo chmod +x /usr/share/helperScript
  
  mkdir -p ~/.config/rofi/default/
  cp config.rasi ~/.config/rofi/default/config.rasi
  
  mkdir -p ~/.config/kitty/
  touch ~/.config/kitty/kitty.conf
  echo "confirm_os_window_close 0" >> ~/.config/kitty/kitty.conf
  echo "background_opacity 0.7" >> ~/.config/kitty/kitty.conf
  
  mkdir -p ~/.config/fastfetch/
  touch ~/.config/fastfetch/config.conf
  echo "--logo-color-2 white" >> ~/.config/fastfetch/config.conf
  sudo cp fastfetch /usr/local/bin/fastfetch
  sudo chmod +x /usr/local/bin/fastfetch
  
  sudo mkdir -p /usr/share/backgrounds/
  sudo cp chinaTown.png /usr/share/backgrounds/


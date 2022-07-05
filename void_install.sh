#!/bin/sh

echo
echo Installing packages
echo
sudo xbps-install -Syu xbps
sudo xbps-install -Syu void-repo-nonfree xfce4 zsh cargo rofi xmodmap ranger git curl kitty neofetch picom helix btop lightdm lightdm-gtk3-greeter base-devel cairo-devel clthreads-devel libxcb-devel cmake gdb ninja xcb-proto xcb-util-devel xcb-util-cursor-devel xcb-util-keysyms-devel xcb-util-wm-devel gtkmm-devel zoxide
sudo xbps-remove -y xfdesktop

echo
echo Moving around config files
echo
  mkdir -p ~/.config/helix/
  cp config.toml /home/gavin/.config/helix/config.toml
  mkdir -p   ~/.config/hypr/
  cp hypr.conf ~/.config/hypr/hypr.conf
  sudo mkdir -p /usr/share/xsessions/
  sudo cp hypr.desktop /usr/share/xsessions/hypr.desktop
  sudo mkdir -p /usr/lib/helix/runtime/themes/
  sudo cp onedark.toml /usr/lib/helix/runtime/themes/
  sudo cp helperScript /usr/share/helperScript
  mkdir -p ~/.config/rofi/default/
  cp config.rasi ~/.config/rofi/default/config.rasi

echo
echo Cloning and compiling HyprWM
echo
  cd; mkdir source; cd /home/gavin/source
  git clone https://github.com/vaxerski/Hypr
  sudo make release
  sudo cp ./build/Hypr /usr/bin/hypr
  cd

#!/bin/sh

echo
echo Installing packages
echo
sudo xbps-install -Syu xbps
sudo xbps-install -Syu void-repo-nonfree xfce4 zsh cargo ranger git curl kitty picom helix btop lightdm lightdm-gtk3-greeter base-devel cairo-devel clthreads-devel libxcb-devel cmake gdb ninja xcb-proto xcb-util-devel xcb-util-cursor-devel xcb-util-keysyms-devel xcb-util-wm-devel gtkmm-devel
sudo xbps-remove -y xfdesktop

echo
echo Moving around config files
echo
  mkdir ~/.config/helix/
  cp helix_config.toml /home/gavin/.config/helix/config.toml
  mkdir ~/.config/hypr
  cp hypr.conf /home/gavin/.config/hypr/hypr.conf
  sudo mkdir /usr/share/xsessions/
  sudo cp hypr.desktop /usr/share/xsessions/hypr.desktop
  sudo mkdir /usr/lib/helix/runtime/themes/
  sudo cp onedark.toml /usr/lib/helix/runtime/themes/
  sudo cp helperScript /usr/share/helperScript

echo
echo Cloning and compiling HyprWM
echo
  cd; mkdir source; cd /home/gavin/source
  git clone https://github.com/vaxerski/Hypr
  make clear && make release
  sudo cp ./build/Hypr /usr/bin/hypr

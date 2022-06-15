#!/bin/sh

echo Installing packages
  sudo xbps-insatll -Su xbps
  sudo xbps-install -Syu rofi zsh cargo ranger git curl kitty helix btop lightdm lightdm-gtk3-greeter base-devel cairo-devel clthreads-devel libxcb-devel cmake gdb ninja xcb-proto xcb-util-devel xcb-util-cursor-devel xcb-util-keysyms-devel xcb-util-wm-devel gtkmm-devel

echo Moving around config files
  mkdir ~/.config/rofi/
  cd ~/source
  git clone https://github.com/yuky2020/rofi-themes.git
  cp -r rofi-themes/* ~/.config/rofi/
  cp .zshrc ~/.zshrc
  cp helix_config.toml ~/.config/helix/config.toml
  cp hypr.conf ~/.config/hypr/hypr.conf
  sudo cp hypr.desktop /usr/share/xsessions/hypr.desktop


echo Cloning and compiling HyprWM
  cd; mkdir source; cd ~/source
  git clone https://github.com/vaxerski/Hypr
  make clear && make release
  sudo cp ./build/Hypr /usr/bin/hypr


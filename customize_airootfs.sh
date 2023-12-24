chown lugos:lugos /home/lugos/.xinitrc
pacman-key --init
pacman-key --populate archlinux
pacman -Syuu
pipx ensurepath > /dev/null
source ~/.bashrc
yay -S gnome-extensions-cli --noconfirm
# pipx install gnome-extensions-cli > /dev/null
: << COMMENT
pipx runpip gnome-extensions-cli install pygobject > /dev/null
extensions=(
  widgets@Aylur
  blur-my-shell@aunetx
  burn-my-windows@schneegans.github.com
  dash-to-dock@micxgx.gmail.com
  # just-perfection@alexram1313.github.io doesn't work
  
  # logo-menu@fabiomonari.it
  logomenu@aryan_k
  # pop-shell@system76.com
  forge@jmmaranan.com
  # rounded-corners@mathieu.bidon.ca
  # rounded-window-corners@yilozt.shell-extension.zip
  space-bar@luchrioh
  # top-bar-organizer@gnome-shell-extensions.gcampax.github.com
  top-bar-organizer@julian.gse.jsts.xyz
  user-theme@gnome-shell-extensions.gcampax.github.com
)

# Iterate over the extensions array and fetch each extension
for extension in "${extensions[@]}"; do
  echo "Fetching extension: $extension"
  gext install "$extension" > /dev/null
  # gext enable "$extension"
done

# git clone https://github.com/lugvitc/lugfetch.git --depth 1
# cd lugfetch && sudo make install && cd -/LUG_custom_distro/scripts/distro
# mkdir -p ~/.local/bin/
# # mkdir -p ~/.config/neofetch/
# mkdir -p ~/.config/starship/
# # ln -sf $(pwd)/../neofetch/neofetch ~/.local/bin/
# # ln -sf $(pwd)/../neofetch/config.conf ~/.config/neofetch/
# ln -sf $(pwd)/../terminal/.bashrc ~/.lug-bashrc
# ln -sf $(pwd)/../terminal/starship.toml ~/.config/
# sudo ln -sf $(pwd)/../terminal/lugpkg /usr/local/bin/
# echo "[[ -f ~/.lug-bashrc ]] && source ~/.lug-bashrc " | sudo tee -a ~/.bashrc

# echo >> themeInfo to ~/.config/gtk-3.0/settings.ini
yay -S  gruvbox-plus-icon-theme-git --needed --noconfirm
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git /tmp/gruvbox
mkdir ./airootfs/etc/skel/.themes
cp -r /tmp/gruvbox/themes/Gruvbox-Dark-B ./airootfs/etc/skel/.themes/
dconf write /org/gnome/desktop/interface/gtk-theme "'Gruvbox-Dark-B'"
dconf write /org/gnome/desktop/interface/icon-theme "'Gruvbox-Plus-Dark'"
gsettings set org.gnome.shell.extensions.user-theme name "Gruvbox-Dark-B"
# Cursor Theme
yay -S bibata-cursor-theme  --needed
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
# Fixes gtk-4.0 theming and adds Jetbrains Mono Nerd font
yay -S  ttf-jetbrains-mono-nerd --noconfirm --needed
# Sets Jetbrains Mono font for terminal
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMonoNL Nerd Font Mono 14'

mkdir -p /usr/share/grub/themes/
if [ ! -d "/var/tmp/LUGOS-grub" ]; then
  git clone https://github.com/lugvitc/LUGOS-grub.git /var/tmp/LUGOS-grub
  sudo cp /var/tmp/LUGOS-grub/LUGOS-grub -r /usr/share/grub/themes/
fi
cd -

# sudo sed -i '47s/.*/GRUB_THEME="\/usr\/share\/grub\/themes\/LUGOS-grub\/theme.txt"/' /etc/default/grub
# sudo sed -i 's/^GRUB_THEME/GRUB_THEME="\/usr\/share\/grub\/themes\/LUGOS-grub\/theme.txt"/' /etc/default/grub
echo GRUB_THEME="./airootfs/usr/share/grub/themes/LUGOS-grub/theme.txt" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
# this SHOULD output
# Found theme: /usr/share/grub/themes/LUGOS-grub/theme.txt   

# GNOME EXTENSIONS CONFIGURATION
dconf write /org/gnome/shell/extensions/burn-my-windows/tv-glitch-enable-effect true
dconf write /org/gnome/shell/extensions/burn-my-windows/fire-enable-effect false
dconf write /org/gnome/shell/extensions/burn-my-windows/tv-glitch-animation-time 650
dconf write /org/gnome/desktop/background/picture-uri-dark "'file://$HOME/LUG_custom_distro/LUG-wallpaper-d.png'"
dconf write /org/gnome/desktop/background/picture-uri "'file://$HOME/LUG_custom_distro/LUG-wallpaper-l.png'"
dconf write /org/gnome/shell/extensions/user-theme/enabled true

# Start the fun
gsettings set org.gnome.shell disable-user-extensions false

# MISC CLEANUP
yay -S libadwaita-without-adwaita-git --noconfirm --needed
yay -Rns $(yay -Qtdq) --noconfirm
sudo pacman -S neovim nodejs npm --noconfirm --needed
git clone https://github.com/lugvitc/LUGOS-nvim-config.git ~/.config/nvim
COMMENT

#!/usr/bin/env bash
# For GTK4 apps, refer etc/skel/.config/gtk-4.0/
menu() {
    dialog --clear --backtitle "StratOS theme changer" \
        --title "Select a theme" \
        --menu "Choose one of the following options:" 15 40 3 \
        1 "TokyoNight Storm (default)" \
        2 "TokyoNight Dark" \
        3 "Gruvbox" \
        2>&1 >/dev/tty
}

while true; do
    choice=$(menu)
    case $choice in
        1)
	    gsettings set org.gnome.shell.extensions.user-theme name "'Tokyonight-Dark-B'"
	    gsettings set org.gnome.desktop.interface gtk-theme "'Tokyonight-Dark-B'"
	    gsettings set org.gnome.desktop.interface icon-theme "'Tokyonight-Dark'" 
	    ln -sf $HOME/.themes/Tokyonight-Dark-B/gtk-4.0/  ~/.config/
            ;;
	2)
	    gsettings set org.gnome.shell.extensions.user-theme name "'Tokyonight-Storm-B'"
	    gsettings set org.gnome.desktop.interface gtk-theme "'Tokyonight-Storm-B'"
	    gsettings set org.gnome.desktop.interface icon-theme "'Tokyonight-Moon'" 
	    ln -sf $HOME/.themes/Tokyonight-Storm-B/gtk-4.0/  ~/.config/
            ;;
        3)
	    gsettings set org.gnome.shell.extensions.user-theme name "'Gruvbox-Dark-B'"
	    gsettings set org.gnome.desktop.interface gtk-theme "'Gruvbox-Dark-B'"
	    gsettings set org.gnome.desktop.interface icon-theme "'Gruvbox-Dark'" 
	    ln -sf $HOME/.themes/Gruvbox-Dark-B/gtk-4.0/  ~/.config/
            ;;
        *)
            # If Cancel or Escape pressed
            echo "Exiting..."
            exit 0
            ;;
    esac
done

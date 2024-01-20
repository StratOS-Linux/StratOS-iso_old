#!/bin/bash

# Display menu options with checkboxes
menu() {
    dialog --clear --backtitle "Linux Distribution Selector" \
        --title "Select Linux distributions" \
        --checklist "Choose one or more of the following options:" 15 40 3 \
        1 "Ubuntu" off \
        2 "Fedora" off \
        2>&1 >/dev/tty
}

# Main loop
while true; do
    # Show menu and capture user choices
    choices=$(menu)

    # Check the user's choices
    for choice in $choices; do
        case $choice in
            1)
		sudo brl fetch ubuntu
                ;;
            2)
		sudo brl fetch fedora
                ;;
        esac
    done

    # Check if user pressed Cancel or Escape
    if [ -z "$choices" ]; then
        echo "Exiting..."
        exit 0
    fi
done

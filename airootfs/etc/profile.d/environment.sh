#!/bin/bash

# If it's a Wayland session, set some environment variables.

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export QT_QPA_PLATFORM=wayland
	export QT_QPA_PLATFORMTHEME=gnome
	export MOZ_ENABLE_WAYLAND=1
fi

# Set some other environment variables

export QT_STYLE_OVERRIDE=kvantum


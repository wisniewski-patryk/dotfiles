#!/bin/bash

echo -e "\033[1;34m====================================================\033[0m"
echo -e "\033[1;34m           FEDORA XDG DIRECTORY REPORT              \033[0m"
echo -e "\033[1;34m====================================================\033[0m"

# Function to check and print
check_xdg() {
    local var_name=$1
    local default_val=$2
    
    if [ -z "${!var_name}" ]; then
        # Variable is NOT set, showing default
        printf "\033[1;33m%-20s\033[0m | %-8s | %s\n" "$var_name" "DEFAULT" "$default_val"
    else
        # Variable IS set
        printf "\033[1;32m%-20s\033[0m | %-8s | %s\n" "$var_name" "SET" "${!var_name}"
    fi
}

echo -e "\033[1mCORE BASE DIRECTORIES\033[0m"
echo "----------------------------------------------------"
check_xdg "XDG_CONFIG_HOME" "$HOME/.config"
check_xdg "XDG_DATA_HOME"   "$HOME/.local/share"
check_xdg "XDG_CACHE_HOME"  "$HOME/.cache"
check_xdg "XDG_STATE_HOME"  "$HOME/.local/state"
check_xdg "XDG_RUNTIME_DIR" "/run/user/$(id -u)"

echo -e "\n\033[1mSYSTEM SEARCH PATHS\033[0m"
echo "----------------------------------------------------"
check_xdg "XDG_CONFIG_DIRS" "/etc/xdg"
check_xdg "XDG_DATA_DIRS"   "/usr/local/share:/usr/share"

echo -e "\n\033[1mUSER CONTENT DIRECTORIES\033[0m"
echo "----------------------------------------------------"
if [ -f "$HOME/.config/user-dirs.dirs" ]; then
    # Parse the user-dirs file directly to show exactly what's mapped
    source "$HOME/.config/user-dirs.dirs"
    check_xdg "XDG_DESKTOP_DIR"   "$XDG_DESKTOP_DIR"
    check_xdg "XDG_DOCUMENTS_DIR" "$XDG_DOCUMENTS_DIR"
    check_xdg "XDG_DOWNLOAD_DIR"  "$XDG_DOWNLOAD_DIR"
    check_xdg "XDG_MUSIC_DIR"     "$XDG_MUSIC_DIR"
    check_xdg "XDG_PICTURES_DIR"  "$XDG_PICTURES_DIR"
    check_xdg "XDG_VIDEOS_DIR"    "$XDG_VIDEOS_DIR"
else
    echo "User directories file not found."
fi

echo -e "\033[1;34m----------------------------------------------------\033[0m"

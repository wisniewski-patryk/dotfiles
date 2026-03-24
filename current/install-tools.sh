# /bin/bash

# Generic function to enable COPR if not already enabled
enable_copr_if_needed() {
    local copr_name="$1"
    if ! dnf copr list | grep -q "$copr_name"; then
        echo "Enabling COPR repository: $copr_name"
        sudo dnf copr enable "$copr_name"
    else
        echo "COPR repository $copr_name is already enabled"
    fi
}

sudo dnf install btop

enable_copr_if_needed "scottames/ghostty"
sudo dnf install ghostty

enable_copr_if_needed "dejan/lazygit"
sudo dnf install lazygit

install-lazydocker() {
  # allow specifying different destination directory
  DIR="${DIR:-"$HOME/.local/bin"}"
  # map different architecture variations to the available binaries
  ARCH=$(uname -m)
  case $ARCH in
      i386|i686) ARCH=x86 ;;
      armv6*) ARCH=armv6 ;;
      armv7*) ARCH=armv7 ;;
      aarch64*) ARCH=arm64 ;;
  esac
  # prepare the download URL
  GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
  GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
  GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"
  # install/update the local binary
  curl -L -o lazydocker.tar.gz $GITHUB_URL
  tar xzvf lazydocker.tar.gz lazydocker
  install -Dm 755 lazydocker -t "$DIR"
  rm -f lazydocker lazydocker.tar.gz
}

install-lazydocker

sudo dnf install wofi
sudo dnf install wlogout
sudo dnf install waybar

sudo dnf install pavucontrol
enable_copr_if_needed "lionheartp/Hyprland"
sudo dnf install hyprland

#!/bin/bash

LOG_FILE="install_log.txt"
DOWNLOAD_DIR="Downloads"

# Function to check if a package is installed
is_installed() {
    dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q "ok installed"
}

# Function to log messages
log_message() {
    echo "$1" | tee -a "$LOG_FILE"
}

# Create or clear the log file
: > "$LOG_FILE"

# Update and upgrade the system
log_message "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install common packages
log_message "Installing common packages..."
sudo apt install -y wget gpg apt-transport-https curl

# Function to install a package
install_package() {
    local name="$1"
    local command="$2"
    local download_url="$3"
    local download_file="$4"

    if is_installed "$name"; then
        log_message "$name is already installed."
    else
        log_message "Installing $name..."
        if [ -n "$download_url" ]; then
            wget "$download_url" -O "$DOWNLOAD_DIR/$download_file"
            if [ -f "$DOWNLOAD_DIR/$download_file" ]; then
                sudo dpkg -i "$DOWNLOAD_DIR/$download_file" || sudo apt --fix-broken install -y
                rm "$DOWNLOAD_DIR/$download_file"
            else
                log_message "Failed to download $name."
                return 1
            fi
        else
            eval "$command"
        fi
        log_message "Finished installing $name."
    fi
}

# Install Brave Browser
install_package \
    "brave-browser" \
    "sudo apt install brave-browser -y" \
    "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg" \
    ""

# Install Motrix
install_package \
    "Motrix" \
    "chmod +x ~/Downloads/Motrix.AppImage && sudo mv ~/Downloads/Motrix.AppImage /usr/local/bin/motrix" \
    "https://github.com/agalwood/Motrix/releases/download/v1.6.11/Motrix-1.6.11-x64.AppImage" \
    "Motrix.AppImage"

# Install Visual Studio Code
install_package \
    "Visual Studio Code" \
    "sudo apt install code -y" \
    "https://packages.microsoft.com/keys/microsoft.asc" \
    "microsoft.asc"

# Install Python
install_package \
    "Python" \
    "sudo apt install -y python3 python3-pip" \
    "" \
    ""

# Install Java (default-jdk)
install_package \
    "Java" \
    "sudo apt install -y default-jdk" \
    "" \
    ""

# Install Steam
install_package \
    "Steam" \
    "sudo apt install -y steam" \
    "" \
    ""

# Install VLC
install_package \
    "VLC" \
    "sudo apt install -y vlc" \
    "" \
    ""

# Install GIMP
install_package \
    "GIMP" \
    "sudo apt install -y gimp" \
    "" \
    ""

# Install Clementine
install_package \
    "Clementine" \
    "sudo apt install -y clementine" \
    "" \
    ""

# Install Zsh and Oh My Zsh
if [ "$SHELL" = "/usr/bin/zsh" ]; then
    log_message "Zsh is already the default shell."
else
    log_message "Installing Zsh..."
    sudo apt install -y zsh
    log_message "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log_message "Finished installing Zsh and Oh My Zsh."
fi

# Install Lutris
install_package \
    "Lutris" \
    "sudo apt install -y lutris" \
    "" \
    ""

# Install Wine
install_package \
    "Wine" \
    "sudo apt install -y wine64 wine32" \
    "" \
    ""

# Install VirtualBox
install_package \
    "VirtualBox" \
    "sudo apt install -y virtualbox" \
    "" \
    ""

# Install Unigram
install_package \
    "Unigram" \
    "" \
    "https://github.com/UnigramDev/Unigram/releases/download/v0.25.0/Unigram_0.25.0_amd64.deb" \
    "Unigram.deb"

# Install qBittorrent
install_package \
    "qBittorrent" \
    "sudo apt install -y qbittorrent" \
    "" \
    ""

# Install Dropbox
install_package \
    "Dropbox" \
    "" \
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2023.08.30_amd64.deb" \
    "dropbox.deb"

# Install Joplin
install_package \
    "Joplin" \
    "chmod +x ~/Downloads/Joplin.AppImage && sudo mv ~/Downloads/Joplin.AppImage /usr/local/bin/joplin" \
    "https://github.com/laurent22/joplin/releases/download/v2.9.3/Joplin-2.9.3.AppImage" \
    "Joplin.AppImage"

# Install Insomnia
install_package \
    "Insomnia" \
    "" \
    "https://github.com/Kong/insomnia/releases/download/2023.3.1/Insomnia.Core-2023.3.1.deb" \
    "insomnia.deb"

# Install Mailspring
install_package \
    "Mailspring" \
    "" \
    "https://github.com/Foundry376/Mailspring/releases/download/1.11.0/mailspring_1.11.0_amd64.deb" \
    "mailspring.deb"

# Install curl
install_package \
    "curl" \
    "sudo apt install -y curl" \
    "" \
    ""

# Install Git
install_package \
    "Git" \
    "sudo apt install -y git" \
    "" \
    ""

# Install OBS Studio
install_package \
    "OBS Studio" \
    "sudo apt install -y obs-studio" \
    "" \
    ""

# Install ZeroTier
install_package \
    "ZeroTier" \
    "curl -s https://install.zerotier.com | sudo bash" \
    "" \
    ""

# Install Kdiskmark
install_package \
    "Kdiskmark" \
    "sudo apt install -y kdiskmark" \
    "" \
    ""

# Install Stacer
install_package \
    "Stacer" \
    "sudo apt install -y stacer" \
    "" \
    ""

# Install Tor Browser
install_package \
    "Tor Browser" \
    "sudo apt install -y tor torbrowser-launcher" \
    "" \
    ""

# Install all available drivers
log_message "Installing all available drivers..."
sudo ubuntu-drivers autoinstall

log_message "🎉 All specified software installation process completed."
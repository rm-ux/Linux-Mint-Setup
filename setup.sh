#!/bin/bash

# Function to check if a package is installed
is_installed() {
    dpkg -l | grep -q "$1"
}

echo "🚀 Starting the installation script..."

# Update and upgrade the system
echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Brave Browser
if is_installed brave-browser; then
    echo "🌐 Brave browser is already installed."
else
    echo "🛠️ Installing Brave browser..."
    sudo apt install apt-transport-https curl -y
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update && sudo apt install brave-browser -y
fi

# Install Motrix
if is_installed motrix; then
    echo "📥 Motrix is already installed."
else
    echo "📦 Installing Motrix..."
    wget https://github.com/agalwood/Motrix/releases/download/v1.6.11/Motrix-1.6.11-x64.AppImage -O ~/Downloads/Motrix.AppImage
    chmod +x ~/Downloads/Motrix.AppImage
    sudo mv ~/Downloads/Motrix.AppImage /usr/local/bin/motrix
    echo "✅ Motrix installed successfully."
fi

# Install Visual Studio Code
if is_installed code; then
    echo "💻 Visual Studio Code is already installed."
else
    echo "🛠️ Installing Visual Studio Code..."
    sudo apt install wget gpg -y
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update && sudo apt install code -y
    echo "✅ Visual Studio Code installed successfully."
fi

# Install Python
if is_installed python3; then
    echo "🐍 Python is already installed."
else
    echo "🛠️ Installing Python..."
    sudo apt install -y python3 python3-pip
    echo "✅ Python installed successfully."
fi

# Install Java (default-jdk)
if is_installed default-jdk; then
    echo "☕ Java is already installed."
else
    echo "🛠️ Installing Java..."
    sudo apt install -y default-jdk
    echo "✅ Java installed successfully."
fi

# Install Steam
if is_installed steam; then
    echo "🎮 Steam is already installed."
else
    echo "🛠️ Installing Steam..."
    sudo apt install -y steam
    echo "✅ Steam installed successfully."
fi

# Install VLC
if is_installed vlc; then
    echo "🎥 VLC is already installed."
else
    echo "🛠️ Installing VLC..."
    sudo apt install -y vlc
    echo "✅ VLC installed successfully."
fi

# Install GIMP
if is_installed gimp; then
    echo "🖼️ GIMP is already installed."
else
    echo "🛠️ Installing GIMP..."
    sudo apt install -y gimp
    echo "✅ GIMP installed successfully."
fi

# Install Clementine
if is_installed clementine; then
    echo "🎶 Clementine is already installed."
else
    echo "🛠️ Installing Clementine..."
    sudo apt install -y clementine
    echo "✅ Clementine installed successfully."
fi

# Install Zsh and Oh My Zsh
if [ "$SHELL" = "/usr/bin/zsh" ]; then
    echo "🐚 Zsh is already the default shell."
else
    echo "🛠️ Installing Zsh..."
    sudo apt install -y zsh
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "✅ Zsh and Oh My Zsh installed successfully."
fi

# Install Lutris
if is_installed lutris; then
    echo "🎮 Lutris is already installed."
else
    echo "🛠️ Installing Lutris..."
    sudo add-apt-repository ppa:lutris-team/lutris -y
    sudo apt update
    sudo apt install -y lutris
    echo "✅ Lutris installed successfully."
fi

# Install Wine
if is_installed wine64; then
    echo "🍷 Wine is already installed."
else
    echo "🛠️ Installing Wine..."
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y wine64 wine32
    echo "✅ Wine installed successfully."
fi

# Install VirtualBox
if is_installed virtualbox; then
    echo "🖥️ VirtualBox is already installed."
else
    echo "🛠️ Installing VirtualBox..."
    sudo apt install -y virtualbox
    echo "✅ VirtualBox installed successfully."
fi

# Install Unigram
if is_installed unigram; then
    echo "📱 Unigram is already installed."
else
    echo "🛠️ Installing Unigram..."
    wget https://github.com/UnigramDev/Unigram/releases/download/v0.25.0/Unigram_0.25.0_amd64.deb -O ~/Downloads/Unigram.deb
    sudo dpkg -i ~/Downloads/Unigram.deb
    sudo apt --fix-broken install -y
    echo "✅ Unigram installed successfully."
fi

# Install qBittorrent
if is_installed qbittorrent; then
    echo "📥 qBittorrent is already installed."
else
    echo "🛠️ Installing qBittorrent..."
    sudo apt install -y qbittorrent
    echo "✅ qBittorrent installed successfully."
fi

# Install Dropbox
if is_installed dropbox; then
    echo "☁️ Dropbox is already installed."
else
    echo "🛠️ Installing Dropbox..."
    wget https://linux.dropbox.com/packages/ubuntu/dropbox_2023.08.30_amd64.deb -O ~/Downloads/dropbox.deb
    sudo dpkg -i ~/Downloads/dropbox.deb
    sudo apt --fix-broken install -y
    echo "✅ Dropbox installed successfully."
fi

# Install Joplin
if is_installed joplin; then
    echo "📝 Joplin is already installed."
else
    echo "🛠️ Installing Joplin..."
    wget https://github.com/laurent22/joplin/releases/download/v2.9.3/Joplin-2.9.3.AppImage -O ~/Downloads/Joplin.AppImage
    chmod +x ~/Downloads/Joplin.AppImage
    sudo mv ~/Downloads/Joplin.AppImage /usr/local/bin/joplin
    echo "✅ Joplin installed successfully."
fi

# Install Insomnia
if is_installed insomnia; then
    echo "☕ Insomnia is already installed."
else
    echo "🛠️ Installing Insomnia..."
    wget https://github.com/Kong/insomnia/releases/download/2023.3.1/Insomnia.Core-2023.3.1.deb -O ~/Downloads/insomnia.deb
    sudo dpkg -i ~/Downloads/insomnia.deb
    sudo apt --fix-broken install -y
    echo "✅ Insomnia installed successfully."
fi

# Install Mailspring
if is_installed mailspring; then
    echo "📧 Mailspring is already installed."
else
    echo "🛠️ Installing Mailspring..."
    wget https://github.com/Foundry376/Mailspring/releases/download/1.11.0/mailspring_1.11.0_amd64.deb -O ~/Downloads/mailspring.deb
    sudo dpkg -i ~/Downloads/mailspring.deb
    sudo apt --fix-broken install -y
    echo "✅ Mailspring installed successfully."
fi

# Install curl
if is_installed curl; then
    echo "🌐 curl is already installed."
else
    echo "🛠️ Installing curl..."
    sudo apt install -y curl
    echo "✅ curl installed successfully."
fi

# Install Git
if is_installed git; then
    echo "🧑‍💻 Git is already installed."
else
    echo "🛠️ Installing Git..."
    sudo apt install -y git
    echo "✅ Git installed successfully."
fi

# Install OBS Studio
if is_installed obs-studio; then
    echo "📹 OBS Studio is already installed."
else
    echo "🛠️ Installing OBS Studio..."
    sudo add-apt-repository ppa:obsproject/obs-studio -y
    sudo apt update
    sudo apt install -y obs-studio
    echo "✅ OBS Studio installed successfully."
fi

# Install ZeroTier
if is_installed zerotier-one; then
    echo "🔗 ZeroTier is already installed."
else
    echo "🛠️ Installing ZeroTier..."
    curl -s https://install.zerotier.com | sudo bash
    echo "✅ ZeroTier installed successfully."
fi

# Install Kdiskmark
if is_installed kdiskmark; then
    echo "📊 Kdiskmark is already installed."
else
    echo "🛠️ Installing Kdiskmark..."
    sudo add-apt-repository ppa:diskmark/ppa -y
    sudo apt update
    sudo apt install -y kdiskmark
    echo "✅ Kdiskmark installed successfully."
fi

# Install Stacer
if is_installed stacer; then
    echo "⚙️ Stacer is already installed."
else
    echo "🛠️ Installing Stacer..."
    sudo apt install -y stacer
    echo "✅ Stacer installed successfully."
fi

# Install Tor Browser
if is_installed torbrowser-launcher; then
    echo "🕵️ Tor Browser is already installed."
else
    echo "🛠️ Installing Tor Browser..."
    sudo add-apt-repository ppa:torproject/ppa -y
    sudo apt update
    sudo apt install -y tor torbrowser-launcher
    echo "✅ Tor Browser installed successfully."
fi

# Install all available drivers
echo "🔧 Installing all available drivers..."
sudo ubuntu-drivers autoinstall

echo "🎉 All specified software has been installed!"

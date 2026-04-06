## 🚀 Ultimate Zsh & Powerlevel10k Auto-Installer

A specialized Bash script designed to automate the installation and configuration of a professional terminal environment. It handles everything from package management to shell migration in one go.


# ✨ Features

    Zsh shell integration.

    Oh My Zsh framework for easy configuration management.

    Powerlevel10k theme (the fastest and most flexible Zsh theme).

    Essential Plugins:

        zsh-autosuggestions: Fish-like completions based on your history.

        zsh-syntax-highlighting: Visual feedback for commands as you type.

        git: Helpful aliases for faster workflow.

#  Support

    My script supports all: 
    -apt
    -dnf
    -pacman
    based Linux distros.

# 🛠 Quick Start

    Note: The script requires sudo privileges to install system packages via package manager and to change the default shell.

    Prepare the script:
    Bash

    chmod +x zsh_autoinstall.sh

    Run the installer:
    Bash

    sudo ./zsh_autoinstall.sh

# 📋 What the Script Does 

    Package Installation: Automatically installs zsh, git, and curl from repositories.

    Environment Cleanup: Wipes existing .oh-my-zsh and .zshrc to ensure a conflict-free setup.

    Unattended OMZ Setup: Installs Oh My Zsh silently using environment flags (CHSH=no RUNZSH=no) to prevent script hanging.

    Plugins & Theme: Clones P10k and performance plugins into the $ZSH_CUSTOM directory.

    Config Automation: Uses sed to inject the correct theme and plugin list into your .zshrc.

    System Shell Update: Changes the default login shell to /usr/bin/zsh for the current user.

    Instant Initialization: Drops you directly into the Powerlevel10k configuration wizard.

# ⚠️ Prerequisite: Nerd Fonts

To see icons correctly (git branches, system status, etc.), you must use a Nerd Font in your terminal emulator. Recommended: MesloLGS NF (specifically optimized for Powerlevel10k).
# 🧪 Testing (Docker / Fedora Image)

You can safely test this script in a clean Fedora container:
Bash

1. Start a clean Fedora container with SELinux labels (:Z)
docker run -it --rm -v "$(pwd)/zsh.sh:/zsh.sh:Z" fedora /bin/bash

 2. Inside the container, install sudo and set up a test user
dnf install -y util-linux sudo && \
useradd -m testguy && \
echo 'testguy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
su - testguy

 3. Execute the script
sudo bash /zsh.sh

📜 License

MIT © 2026

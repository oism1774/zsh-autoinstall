#!/bin/bash
set -e
if [ "$EUID" -ne 0 ]; then
  echo "Use sudo for installation"
  exit
fi
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

if command -v dnf &>/dev/null; then
  dnf install -y zsh git curl
elif command -v apt &>/dev/null; then
  apt install -y zsh git curl
elif command -v pacman &>/dev/null; then
  pacman -S --noconfirm zsh git curl
else
  echo "Unsupported package manager"
  exit 1
fi

rm -rf "$USER_HOME/.oh-my-zsh"
rm -f "$USER_HOME/.zshrc"

sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"

sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$USER_HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo -u $SUDO_USER git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$USER_HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's|^plugins=(.*|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' $USER_HOME/.zshrc

sudo -u $SUDO_USER git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' $USER_HOME/.zshrc
chown -R $SUDO_USER:$SUDO_USER "$USER_HOME/.oh-my-zsh"
chown $SUDO_USER:$SUDO_USER "$USER_HOME/.zshrc"

sudo -u $SUDO_USER -i zsh

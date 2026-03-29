pkg update && pkg upgrade -y
pkg install git curl wget zsh -y
pkg install figlet toilet ruby -y
gem install lolcat

#!/data/data/com.termux/files/usr/bin/bash

# ==============================
# 🚀 TERMUX DEV ENVIRONMENT SETUP
# ==============================

echo "⚡ Initializing Termux Environment..."

# Update system
pkg update -y && pkg upgrade -y

# Core packages
pkg install -y git curl wget zsh fzf bat figlet toilet ruby

# Install lolcat
gem install lolcat

# Set Zsh as default shell
chsh -s zsh

# Install Oh My Zsh (unattended)
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ==============================
# 🎨 Install Powerlevel10k Theme
# ==============================
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ==============================
# 🔌 Install Plugins
# ==============================
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ==============================
# 🧠 Create .zshrc (Optimized)
# ==============================
cat <<'EOF' > ~/.zshrc
# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ==============================
# ⚡ Aliases
# ==============================
alias ll="exa -lh --icons"
alias la="exa -a --icons"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

# ==============================
# 🚀 Environment
# ==============================
export EDITOR=nano
export PATH=$HOME/bin:$PATH

# ==============================
# 🎨 Branding
# ==============================
[[ -f ~/.branding.sh ]] && source ~/.branding.sh

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

# ==============================
# 🎨 Branding Script
# ==============================
cat <<'EOF' > ~/.branding.sh
clear
figlet "Kevin Dev" | lolcat
echo "⚡ Web Dev • Termux Workspace" | lolcat
date
EOF

# ==============================
# 🔐 Permissions
# ==============================
chmod +x ~/.branding.sh

# ==============================
# 🎯 Finalization
# ==============================
echo "✅ Setup complete. Launching Zsh..."

p10k configure

#exec zsh

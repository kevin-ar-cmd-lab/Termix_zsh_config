#!/data/data/com.termux/files/usr/bin/bash

# =========================================
# KEVIN DEV TERMUX BOOTSTRAP INSTALLER v2
# =========================================

set -e

echo "Initializing Kevin Dev Environment..."

# -------------------------------
# SYSTEM UPDATE
# -------------------------------
pkg update -y && pkg upgrade -y

# -------------------------------
# CORE PACKAGES
# -------------------------------
pkg install -y git curl wget zsh fzf exa bat figlet toilet ruby

# Install lolcat safely
if ! command -v lolcat >/dev/null 2>&1; then
  gem install lolcat
fi

# -------------------------------
# ZSH DEFAULT SHELL
# -------------------------------
chsh -s zsh || true

# -------------------------------
# ⚙ OH MY ZSH INSTALL (SAFE)
# -------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  export RUNZSH=no
  export CHSH=no
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✔ Oh My Zsh already installed"
fi

# -------------------------------
# POWERLEVEL10K THEME
# -------------------------------
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d "$P10K_DIR" ]; then
  echo "Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  echo "✔ Powerlevel10k already exists"
fi

# -------------------------------
# 🔌 PLUGINS
# -------------------------------
ZSH_PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
fi

# -------------------------------
# BACKUP EXISTING CONFIG
# -------------------------------
if [ -f "$HOME/.zshrc" ]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
  echo " Existing .zshrc backed up"
fi

# -------------------------------
# ⚙ WRITE CONFIG
# -------------------------------
cat <<'EOF' > "$HOME/.zshrc"
# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ==============================
#  Aliases
# ==============================
alias ll="exa -lh --icons"
alias la="exa -a --icons"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

# ==============================
#  Environment
# ==============================
export EDITOR=nano
export PATH=$HOME/bin:$PATH

# ==============================
#  Branding
# ==============================
[[ -f ~/.branding.sh ]] && source ~/.branding.sh

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================
# FIRST-RUN AUTO CONFIG
# ==============================
if [[ ! -f ~/.p10k.zsh ]]; then
  echo " Running Powerlevel10k initial setup..."
  sleep 1
  p10k configure
fi
EOF

# -------------------------------
# BRANDING
# -------------------------------
cat <<'EOF' > "$HOME/.branding.sh"
clear
figlet "Kevin Dev" | lolcat
echo "Web Dev • Termux Workspace" | lolcat
date
EOF

chmod +x "$HOME/.branding.sh"

# -------------------------------
# FINALIZATION
# -------------------------------
echo "✅ Installation complete. Launching Zsh..."

exec zsh

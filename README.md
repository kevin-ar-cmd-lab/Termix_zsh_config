# Kevin Dev Termux Bootstrap Installer

![Environment](https://img.shields.io/badge/Environment-Termux-blue?style=flat-square)
![Shell](https://img.shields.io/badge/Shell-Zsh-orange?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Powerlevel10k-purple?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

---

## 🚀 Overview

A **production-grade Termux bootstrapper** engineered to provision a fully optimized, modern developer environment in minutes.

This system transforms a fresh Termux install into a **high-performance, developer-centric workspace** with minimal manual intervention.

### Core Objectives
- ⚡ Fast provisioning
- 🔁 Idempotent execution (safe re-runs)
- 🧠 Developer productivity optimization
- 🎨 Clean, branded CLI experience

---

## ✨ Features

### Shell & UI
- Zsh as default shell
- Oh My Zsh framework
- Powerlevel10k prompt (high-performance + customizable)

### Plugins
- zsh-autosuggestions  
- zsh-syntax-highlighting  

### Developer Tooling
- git, curl, wget  
- bat (better cat)  
- fzf (fuzzy finder)  
- exa (modern ls alternative)  
- figlet, toilet, lolcat (terminal UX enhancements)  

### System Capabilities
- Modular architecture (future extensibility)  
- Automatic dependency handling  
- Safe re-execution (no duplication or breakage)  

---

## ⚙️ Installation

### 🔹 One-Line Install (Latest)

```bash
bash <(curl -s https://raw.githubusercontent.com/kevin-ar-cmd-lab/termux-bootstrap/main/install.sh)
```

---

### 🔹 Stable Version (Recommended)

```bash
bash <(curl -s https://raw.githubusercontent.com/kevin-ar-cmd-lab/termux-bootstrap/v1.0/install.sh)
```

---

## 📦 Prerequisites

Ensure a clean Termux environment:

```bash
pkg update && pkg upgrade -y
pkg install curl -y
```

---

## 🖌 Branding System

The installer deploys a persistent branding module:

```bash
~/.branding.sh
```

### CLI Output

```
Kevin Dev
Web Dev • Termux Workspace
<Dynamic Date & Time>
```

This enforces a **consistent and professional terminal identity** across sessions.

---

## 🧱 Project Structure

```
termux-bootstrap/
├── install.sh          # Main orchestrator
├── README.md
└── modules/            # Modular system (extensible)
    ├── core.sh
    ├── zsh.sh
    ├── branding.sh
```

---

## 🔁 Idempotency Model

This installer is **designed for repeat execution**:

- Skips already installed packages  
- Avoids duplicate configurations  
- Maintains system integrity across updates  

---

## 🎯 Optimization Recommendations

To maximize user experience:

- Include a pre-configured `.p10k.zsh`  
- Install Nerd Fonts (MesloLGS NF recommended)  
- Extend modular system with:
  - Git remote manager  
  - Node.js / Next.js environment setup  
  - Supabase CLI integration  

---

## 📈 Roadmap

- [ ] Termux GUI (X11) integration  
- [ ] Interactive installer (fzf-driven UI)  
- [ ] Environment presets (`--minimal`, `--full`)  
- [ ] Dotfiles sync (remote configuration)  
- [ ] Plugin manager abstraction layer  

---

## 📄 License

MIT License © Kevin Juma  

---

## 🌐 Contact

- Portfolio: https://kevinjuma.netlify.app  
- GitHub: https://github.com/kevin-ar-cmd-lab  
- Twitter: https://twitter.com/kevin_ar_cmd_lab  

---

## 💡 Positioning

This is not just a setup script.

It is a **developer environment provisioning system** purpose-built for Termux power users.

# Kevin Dev Termux Bootstrap Installer

![Termux Banner](https://img.shields.io/badge/Termux-Installer-blue?style=flat-square)
![Zsh](https://img.shields.io/badge/Zsh-Powerlevel10k-purple?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
[![Download](https://img.shields.io/badge/Download-Bootstrap-blue?style=flat-square)](https://raw.githubusercontent.com/<your-username>/termux-bootstrap/main/install.sh)

##  Overview

This is a fully automated **Termux development environment bootstrapper** by Kevin Juma. It sets up a modern, productive workspace on Termux with:

- **Zsh shell** as the default
- **Oh My Zsh** framework
- **Powerlevel10k theme**
- Essential plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Core developer tools: `git`, `bat`, `fzf`, `exa`, `figlet`, `toilet`, `lolcat`
- Branded terminal experience with custom ASCII and colors
- Idempotent and safe for multiple re-runs

##  Installation (One-Line)

Run the bootstrap installer in Termux with:

\`\`\`bash
bash <(curl -s https://raw.githubusercontent.com/<your-username>/termux-bootstrap/main/install.sh)
\`\`\`

##  Versioned Release (Recommended)

For stable installs, use versioned releases:

\`\`\`bash
bash <(curl -s https://raw.githubusercontent.com/<your-username>/termux-bootstrap/v1.0/install.sh)
\`\`\`

## 🖌 Branding

The installer includes a terminal branding script (`~/.branding.sh`) that displays:

Kevin Dev
Web Dev • Termux Workspace
<Date/Time>

##  Project Structure

termux-bootstrap/
├─ install.sh         # Main bootstrap installer
├─ README.md          # This file
└─ modules/           # Optional future modules (zsh, core tools, branding)

##  Usage Notes

- Re-running the installer is safe: it **skips existing installations**  
- For a zero-touch experience, provide a pre-configured `.p10k.zsh`  
- Ensure Termux supports **Nerd Fonts** for Powerlevel10k icons  

##  License

MIT License © Kevin Juma

##  Contact

- Website / Portfolio: [https://kevinjuma.netlify.app](https://kevinjuma.nelify.app)  
- GitHub: [https://github.com/kevin_ar_cmd_lab](https://github.com/kevin_ar_cmd_lab)  
- Twitter: [@kevin_ar_cmd_lab](https://twitter.com/kevin_ar_cmd_lab)

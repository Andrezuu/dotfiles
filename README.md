# 🚀 Dotfiles: Full Stack Environment

Este repositorio contiene la configuración técnica de mi entorno de desarrollo, optimizado para la productividad en sistemas híbridos (WSL2 + Windows 11). Como CTO y Full Stack Developer, busco consistencia, velocidad y una estética funcional en todas mis herramientas.

## 🛠️ Tech Stack & Herramientas

* **OS:** WSL2 (Ubuntu 24.04) & Windows 11 (PowerShell 7).
* **Shell:** Zsh con [Starship Prompt](https://starship.rs/) (Configuración compartida).
* **Multiplexor:** [Tmux](https://github.com/tmux/tmux) (Gestión de sesiones para backend y mobile).
* **Editor:** Neovim (IDE-like experience).
* **Font:** JetBrainsMono Nerd Font (Crucial para los glifos de Starship).
* **Networking:** WSL Mirror Mode habilitado para pruebas en dispositivos reales (Android/Mobile).

## Notas
Para desarrollar flutter con este stack mediante WSL. Mantener ADB del lado de windows y crear un symlink coherente con el .zshrc

## 📂 Estructura del Repositorio

La gestión de enlaces simbólicos se realiza mediante **GNU Stow**, replicando la estructura del `$HOME`.

```text
dotfiles/
├── zsh/                # Configuración de .zshrc y alias
├── config-files/       # Configuraciones de ~/.config/
│   ├── nvim/           # Neovim IDE setup
│   ├── tmux/           # Multiplexor y gestión de paneles
│   └── starship.toml   # Diseño del prompt universal
└── scripts/            

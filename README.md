# Dotfiles: Full Stack Environment

Este repositorio contiene la configuración técnica de mi entorno de desarrollo, optimizado para la productividad en sistemas híbridos (WSL2 + Windows 11).

## 🛠️ Tech Stack & Herramientas

* **OS:** WSL2 (Ubuntu 24.04) & Windows 11 (PowerShell 7).
* **Shell:** Zsh con [Starship Prompt](https://starship.rs/) (Configuración compartida).
* **Multiplexor:** [Tmux](https://github.com/tmux/tmux) (Gestión de sesiones para backend y mobile).
* **Editor:** Neovim (IDE-like experience).
* **Font:** JetBrainsMono Nerd Font (Crucial para los glifos de Starship).
* **Networking:** WSL Mirror Mode habilitado para pruebas en dispositivos reales (Android/Mobile).

## 📋 Requisitos Previos

Antes de aplicar esta configuración en una máquina nueva, asegúrate de tener instalados los siguientes paquetes base en tu sistema:

```bash
# Actualizar e instalar dependencias base (Ubuntu/Debian en WSL)
sudo apt update && sudo apt install -y git zsh tmux stow curl xclip

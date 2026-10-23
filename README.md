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
sudo apt update && sudo apt install -y git zsh tmux stow curl xclip \
  build-essential unzip ripgrep nodejs npm tree-sitter-cli
```

Para Neovim además:

* **Neovim 0.11+** (la config usa `vim.lsp.config` y `vim.diagnostic.jump`; probada en 0.12).
* `build-essential`: compila `telescope-fzf-native` y los parsers de treesitter.
* `tree-sitter-cli`: la rama `main` de nvim-treesitter lo necesita para instalar parsers.
* `ripgrep`: lo usan los greps de Telescope.
* `nodejs` y `npm`: Mason instala `ts_ls` e `intelephense` con npm.

## 🔗 Instalación

Cada carpeta es un paquete de [GNU Stow](https://www.gnu.org/software/stow/):

```bash
stow nvim tmux zsh starship fonts
```

## ⌨️ Neovim

```
nvim/.config/nvim/
├── init.lua          # leader + carga de módulos
└── lua/
    ├── config/       # options, keymaps, autocmds, filetypes, lazy
    └── plugins/      # un archivo por tema (telescope, lsp, completion, ...)
```

* **LSP** (vía Mason): `lua_ls`, `ts_ls`, `intelephense` y `postgres_lsp`. Para agregar otro, añádelo a la tabla `servers` en `lua/plugins/lsp.lua`.
* **Filetypes:** `.sac`, `.dml` y `.ddl` se tratan como SQL (`lua/config/filetypes.lua`).
* **Format on save:** solo `stylua`; el formateo por LSP es manual con `<leader>f`.
* **Recarga automática de archivos:** con tmux requiere `focus-events on`, ya incluido en `tmux.conf`.

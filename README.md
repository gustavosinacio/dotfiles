# Dotfiles

Personal config repo. Configs are **symlinked manually** from `$HOME` / `$HOME/.config/` — there is no install script, no Makefile.

## Shell

`.zshrc` expects:

| Tool      | Role                                              |
| --------- | ------------------------------------------------- |
| `starship` | prompt (config in `starship.toml`)               |
| `atuin`    | history search                                   |
| `zoxide`   | smarter `cd`                                     |
| `fzf`      | fuzzy finder                                     |
| `fzf-tab`  | tab-completion via fzf (auto-cloned to `~/.zsh/fzf-tab` on first run) |
| `nvm`      | runs `nvm use` if `.nvmrc` is present in cwd     |
| `lsd`      | replaces `ls` (alias in `.aliases.sh`)           |
| `bat`      | replaces `cat` (alias in `.aliases.sh`)          |

`oh-my-posh.toml` is kept as historical reference — the active prompt is starship.

## Layout

| Path | Purpose |
| ---- | ------- |
| `.zshrc`, `.aliases.sh`, `.aliases.ps1` | shell entrypoints |
| `tmux.conf` | tmux (prefix `C-s`, `vim-tmux-navigator`) |
| `nvim/` | Neovim — `lazy.nvim` with ~50 plugins (catppuccin-mocha active) |
| `.gitconfig` | git config + aliases; includes `~/workhub/.gitconfig-work` for repos under `~/workhub/` |
| `alacritty/` | terminal (macOS) |
| `yazi/`, `btop/`, `rc.conf` (ranger) | TUI utilities |
| `macos/yabairc`, `macos/skhdrc`, `macos/sketchybar/`, `macos/karabiner/`, `macos/.aerospace.toml` | macOS WM stack |
| `hypr/`, `sway/`, `waybar/`, `wofi/`, `mako/`, `rofi/`, `picom.conf` | Linux WM stack (Hyprland / Sway) |
| `vscode/` | VS Code keybindings, settings, vim config |
| `qmk_q11/` | QMK firmware (Keychron Q11) |

## Helper scripts

Two scripts export shell arrays consumed by external tooling in `~/unixverse/scripts/`:

- `working-dirs.sh` → `WORKING_DIRS` (project roots for fuzzy-pickers like `tmux-sessionizer`).
- `git-status-folders.sh` → `GIT_STATUS_DIRS` (repos to scan for dirty status).

Both scripts append from a `~/local_*.sh` overlay if present. Machine-specific paths stay out of the repo via this overlay pattern.

## Conventions

- tmux prefix is `C-s`; `C-h/j/k/l` are pane-nav keys (deferred to vim/nvim/fzf via `vim-tmux-navigator`).
- Two VS Code keybinding files are tracked: `vscode/keybindings.json` (cross-platform) and `vscode/macos.keybindings.json` (macOS-specific).
- Active Neovim colorscheme is `catppuccin-mocha`; `tokyonight-moon` and `themes/oled` are kept as alternates.
- `LSPs/` and `mason_packages/` under `nvim/lua/custom/` are committed as the source of truth for installed servers.

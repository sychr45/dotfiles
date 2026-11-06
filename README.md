<div align="center">
**v0.2α Working**


<p align="center">

### Requirements

- **Arch-based distro:** Arch, CachyOS, EndeavourOS, Manjaro, etc.
- **A mostly clean install.** Replaced configs are backed up automatically.

### Hardware

- RAM: 4 GB minimum, 8 GB recommended.
- GPU: Intel, AMD or NVIDIA with compatible wayland drivers.
- Display: Will look much better if you use IPS or VA.

As reference for this, I tried it on a Lenovo X240 with 8GB of DDR3L, and although the panel type is TN, the experience performance-wise was rather usable

</details>

## Features

- **Quickshell** — Fast, lightweight, customizable desktop components.
- **Waybar** - Minimal-distraction, customisable-by-terminal, interface for hardware monitoring or app shortcuts
- **Wallpaper picker** — Customizable | Wallpaper-based color generation, and live wallpapers.
- **App Launcher** — **Rofi** App search, clipboard history, and opacity controls.
- **Zsh + Starship** — Enhanced shell with autosuggestions and command history.
- **Power Menu** — Shutdown, reboot, logout

> All programs: [packages.txt](packages.txt)

## Keybinds

Hover over elements to see actions. 

| Keybind                 | Action                    |
| -----------             | ------------------------- |
| `Super + T`             | Terminal                  |
| `Super + Q`             | Close active window       |
| `Super + D`             | Application launcher      |
| `Super + Space`         | Toggle focus window       |
| `Super + F`             | Toggle fullscreen         |
| `Super + 1, 2, 3..`     | Change workspaces         |
| `Super + Shift + 1, 2..`| Move window to workspace  |
| `Super + E`             | File manager              |
| `Super + B`             | Browser                   |
| `Super + O`             | Switch opacity            |
| `Super + W`             | Wallpaper selector        |
| `Super + Mouse wheel`   | Zoom in/out               |
| `Super + Grave`         | Logout menu               |
| `Super + L`             | Lock screen               |
| `Super + M`             | Minimise a window         |

> [!note]
>
> Move and resize windows with Super + left/right mouse drag.
>
> To close components use Esc key or use the same keybind. 
>
> All keybinds: [.config/hypr/keybinds.lua](.config/hypr/keybinds.lua)

---
## Installation 

**READ ALL**

Works for Arch, CachyOS, EndeavourOS, Manjaro, etc. (testing for Nyarch soon)

This is mainly intended for a clean installation (existing configuration files that are being replaced will be backed up automatically).

**First install git and a package installer (paru or yay) then use the next command and continue the installation until it's finished**

```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git   
```

```bash
git clone https://github.com/sychr45/dotfiles
cd dotfiles
chmod +x install.sh
./install.sh
```

After the installation finishes log out and back in (or restart). 

> [!important]
> **Do not move or delete the dotfiles repository after installation.**
>
> This setup uses **symbolic links (symlinks)** that point to files inside the cloned repository. If you move or delete the repository, those symlinks will break.

> [!note]
> Screenshot mode is toggled off with esc
>
> Super + Grave means Super + ` <- the button to the left of 1 and above tab but below esc

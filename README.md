<div align="center">

## Hyprland Setup by 43pr メ

A fork from https://github.com/43PR/dotfiles using an older GUI version, different keybinds, AMD GPU support, a taskbar integrated into the waybar, more nerd fonts, and no media array on the waybar taking up 1/4 of the screen, and some other stuff probably

do NOT use this repo currently, may be worked on soon

### **[Features](#features)  -  [Keybinds](#most-used-keybinds)  -  [Installation](#installation) -  [Updating](#updating)**

</div>

**V1.0 ß**

Wallpapers: https://wallhaven.cc/user/43pr

## Features

- **Waybar** — Volume control, mute, and media playback controls.
- **Settings Menu** — System, network, bluetooth, display, audio, storage, and more.
- **Dynamic Colors** — Wallpaper-based color generation with **Matugen**.
- **Preset Themes** — Default Monochrome, Nord, Tokyo Night, etc. (you can create your own too)
- **Wallpaper Selector** — Custom wallpaper picker **(Awww + Quickshell)**.
- **App Launcher** — **Rofi** Application search, clipboard history, and opacity control.
- **Zsh + Starship** — Customizable shell with autosuggestions, history, and a polished prompt.
- **Customizable Power Menu** —  Custom power menu. 
- **Hyprlock** — Custom lock screen.
- **Custom Scripts** — Scripts for workflow and system management.
- 
> All programs: [packages.txt](packages.txt)

### Wallpaper Selector

Just made some tweaks to it. Give it some love: [hyprquickpaper](https://github.com/iamsurjog/hyprquickpaper)

## Most used keybinds

> **You can modify keybinds using HyprMod**

> **Move and resize windows with Super + left/right/mouse drag.**

| Keybind                 | Action                    |
| -----------             | ------------------------- |
| `Super + T`             | Terminal                  |
| `Super + Q`             | Close active window       |
| `Super + 1, 2, 3..`     | Change workspaces         |
| `Super + Shift + 1, 2..`| Move window to workspace  |
| `Super + D`             | Application launcher      |
| `Super + E`             | File manager              |
| `Super + F`             | Toggle fullscreen         |
| `Super + Space`         | Toggle floating window    |
| `Super + B`             | Browser                   |
| `Super + W`             | Wallpaper selector        |
| `Super + I`             | Settings menu             |
| `Super + O`             | Switch opacity            |
| `Super + V`             | Clipboard history         |
| `Super + Shift + W`     | Toggle waybar             |
| `Super + Tab`           | Lock screen               |
| `Super + Grave`         | Logout menu               |
| `Super + Mouse wheel`   | Zoom in/out               |
| `Delete`                | Screenshot fullscreen     |
| `SHIFT + Delete`        | Screenshot area select    |
| `Super + L`             | Screen lock               |

> To close most quickshell apps just click outside or Esc key.

> All keybinds: [.config/hypr/keybinds.lua](.config/hypr/keybinds.lua)

> Quickshell SettingsCornerTrigger.qml to controls hover actions

---
## Installation 

**READ ALL**

Should work for Arch, Manjaro, EndeavourOS, CachyOS, etc. 

This is mainly intended for a clean installation (existing configuration files that are being replaced will be backed up automatically).

**First install git then use the next command and continue the installation until it's finished**

```bash
sudo pacman -S git   
```

```bash
git clone https://github.com/43PR/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

After the installation finishes log out and back in.

> [!important]
> **Do not move or delete the dotfiles repository after installation.**
>
> This setup uses **symbolic links (symlinks)** that point to files inside the cloned repository. If you move or delete the repository, those symlinks will break.
>
> If you relocate the repository, simply run:
>
> ```bash
> ./install.sh
> ```
>
> The installer will automatically update the existing symlinks to point to the new location.

---
## Updating

Pull the latest changes, then run the updater from inside the repository:

```bash
git pull
./update.sh
```

Other options: `--dry-run` (preview changes), `--skip-packages`, `--skip-theme`.

Dotfiles are symlinked so, `git pull` updates your live configs directly.

You can check the reminders printed at the end of the run.

> [!tip]
> If any Quickshell (`.qml`) files changed in the pull, run:
>
> ```bash
> ./update.sh --restart-shell
> ```
>
> to restart Quickshell automatically.

> [!note]
> 
> Custom-gpu parts are specific to my hardware.
>
> For issues with the wallpaper picker, you can clear the cache from the Storage page in Settings.



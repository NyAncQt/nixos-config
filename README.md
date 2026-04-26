

````md
# ❄️ NixOS Hyprland + Caelestia Setup

Minimal (but powerful) NixOS configuration using **Hyprland**, **NVIDIA**, and **caelestia-shell**.

---

## 🧠 Overview

Personal NixOS config built around:
- Wayland (**Hyprland**)
- NVIDIA (modesetting enabled)
- **caelestia-shell** (Qt/QML shell)
- **spicetify-nix**
- **zen-browser**

**System:**
- Kernel: 6.12.x  
- Shell: fish  
- Distro: NixOS 25.11 (Xantusia)

---

## ⚙️ Features

- Hyprland (Wayland compositor)
- NVIDIA working on Wayland
- PipeWire audio
- Gaming stack (Steam, Lutris, Heroic, Wine)
- Flatpak support
- Caelestia shell UI
- Spicetify integration
- Zen browser (flake)

---

## 🚀 Install

> ⚠️ Personal config. Know what you're doing.

```bash
git clone https://github.com/YOUR_USERNAME/nixos-config.git
cd nixos-config
sudo nixos-rebuild switch --flake .#nixos
````

---

## 🌌 Caelestia Shell

Run:

```bash
caelestia-shell
```

---

## 🖼️ Wallpaper (IMPORTANT)

Caelestia reads from:

```
~/.local/state/caelestia/wallpaper/path.txt
```

Expected folder:

```
~/Pictures/Wallpapers/
```

Set wallpaper:

```bash
mkdir -p ~/.local/state/caelestia/wallpaper
echo "$HOME/Pictures/Wallpapers/your-image.jpg" > ~/.local/state/caelestia/wallpaper/path.txt
```

---

## 🎮 Gaming

* Steam
* Lutris
* Heroic
* Wine + Winetricks
* Gamemode
* MangoHud

---

## 📦 Packages

* git, curl, neovim, fzf
* btop, fastfetch, cava
* kitty, foot
* dolphin, kate, konsole
* spotify + spicetify
* zed-editor

---

## ⚠️ Notes

* NVIDIA-focused config
* Some caelestia warnings are normal
* Not modular (yet)

---

## 🧩 TODO

* [ ] Modularize config
* [ ] Add Home Manager
* [ ] Auto-start caelestia-shell
* [ ] Clean duplicates

---

## 📜 License

Do whatever you want with it.

```
```
readme made by ai btw lol

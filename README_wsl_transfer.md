# Sorcery WSL Transfer & Installation Guide

This guide explains how to transfer and run Sorcery on your WSL (Windows Subsystem for Linux) environment.

## 1. Transfer the Tarball
Copy the generated tarball (e.g., `sorcery_dist.tar.gz`) to your WSL home directory using your preferred method (Explorer drag-and-drop, `wsl cp`, etc).

## 2. Extract the Tarball
```bash
tar xvf sorcery_dist.tar.gz
cd sorcery_dist
```

## 3. Install Dependencies
Install all required runtime libraries:
```bash
sudo apt update
sudo xargs -a requirements.txt apt install -y
```

## 4. Run Sorcery
Make sure the binary is executable:
```bash
chmod +x build/sorcery
./build/sorcery
```

## Notes
- Sorcery requires a graphical environment (X11). Use an X server (like X410, VcXsrv, or Xming) on Windows and set `export DISPLAY=:0` in WSL if needed.
- If you encounter missing library errors, install the corresponding package listed in `requirements.txt`.
- Data folders (`cfg/`, `dat/`, `doc/`, `gfx/`, `vfx/`) must be present in the extracted directory.

Enjoy playing Sorcery on WSL!

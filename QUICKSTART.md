# Quick Start Guide

## For Ubuntu 24.04 / WSL2 Ubuntu 24.04

### First Time Setup

```bash
# 1. Clone the repository with submodules
git clone --recursive https://github.com/YOUR_USERNAME/sorcery.git
cd sorcery

# 2. Install all dependencies
sudo apt update
sudo apt install -y build-essential cmake pkg-config git \
    libsdl2-dev libsdl2-image-dev libglew-dev libgl1-mesa-dev \
    libglm-dev libjsoncpp-dev libsqlite3-dev libfmt-dev uuid-dev \
    libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev \
    libswscale-dev libswresample-dev libavutil-dev

# 3. Clone ImGui dependencies (not in repo due to size)
mkdir -p ext
git clone --depth 1 https://github.com/ocornut/imgui ext/imgui
git clone --depth 1 https://github.com/cfillion/imgui-toggle ext/imgui_toggle
git clone --depth 1 https://github.com/Flix01/imgui_sugar ext/imgui_sugar
git clone --depth 1 https://github.com/dalerank/imspinner ext/imgui_spinner

# 4. Download stb_image header
mkdir -p ext/stb
wget -O ext/stb/stb_image.h https://raw.githubusercontent.com/nothings/stb/master/stb_image.h

# 5. Build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)

# 6. Run!
cd build
./sorcery
```

### Running on Another Machine

If you want to copy the game to another Linux system:

```bash
# On the build machine - create a distributable package
cd /path/to/sorcery
mkdir -p dist/sorcery
cp build/sorcery dist/sorcery/
cp -r cfg dat doc gfx vfx dist/sorcery/
cd dist
tar -czf sorcery-linux.tar.gz sorcery/

# Transfer sorcery-linux.tar.gz to target machine, then:

# On the target machine - install runtime dependencies
sudo apt install -y libsdl2-2.0-0 libglew2.2 libgl1 \
    libjsoncpp25 libsqlite3-0 libfmt9 uuid-runtime \
    libavcodec60 libavformat60 libavutil58 libswscale7 libswresample4

# Extract and run
tar -xzf sorcery-linux.tar.gz
cd sorcery
./sorcery
```

### Troubleshooting

**Missing libraries error:**
```bash
# Check what libraries are missing
ldd build/sorcery | grep "not found"

# Install any missing packages
sudo apt install lib<package-name>
```

**CMake configuration errors:**
- Make sure all `-dev` packages are installed
- Ensure submodules are initialized: `git submodule update --init --recursive`
- Verify ext/imgui and other ext/ directories exist

**Build errors:**
- Ensure you have GCC 14+ or Clang 18+ with C++23 support
- Check `cmake --version` is 3.22 or higher

**Game won't start:**
- Make sure you're running from the `build/` directory
- The game expects `cfg/`, `dat/`, `gfx/`, `vfx/` directories adjacent to the binary

### For Development

```bash
# Build in debug mode with symbols
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j$(nproc)

# Rebuild after changes
cmake --build build -j$(nproc)

# Clean build
rm -rf build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for more development information.

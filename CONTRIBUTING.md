# Contributing to Sorcery

Thank you for your interest in contributing to Sorcery! This document provides guidelines for contributing to the project.

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help maintain a welcoming environment for all contributors

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/davemoore22/sorcery/issues)
2. If not, create a new issue using the bug report template
3. Include detailed steps to reproduce, expected vs actual behavior, and environment details

### Suggesting Features

1. Check if the feature has already been suggested
2. Create a new issue using the feature request template
3. Clearly describe the feature and its benefits

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes following the code style below
4. Test your changes thoroughly
5. Commit with clear, descriptive messages
6. Push to your fork
7. Open a Pull Request with a clear description

## Code Style

- C++23 standard
- Follow existing code formatting conventions
- Use meaningful variable and function names
- Comment complex logic
- Avoid unnecessary dependencies

## Build Requirements

See [doc/COMPILE](/doc/COMPILE) for detailed build instructions.

### Quick setup:

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt install build-essential cmake pkg-config \
    libsdl2-dev libglew-dev libjsoncpp-dev libsqlite3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libavutil-dev

# Clone ImGui dependencies
mkdir -p ext
git clone --depth 1 https://github.com/ocornut/imgui ext/imgui
git clone --depth 1 https://github.com/cfillion/imgui-toggle ext/imgui_toggle
git clone --depth 1 https://github.com/Flix01/imgui_sugar ext/imgui_sugar
git clone --depth 1 https://github.com/dalerank/imspinner ext/imgui_spinner

# Build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
```

## Testing

- Test all changes in both Debug and Release builds
- Verify no regressions in existing functionality
- Test on clean Ubuntu 24.04 environment when possible

## Questions?

Feel free to ask questions in:
- GitHub Issues
- The C++ Help Discord
- The DungeonCrawlers.org Discord (find Typhon)

Thank you for contributing!

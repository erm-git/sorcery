#!/bin/bash
# Package Sorcery for distribution

set -e

echo "=== Sorcery Linux Packaging Script ==="

# Check if binary exists
if [ ! -f "build/sorcery" ]; then
    echo "Error: build/sorcery not found. Build the project first:"
    echo "  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release"
    echo "  cmake --build build -j\$(nproc)"
    exit 1
fi

# Create dist directory
echo "Creating distribution directory..."
rm -rf dist/sorcery
mkdir -p dist/sorcery

# Copy binary
echo "Copying binary..."
cp build/sorcery dist/sorcery/

# Copy data directories
echo "Copying game data..."
for dir in cfg dat doc gfx vfx; do
    if [ -d "$dir" ]; then
        cp -r "$dir" dist/sorcery/
    else
        echo "Warning: $dir directory not found"
    fi
done

# Create archive
echo "Creating archive..."
cd dist
tar -czf "sorcery-linux-$(uname -m).tar.gz" sorcery/
cd ..

# Show result
echo ""
echo "=== Package created successfully! ==="
echo "File: dist/sorcery-linux-$(uname -m).tar.gz"
echo "Size: $(du -h dist/sorcery-linux-$(uname -m).tar.gz | cut -f1)"
echo ""
echo "To install on another system:"
echo "1. Transfer the .tar.gz file"
echo "2. Install runtime dependencies (see README.md)"
echo "3. Extract: tar -xzf sorcery-linux-$(uname -m).tar.gz"
echo "4. Run: cd sorcery && ./sorcery"

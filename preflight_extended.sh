#!/bin/bash
set -e

# Extended preflight check for Sorcery distribution

echo "=== Sorcery Extended Preflight Check ==="

# 1. Binary check
if [ ! -x "build/sorcery" ]; then
  echo "ERROR: build/sorcery not found or not executable."
  exit 1
fi

# 2. Data folders and file count
for d in cfg dat doc gfx vfx; do
  if [ ! -d "$d" ]; then
    echo "ERROR: Missing directory: $d"
    exit 1
  fi
  count=$(find "$d" -type f | wc -l)
  if [ "$count" -eq 0 ]; then
    echo "ERROR: $d is empty."
    exit 1
  fi
  echo "Found $count files in $d/"
done

# 3. Config file validation (basic)
if [ ! -f cfg/config.ini ]; then
  echo "ERROR: cfg/config.ini missing."
  exit 1
fi
if ! grep -q "\[General\]" cfg/config.ini; then
  echo "ERROR: cfg/config.ini missing [General] section."
  exit 1
fi
if ! grep -q "Font" cfg/config.ini; then
  echo "ERROR: cfg/config.ini missing Font settings."
  exit 1
fi
if ! grep -q "size" cfg/config.ini; then
  echo "ERROR: cfg/config.ini missing font size setting."
  exit 1
fi
if ! grep -q "Language" cfg/config.ini; then
  echo "ERROR: cfg/config.ini missing Language setting."
  exit 1
fi

echo "Config file validation passed."

# 4. Asset integrity (check for key assets)
missing_assets=()
for asset in dat/items.json dat/layout.json dat/maps.json dat/monsters.json dat/strings.json gfx; do
  if [ ! -e "$asset" ]; then
    missing_assets+=("$asset")
  fi
  # For gfx, check for at least one PNG
  if [ "$asset" = "gfx" ]; then
    png_count=$(find gfx -name '*.png' | wc -l)
    if [ "$png_count" -eq 0 ]; then
      missing_assets+=("gfx/*.png")
    fi
  fi
  # For dat, check JSON validity (simple)
  if [[ "$asset" == dat/*.json ]]; then
    if ! head -n 1 "$asset" | grep -q "{"; then
      echo "WARNING: $asset may not be valid JSON."
    fi
  fi
  # For save.db3, check existence
  if [ "$asset" = "dat/save.db3" ] && [ ! -f "$asset" ]; then
    echo "WARNING: dat/save.db3 missing (will be created on first run)"
  fi
  # For OFL.txt, check existence
  if [ "$asset" = "dat/OFL.txt" ] && [ ! -f "$asset" ]; then
    echo "WARNING: dat/OFL.txt missing (font license)"
  fi
  # For monsters.json, check for monsters
  if [ "$asset" = "dat/monsters.json" ]; then
    if ! grep -q "monster" "$asset"; then
      echo "WARNING: dat/monsters.json may be missing monster entries."
    fi
  fi

done
if [ ${#missing_assets[@]} -ne 0 ]; then
  echo "ERROR: Missing key assets: ${missing_assets[*]}"
  exit 1
fi

echo "Asset integrity check passed."

# 5. Runtime libraries
missing_libs=$(ldd build/sorcery | grep "not found" || true)
if [ -n "$missing_libs" ]; then
  echo "ERROR: Missing runtime libraries:"
  echo "$missing_libs"
  exit 1
fi

echo "Runtime library check passed."

# 6. Launch smoke test
if timeout 5s ./build/sorcery --help >/dev/null 2>&1; then
  echo "Launch smoke test passed (binary starts)."
else
  echo "ERROR: Launch smoke test failed (binary did not start)."
  exit 1
fi

echo "All extended checks passed. Sorcery is ready for distribution!"

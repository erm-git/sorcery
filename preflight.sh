#!/bin/bash
set -e

# Preflight check for Sorcery distribution

echo "=== Sorcery Preflight Check ==="

# Check binary
if [ ! -x "build/sorcery" ]; then
  echo "ERROR: build/sorcery not found or not executable."
  exit 1
fi

# Check data folders
for d in cfg dat doc gfx vfx; do
  if [ ! -d "$d" ]; then
    echo "ERROR: Missing directory: $d"
    exit 1
  fi
  # Check for files inside each folder
  count=$(find "$d" -type f | wc -l)
  if [ "$count" -eq 0 ]; then
    echo "ERROR: $d is empty."
    exit 1
  fi
  echo "Found $count files in $d/"
done

# Check runtime libraries
missing_libs=$(ldd build/sorcery | grep "not found" || true)
if [ -n "$missing_libs" ]; then
  echo "ERROR: Missing runtime libraries:"
  echo "$missing_libs"
  exit 1
fi

echo "All checks passed. Sorcery is ready for packaging and distribution!"

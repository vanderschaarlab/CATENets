#!/bin/bash

set -e

# Update the package list
apt-get update

# Install Python and development headers, plus LLVM 7 and clang-7 to match llvm-toolset-7.0 functionality.
apt-get install -y python3 python3-dev llvm-7 clang-7

# Python: upgrade pip and install packaging tools
python3 -m pip install --upgrade pip
python3 -m pip install setuptools wheel twine auditwheel

# Build Python wheels without dependencies and place them in the dist/ folder
python3 -m pip wheel . -w dist/ --no-deps

# Publish the built wheels to PyPI
twine upload --verbose --skip-existing dist/*

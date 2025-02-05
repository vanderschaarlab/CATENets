#!/bin/bash
set -e

# Update the package list
apt-get update

# Install Python and development headers, plus LLVM 10 and clang-10 as equivalents for llvm-toolset-7.0
apt-get install -y python3 python3-dev llvm-10 clang-10

# Python: upgrade pip and install packaging tools
python3 -m pip install --upgrade pip
python3 -m pip install setuptools wheel twine auditwheel

# Build Python wheels without dependencies and place them in the dist/ folder
python3 -m pip wheel . -w dist/ --no-deps

# Publish the built wheels to PyPI
twine upload --verbose --skip-existing dist/*

#!/bin/bash

# Setup script for system-level dependencies
# This script installs system packages required for the Kokoro audio project

echo "Installing system dependencies..."

# Install espeak-ng for English OOD fallback and some non-English languages
apt-get -qq -y install espeak-ng > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✓ espeak-ng installed successfully"
else
    echo "✗ Failed to install espeak-ng"
    echo "Note: You may need to run this script with sudo privileges"
    exit 1
fi

echo "System dependencies installation completed!"
echo ""
echo "Installing Python dependencies..."
pip install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✓ Python dependencies installed successfully"
else
    echo "✗ Failed to install Python dependencies"
    exit 1
fi

echo ""
echo "Setup completed! Your environment is now ready for the Kokoro audio project"
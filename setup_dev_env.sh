#!/bin/bash

# Update and upgrade the system
sudo apt update -y
sudo apt upgrade -y

# Install curl and other dependencies
sudo apt install -y curl git unzip xz-utils

# Install Node.js and npm
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js and npm installation
node -v
npm -v

# Install create-react-app globally
sudo npm install -g create-react-app

# Install Flutter
# Download the latest stable Flutter release
FLUTTER_VERSION="stable"
curl -O https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_VERSION}/linux/flutter_linux_${FLUTTER_VERSION}-latest.tar.xz
tar xf flutter_linux_${FLUTTER_VERSION}-latest.tar.xz

# Move flutter to /opt directory
sudo mv flutter /opt/flutter

# Add flutter to PATH
export PATH="$PATH:/opt/flutter/bin"

# Enable flutter auto-complete and cache flutter binaries
flutter precache
flutter doctor

# Install Android Studio (optional, for full Flutter development experience)
sudo snap install android-studio --classic

# Install Visual Studio Code
sudo snap install --classic code

# Install Dart SDK (required for Flutter)
sudo apt install -y apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update -y
sudo apt install -y dart

# Add Dart SDK to PATH
export PATH="$PATH:/usr/lib/dart/bin"

# Verify installations
flutter --version
dart --version

echo "Development environment setup completed successfully!"

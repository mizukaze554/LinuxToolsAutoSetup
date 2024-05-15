#!/bin/bash

# Function to display a message
function echo_message() {
  echo ""
  echo "======================================"
  echo "$1"
  echo "======================================"
  echo ""
}

# Update and upgrade the system
echo_message "Updating and upgrading the system..."
sudo apt update -y
sudo apt upgrade -y

# Install curl and other dependencies
echo_message "Installing curl, git, unzip, and xz-utils..."
sudo apt install -y curl git unzip xz-utils

# Install Node.js and npm
echo_message "Installing Node.js and npm..."
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js and npm installation
node -v
npm -v

# Install create-react-app globally
echo_message "Installing create-react-app globally..."
sudo npm install -g create-react-app

# Install Flutter
echo_message "Installing Flutter..."
FLUTTER_VERSION="stable"
curl -O https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_VERSION}/linux/flutter_linux_${FLUTTER_VERSION}-latest.tar.xz
tar xf flutter_linux_${FLUTTER_VERSION}-latest.tar.xz

# Move flutter to /opt directory
sudo mv flutter /opt/flutter

# Add flutter to PATH
export PATH="$PATH:/opt/flutter/bin"
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc

# Enable flutter auto-complete and cache flutter binaries
echo_message "Pre-caching Flutter binaries..."
flutter precache

# Run flutter doctor
echo_message "Running flutter doctor..."
flutter doctor

# Install Android Studio (optional, for full Flutter development experience)
echo_message "Installing Android Studio..."
sudo snap install android-studio --classic

# Install Visual Studio Code
echo_message "Installing Visual Studio Code..."
sudo snap install --classic code

# Install Dart SDK (required for Flutter)
echo_message "Installing Dart SDK..."
sudo apt install -y apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update -y
sudo apt install -y dart

# Add Dart SDK to PATH
export PATH="$PATH:/usr/lib/dart/bin"
echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> ~/.bashrc

# Verify installations
echo_message "Verifying installations..."
flutter --version
dart --version
node -v
npm -v
create-react-app --version
code --version
android-studio --version

echo_message "Development environment setup completed successfully!"

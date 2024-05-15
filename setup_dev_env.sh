#!/bin/bash

# Function to display a message
function echo_message() {
  echo ""
  echo "======================================"
  echo "$1"
  echo "======================================"
  echo ""
}

# Function to handle errors
function handle_error() {
  echo ""
  echo "======================================"
  echo "Error occurred during: $1"
  echo "Exiting script."
  echo "======================================"
  exit 1
}

# Function to install common dependencies
function install_dependencies() {
  echo_message "Installing curl, git, unzip, and xz-utils..."
  sudo apt install -y curl git unzip xz-utils || handle_error "installing curl, git, unzip, and xz-utils"
}

# Function to install Node.js and npm
function install_nodejs() {
  echo_message "Installing Node.js and npm..."
  read -p "Enter the version of Node.js to install (default is 16): " NODE_VERSION
  NODE_VERSION=${NODE_VERSION:-16}
  curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash - || handle_error "setting up Node.js repository"
  sudo apt install -y nodejs || handle_error "installing Node.js and npm"
  node -v || handle_error "verifying Node.js installation"
  npm -v || handle_error "verifying npm installation"
}

# Function to install create-react-app
function install_react() {
  install_nodejs
  echo_message "Installing create-react-app globally..."
  sudo npm install -g create-react-app || handle_error "installing create-react-app"
  create-react-app --version || handle_error "verifying create-react-app installation"
}

# Function to install Flutter
function install_flutter() {
  echo_message "Installing Dart SDK..."
  sudo apt install -y apt-transport-https || handle_error "installing apt-transport-https"
  sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' || handle_error "adding Google signing key"
  sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' || handle_error "adding Dart repository"
  sudo apt update -y || handle_error "updating package list"
  sudo apt install -y dart || handle_error "installing Dart SDK"

  export PATH="$PATH:/usr/lib/dart/bin"
  echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> ~/.bashrc

  echo_message "Installing Flutter..."
  read -p "Enter the version of Flutter to install (default is stable): " FLUTTER_VERSION
  FLUTTER_VERSION=${FLUTTER_VERSION:-stable}
  curl -O https://storage.googleapis.com/flutter_infra_release/releases/$FLUTTER_VERSION/linux/flutter_linux_$FLUTTER_VERSION-latest.tar.xz || handle_error "downloading Flutter"
  tar xf flutter_linux_$FLUTTER_VERSION-latest.tar.xz || handle_error "extracting Flutter"

  sudo mv flutter /opt/flutter || handle_error "moving Flutter to /opt directory"
  export PATH="$PATH:/opt/flutter/bin"
  echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc

  echo_message "Pre-caching Flutter binaries..."
  flutter precache || handle_error "pre-caching Flutter binaries"

  echo_message "Running flutter doctor..."
  flutter doctor || handle_error "running flutter doctor"
}

# Function to install Snap if not already installed
function install_snap() {
  if ! command -v snap &> /dev/null; then
    echo_message "Installing Snap..."
    sudo apt install -y snapd || handle_error "installing Snap"
  fi
}

# Function to install Android Studio
function install_android_studio() {
  install_snap
  echo_message "Installing Android Studio..."
  sudo snap install android-studio --classic || handle_error "installing Android Studio"
}

# Function to install Visual Studio Code
function install_vscode() {
  install_snap
  echo_message "Installing Visual Studio Code..."
  sudo snap install --classic code || handle_error "installing Visual Studio Code"
}

# Update and upgrade the system
echo_message "Updating and upgrading the system..."
sudo apt update -y || handle_error "updating package list"
sudo apt upgrade -y || handle_error "upgrading packages"

# Prompt user for input
echo "Choose the development field name to setup (Node.js, React, Flutter, Android Studio, vscode):"
read userInput

# Call the appropriate installation function
case $userInput in
  "Node.js")
    install_dependencies
    install_nodejs
    ;;
  "React")
    install_dependencies
    install_react
    ;;
  "Flutter")
    install_dependencies
    install_flutter
    ;;
  "Android Studio")
    install_dependencies
    install_android_studio
    ;;
  "vscode")
    install_dependencies
    install_vscode
    ;;
  *)
    echo_message "Invalid option selected. Please choose a valid development field name."
    exit 1
    ;;
esac

# Verify installations
echo_message "Verifying installations..."
node -v || echo "Node.js not installed."
npm -v || echo "npm not installed."
create-react-app --version || echo "create-react-app not installed."
flutter --version || echo "Flutter not installed."
dart --version || echo "Dart SDK not installed."
code --version || echo "Visual Studio Code not installed."
android-studio --version || echo "Android Studio not installed."

echo_message "Development environment setup completed successfully!"

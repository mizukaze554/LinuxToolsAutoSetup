# Function to display a message
function echo_message {
  Write-Host ""
  Write-Host "======================================"
  Write-Host "$1"
  Write-Host "======================================"
  Write-Host ""
}

# Function to handle errors
function handle_error {
  Write-Host ""
  Write-Host "======================================"
  Write-Host "Error occurred during: $1"
  Write-Host "Exiting script."
  Write-Host "======================================"
  exit 1
}

# Function to install Chocolatey if not already installed
function install_chocolatey {
  if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    echo_message "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  }
}

# Function to install common dependencies
function install_dependencies {
  echo_message "Installing curl, git, unzip, and 7zip..."
  choco install -y curl git unzip 7zip
}

# Function to install or upgrade Node.js and npm
function install_nodejs {
  echo_message "Installing or upgrading Node.js and npm..."
  $NODE_VERSION = Read-Host "Enter the version of Node.js to install (default is 16)"
  if (-not $NODE_VERSION) {
    $NODE_VERSION = 16
  }
  Invoke-WebRequest -Uri "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-x64.msi" -OutFile "node_installer.msi"
  Start-Process -FilePath "msiexec.exe" -ArgumentList "/i node_installer.msi /quiet" -Wait
  Remove-Item -Path "node_installer.msi"
}

# Function to install or upgrade create-react-app
function install_react {
  install_nodejs
  echo_message "Installing or upgrading create-react-app globally..."
  npm install -g create-react-app
}

# Function to install or upgrade Flutter
function install_flutter {
  echo_message "Installing or upgrading Dart SDK..."
  if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    choco install -y dart-sdk flutter
  }
}

# Function to install or upgrade Android Studio
function install_android_studio {
  if (-not (Get-Command studio -ErrorAction SilentlyContinue)) {
    choco install -y android-studio
  }
}

# Function to install or upgrade Visual Studio Code
function install_vscode {
  if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    choco install -y vscode
  }
}

# Function to install or upgrade Laravel
function install_laravel {
  echo_message "Installing or upgrading Laravel..."
  install_nodejs
  if (-not (Get-Command composer -ErrorAction SilentlyContinue)) {
    choco install -y composer
  }
  composer global require laravel/installer
}

# Update and upgrade the system
echo_message "Updating and upgrading the system..."
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  install_chocolatey
}
choco upgrade all -y

# Prompt user for input
Write-Host "Choose the development field name to setup (Node.js, React, Flutter, Android Studio, vscode, Laravel):"
$userInput = Read-Host

# Call the appropriate installation function
switch ($userInput) {
  "Node.js" {
    install_dependencies
    install_nodejs
  }
  "React" {
    install_dependencies
    install_react
  }
  "Flutter" {
    install_flutter
  }
  "Android Studio" {
    install_android_studio
  }
  "vscode" {
    install_vscode
  }
  "Laravel" {
    install_dependencies
    install_laravel
  }
  default {
    echo_message "Invalid option selected. Please choose a valid development field name."
    exit 1
  }
}

# Verify installations
echo_message "Verifying installations..."
node -v
npm -v
flutter --version
dart --version
code --version
laravel --version

echo_message "Development environment setup completed successfully!"

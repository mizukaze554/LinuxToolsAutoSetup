# DevToolsAutoSetup

This repository contains scripts to automatically set up a development environment on both Linux and Windows machines. The scripts install tools such as Node.js, npm, React, Flutter, Dart SDK, Android Studio, Visual Studio Code, and Laravel.

## Prerequisites

### For Linux
- A Linux machine with `sudo` privileges.
- An internet connection.

### For Windows
- A Windows machine with administrative privileges.
- An internet connection.

## Tools Installed

- **Node.js** and **npm**
- **create-react-app** (globally)
- **Flutter**
- **Dart SDK**
- **Android Studio** (optional)
- **Visual Studio Code**
- **Laravel**

## Usage

### For Linux

1. **Clone the repository:**

    ```sh
    git clone https://github.com/Cherrystone123/LinuxToolsAutoSetup.git
    cd LinuxToolsAutoSetup
    ```

2. **Make the script executable:**

    ```sh
    chmod +x setup_dev_env.sh
    ```

3. **Run the script:**

    ```sh
    ./setup_dev_env.sh
    ```

4. **Follow the on-screen instructions and wait for the setup to complete.**

### For Windows

1. **Clone the repository:**

    ```powershell
    git clone https://github.com/Cherrystone123/LinuxToolsAutoSetup.git
    cd LinuxToolsAutoSetup
    ```

2. **Run the script in PowerShell:**

    ```powershell
    ./setup_dev_env.ps1
    ```

3. **Follow the on-screen instructions and wait for the setup to complete.**

## Script Details

The scripts perform the following tasks:

1. **System Update and Upgrade:**
    - Updates the package list and upgrades existing packages.

2. **Install Dependencies:**
    - Installs essential tools such as `curl`, `git`, `unzip`, and `xz-utils` (Linux) or `curl`, `git`, `unzip`, and `7zip` (Windows).

3. **Install Node.js and npm:**
    - Uses the NodeSource repository to install Node.js and npm (Linux).
    - Downloads and installs Node.js and npm using the official MSI installer (Windows).
    - Installs `create-react-app` globally.

4. **Install Flutter:**
    - Downloads the latest stable release of Flutter.
    - Extracts and moves Flutter to the `/opt` directory (Linux) or installs via Chocolatey (Windows).
    - Adds Flutter to the system `PATH`.
    - Runs `flutter precache` and `flutter doctor` to verify the installation.

5. **Install Android Studio (Optional):**
    - Installs Android Studio using `snap` (Linux) or Chocolatey (Windows).

6. **Install Visual Studio Code:**
    - Installs Visual Studio Code using `snap` (Linux) or Chocolatey (Windows).

7. **Install Dart SDK:**
    - Adds the Dart SDK repository and installs Dart (Linux).
    - Installs Dart SDK via Chocolatey (Windows).
    - Adds Dart SDK to the system `PATH`.

8. **Install Laravel:**
    - Installs PHP, Composer, and Laravel installer.
    - Adds Composer's global bin directory to the system `PATH`.

9. **Verify Installations:**
    - Checks and displays the versions of the installed tools to confirm successful installation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

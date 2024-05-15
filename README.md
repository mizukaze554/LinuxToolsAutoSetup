# LinuxToolsAutoSetup

This repository contains a bash script to automatically set up a development environment on a Linux machine. The script installs tools such as Node.js, npm, React, Flutter, Dart SDK, Android Studio, and Visual Studio Code.

## Prerequisites

- A Linux machine with `sudo` privileges.
- An internet connection.

## Tools Installed

- **Node.js** and **npm**
- **create-react-app** (globally)
- **Flutter**
- **Dart SDK**
- **Android Studio** (optional)
- **Visual Studio Code**

## Usage

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

## Script Details

The script performs the following tasks:

1. **System Update and Upgrade:**
    - Updates the package list and upgrades existing packages.

2. **Install Dependencies:**
    - Installs essential tools such as `curl`, `git`, `unzip`, and `xz-utils`.

3. **Install Node.js and npm:**
    - Uses the NodeSource repository to install Node.js and npm.
    - Installs `create-react-app` globally.

4. **Install Flutter:**
    - Downloads the latest stable release of Flutter.
    - Extracts and moves Flutter to the `/opt` directory.
    - Adds Flutter to the system `PATH`.
    - Runs `flutter precache` and `flutter doctor` to verify the installation.

5. **Install Android Studio (Optional):**
    - Installs Android Studio using `snap`.

6. **Install Visual Studio Code:**
    - Installs Visual Studio Code using `snap`.

7. **Install Dart SDK:**
    - Adds the Dart SDK repository and installs Dart.
    - Adds Dart SDK to the system `PATH`.

8. **Verify Installations:**
    - Checks and displays the versions of the installed tools to confirm successful installation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

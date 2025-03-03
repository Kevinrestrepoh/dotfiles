## 1. Install Arch Linux

You can either follow the **manual installation** or use `archinstall` to simplify the process.

## 2. Install Graphic Drivers

Ensure that you install the correct drivers for your graphics card:
- **NVIDIA** / **AMD** / **Intel**

If you used `archinstall`, make sure to select the following during the setup:
- **Profile**: Choose `xorg`
- **Graphics**: Select your specific graphics card (NVIDIA/AMD/Intel)

---

## 3. Clone and Set Up Your Dotfiles

Once you have your system installed and running, you can set up your dotfiles.

First, open a terminal and run the following commands:

```bash
# Install Git if it is not already installed
sudo pacman -S git

# Clone the dotfiles repository
https://github.com/Kevinrestrepoh/dotfiles.git

# Change to the dotfiles directory
cd ~/dotfiles

# Make the install script executable
chmod +x install.sh

# Run the installation script
./install.sh

# Reboot the system
sudo reboot
```

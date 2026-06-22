#!/usr/bin/env bash
# bash <(curl -L https://raw.githubusercontent.com/kimuxer/nixos-config/main/scripts/install.sh)

# 2. Define Variables
HOSTNAME="nixdevbox"
REPO_URL="https://github.com/kimuxer/nixos-config.git"
TARGET_DIR="/tmp/nixos-config"
DISK_CONFIG="./modules/desktop/disko.nix"
USER_NAME="kim"

# Enable experimental features
export NIX_CONFIG="experimental-features = nix-command flakes"

# Check for root privilege
if [ "$EUID" -ne 0 ]; then
  echo "--------------------------------------------------------"
  echo "         ERROR: This script must be run as root."
  echo "         Please execute 'sudo -i' and try again."
  echo "--------------------------------------------------------"
  exit 1
fi

set -e

# Confirm initiation
echo "Current directory: $(pwd)"
echo "--------------------------------------------------------"
echo "    IMPORTANT: Remember to backup your .ssh folder"
echo "--------------------------------------------------------"

read -p "Start installation? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# 1. Check network
echo "Checking network connection..."
if ! ping -c 1 kimdel.top &> /dev/null; then
    echo "Network unreachable!"
    exit 1
fi

# 3. Clone configuration
echo "Fetching configuration from GitHub..."
rm -rf $TARGET_DIR
git clone $REPO_URL $TARGET_DIR
cd $TARGET_DIR

echo "Current execution path: $(pwd)"
read -p "Confirm path: (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

DISK_PATH=$(grep "diskid =" ./modules/desktop/disko.nix | cut -d'"' -f2)
DISK_MODEL=$(lsblk -dno MODEL "$DISK_PATH" 2>/dev/null || echo "Unknown")
DISK_SIZE=$(lsblk -dno SIZE "$DISK_PATH" 2>/dev/null || echo "Unknown")

# 4. Confirmation
echo "--------------------------------------------------------"
echo "Target Disk: $DISK_PATH"
echo "Disk Model: $DISK_MODEL"
echo "Disk Size: $DISK_SIZE"
echo "--------------------------------------------------------"
echo "WARNING: This will format the target disk, all data will be lost!"
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# 5. Partitioning and Installation
echo "Deploying system..."

nix run github:nix-community/disko -- --mode disko "$DISK_CONFIG"
nixos-install --flake .#$HOSTNAME --no-channel-copy

echo "Installation complete!"

# 6. Set user password
echo "Setting password for user $USER_NAME..."
nixos-enter --command "passwd $USER_NAME"

echo "Installation finished! Please run 'reboot' to restart the system."

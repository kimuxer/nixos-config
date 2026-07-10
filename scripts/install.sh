#!/usr/bin/env bash

# 安装命令,仅支持全新安装
# bash <(curl -L https://raw.githubusercontent.com/kimuxer/nixos-config/main/scripts/install.sh)

# 1. Check for root privilege
if [ "$EUID" -ne 0 ]; then
  echo "--------------------------------------------------------"
  echo "         ERROR: This script must be run as root."
  echo "         Please execute 'sudo -i' and try again."
  echo "--------------------------------------------------------"
  exit 1
fi

set -e

# 2. Define Variables
HOSTNAME="nixbox"
REPO_URL="https://github.com/kimuxer/nixos-config.git"
TARGET_DIR="/tmp/nixos-config"
DISK_CONFIG="$TARGET_DIR/modules/desktop/disko.nix"
USER_NAME="kim"

# 2.1Enable experimental features
export NIX_CONFIG="experimental-features = nix-command flakes"

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
if ! curl -Is www.google.com | head -n 1 | grep -q "200"; then
    echo "Network unreachable via HTTP"
    exit 1
fi

# 3. Clone configuration
echo "Fetching configuration from GitHub..."
rm -rf $TARGET_DIR
if ! git clone --depth 1 "$REPO_URL" "$TARGET_DIR"; then
    echo "Error: Failed to clone the repository. Check your network or URL."
    exit 1
fi
cd $TARGET_DIR

DISK_PATH=$(nix-instantiate --eval --expr "(import ${DISK_CONFIG}).disko.devices.disk.main.device" | tr -d '"')

if [[ -z "$DISK_PATH" ]]; then
    echo "Error: DISK_PATH is not set. Disko failed?"
    exit 1
fi

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

# 5.1 Check if /mnt is mounted
if ! mountpoint -q /mnt; then
    echo "Error: /mnt is not mounted. Disko failed?"
    exit 1
fi

# 5.2 Install NixOS
echo "Installing NixOS..."
nixos-install --flake .#$HOSTNAME --no-channel-copy
echo "Installation complete!"

# 6. Set user password
echo "Setting password for user $USER_NAME..."
nixos-enter --command "passwd $USER_NAME"

# 7. Clone NixOS config
echo "Cloning NixOS config for user $USER_NAME..."
nixos-enter --command "cd /home/$USER_NAME && \
    rm -rf nixos-config && \
    git clone https://github.com/kimuxer/nixos-config.git && \
    chown -R $USER_NAME:users nixos-config"


sync && echo "Installation finished! Please run 'reboot' to restart the system."

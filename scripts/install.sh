#!/usr/bin/env bash

# 1. 确保已联网
echo "正在检测网络连接..."
if ! ping -c 1 google.com &> /dev/null; then
    echo "未检测到网络!"
    exit 1
fi

# 2. 定义变量 (这里换成你自己的仓库名)
REPO_URL="https://github.com/kimuxer/nixos-config.git"
TARGET_DIR="/tmp/nixos-config"
HOSTNAME="nixdevbox"
DISK_PATH=$(grep "diskid =" ./modules/desktop/disko.nix | cut -d'"' -f2)
DISK_MODEL=$(lsblk -dno MODEL "$DISK_PATH" 2>/dev/null || echo "未知型号")
DISK_SIZE=$(lsblk -dno SIZE "$DISK_PATH" 2>/dev/null || echo "未知大小")

# 3. 清理并克隆
echo "正在从 GitHub 获取配置..."
rm -rf $TARGET_DIR
git clone $REPO_URL $TARGET_DIR
cd $TARGET_DIR

# 4. 确认警告
echo "--------------------------------------------------------"
echo "目标硬盘: $DISK_PATH"
echo "硬盘型号: $DISK_MODEL"
echo "硬盘容量: $DISK_SIZE"
echo "--------------------------------------------------------"
echo "警告：这将完全格式化目标硬盘，所有数据将丢失！"
read -p "确定继续吗? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# 5. 执行分区与安装
echo "正在部署系统..."
nix run github:nix-community/disko -- --mode disko ./modules/desktop/disko.nix
nixos-install --flake .#$HOSTNAME

echo "安装完成!"
# 6. 设置 root 密码
echo "正在为系统设置 root 密码..."
nixos-enter --root /mnt -c "passwd root"
echo "密码为:root"
echo "移除 U 盘并重启。"

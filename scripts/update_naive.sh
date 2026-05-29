#!/usr/bin/env bash

# 确保脚本在遇到错误时立即退出，并捕获未定义的变量
set -euo pipefail

# 指向你的 naive.nix 文件路径（根据实际位置微调）
SED_FILE="/home/kim/nixos/modules/system/naiveproxy.nix"

# 1. 确保配置文件确实存在
if [ ! -f "$SED_FILE" ]; then
  echo "❌ 找不到配置文件: $SED_FILE，请检查路径是否正确！"
  exit 1
fi

# 2. 核心黑科技：直接从你的 naive.nix 中提取本地当前活跃的版本号
# 原理：寻找含有 'version = "' 的行，并以双引号为分隔符提取出版本号
CURRENT_VERSION=$(grep 'version = "' "$SED_FILE" | cut -d '"' -f 2)
echo "💾 本地当前已安装版本: $CURRENT_VERSION"

echo "🔍 正在检查 NaiveProxy 官方最新版本..."
# 自动获取 GitHub 最新 Release 标签 (例如 v148.0.7778.96-5)
TAG=$(curl -s "https://api.github.com/repos/klzgrad/naiveproxy/releases/latest" | jq -r .tag_name)
VERSION=$(echo "$TAG" | sed 's/^v//')

echo "✨ 官方最新发布版本: $VERSION"

# 3. 智能比对：如果最新版本和本地版本一致，直接零开销退出
if [ "$VERSION" = "$CURRENT_VERSION" ]; then
  echo "🎉 当前已是最新版本，无需更新！"
  exit 0
fi

# 4. 如果发现新版本，才执行下载、哈希计算与文件覆写
echo "🚀 发现新版本！开始更新..."
URL="https://github.com/klzgrad/naiveproxy/releases/download/${TAG}/naiveproxy-${TAG}-linux-x64.tar.xz"

echo "⏳ 正在拉取临时文件并自动计算哈希 (SHA256 SRI)..."
HASH=$(nix-prefetch-url --type sha256 "$URL" 2>/dev/null)
SRI_HASH=$(nix hash to-sri --type sha256 "$HASH")

echo "✅ 计算完成! 
   -> 新版本: $VERSION
   -> 新哈希: $SRI_HASH"

# 5. 精准修改 naive.nix
sed -i "s/version = \".*\";/version = \"$VERSION\";/" "$SED_FILE"
sed -i "s|hash = \".*\";|hash = \"$SRI_HASH\";|" "$SED_FILE"

echo "🎉 $SED_FILE 已经自动更新成功！"

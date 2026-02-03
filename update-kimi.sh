#!/bin/bash
set -e

AGENTS_DIR="$HOME/.config/agents/superpowers"
SKILLS_DIR="$HOME/.config/agents/skills"

echo "=== Updating Superpowers for Kimi CLI ==="
echo ""

# 获取最新版本
TEMP_DIR=$(mktemp -d)
echo "Fetching latest version..."
git clone --depth 1 https://github.com/kyrosle/superpowers.git "$TEMP_DIR"

# 更新文件
echo "Updating Agent configuration..."
cp -r "$TEMP_DIR/.kimi/agents/"* "$AGENTS_DIR/"

echo "Updating Skills..."
cp -r "$TEMP_DIR/.kimi/skills/"* "$SKILLS_DIR/"

# 清理
rm -rf "$TEMP_DIR"

echo ""
echo "=== Update Complete ==="
echo ""

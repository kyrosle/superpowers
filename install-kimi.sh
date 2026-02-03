#!/bin/bash
set -e

SUPERPOWERS_REPO="https://github.com/kyrosle/superpowers.git"
AGENTS_DIR="$HOME/.config/agents/superpowers"
SKILLS_DIR="$HOME/.config/agents/skills"

echo "=== Installing Superpowers for Kimi CLI ==="
echo ""

# 1. 创建目录
echo "Creating directories..."
mkdir -p "$AGENTS_DIR"
mkdir -p "$SKILLS_DIR"

# 2. 克隆仓库到临时目录
TEMP_DIR=$(mktemp -d)
echo "Cloning superpowers repository..."
git clone --depth 1 "$SUPERPOWERS_REPO" "$TEMP_DIR"

# 3. 复制 Agent 配置
echo "Installing Agent configuration..."
cp -r "$TEMP_DIR/.kimi/agents/"* "$AGENTS_DIR/"

# 4. 复制普通 Skills
echo "Installing Skills..."
cp -r "$TEMP_DIR/.kimi/skills/"* "$SKILLS_DIR/"

# 5. 清理
rm -rf "$TEMP_DIR"

echo ""
echo "=== Installation Complete ==="
echo ""
echo "启动方式："
echo "  kimi --agent-file ~/.config/agents/superpowers/superpowers.yaml"
echo ""
echo "或创建别名 (添加到 ~/.bashrc 或 ~/.zshrc)："
echo "  alias kimi-super='kimi --agent-file ~/.config/agents/superpowers/superpowers.yaml'"
echo ""
echo "更新方式："
echo "  curl -fsSL https://raw.githubusercontent.com/kyrosle/superpowers/main/update-kimi.sh | bash"
echo ""

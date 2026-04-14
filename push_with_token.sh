#!/bin/bash
# 特朗普Skill推送到GitHub脚本（带Token版本）
# 用法: 
#   1. 编辑此文件，将 YOUR_PERSONAL_ACCESS_TOKEN 替换为你的GitHub Token
#   2. ./push_with_token.sh

set -e

USERNAME="andrew2king"
REPO_NAME="donald-trump-skill"
# ⚠️ 重要: 将下面这行替换为你的Personal Access Token
# 获取方式: https://github.com/settings/tokens
TOKEN="YOUR_PERSONAL_ACCESS_TOKEN"

echo "========================================"
echo "🚀 推送到GitHub"
echo "========================================"
echo ""
echo "GitHub用户名: $USERNAME"
echo "仓库名称: $REPO_NAME"
echo ""

# 检查Token是否已设置
if [ "$TOKEN" = "YOUR_PERSONAL_ACCESS_TOKEN" ]; then
    echo "❌ 错误: 请先编辑此脚本，设置你的Personal Access Token"
    echo ""
    echo "获取Token的步骤:"
    echo "  1. 访问 https://github.com/settings/tokens"
    echo "  2. 点击 'Generate new token (classic)'"
    echo "  3. 勾选 'repo' 权限"
    echo "  4. 复制生成的Token"
    echo "  5. 编辑此脚本，替换 YOUR_PERSONAL_ACCESS_TOKEN"
    exit 1
fi

# 检查是否在正确的目录
if [ ! -f "README.md" ]; then
    echo "❌ 错误: 请在项目根目录运行此脚本"
    exit 1
fi

# 添加远程仓库
echo "🔗 添加远程仓库..."
if git remote | grep -q "origin"; then
    echo "远程仓库已存在，更新URL..."
    git remote set-url origin https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPO_NAME.git
else
    git remote add origin https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPO_NAME.git
fi

# 显示远程仓库信息
echo ""
echo "📡 远程仓库信息:"
git remote -v

# 推送代码
echo ""
echo "⬆️  推送到GitHub..."
git push -u origin main

echo ""
echo "========================================"
echo "✅ 推送成功！"
echo "========================================"
echo ""
echo "🌐 访问你的仓库:"
echo "   https://github.com/$USERNAME/$REPO_NAME"
echo ""
echo "📋 下一步建议:"
echo "   1. 在GitHub上添加Topics标签"
echo "   2. 创建Release版本"
echo "   3. 分享给朋友使用"
echo ""

# 移除Token从远程URL（为了安全）
git remote set-url origin https://github.com/$USERNAME/$REPO_NAME.git
echo "🔒 已移除Token从远程URL（安全）"

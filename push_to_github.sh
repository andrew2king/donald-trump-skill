#!/bin/bash
# 特朗普Skill推送到GitHub脚本
# 用法: ./push_to_github.sh YOUR_GITHUB_USERNAME

set -e

# 检查参数
if [ $# -eq 0 ]; then
    echo "❌ 错误: 请提供GitHub用户名"
    echo "用法: ./push_to_github.sh YOUR_GITHUB_USERNAME"
    echo ""
    echo "示例:"
    echo "  ./push_to_github.sh andrew"
    exit 1
fi

USERNAME=$1
REPO_NAME="donald-trump-skill"

echo "========================================"
echo "🚀 推送到GitHub"
echo "========================================"
echo ""
echo "GitHub用户名: $USERNAME"
echo "仓库名称: $REPO_NAME"
echo ""

# 检查是否在正确的目录
if [ ! -f "README.md" ]; then
    echo "❌ 错误: 请在项目根目录运行此脚本"
    exit 1
fi

# 检查git状态
echo "📋 检查Git状态..."
git status --short

# 添加远程仓库
echo ""
echo "🔗 添加远程仓库..."
if git remote | grep -q "origin"; then
    echo "远程仓库已存在，更新URL..."
    git remote set-url origin https://github.com/$USERNAME/$REPO_NAME.git
else
    git remote add origin https://github.com/$USERNAME/$REPO_NAME.git
fi

# 显示远程仓库信息
echo ""
echo "📡 远程仓库信息:"
git remote -v

# 推送代码
echo ""
echo "⬆️  推送到GitHub..."
echo "提示: 如果要求输入密码，请使用Personal Access Token"
echo ""
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

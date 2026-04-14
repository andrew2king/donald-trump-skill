# GitHub上传步骤

## 快速上传（推荐）

### 步骤1：在GitHub创建仓库

1. 访问 https://github.com/new
2. 填写信息：
   - **Repository name**: `donald-trump-skill`
   - **Description**: `唐纳德·特朗普思维模型 - 从《交易的艺术》提取的决策框架`
   - **Public**: ✅ 选择公开
   - **Add a README file**: ❌ 不要勾选（已有README）
3. 点击 **Create repository**

### 步骤2：推送本地代码

在终端执行以下命令：

```bash
cd ~/workspace/donald-trump-skill

# 添加远程仓库（替换 YOUR_USERNAME 为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/donald-trump-skill.git

# 推送代码
git push -u origin main
```

### 步骤3：验证

访问以下链接查看：
```
https://github.com/YOUR_USERNAME/donald-trump-skill
```

## 使用GitHub CLI（如果已安装）

```bash
# 安装 GitHub CLI
brew install gh

# 登录
gh auth login

# 创建仓库并推送
cd ~/workspace/donald-trump-skill
gh repo create donald-trump-skill --public --description "唐纳德·特朗普思维模型 - 从《交易的艺术》提取的决策框架" --source=. --push
```

## 项目信息

- **本地路径**: `~/workspace/donald-trump-skill`
- **文件数量**: 9个文件
- **总大小**: 约 20KB
- **许可证**: MIT
- **主要文件**:
  - `README.md` - 项目说明
  - `SKILL.md` - Skill定义文件
  - `distilled/donald_trump_skill.md` - 完整思维模型
  - `examples/` - 实战案例
  - `scripts/think_like_trump.py` - 分析工具

## 上传后建议

1. **添加Topics标签**: 
   - thinking-model
   - decision-making
   - business-negotiation
   - psychology
   - ai-skill

2. **创建Release**:
   - 版本号: v1.0.0
   - 标题: Initial Release
   - 描述: 特朗普思维模型Skill初始版本

3. **分享给女娲Skill项目**:
   - 可以向 https://github.com/alchaincyf/nuwa-skill 提交PR
   - 或作为独立Skill分享

## 遇到问题？

如果遇到权限问题，尝试：
```bash
# 使用SSH方式
git remote set-url origin git@github.com:YOUR_USERNAME/donald-trump-skill.git
```

或检查GitHub设置中的Personal Access Token。

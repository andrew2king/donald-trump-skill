# 推送到GitHub的详细步骤

## 方法1：使用HTTPS + Personal Access Token（推荐）

### 步骤1：创建GitHub仓库

1. 打开浏览器访问：https://github.com/new
2. 填写信息：
   - **Repository name**: `donald-trump-skill`
   - **Description**: `唐纳德·特朗普思维模型 - 从《交易的艺术》提取的决策框架`
   - 选择 **Public**
   - 不要勾选 "Add a README file"
3. 点击 **Create repository**

### 步骤2：获取Personal Access Token

1. 访问：https://github.com/settings/tokens
2. 点击 **Generate new token (classic)**
3. 填写：
   - **Note**: `donald-trump-skill-push`
   - **Expiration**: 选择过期时间（建议30天）
   - **Scopes**: 勾选 `repo`（完整仓库访问）
4. 点击 **Generate token**
5. **立即复制token**（只显示一次！）

### 步骤3：推送代码

在终端执行以下命令：

```bash
# 进入项目目录
cd ~/workspace/donald-trump-skill

# 添加远程仓库（替换 YOUR_USERNAME 为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/donald-trump-skill.git

# 推送代码（会提示输入用户名和密码）
# 用户名：你的GitHub用户名
# 密码：刚才生成的Personal Access Token
git push -u origin main
```

## 方法2：使用SSH密钥

### 步骤1：检查SSH密钥

```bash
ls -la ~/.ssh/
```

如果有 `id_rsa.pub` 或 `id_ed25519.pub`，说明已有SSH密钥。

### 步骤2：如果没有SSH密钥，创建一个新的

```bash
# 生成SSH密钥（替换 your_email@example.com 为你的邮箱）
ssh-keygen -t ed25519 -C "your_email@example.com"

# 按回车使用默认路径
# 可以设置密码，也可以留空
```

### 步骤3：添加SSH密钥到GitHub

```bash
# 复制公钥内容
cat ~/.ssh/id_ed25519.pub
# 或者
cat ~/.ssh/id_rsa.pub
```

1. 访问：https://github.com/settings/keys
2. 点击 **New SSH key**
3. 粘贴刚才复制的公钥内容
4. 点击 **Add SSH key**

### 步骤4：推送代码

```bash
# 进入项目目录
cd ~/workspace/donald-trump-skill

# 使用SSH方式添加远程仓库
git remote add origin git@github.com:YOUR_USERNAME/donald-trump-skill.git

# 推送代码
git push -u origin main
```

## 方法3：使用GitHub CLI（最简单）

### 步骤1：安装GitHub CLI

```bash
# macOS
brew install gh

# Windows
winget install --id GitHub.cli

# 其他系统见：https://github.com/cli/cli#installation
```

### 步骤2：登录GitHub

```bash
gh auth login
```

按照提示操作：
- 选择 **GitHub.com**
- 选择 **HTTPS** 或 **SSH**
- 浏览器会打开授权页面，点击授权

### 步骤3：创建仓库并推送

```bash
# 进入项目目录
cd ~/workspace/donald-trump-skill

# 创建仓库并推送（一条命令搞定！）
gh repo create donald-trump-skill \
  --public \
  --description "唐纳德·特朗普思维模型 - 从《交易的艺术》提取的决策框架" \
  --source=. \
  --push
```

## 验证推送成功

推送完成后，访问：
```
https://github.com/YOUR_USERNAME/donald-trump-skill
```

应该能看到所有文件：
- README.md
- SKILL.md
- LICENSE
- distilled/
- examples/
- scripts/

## 常见问题

### 问题1：提示 "Permission denied"

**原因**：没有权限推送

**解决**：
- 检查是否正确添加了远程仓库
- 检查Personal Access Token是否有`repo`权限
- 检查是否是仓库的协作者

### 问题2：提示 "Repository not found"

**原因**：仓库不存在或没有访问权限

**解决**：
- 确认已在GitHub上创建了仓库
- 确认仓库名和用户名拼写正确
- 确认仓库是Public或你有权限访问

### 问题3：提示 "fatal: remote origin already exists"

**原因**：已经添加了远程仓库

**解决**：
```bash
# 查看现有远程仓库
git remote -v

# 删除现有远程仓库
git remote remove origin

# 重新添加
git remote add origin https://github.com/YOUR_USERNAME/donald-trump-skill.git
```

### 问题4：提示 "Updates were rejected"

**原因**：远程仓库有本地没有的更新

**解决**：
```bash
# 先拉取远程更新
git pull origin main

# 然后再推送
git push origin main
```

## 推送后的建议操作

### 1. 添加Topics标签

在GitHub仓库页面，点击右侧的齿轮图标，添加：
- `thinking-model`
- `decision-making`
- `business-negotiation`
- `psychology`
- `ai-skill`
- `trump`
- `art-of-the-deal`

### 2. 创建Release

1. 在GitHub仓库页面，点击右侧的 **Create a new release**
2. 点击 **Choose a tag**，输入 `v1.0.0`
3. **Release title**: `Initial Release`
4. **Description**:
   ```
   # 特朗普思维模型 Skill v1.0.0

   ## 包含内容
   - 5大心智模型详细解析
   - 11条交易法则完整收录
   - 3个实战应用案例
   - 可执行的Python分析工具

   ## 来源
   基于《交易的艺术》(The Art of the Deal, 1987) 和特朗普商业实践

   ## 使用
   详见 README.md
   ```
5. 点击 **Publish release**

### 3. 分享给女娲Skill项目

可以向 https://github.com/alchaincyf/nuwa-skill 提交Issue或PR，建议添加这个Skill到他们的列表。

## 需要帮助？

如果遇到问题，可以：
1. 查看GitHub文档：https://docs.github.com/en/get-started
2. 搜索错误信息
3. 在相关社区提问

祝推送顺利！

# 如何获取GitHub Personal Access Token（详细图文指南）

## 🔑 什么是Personal Access Token？

Personal Access Token（PAT）是GitHub用来替代密码进行身份验证的令牌。使用Token比密码更安全，因为：
- 可以设置过期时间
- 可以限制权限范围
- 可以随时撤销
- 不会暴露你的真实密码

---

## 📱 步骤详解

### 步骤1：登录GitHub

1. 打开浏览器
2. 访问：https://github.com
3. 点击右上角 **Sign in**
4. 输入你的用户名和密码登录

---

### 步骤2：进入Token设置页面

**方法A：直接访问**
- 在地址栏输入：https://github.com/settings/tokens
- 按回车

**方法B：通过菜单进入**
1. 点击右上角你的头像
2. 在下拉菜单中选择 **Settings**
3. 在左侧菜单中，最下方找到 **Developer settings**
4. 点击 **Personal access tokens**
5. 选择 **Tokens (classic)**

---

### 步骤3：生成新Token

1. 点击绿色按钮 **Generate new token**
2. 在下拉菜单中选择 **Generate new token (classic)**

---

### 步骤4：填写Token信息

#### 4.1 Note（备注）
```
donald-trump-skill-push
```
> 💡 这是Token的用途说明，方便你日后识别

#### 4.2 Expiration（过期时间）
- 选择 **30 days**（30天）
- 或选择 **No expiration**（永不过期）
- 或选择自定义日期

> ⚠️ 建议选30天，到期后可以重新生成

#### 4.3 Select scopes（选择权限）

**必须勾选的权限：**

☑️ **repo** - 完整仓库访问权限
- 包括：repo:status, repo_deployment, repo_public, repo_invite, security_events

**可选权限（根据需要）：**

☑️ **workflow** - 更新GitHub Actions工作流

☐ **write:packages** - 上传包到GitHub Package Registry

☐ **delete:packages** - 删除GitHub Package Registry中的包

> 💡 对于我们推送代码的需求，只需要勾选 **repo** 即可

---

### 步骤5：生成Token

1. 滚动到页面底部
2. 点击绿色按钮 **Generate token**

---

### 步骤6：保存Token（⚠️ 重要！）

**Token只会显示一次！**

页面会显示类似这样的Token：
```
ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

**立即复制并保存！**

#### 保存方法：

**方法1：复制到剪贴板**
1. 点击Token右侧的复制按钮（📋图标）
2. 或手动选中Token，按 Cmd+C（Mac）或 Ctrl+C（Windows）

**方法2：保存到安全的地方**
```bash
# 保存到文件（在你的电脑上）
echo "ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" > ~/github_token.txt

# 或保存到密码管理器
# 如：1Password, LastPass, Bitwarden等
```

**方法3：临时保存（仅用于本次推送）**
```bash
# 在终端中设置环境变量
export GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

---

## 🚀 使用Token推送代码

### 方法1：使用我们准备的脚本

```bash
# 编辑脚本
nano ~/workspace/donald-trump-skill/push_with_token.sh

# 找到这行（第12行）
TOKEN="YOUR_PERSONAL_ACCESS_TOKEN"

# 替换为你的Token
TOKEN="ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# 保存（按 Ctrl+O，然后回车，然后 Ctrl+X）

# 运行脚本
cd ~/workspace/donald-trump-skill
./push_with_token.sh
```

### 方法2：直接命令推送

```bash
cd ~/workspace/donald-trump-skill

# 设置远程仓库URL（替换YOUR_TOKEN为你的Token）
git remote set-url origin https://andrew2king:YOUR_TOKEN@github.com/andrew2king/donald-trump-skill.git

# 推送代码
git push -u origin main

# 为了安全，推送后移除Token
git remote set-url origin https://github.com/andrew2king/donald-trump-skill.git
```

### 方法3：使用环境变量（更安全）

```bash
# 设置Token为环境变量
export GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# 使用Token推送
cd ~/workspace/donald-trump-skill
git remote set-url origin https://andrew2king:${GITHUB_TOKEN}@github.com/andrew2king/donald-trump-skill.git
git push -u origin main

# 清除环境变量
unset GITHUB_TOKEN

# 恢复远程URL
git remote set-url origin https://github.com/andrew2king/donald-trump-skill.git
```

---

## 🔒 Token安全注意事项

### ✅ 应该做的：
- 将Token保存在密码管理器中
- 设置合理的过期时间
- 只授予必要的权限
- 如果怀疑泄露，立即撤销并重新生成

### ❌ 不应该做的：
- 将Token硬编码在代码中
- 将Token分享给他人
- 将Token上传到公共仓库
- 在公共电脑或不安全的环境保存Token

---

## 🔄 管理Token

### 查看所有Token
1. 访问：https://github.com/settings/tokens
2. 可以看到所有生成的Token列表

### 撤销Token
1. 在Token列表中找到要撤销的Token
2. 点击 **Delete**
3. 确认删除

### 重新生成Token
如果Token过期或被删除，重复上述步骤生成新的Token即可。

---

## 🆘 常见问题

### Q1：Token显示"Not shown"怎么办？
**A：** Token只在生成时显示一次。如果丢失了，只能删除旧Token，重新生成一个新的。

### Q2：推送时提示"Authentication failed"？
**A：** 
- 检查Token是否复制完整（以ghp_开头）
- 检查Token是否已过期
- 检查Token是否已被撤销

### Q3：提示"Permission denied"？
**A：** 
- 检查Token是否勾选了"repo"权限
- 检查是否有仓库的写入权限

### Q4：Token应该保存多久？
**A：** 
- 建议设置30天过期
- 过期后重新生成即可
- 不要在多个地方长期保存Token

---

## 📋 快速检查清单

获取Token前：
- [ ] 已登录GitHub
- [ ] 知道GitHub用户名（andrew2king）

获取Token时：
- [ ] 访问 https://github.com/settings/tokens
- [ ] 点击 Generate new token (classic)
- [ ] Note填写：donald-trump-skill-push
- [ ] Expiration选择：30 days
- [ ] 勾选权限：repo
- [ ] 点击 Generate token
- [ ] **立即复制Token**

使用Token时：
- [ ] 将Token填入push_with_token.sh脚本
- [ ] 运行脚本推送代码
- [ ] 推送成功后删除或安全保存Token

---

## 🎯 总结

1. **访问** https://github.com/settings/tokens
2. **点击** Generate new token (classic)
3. **填写** Note: donald-trump-skill-push
4. **选择** Expiration: 30 days
5. **勾选** 权限: repo
6. **点击** Generate token
7. **立即复制** Token（ghp_开头）
8. **填入** push_with_token.sh脚本
9. **运行** ./push_with_token.sh
10. **完成** 🎉

---

**现在就开始获取Token吧！** 整个过程只需要2-3分钟。

如果遇到问题，请告诉我具体的错误信息，我会帮您解决。

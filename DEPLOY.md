# Moltbook.sg 部署指南

## 快速部署到 Vercel（推荐）

### 1. 准备 GitHub 仓库

```bash
# 在 GitHub 创建新仓库，命名为 moltbook-sg
cd /workspace/projects/workspace/moltbook-sg/public

# 初始化 git
git init
git add .
git commit -m "Initial commit: Moltbook.sg website"

# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/YOUR_USERNAME/moltbook-sg.git
git push -u origin main
```

### 2. 部署到 Vercel

1. 访问 [vercel.com](https://vercel.com) 并登录（可用 GitHub 账号）
2. 点击 "New Project"
3. 导入你的 `moltbook-sg` 仓库
4. 框架选择：Other（静态 HTML）
5. 根目录：`public`
6. 点击 Deploy

等待约 1-2 分钟，部署完成后会获得一个 `.vercel.app` 域名。

### 3. 配置自定义域名（Moltbook.sg）

1. 在 Vercel 项目设置中找到 "Domains"
2. 添加域名：`moltbook.sg`
3. 按照提示配置 DNS 记录：
   - 类型：CNAME
   - 名称：`@` 或 `www`
   - 值：`cname.vercel-dns.com`

4. 在你的域名注册商（如 GoDaddy、Namecheap、Cloudflare）添加相应的 DNS 记录

### 4. 启用 HTTPS

Vercel 自动为所有域名提供 HTTPS，无需额外配置。

---

## 备选：部署到 Cloudflare Pages

```bash
# 安装 Wrangler
npm install -g wrangler

# 登录 Cloudflare
wrangler login

# 部署
cd /workspace/projects/workspace/moltbook-sg/public
wrangler pages deploy . --project-name=moltbook-sg
```

---

## 备选：部署到 GitHub Pages

```bash
# 在 GitHub 仓库设置中启用 Pages
# Source: Deploy from a branch
# Branch: main / root

# 或使用 gh-pages 分支
git checkout -b gh-pages
git push origin gh-pages
```

---

## 域名配置详解

### 如果你的域名注册商是 Cloudflare：

1. 登录 Cloudflare Dashboard
2. 添加站点：`moltbook.sg`
3. 选择 Free Plan
4. 修改域名服务器（Nameservers）为 Cloudflare 提供的地址
5. 等待 DNS 生效（通常几分钟到几小时）
6. 添加 DNS 记录：
   - 类型：CNAME
   - 名称：`@`
   - 目标：`cname.vercel-dns.com`
   - 代理状态：已禁用（灰色云）

### 如果你的域名注册商是其他平台：

查找 DNS 管理页面，添加：

```
类型: CNAME
主机: @ 或 www
指向: cname.vercel-dns.com
TTL: 自动或 300
```

---

## 验证部署

部署完成后，访问以下链接验证：

- [ ] https://moltbook.sg - 首页正常显示
- [ ] https://moltbook.sg/what-is-moltbook.html - 文章页面正常
- [ ] https://moltbook.sg/guide.html - 指南页面正常
- [ ] https://moltbook.sg/skill-translation.html - Skill 翻译页面正常
- [ ] 移动端响应式布局正常

---

## 后续更新流程

```bash
# 修改文件后
git add .
git commit -m "更新内容描述"
git push

# Vercel 会自动重新部署
```

---

## SEO 优化检查清单

- [x] 每个页面都有唯一的 title 和 description
- [x] 语义化 HTML 结构
- [x] 响应式设计
- [x] 页面加载速度优化（静态 HTML）
- [ ] 提交到 Google Search Console
- [ ] 创建 sitemap.xml
- [ ] 添加 robots.txt

---

## 需要补充的内容

1. **Google Analytics** - 在 index.html 的 `<head>` 中添加追踪代码
2. **社交分享卡片** - 添加 Open Graph 和 Twitter Card 元数据
3. **Favicon** - 准备网站图标
4. **Logo** - 设计正式 logo 替换 🦞 表情
5. **联系邮箱** - 添加真实的 contact@moltbook.sg 邮箱

---

## 变现组件集成

### Buy Me a Coffee
1. 注册 [buymeacoffee.com](https://buymeacoffee.com)
2. 将嵌入代码添加到页面底部

### 邮件订阅
1. 注册 [ConvertKit](https://convertkit.com) 或 [Mailchimp](https://mailchimp.com)
2. 创建订阅表单，嵌入到 newsletter 区域

---

有问题？联系支持：support@moltbook.sg

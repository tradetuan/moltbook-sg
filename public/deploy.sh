#!/bin/bash

# Moltbook.sg 部署脚本
# 用法: ./deploy.sh [vercel|cloudflare|github]

set -e

echo "🦞 Moltbook.sg 部署脚本"
echo "========================"

# 检查参数
PLATFORM=${1:-vercel}

if [ "$PLATFORM" != "vercel" ] && [ "$PLATFORM" != "cloudflare" ] && [ "$PLATFORM" != "github" ]; then
    echo "❌ 错误: 不支持的部署平台"
    echo "用法: ./deploy.sh [vercel|cloudflare|github]"
    exit 1
fi

# 检查是否在正确目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误: 请在 public 目录中运行此脚本"
    exit 1
fi

echo "📦 部署平台: $PLATFORM"
echo ""

# 部署到 Vercel
if [ "$PLATFORM" == "vercel" ]; then
    echo "🚀 开始部署到 Vercel..."
    
    # 检查是否安装 Vercel CLI
    if ! command -v vercel &> /dev/null; then
        echo "📥 安装 Vercel CLI..."
        npm install -g vercel
    fi
    
    # 登录检查
    echo "🔑 检查 Vercel 登录状态..."
    vercel whoami || (echo "请先登录: vercel login" && exit 1)
    
    # 部署
    echo "📤 部署中..."
    vercel --prod
    
    echo ""
    echo "✅ 部署完成!"
    echo "🌐 访问: https://moltbook.sg (配置自定义域名后)"
fi

# 部署到 Cloudflare
if [ "$PLATFORM" == "cloudflare" ]; then
    echo "🚀 开始部署到 Cloudflare Pages..."
    
    # 检查是否安装 Wrangler
    if ! command -v wrangler &> /dev/null; then
        echo "📥 安装 Wrangler..."
        npm install -g wrangler
    fi
    
    # 登录检查
    echo "🔑 检查 Cloudflare 登录状态..."
    wrangler whoami || (echo "请先登录: wrangler login" && exit 1)
    
    # 部署
    echo "📤 部署中..."
    wrangler pages deploy . --project-name=moltbook-sg
    
    echo ""
    echo "✅ 部署完成!"
fi

# 部署到 GitHub Pages
if [ "$PLATFORM" == "github" ]; then
    echo "🚀 准备部署到 GitHub Pages..."
    
    # 检查 git
    if ! command -v git &> /dev/null; then
        echo "❌ 请先安装 Git"
        exit 1
    fi
    
    echo "📋 请按照以下步骤手动部署:"
    echo "1. 在 GitHub 创建仓库: moltbook-sg"
    echo "2. 运行以下命令:"
    echo ""
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/moltbook-sg.git"
    echo "   git push -u origin main"
    echo ""
    echo "3. 在仓库设置中启用 GitHub Pages"
    echo "   Settings -> Pages -> Source: Deploy from a branch -> Branch: main"
    echo ""
fi

echo ""
echo "📚 下一步:"
echo "1. 配置自定义域名 (moltbook.sg)"
echo "2. 添加 DNS 记录指向部署平台"
echo "3. 等待 SSL 证书生成"
echo "4. 验证网站访问"
echo ""
echo "📖 详细文档: DEPLOY.md"

#!/bin/bash
# ============================================
# 热点页 Git 推送脚本
# 将 _hotspot/pages/ 下的 HTML 同步到站点根目录并推送
# ============================================

SITE_DIR="/Users/judy/self-learning-is-a-skill"

cd "$SITE_DIR"

# 将热点页复制到站点 hot 目录下
mkdir -p hot
cp _hotspot/pages/*.html hot/ 2>/dev/null

# 更新首页热点索引（可选）
HOT_FILES=$(ls hot/*.html 2>/dev/null | sed 's|hot/||' | sed 's|\.html$||')
if [ -n "$HOT_FILES" ]; then
  echo "🔥 当前热点页:"
  echo "$HOT_FILES" | while read slug; do
    echo "  https://www.liaodingjiu.com/hot/$slug"
  done
fi

echo ""
echo "📦 准备推送..."
git add _hotspot/pages/ hot/ 2>/dev/null
git status --short

echo ""
read -p "确认推送? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git commit -m "hotspot: update $(date '+%Y-%m-%d')" 2>/dev/null
  git push
  echo "✅ 已推送。页面将在一分钟内上线。"
else
  echo "❌ 已取消。"
fi

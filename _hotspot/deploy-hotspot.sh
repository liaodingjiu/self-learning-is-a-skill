#!/bin/bash
# ============================================
# 热点页部署脚本 · Hotspot Deploy
# 用法: bash deploy-hotspot.sh "slug" "标题"
# 示例: bash deploy-hotspot.sh "claude-code-guide" "Claude Code 入门指南：从零到第一行代码"
# ============================================

SLUG="$1"
TITLE="$2"
DATE=$(date '+%Y-%m-%d')
DIR="/Users/judy/self-learning-is-a-skill/_hotspot/pages"

if [ -z "$SLUG" ] || [ -z "$TITLE" ]; then
  echo "用法: bash deploy-hotspot.sh \"页面slug\" \"页面标题\""
  echo "示例: bash deploy-hotspot.sh \"gemini-vs-gpt\" \"Gemini 2.5 vs GPT-5：实测对比 2026\""
  exit 1
fi

mkdir -p "$DIR"

PAGE_FILE="$DIR/$SLUG.html"

if [ -f "$PAGE_FILE" ]; then
  echo "⚠️  页面已存在: $PAGE_FILE"
  echo "   用编辑器打开修改，或换一个 slug"
  exit 1
fi

# 生成页面（占位符，等你自己填内容）
cat > "$PAGE_FILE" << PAGEEOF
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$TITLE</title>
<meta name="description" content="$TITLE —— 快速了解、对比分析、实用指南">
<style>
  :root { --bg: #fafaf8; --text: #2c2c2a; --text-secondary: #5f5e5a; --blue: #185fa5; --border: #e5e5e0; }
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Microsoft YaHei", sans-serif; background: var(--bg); color: var(--text); line-height: 1.8; font-size: 16px; -webkit-font-smoothing: antialiased; }
  .container { max-width: 720px; margin: 0 auto; padding: 48px 20px 80px; }
  .meta { font-size: 13px; color: var(--text-secondary); margin-bottom: 8px; }
  .hot-badge { display: inline-block; padding: 2px 10px; background: #faeeda; color: #854f0b; border-radius: 12px; font-weight: 500; font-size: 12px; margin-left: 8px; }
  h1 { font-size: 28px; font-weight: 700; margin-bottom: 12px; letter-spacing: -0.5px; line-height: 1.35; }
  .lead { font-size: 17px; color: var(--text-secondary); margin-bottom: 32px; padding-bottom: 24px; border-bottom: 1px solid var(--border); }
  h2 { font-size: 20px; font-weight: 600; margin: 36px 0 12px; }
  p, li { margin-bottom: 14px; }
  a { color: var(--blue); text-decoration: none; }
  .cta { margin-top: 40px; padding: 20px; background: #e6f1fb; border-radius: 10px; text-align: center; }
  .footer { margin-top: 48px; padding-top: 20px; border-top: 1px solid var(--border); font-size: 13px; color: #888780; text-align: center; }
  @media (max-width: 640px) { .container { padding: 28px 16px 60px; } h1 { font-size: 23px; } }
</style>
</head>
<body>
<div class="container">
  <div class="meta">$DATE <span class="hot-badge">🔥 热点</span></div>
  <h1>$TITLE</h1>
  <p class="lead">$TITLE —— 快速了解、对比分析、实用指南</p>

  <!-- TODO: 在这里填充内容 -->

  <div class="cta">
    <p>更多内容 → <a href="https://www.liaodingjiu.com">阿玖说事</a></p>
  </div>
  <div class="footer"><p>liaodingjiu.com · $DATE</p></div>
</div>
</body>
</html>
PAGEEOF

echo "✅ 页面已生成: $PAGE_FILE"
echo "   标题: $TITLE"
echo "   日期: $DATE"
echo ""
echo "📝 下一步："
echo "   1. 告诉 Claude Code「帮我把 hotspot/pages/$SLUG.html 的内容填好，主题是 $TITLE」"
echo "   2. 预览: open $PAGE_FILE"
echo "   3. 满意后部署: bash _hotspot/push-hotspot.sh"

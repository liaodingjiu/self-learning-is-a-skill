#!/bin/bash
# ============================================
# 热点监控脚本 · Hotspot Monitor
# 用法: bash check-trends.sh
# 频率: 每天早晚各跑一次
# 注意: 部分服务需科学上网
# ============================================

CURL="curl -s --max-time 10 --connect-timeout 5"

echo "🔍 热点监控 · $(date '+%Y-%m-%d %H:%M')"
echo "========================================"
echo ""

# ── 1. Google Trends 每日热词 ──
fetch_trends() {
  local GEO="$1"
  local LABEL="$2"
  echo "📊 Google Trends ($LABEL)"
  result=$($CURL "https://trends.google.com/trends/trendingsearches/daily/rss?geo=$GEO" 2>/dev/null)
  if [ $? -ne 0 ] || [ -z "$result" ]; then
    echo "  ⚠️  无法连接（需科学上网）"
  else
    echo "$result" | python3 -c "
import sys, re
xml = sys.stdin.read()
titles = re.findall(r'<title>([^<]+)</title>', xml)
for t in titles[1:11]:
    print(f'  🔥 {t}')
" 2>/dev/null
  fi
  echo ""
}

fetch_trends "US" "美国"
fetch_trends "CN" "中国"

# ── 2. Hacker News 前 10 ──
echo "💻 Hacker News Top 10"
$CURL "https://hacker-news.firebaseio.com/v0/topstories.json" 2>/dev/null | \
  python3 -c "
import json, sys, urllib.request
try:
    ids = json.load(sys.stdin)[:10]
    for i in ids:
        try:
            req = urllib.request.Request(f'https://hacker-news.firebaseio.com/v0/item/{i}.json')
            req.add_header('User-Agent', 'Mozilla/5.0')
            data = json.load(urllib.request.urlopen(req, timeout=5))
            print(f'  📌 {data.get(\"title\",\"?\")[:80]}  ({data.get(\"score\",0)}pts)')
        except: pass
except:
    print('  ⚠️  无法连接（需科学上网）')
" 2>/dev/null
echo ""

# ── 3. GitHub Trending ──
echo "🐙 GitHub Trending (今日)"
python3 -c "
import urllib.request, re
try:
    req = urllib.request.Request('https://github.com/trending')
    req.add_header('User-Agent', 'Mozilla/5.0')
    html = urllib.request.urlopen(req, timeout=10).read().decode()
    repos = re.findall(r'<h2[^>]*>.*?<a[^>]*href=\\\"/([^\\\"]+)\\\"[^>]*>', html, re.DOTALL)
    seen = set()
    for r in repos[:10]:
        r = r.strip().lstrip('/')
        if r and r not in seen and not r.startswith('trending'):
            seen.add(r)
            print(f'  ⭐ {r}')
except Exception:
    print('  ⚠️  无法获取')
" 2>/dev/null
echo ""

# ── 4. Product Hunt (今日精选) ──
echo "🚀 Product Hunt 今日精选"
python3 -c "
import urllib.request, re
try:
    req = urllib.request.Request('https://www.producthunt.com/')
    req.add_header('User-Agent', 'Mozilla/5.0')
    html = urllib.request.urlopen(req, timeout=10).read().decode()
    # 提取首页产品名
    names = re.findall(r'<h3[^>]*class=\"[^\"]*name[^\"]*\"[^>]*>(.*?)</h3>', html, re.DOTALL)
    for n in names[:8]:
        name = re.sub(r'<[^>]+>', '', n).strip()
        if name:
            print(f'  🆕 {name}')
except Exception:
    print('  ⚠️  无法获取')
" 2>/dev/null
echo ""

echo "========================================"
echo "✅ 完成。"
echo ""
echo "📝 下一步：在本对话中说「帮我写一个热点页：[关键词]」"
echo "   我会用 _hotspot/template.html 生成页面，你确认后部署。"

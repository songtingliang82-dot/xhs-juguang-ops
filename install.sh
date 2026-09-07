#!/usr/bin/env bash
# =============================================================================
# xhs-juguang-ops 一键安装脚本 (macOS / Linux)
# 用法:
#   ./install.sh                       # 安装到所有已支持的 Agent
#   ./install.sh --target claude       # 只装 Claude Code
#   ./install.sh --target claude,codex # 装多个, 逗号分隔
#   可用 target: claude codex workbuddy grok agents
# =============================================================================
set -euo pipefail

SKILL_NAME="xhs-juguang-ops"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR"   # 仓库根即技能内容 (SKILL.md 在根目录)

declare -A DIRS=(
  [claude]="$HOME/.claude/skills"
  [codex]="$HOME/.codex/skills"
  [workbuddy]="$HOME/.workbuddy/skills"
  [grok]="$HOME/.grok/skills"
  [agents]="$HOME/.agents/skills"
)

usage() {
  echo "用法: ./install.sh [--target claude,codex,...|all]"
  echo "可用 target: ${!DIRS[*]} | all"
  exit 0
}

TARGET=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="$2"; shift 2 ;;
    -h|--help) usage ;;
    *) echo "未知参数: $1"; usage ;;
  esac
done

[[ -z "$TARGET" || "$TARGET" == "all" ]] && TARGET="${!DIRS[*]}"
IFS=',' read -ra picks <<< "$(echo "$TARGET" | tr ' ' ',')"

installed=0
for key in "${picks[@]}"; do
  key="$(echo "$key" | xargs)"           # 去空格
  [[ -z "$key" ]] && continue
  base="${DIRS[$key]:-}"
  if [[ -z "$base" ]]; then
    echo "⚠️ 未知 target: $key (可用: ${!DIRS[*]})"; continue
  fi
  dest="$base/$SKILL_NAME"
  mkdir -p "$base"
  rm -rf "$dest"
  mkdir -p "$dest"
  # 拷贝技能内容(跳过 .git 与本安装脚本自身)
  cp -R "$SRC"/SKILL.md "$SRC"/references "$SRC"/templates "$SRC"/examples "$SRC"/README.md "$SRC"/LICENSE "$dest"/ 2>/dev/null || {
    cp -R "$SRC"/SKILL.md "$dest"/
    cp -R "$SRC"/references "$dest"/
    cp -R "$SRC"/templates "$dest"/
    cp -R "$SRC"/examples "$dest"/
    cp -R "$SRC"/README.md "$SRC"/LICENSE "$dest"/
  }
  echo "✅ 已安装到 $dest"
  installed=$((installed+1))
done

if [[ $installed -eq 0 ]]; then
  echo "未安装任何 target。示例: ./install.sh --target claude,codex"
  exit 1
fi

echo ""
echo "🎉 安装完成! 请重启 Agent 会话, 然后说:"
echo "   「我要做小红书留学获客投放, 帮我出一份完整方案」"

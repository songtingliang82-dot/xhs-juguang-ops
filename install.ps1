<#
# =============================================================================
# xhs-juguang-ops 一键安装脚本 (Windows PowerShell)
# 用法:
#   .\install.ps1                      # 安装到所有已支持的 Agent
#   .\install.ps1 -Target claude       # 只装 Claude Code
#   .\install.ps1 -Target claude,codex # 装多个, 逗号分隔
#   可用 Target: claude codex workbuddy grok agents
# 注意: 如果你的 Agent 支持通用 skills CLI, 推荐使用
#   npx -y skills add songtingliang82-dot/xhs-juguang-ops -g -a claude-code -y
#   本脚本是兜底方案(不依赖 Node.js)
# 提示: 若被安全策略拦截, 先执行 Set-ExecutionPolicy -Scope Process Bypass
# =============================================================================
#>
param(
    [string]$Target = "all"
)

$SkillName = "xhs-juguang-ops"
$Root = $PSScriptRoot
$Src = Join-Path $Root "skills\$SkillName"   # 仓库已按标准 skills/<name>/ 结构组织

$Map = [ordered]@{
    "claude"    = Join-Path $HOME ".claude\skills"
    "codex"     = Join-Path $HOME ".codex\skills"
    "workbuddy" = Join-Path $HOME ".workbuddy\skills"
    "grok"      = Join-Path $HOME ".grok\skills"
    "agents"    = Join-Path $HOME ".agents\skills"
}

if ($Target -eq "all") { $Target = ($Map.Keys -join ",") }

$installed = 0
foreach ($key in ($Target -split ",")) {
    $key = $key.Trim()
    if (-not $key) { continue }
    if (-not $Map.Contains($key)) {
        Write-Host "⚠️ 未知 target: $key (可用: $($Map.Keys -join ', '))" -ForegroundColor Yellow
        continue
    }
    $base = $Map[$key]
    $dest = Join-Path $base $SkillName
    New-Item -ItemType Directory -Force -Path $base | Out-Null
    if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
    if (Test-Path $Src) {
        Copy-Item -Recurse -Force "$Src\*" $dest
    } else {
        Write-Host "⚠️ 未找到源码 $Src"; continue
    }
    Write-Host "✅ 已安装到 $dest" -ForegroundColor Green
    $installed++
}

if ($installed -eq 0) {
    Write-Host "未安装任何 target。示例: .\install.ps1 -Target claude,codex" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "🎉 安装完成! 请重启 Agent 会话, 然后说:" -ForegroundColor Cyan
Write-Host "   「我要做小红书留学获客投放, 帮我出一份完整方案」" -ForegroundColor Cyan
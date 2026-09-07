<#
# =============================================================================
# xhs-juguang-ops 一键安装脚本 (Windows PowerShell)
# 用法:
#   .\install.ps1                      # 安装到所有已支持的 Agent
#   .\install.ps1 -Target claude       # 只装 Claude Code
#   .\install.ps1 -Target claude,codex # 装多个, 逗号分隔
#   可用 Target: claude codex workbuddy grok agents
# 提示: 若被安全策略拦截, 先执行 Set-ExecutionPolicy -Scope Process Bypass
# =============================================================================
#>
param(
    [string]$Target = "all"
)

$SkillName = "xhs-juguang-ops"
$Root = $PSScriptRoot   # 仓库根即技能内容 (SKILL.md 在根目录)

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
    New-Item -ItemType Directory -Force -Path $dest | Out-Null

    # 拷贝技能内容 (SKILL.md / references / templates / examples / README / LICENSE)
    Copy-Item -Force (Join-Path $Root "SKILL.md") $dest
    Copy-Item -Recurse -Force (Join-Path $Root "references") $dest
    Copy-Item -Recurse -Force (Join-Path $Root "templates") $dest
    Copy-Item -Recurse -Force (Join-Path $Root "examples") $dest
    Copy-Item -Force (Join-Path $Root "README.md") $dest
    if (Test-Path (Join-Path $Root "LICENSE")) { Copy-Item -Force (Join-Path $Root "LICENSE") $dest }

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

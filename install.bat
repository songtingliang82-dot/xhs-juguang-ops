@echo off
chcp 65001 >nul
title xhs-juguang-ops 一键安装
echo ============================================================
echo   小红书聚光广告投放操盘技能 xhs-juguang-ops 一键安装
echo   本文件所在文件夹必须是完整解压后的仓库内容
echo ============================================================
echo.

set "SRC=%~dp0skills\xhs-juguang-ops"
if not exist "%SRC%\SKILL.md" (
    echo [错误] 没有找到技能文件 ^(skills\xhs-juguang-ops\SKILL.md^)
    echo 请确认已把下载的 ZIP 完整解压，再双击 install.bat
    echo.
    pause
    exit /b 1
)

set /a N=0

call :install_one WorkBuddy "%USERPROFILE%\.workbuddy\skills"
call :install_one ClaudeCode "%USERPROFILE%\.claude\skills"
call :install_one Codex "%USERPROFILE%\.codex\skills"
call :install_one Cursor "%USERPROFILE%\.cursor\skills"
call :install_one Grok "%USERPROFILE%\.grok\skills"
call :install_one Agents "%USERPROFILE%\.agents\skills"

if %N% EQU 0 (
    echo.
    echo [提示] 没有检测到已安装的 AI 技能目录。
    echo 请先安装任意支持技能的 AI（如 WorkBuddy / Claude Code / Codex），
    echo 或手动把 skills\xhs-juguang-ops 文件夹复制到对应 Agent 的 skills 目录。
) else (
    echo.
    echo ============================================================
    echo  完成！已自动安装到 %N% 个 AI 技能目录
    echo ============================================================
    echo  下一步：重启对应的 AI 应用/会话，然后对它说：
    echo  「我要做小红书留学获客投放，帮我出一份完整方案」
)
echo.
pause
exit /b 0

:install_one
if not exist "%~2" goto :eof
if not exist "%~2\NUL" mkdir "%~2" >nul 2>&1
xcopy /e /i /y "%SRC%" "%~2\xhs-juguang-ops\" >nul 2>&1
if exist "%~2\xhs-juguang-ops\SKILL.md" (
    echo  [已安装] %~1
    set /a N+=1
)
goto :eof

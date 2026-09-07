# AI_INSTRUCTIONS.md · 给目标 AI 的安装与使用指令

> 用法：把下方【指令原文】整段复制，粘贴给你想安装此技能的任意 AI（Claude、GPT、Gemini、Codex 等）。它会自行安装/内化技能并按方法论给你建议。

---

## ⚡ 指令原文（首选 · 一行命令版，复制这段发给 AI）

请帮我安装并使用一个开源 AI 技能【xhs-juguang-ops · 小红书聚光广告投放操盘】，然后按它给我提供投流建议。

**执行**：在你的终端运行 `npx -y skills add songtingliang82-dot/xhs-juguang-ops -g -a <你支持的agent> -y`（支持 claude-code / codex / cursor / opencode / workbuddy 等 70+ Agent；不确定就 `--all`）。

装好重启会话后告诉我"已就绪"。我之后会提真实业务问题（小红书留学聚光投放方案、计划没消耗诊断、笔记违禁词自查、ROI 台账等），请按该技能方法论回答，数值给区间并说明前提，平台规则以聚光后台为准，遵守合规红线（留学类不承诺保录取等），不教规避审核。

---

## 🛠 指令原文（兜底 · 无 skills CLI 时的手动安装版）

请帮我安装并使用一个开源 AI 技能【xhs-juguang-ops · 小红书聚光广告投放操盘】。

**背景**：仓库 https://github.com/songtingliang82-dot/xhs-juguang-ops ，已按标准 `skills/<name>/` 目录组织：`skills/xhs-juguang-ops/` 下含 SKILL.md（入口与工作流）、references/（方法论文档，07 为留学/国际教育专篇）、templates/（投放计划表、关键词词表、ROI 台账）、examples/（留学投放完整示例）。

**第 1 步 · 获取**：在本机执行 `git clone https://github.com/songtingliang82-dot/xhs-juguang-ops.git`；若失败可下载 zip：https://github.com/songtingliang82-dot/xhs-juguang-ops/archive/refs/heads/main.zip

**第 2 步 · 安装到你的 skills 目录**：
- 如果你支持技能目录机制（常见：`~/.claude/skills/`、`~/.codex/skills/`、`~/.workbuddy/skill…`），把仓库内 `skills/xhs-juguang-ops/` 文件夹整体放入对应目录（如 `cp -r xhs-juguang-ops/skills/xhs-juguang-ops ~/.claude/skills/xhs-juguang-ops`）。
- 也可用仓库内脚本：`cd xhs-juguang-ops && ./install.sh --target <你支持的target>`（Windows：`.\install.ps1 -Target <Target>`；target：claude/codex/workbuddy/grok/agents/all）。
- 若你没有技能目录机制：请**通读并内化** `skills/xhs-juguang-ops/SKILL.md` 与 `references/` 全部文件，作为你在"小红书聚光投放/留学获客"领域的知识遵循。

**第 3 步 · 内化**：以 SKILL.md 为入口（含工作总流程与分场景要点）；需要细则时查阅 references/01-07；给用户交付文档时套用 templates/ 结构。

**第 4 步 · 验证**：完成后告诉我"已就绪"。随后我会提出真实业务，请按上述方法论给出可执行答复，不要泛泛而谈，涉及数值请给区间并说明前提。

---

## 给使用者的检查清单

- [ ] 目标 AI 能访问仓库 URL（git clone 或 zip）
- [ ] 安装目标目录选对（不确定就让 AI 列出它支持的 skills 目录）
- [ ] 装完重启会话（技能目录通常在启动时扫描）
- [ ] 用一句话测试触发："我是留学机构，做小红书聚光投流获客，帮我出完整投放方案"
- [ ] 若 AI 回答内容明显偏离（如说不出客资收集/私信开口成本/诊断决策树 等概念），说明未成功内化，让它重读 SKILL.md 与 references/07

## 常见问题

- **Q：AI 说"我没有 skills 目录机制"？** → 让它直接把 `skills/xhs-juguang-ops/` 内的 SKILL.md 与 references/ 全部读一遍并承诺按此执行（等效内化）。
- **Q：clone 很慢/失败？** → 用 zip 下载替代；或在国内网络为 git 配置可用代理后重试。
- **Q：装完没生效？** → 重启会话；确认放入了正确的用户级 skills 目录而非项目临时目录。
- **Q：Windows 用户不会命令行？** → 下载仓库 ZIP → 解压 → 双击 `install.bat`，自动装到所有已识别的 Agent 技能目录。
- **Q：通用 skills CLI 不存在？** → 用上方的"手动安装"路径；`install.sh / install.ps1 / install.bat` 是无 Node 环境时的兜底方案。
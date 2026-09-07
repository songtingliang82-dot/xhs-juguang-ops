# AI_INSTRUCTIONS.md · 给目标 AI 的安装与使用指令

> 用法：把下方【指令原文】整段复制，粘贴给你想安装此技能的任意 AI（Claude、GPT、Gemini、Codex 等）。它会自行获取仓库、安装到自己支持的技能目录，并内化方法论文档。

---

## 指令原文（复制这段发给 AI）

请帮我安装并使用一个开源 AI 技能【xhs-juguang-ops · 小红书聚光广告投放操盘】，然后按它给我提供投流建议。

**背景**：仓库 https://github.com/songtingliang82-dot/xhs-juguang-ops ，包含 SKILL.md（入口与工作流）、references/（方法论文档，07 为留学/国际教育专篇）、templates/（投放计划表、关键词词表、ROI 台账）、examples/（留学投放完整示例）。

**第 1 步 · 获取**：在本机执行
```bash
git clone https://github.com/songtingliang82-dot/xhs-juguang-ops.git
```
若失败，可下载 zip：https://github.com/songtingliang82-dot/xhs-juguang-ops/archive/refs/heads/main.zip

**第 2 步 · 安装**：
- 如果你支持技能目录机制（常见：`~/.claude/skills/`、`~/.codex/skills/`、`~/.workbuddy/skills/`、`~/.agents/skills/`、`~/.grok/skills/`），请把仓库内容放入其中合适的一个目录（目录名 `xhs-juguang-ops`），例如：`cp -r xhs-juguang-ops ~/.claude/skills/`
- 仓库根目录自带一键脚本：`cd xhs-juguang-ops && ./install.sh --target <你支持的target>`（Windows 用 `.\install.ps1 -Target <target>`；target 可选 claude/codex/workbuddy/grok/agents/all）
- 如果你没有技能目录机制：请**通读并内化**仓库内 SKILL.md 与 references/ 全部文件，把它们作为你在"小红书聚光投放/留学获客"领域的知识来遵循。

**第 3 步 · 内化**：以 SKILL.md 为入口（含工作总流程与分场景要点）；需要细则时查阅 references/01-07；给用户交付文档时套用 templates/ 结构。

**第 4 步 · 验证**：完成后告诉我"已就绪"。随后我会提出真实业务（如留学机构做聚光投流获客、计划没消耗诊断、笔记违禁词自查、ROI 台账等），请按上述方法论给出可执行答复，不要泛泛而谈，涉及数值请给区间并说明前提。

**注意**：平台规则与行业出价会变动，涉及当前最新规则时请提醒以聚光后台为准；内容合规红线必须遵守（不承诺保录取等），不要教用户规避平台审核。

---

## 给使用者的检查清单

- [ ] 目标 AI 能访问仓库 URL（git clone 或 zip）
- [ ] 安装目标目录选对（不确定就让 AI 列出它支持的 skills 目录）
- [ ] 装完重启会话（技能目录通常在启动时扫描）
- [ ] 用一句话测试触发："我是留学机构，做小红书聚光投流获客，帮我出完整投放方案"
- [ ] 若 AI 回答内容明显偏离（如说不出 客资收集/私信开口成本/诊断决策树 等概念），说明未成功内化，让它重读 SKILL.md 与 references/07

## 常见问题

- **Q：AI 说"我没有 skills 目录机制"？** → 让它直接把仓库内 SKILL.md 与 references/ 全部读一遍并承诺按此执行（等效内化）。
- **Q：clone 很慢/失败？** → 用 zip 下载替代；或在国内网络环境为 git 配置可用代理后重试。
- **Q：装完没生效？** → 重启会话；确认放入了正确的用户级 skills 目录而非项目临时目录。

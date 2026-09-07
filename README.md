# xhs-juguang-ops · 小红书聚光广告投放操盘技能

> 小红书聚光（效果广告）投放的 AI 操盘助手 —— 一个可直接安装到 AI 助手（Agent）的 Skill。
> 深度覆盖 **留学 / 国际教育获客**，同时沉淀本地服务、教培等行业的通用投放方法论。

把"小红书付费投流"做成可复用的决策框架：**先算账、再投放；先测试、再放量；以数据决策，不靠感觉。**

## ✨ 一行安装（推荐 · 通用 skills CLI）

仓库已按标准 `skills/<name>/` 目录组织，可直接通过 [`skills`](https://www.npmjs.com/package/skills) CLI 安装到 Claude Code / Codex / Cursor / WorkBuddy / OpenCode 等 70+ Agent：

```bash
# 装到某个 Agent（以 Claude Code 为例）
npx -y skills add songtingliang82-dot/xhs-juguang-ops -g -a claude-code -y

# 或一次性装到全部 Agent
npx -y skills add songtingliang82-dot/xhs-juguang-ops -g --all -y
```

## ✨ 能力清单

| 环节 | 你能得到 |
|---|---|
| 合规体检 | 行业准入判断逻辑（医疗/教育/本地/金融…）、开户资质与流程、禁投红线 |
| 计划搭建 | 营销诉求×成交路径映射、搜索/信息流/人群包组合、建计划操作顺序、定向经验 |
| 出价预算 | 倒推定价法、系统建议对照、调价纪律（日≤2次/间隔≥1h）、预算公式 |
| 投放诊断 | 完整决策树：新/老计划 × 跑量少/成本高 四象限动作表；空耗 vs 假耗区分 |
| 素材内容 | 留资笔记四段公式、标题公式、关键词埋词、素材赛马与复制框架 |
| 私信承接 | 私信通配置、欢迎语三段式、30 秒回复率基准、加微合规动作 |
| 数据复盘 | 指标口径（开口/留资/签约成本、回本率）、ROI 台账模板 |
| **留学专篇** | 留学类目合规（保录取红线）、人群细分、关键词体系、计划结构、家长/学生向素材、签约漏斗算账 |

## 📦 目录结构

```
xhs-juguang-ops/
├── skills/xhs-juguang-ops/             # 标准 skills 目录（npx CLI 自动识别）
│   ├── SKILL.md                        # 技能入口（触发词+工作流）
│   ├── references/                     # 方法论文档（按需加载）
│   │   ├── 01-开户资质与行业准入.md
│   │   ├── 02-计划搭建与出价预算.md
│   │   ├── 03-投放诊断决策树.md
│   │   ├── 04-素材与笔记内容方法.md
│   │   ├── 05-私信承接与数据口径.md
│   │   ├── 06-合规红线清单.md
│   │   └── 07-留学国际教育投放专篇.md
│   ├── templates/                      # 可直接使用的表格模板
│   │   ├── 投放计划表.md
│   │   ├── 关键词词表.md
│   │   └── 投放台账ROI.md
│   └── examples/
│       └── 示例-留学国际教育投放方案.md
├── README.md                           # 你正在读的
├── LICENSE                             # MIT
├── AI_INSTRUCTIONS.md                  # 给目标 AI 的一段话指令
├── install.sh / install.ps1            # 不依赖 Node 时的兜底安装脚本
└── .gitattributes
```
│   ├── 05-私信承接与数据口径.md
│   ├── 06-合规红线清单.md
│   └── 07-留学国际教育投放专篇.md
├── README.md                           # 你正在读的
├── LICENSE                             # MIT
├── AI_INSTRUCTIONS.md                  # 给目标 AI 的一段话指令
├── install.sh / install.ps1            # 不依赖 Node 时的兜底安装脚本
└── .gitattributes
```

## 🚀 安装

### 🐣 新手三步（Windows · 最简单，不用任何命令）

1. **下载**：点本仓库绿色 **Code** → **Download ZIP**（或直接打开 `https://github.com/songtingliang82-dot/xhs-juguang-ops/archive/refs/heads/main.zip`）
2. **解压**：右键 zip → 全部解压（得到文件夹 `xhs-juguang-ops-main`）
3. **双击**：进入该文件夹，双击 **`install.bat`** → 看到"已自动安装到 N 个 AI"即完成

> 安装器会自动识别电脑上已有的 WorkBuddy / Claude Code / Codex / Cursor / Grok 等技能目录并装进去。装完**重启对应 AI**，对它说「我要做小红书留学获客投放，帮我出一份完整方案」即可生效。

### ⚡ 一行安装（技术用户 · 通用 skills CLI）

仓库已按标准 `skills/<name>/` 目录组织，可通过 [`skills`](https://www.npmjs.com/package/skills) CLI 一键装到 Claude Code / Codex / Cursor / WorkBuddy / OpenCode 等 70+ Agent：

```bash
# 装到某个 Agent（以 Claude Code 为例）
npx -y skills add songtingliang82-dot/xhs-juguang-ops -g -a claude-code -y

# 或一次性装到全部 Agent
npx -y skills add songtingliang82-dot/xhs-juguang-ops -g --all -y
```

### 🤖 给任意 AI 的一句话指令（让 AI 自己装）

把 [AI_INSTRUCTIONS.md](./AI_INSTRUCTIONS.md) 里的「指令原文」整段复制发给你的 AI（Claude / GPT / Codex…），它会**自己 clone 仓库并安装/内化**，然后直接按技能给你投流建议。

### 兜底：手动 / 脚本安装（不依赖 Node）

```bash
# 1. 获取仓库
git clone https://github.com/songtingliang82-dot/xhs-juguang-ops.git
cd xhs-juguang-ops

# 2. macOS / Linux
./install.sh                       # 装到所有已支持 Agent
./install.sh --target claude,codex # 或指定(逗号分隔): claude codex workbuddy grok agents
```

```powershell
# Windows PowerShell
cd xhs-juguang-ops
.\install.ps1                       # 装到所有已支持 Agent
.\install.ps1 -Target claude,codex  # 或指定
```

| Agent | Skills 目录（放入 xhs-juguang-ops 文件夹） |
|---|---|
| **WorkBuddy** | Windows: `%USERPROFILE%\.workbuddy\skills\` ／ macOS: `~/.workbuddy/skills/` |
| **Claude Code** | `~/.claude/skills/`（项目级 `.claude/skills/`） |
| **OpenAI Codex** | `~/.codex/skills/`（项目级 `.codex/skills/`） |
| **Grok CLI** | `~/.grok/skills/` |
| **通用 Agents** | `~/.agents/skills/` |

## ⚠️ 使用须知

- **数值仅供参考**：行业出价、大盘成本随平台波动，执行时以聚光后台「系统建议出价 / 大盘参考」为准。
- **平台规则会迭代**：产品界面（如聚光创编 2.0）与准入规则动态更新，涉及具体类目以官方后台为准。
- **合规底线**：内容创作遵循广告法与平台规范（本技能内置违规词自查清单），不教规避。
- 本技能为**通用方法论整理**，不包含任何第三方课程、机构内部资料或受版权保护的内容。

## 📄 License

[MIT](./LICENSE)

---

*Made with the workflow: 学习 → 提炼 → 产品化。如果对你有帮助，欢迎 ⭐ Star。*

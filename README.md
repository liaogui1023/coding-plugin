# coding-plugin

一个 Claude Code 插件市场，按开发角色划分插件，解决团队成员工具配置零散、复用成本高的问题。

## 插件列表

本市场包含 4 个插件，覆盖软件开发的完整流程：

### 1. product-plugin（产品需求）

面向产品和需求角色，提供 PRD 文档编写工具。

| 能力类型 | 名称 | 说明 |
|---------|------|------|
| Skill | `prd-writer-skill` | PRD 文档编写，含模板、质量检查清单、原型指南 |

### 2. ui-plugin（UI 设计）

面向 UI/UX 设计师和前端开发者，提供设计方案生成和设计系统智能辅助。

| 能力类型 | 名称 | 说明 |
|---------|------|------|
| Skill | `frontend-design` | 前端设计生成 |
| Skill | `ui-ux-pro-max` | UI/UX 设计智能助手，67 种风格、96 套调色板、57 种字体搭配、13 种技术栈 |
| Command | `pr` | PR 创建与管理 |

### 3. dev-plugin（开发）

面向开发工程师，提供编码辅助、项目文档、技能管理和 PR 管理工具。

| 能力类型 | 名称 | 说明 |
|---------|------|------|
| Skill | `hello` | 示例 skill |
| Skill | `claude-md` | 生成/更新 CLAUDE.md 项目文档 |
| Skill | `find-skills` | 搜索和发现 skills |
| Skill | `skill-creator` | 创建自定义 skill |
| Skill | `superpowers` | 超级能力合集 |
| Command | `pr` | PR 创建与管理 |

### 4. test-plugin（测试）

面向测试工程师（规划中，欢迎贡献）。

| 能力类型 | 名称 | 说明 |
|---------|------|------|
| — | — | 暂无，规划中 |

## 安装

### 第一步：注册插件市场

在 Claude Code 中执行：

```
/plugin marketplace add https://github.com/liaogui1023/coding-plugin.git
```

### 第二步：安装插件

根据需要安装对应的插件：

```
/plugin install product-plugin@coding-plugin   # 产品需求
/plugin install ui-plugin@coding-plugin        # UI 设计
/plugin install dev-plugin@coding-plugin       # 开发
/plugin install test-plugin@coding-plugin      # 测试
```


## 插件市场信息

- **市场名称**: `coding-plugin`
- **所有者**: [liaogui](mailto:liaogui1023@163.com)
- **仓库**: [https://github.com/liaogui1023/coding-plugin](https://github.com/liaogui1023/coding-plugin)
- **许可证**: MIT

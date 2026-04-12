# Rime 个人配置 (personal branch)

基于 [rime-ice（雾凇拼音）](https://github.com/iDvel/rime-ice) 的个人定制配置。

## 分支说明

| 分支 | 用途 |
|------|------|
| `main` | 与上游 rime-ice 保持同步，不做个人修改 |
| `personal` | 个人定制文件，换电脑后覆盖即可恢复偏好 |

## 个人定制文件

### `rime_ice.custom.yaml` — 输入开关
- 默认英文输入模式（`ascii_mode` reset: 1）
- 默认开启 emoji
- 简体中文
- 半角标点

### `weasel.custom.yaml` — Weasel 皮肤（Windows）
- 搜狗风格配色：白底黑字，橙色高亮候选项

### `custom_phrase.txt` — 自定义词库
置顶词汇，优先级最高（权重 99），覆盖默认候选顺序：

- **虚词权重**：有/又/由（u）、一/以/已/亦（i）调整为常用顺序
- **常用词组**：有个、有一个、有没有 等固定编码
- **技术词汇**：Go、Golang、Hugo、Amazon、NASA 等英文单词，防止被拼音纠错覆盖

### `default.custom.yaml` — 方案选择
- 只启用 `rime_ice` 全拼方案

## 换电脑部署

1. 安装 [Weasel](https://github.com/rime/weasel/releases)（Windows）
2. 克隆 `main` 分支到 Rime 用户目录：
   ```bash
   git clone -b main https://github.com/jinzaizhichi/rime-ice "%APPDATA%\Rime"
   ```
3. 切换到 `personal` 分支检出个人配置文件：
   ```bash
   cd "%APPDATA%\Rime"
   git fetch origin
   git checkout origin/personal -- rime_ice.custom.yaml default.custom.yaml weasel.custom.yaml custom_phrase.txt
   ```
4. Weasel 托盘 → 重新部署

## 打字学习记录同步（userdb）

`rime_ice.userdb/` 是 LevelDB 二进制格式，不直接用 git 追踪。
导出的文本文件 `sync/.../rime_ice.userdb.txt` 已纳入版本控制。

### 日常同步（两步）

1. Weasel 托盘 → **用户资料同步**
2. 双击根目录的 `sync-userdb.bat`

### 新电脑恢复

1. 安装 [Weasel](https://github.com/rime/weasel/releases)
2. 克隆并检出个人配置（见上方「换电脑部署」）
3. 将 `sync/` 目录里的 `rime_ice.userdb.txt` 复制到新机器对应的 `sync/<新UUID>/` 目录
4. Weasel 托盘 → **用户资料同步**，Rime 自动导入学习记录

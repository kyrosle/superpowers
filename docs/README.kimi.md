# Superpowers for Kimi Code

Complete guide for using Superpowers with Kimi Code CLI.

## Quick Install

Tell Kimi Code:

```
Fetch and follow instructions from https://raw.githubusercontent.com/kyrosle/superpowers/refs/heads/main/.kimi/INSTALL.md
```

## Manual Installation

### Prerequisites

- [Kimi Code CLI](https://moonshotai.github.io/kimi-cli/) installed
- Git installed

### Installation Steps

#### 1. Clone Superpowers

```bash
mkdir -p ~/.kimi/superpowers
git clone https://github.com/kyrosle/superpowers.git ~/.kimi/superpowers
```

#### 2. Install Bootstrap

The bootstrap file is included in the repository at `.kimi/superpowers-bootstrap.md`. Kimi Code will automatically use it from the cloned location.

#### 3. Verify Installation

Tell Kimi Code:

```
Run ~/.kimi/superpowers/.kimi/superpowers-kimi find-skills to show available skills
```

You should see a list of available skills with descriptions.

## Usage

### Finding Skills

```
Run ~/.kimi/superpowers/.kimi/superpowers-kimi find-skills
```

### Loading a Skill

```
Run ~/.kimi/superpowers/.kimi/superpowers-kimi use-skill superpowers:brainstorming
```

### Bootstrap All Skills

```
Run ~/.kimi/superpowers/.kimi/superpowers-kimi bootstrap
```

This loads the complete bootstrap with all skill information.

### Personal Skills

Create your own skills in `~/.kimi/skills/`:

```bash
mkdir -p ~/.kimi/skills/my-skill
```

Create `~/.kimi/skills/my-skill/SKILL.md`:

```markdown
---
name: my-skill
description: Use when [condition] - [what it does]
---

# My Skill

[Your skill content here]
```

Personal skills override superpowers skills with the same name.

## Architecture

### Kimi Code CLI Tool

**Location:** `~/.kimi/superpowers/.kimi/superpowers-kimi`

A Node.js CLI script that provides three commands:
- `bootstrap` - Load complete bootstrap with all skills
- `use-skill <name>` - Load a specific skill
- `find-skills` - List all available skills

### Shared Core Module

**Location:** `~/.kimi/superpowers/lib/skills-core.js`

The Kimi Code implementation uses the shared `skills-core` module (ES module format) for skill discovery and parsing. This is the same module used by Codex and OpenCode plugins, ensuring consistent behavior across platforms.

### Tool Mapping

Skills written for Claude Code are adapted for Kimi Code with these mappings:

- `TodoWrite` -> Update your task list
- `Task` with subagents -> Tell user subagents aren't available, do work directly
- `Skill` tool -> `~/.kimi/superpowers/.kimi/superpowers-kimi use-skill`
- File operations -> Native Kimi Code tools

### Skill Directories

Kimi Code discovers skills through a hierarchical system:

**User-level skills** (checked in priority order):
- `~/.kimi/skills/` (personal skills take precedence)
- `~/.kimi/superpowers/skills/` (superpowers skills)

**Project-level skills**:
- `.kimi/skills/` in your project directory

## Updating

```bash
cd ~/.kimi/superpowers
git pull
```

## Troubleshooting

### Skills not found

1. Verify installation: `ls ~/.kimi/superpowers/skills`
2. Check CLI works: `~/.kimi/superpowers/.kimi/superpowers-kimi find-skills`
3. Verify skills have SKILL.md files

### CLI script not executable

```bash
chmod +x ~/.kimi/superpowers/.kimi/superpowers-kimi
```

### Node.js errors

The CLI script requires Node.js. Verify:

```bash
node --version
```

Should show v14 or higher (v18+ recommended for ES module support).

## Getting Help

- Report issues: https://github.com/kyrosle/superpowers/issues
- Main documentation: https://github.com/kyrosle/superpowers
- Kimi Code documentation: https://moonshotai.github.io/kimi-cli/

## Note

Kimi Code support is experimental and may require refinement based on user feedback. If you encounter issues, please report them on GitHub.

# Superpowers for Kimi Code

Complete guide for using Superpowers with Kimi Code CLI.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/kyrosle/superpowers/main/install-kimi.sh | bash
```

Or tell Kimi Code:

```
Fetch and run the install script from https://raw.githubusercontent.com/kyrosle/superpowers/main/install-kimi.sh
```

## Manual Installation

### Prerequisites

- [Kimi Code CLI](https://moonshotai.github.io/kimi-cli/) installed
- Git installed

### Installation Steps

1. Clone repository:
```bash
git clone --depth 1 https://github.com/kyrosle/superpowers.git /tmp/superpowers
```

2. Copy Agent configuration:
```bash
mkdir -p ~/.config/agents/superpowers
cp -r /tmp/superpowers/.kimi/agents/* ~/.config/agents/superpowers/
```

3. Copy Skills:
```bash
mkdir -p ~/.config/agents/skills
cp -r /tmp/superpowers/.kimi/skills/* ~/.config/agents/skills/
```

4. Clean up:
```bash
rm -rf /tmp/superpowers
```

## Usage

### Starting Kimi with Superpowers

```bash
kimi --agent-file ~/.config/agents/superpowers/superpowers.yaml
```

Or create an alias (add to `~/.bashrc` or `~/.zshrc`):

```bash
alias kimi-super='kimi --agent-file ~/.config/agents/superpowers/superpowers.yaml'
kimi-super
```

### Sub Agents

Superpowers provides 8 specialized sub agents that handle specific workflows:

| Sub Agent | When Used |
|-----------|-----------|
| `brainstorming` | Before creative work - new features, components, behavior changes |
| `debugging` | When encountering bugs, test failures, unexpected behavior |
| `planning` | When you have requirements/specs for multi-step tasks |
| `execution` | When you have a written plan to execute |
| `verification` | Before claiming work is complete, before commits or PRs |
| `code-review` | After completing tasks or major features |
| `tdd` | When explicitly requesting TDD or test-first development |
| `subagent-dev` | When executing plans with independent tasks in current session |

The main Agent automatically dispatches to sub agents using the `Task` tool when appropriate.

### Regular Skills

In addition to sub agents, you can use native Kimi `/skill:` commands:

```
/skill:writing-skills
/skill:receiving-code-review
/skill:dispatching-parallel-agents
```

## Updating

```bash
curl -fsSL https://raw.githubusercontent.com/kyrosle/superpowers/main/update-kimi.sh | bash
```

Or manually:

```bash
cd ~/.config/agents/superpowers
git pull
```

## Uninstalling

```bash
rm -rf ~/.config/agents/superpowers
rm -rf ~/.config/agents/skills/writing-skills
rm -rf ~/.config/agents/skills/receiving-code-review
rm -rf ~/.config/agents/skills/dispatching-parallel-agents
```

## Architecture

### Main Agent

**Location:** `~/.config/agents/superpowers/superpowers.yaml`

- Extends `superpowers-base.yaml`
- Injects Superpowers discipline into system prompt
- Defines 8 sub agents with descriptions

### Base Agent

**Location:** `~/.config/agents/superpowers/superpowers-base.yaml`

- Extends Kimi CLI's `default` agent
- Provides shared system prompt + args without subagent recursion

### Sub Agents

**Location:** `~/.config/agents/superpowers/subagents/`

Each sub agent:
- Extends the main Superpowers agent
- Has specialized system prompt for its workflow
- Excludes `Task` tool to prevent nested sub agent calls

### Regular Skills

**Location:** `~/.config/agents/skills/`

Standard Kimi skills discovered automatically:
- `writing-skills/` - Create or edit skill files
- `receiving-code-review/` - Handle code review feedback
- `dispatching-parallel-agents/` - Parallel task execution

## Directory Structure

```
~/.config/agents/
├── superpowers/
│   ├── superpowers.yaml          # Main agent config
│   ├── superpowers-base.yaml     # Shared base (no subagents)
│   ├── system-prompt.md          # Main agent system prompt
│   ├── subagents/                # Sub agent configs
│   │   ├── brainstorming.yaml
│   │   ├── debugging.yaml
│   │   ├── planning.yaml
│   │   ├── verification.yaml
│   │   ├── execution.yaml
│   │   ├── code-review.yaml
│   │   ├── tdd.yaml
│   │   └── subagent-dev.yaml
│   └── prompts/                  # Sub agent prompts
│       ├── brainstorming.md
│       ├── debugging.md
│       ├── planning.md
│       ├── verification.md
│       ├── execution.md
│       ├── code-review.md
│       ├── tdd.md
│       └── subagent-dev.md
│
└── skills/                       # Regular skills
    ├── writing-skills/
    │   └── SKILL.md
    ├── receiving-code-review/
    │   └── SKILL.md
    └── dispatching-parallel-agents/
        └── SKILL.md
```

## Troubleshooting

### Agent not found

1. Verify installation: `ls ~/.config/agents/superpowers/superpowers.yaml`
2. Check path in launch command matches actual location
3. Try absolute path: `kimi --agent-file $HOME/.config/agents/superpowers/superpowers.yaml`

### Skills not found

1. Verify skills directory: `ls ~/.config/agents/skills/`
2. Check skills have SKILL.md files
3. Skills are loaded automatically by Kimi CLI

### YAML syntax errors

Validate agent configuration:
```bash
python3 -c "import yaml; yaml.safe_load(open('~/.config/agents/superpowers/superpowers.yaml'))"
```

## Getting Help

- Report issues: https://github.com/kyrosle/superpowers/issues
- Main documentation: https://github.com/kyrosle/superpowers
- Kimi Code documentation: https://moonshotai.github.io/kimi-cli/

## Note

Kimi Code support follows Kimi CLI's native Agent architecture. The implementation uses Kimi's standard `--agent-file` parameter and skill discovery mechanisms.

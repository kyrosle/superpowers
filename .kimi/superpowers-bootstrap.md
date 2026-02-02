# Superpowers Bootstrap for Kimi Code

Welcome to Superpowers! This system provides intelligent, composable skills that enhance your development workflow.

## How Superpowers Work

Superpowers skills are triggered automatically based on context. When you start a task, the system checks if any skills apply and activates them.

## Key Skills

- **brainstorming** - Interactive design refinement before coding
- **writing-plans** - Create detailed implementation plans
- **subagent-driven-development** - Execute tasks with fresh context per step
- **test-driven-development** - RED-GREEN-REFACTOR cycle (when requested)
- **systematic-debugging** - 4-phase root cause analysis
- **verification-before-completion** - Ensure work is actually complete

## Tool Mappings for Kimi Code

When skills reference Claude Code tools, use these equivalents:

| Claude Code Tool | Kimi Code Equivalent |
|------------------|---------------------|
| `TodoWrite` | Update your task list |
| `Task` with subagents | Work directly (subagents not available) |
| `Skill` tool | `~/.kimi/superpowers/.kimi/superpowers-kimi use-skill` |
| File operations | Native Kimi Code tools |

## Commands

```bash
# List all available skills
~/.kimi/superpowers/.kimi/superpowers-kimi find-skills

# Load a specific skill
~/.kimi/superpowers/.kimi/superpowers-kimi use-skill superpowers:brainstorming

# Run full bootstrap
~/.kimi/superpowers/.kimi/superpowers-kimi bootstrap
```

## Remember

**If a skill applies to your task, you MUST use it!** This is not optional.

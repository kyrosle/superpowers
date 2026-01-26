---
name: writing-plans
description: Use when you have a spec or requirements for a multi-step task, before touching code
---

# Writing Plans

## Overview

Write comprehensive implementation plans assuming the engineer has zero context for our codebase and questionable taste. Document everything they need to know: which files to touch for each task, code, docs they might need to check, how to verify it works. Give them the whole plan as bite-sized tasks. DRY. YAGNI.

Assume they are a skilled developer, but know almost nothing about our toolset or problem domain.

**Announce at start:** "I'm using the writing-plans skill to create the implementation plan."

**Save plans to:** `docs/plans/YYYY-MM-DD-<feature-name>.md`

## Bite-Sized Task Granularity

**Each step is one action (2-5 minutes):**
- "Implement the function/component" - step
- "Verify it works as expected" - step
- "Handle edge cases" - step

**If tests are requested, add:**
- "Write the test" - step
- "Run test to verify it passes" - step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Feature Name] Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

## Task Structure

```markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`

**Step 1: Implement the component**

```python
def function(input):
    return expected
```

**Step 2: Verify it works**

Run: `python -c "from module import function; print(function(input))"`
Expected: correct output
```

### Task Structure (with tests, if requested)

```markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Test: `tests/exact/path/to/test.py`

**Step 1: Implement the component**

```python
def function(input):
    return expected
```

**Step 2: Write test**

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

**Step 3: Run test to verify it passes**

Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS
```

## Remember
- Exact file paths always
- Complete code in plan (not "add validation")
- Exact commands with expected output
- Reference relevant skills with @ syntax
- DRY, YAGNI
- Only include tests if user requests them

## Execution

After saving the plan, proceed directly with implementation:

**"Plan complete and saved to `docs/plans/<filename>.md`. Starting implementation..."**

- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

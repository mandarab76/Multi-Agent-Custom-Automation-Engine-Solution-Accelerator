```markdown
# Multi-Agent-Custom-Automation-Engine-Solution-Accelerator Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches you the development patterns and conventions used in the Multi-Agent-Custom-Automation-Engine-Solution-Accelerator repository. You'll learn how to structure Python code, follow naming conventions, manage imports and exports, and write tests in alignment with the project's standards. This guide also outlines common workflows and provides command suggestions for streamlined development.

## Coding Conventions

### File Naming
- Use **snake_case** for all file names.
  - Example: `agent_manager.py`, `task_scheduler.py`

### Import Style
- Use **relative imports** within the package.
  - Example:
    ```python
    from .utils import get_agent_config
    from .core.engine import Engine
    ```

### Export Style
- Use **named exports** (explicitly define what is exported).
  - Example:
    ```python
    __all__ = ['AgentManager', 'TaskScheduler']
    ```

### Commit Messages
- Freeform style, typically concise (average 42 characters).
  - Example: `add agent orchestration logic`

## Workflows

### Add a New Agent Module
**Trigger:** When you need to introduce a new agent type to the automation engine.
**Command:** `/add-agent-module`

1. Create a new Python file in snake_case (e.g., `custom_agent.py`).
2. Implement the agent class and required methods.
3. Use relative imports to access shared utilities or base classes.
4. Add the new agent to the engine's registry or configuration.
5. Update `__all__` in the module for named exports.

#### Example
```python
# custom_agent.py
from .base_agent import BaseAgent

class CustomAgent(BaseAgent):
    def run(self):
        # Custom logic here
        pass

__all__ = ['CustomAgent']
```

### Update an Existing Workflow
**Trigger:** When modifying the logic or steps of an automation workflow.
**Command:** `/update-workflow`

1. Locate the relevant workflow file (e.g., `workflow_manager.py`).
2. Edit the workflow logic as needed.
3. Use relative imports for any new dependencies.
4. Ensure all changes are reflected in named exports.
5. Update or add corresponding test files.

### Add or Update a Test
**Trigger:** When adding new features or fixing bugs.
**Command:** `/add-test`

1. Create or update a test file following the `*.test.*` pattern (e.g., `agent_manager.test.py`).
2. Write test cases for the relevant modules or functions.
3. Use the project's preferred testing framework (unknown; check existing tests for patterns).
4. Run tests to verify correctness.

## Testing Patterns

- Test files follow the `*.test.*` naming convention.
  - Example: `engine.test.py`, `scheduler.test.py`
- The specific testing framework is not detected; review existing test files for framework usage.
- Place test files alongside or within a dedicated test directory as per project structure.

#### Example Test File
```python
# agent_manager.test.py
def test_agent_initialization():
    agent = AgentManager()
    assert agent is not None
```

## Commands
| Command            | Purpose                                      |
|--------------------|----------------------------------------------|
| /add-agent-module  | Scaffold and register a new agent module     |
| /update-workflow   | Modify an existing automation workflow       |
| /add-test          | Add or update a test for a module or feature |
```

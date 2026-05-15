# VS Code / Visual Studio Task Runner Setup

This configuration enables you to run flight tracker tools directly from your IDE.

## Quick Start

### VS Code
1. Open Command Palette: `Ctrl+Shift+P`
2. Type: "Tasks: Run Task"
3. Select from available tasks

**Default build task** (runs with `Ctrl+Shift+B`):
- **Flight Tracker (PowerShell)** - Shows complete tracker with all features

### Visual Studio 2026
1. View → Task List
2. Right-click task → Run
3. Or bind to keyboard shortcuts in Tools → Options → Keyboard

## Available Tasks

### Main Trackers
- **Flight Tracker (PowerShell)** ⭐ DEFAULT - Complete tracker with -ShowAll
- **Flight Tracker (Python)** - Python version with .venv

### Feature-Specific
- **Flight Map** - ASCII route visualization
- **Flight Delays** - Delay tracking table
- **Flight UTC** - UTC time conversions

### Development
- **Run All Tests** - Execute test-all.ps1 suite
- **Install Python Dependencies** - pip install in .venv
- **Build Python Package** - Create distribution with python -m build

## Keyboard Shortcuts

### VS Code Default Bindings
- `Ctrl+Shift+B` - Run default build task (PowerShell tracker)
- `Ctrl+Shift+P` → "Tasks: Run Task" - Show all tasks
- `Ctrl+Shift+P` → "Tasks: Run Build Task" - Run build task

### Custom Keybindings (Optional)

Add to your `keybindings.json` (File → Preferences → Keyboard Shortcuts → Open JSON):

```json
[
  {
	"key": "ctrl+shift+r",
	"command": "workbench.action.tasks.runTask",
	"args": "Flight Tracker (PowerShell)"
  },
  {
	"key": "ctrl+shift+m",
	"command": "workbench.action.tasks.runTask",
	"args": "Flight Map"
  },
  {
	"key": "ctrl+shift+t",
	"command": "workbench.action.tasks.runTask",
	"args": "Run All Tests"
  }
]
```

Now you can use:
- **`Ctrl+Shift+R`** - Run flight tracker
- **`Ctrl+Shift+M`** - Show flight map
- **`Ctrl+Shift+T`** - Run all tests

## Task Configuration

All tasks are defined in `.vscode/tasks.json`:

```json
{
  "version": "0.2.0",
  "tasks": [...]
}
```

### Task Properties
- **label**: Display name in task list
- **type**: "shell" for command-line execution
- **command**: Executable (powershell.exe or python.exe)
- **args**: Command-line arguments
- **group**: "build" or "test" classification
- **presentation**: Output panel behavior
- **problemMatcher**: Error pattern matching (empty for these tasks)

## Customization

### Change Default Task
Edit `.vscode/tasks.json` and modify the `isDefault` property:

```json
{
  "group": {
	"kind": "build",
	"isDefault": true  // Set this for your preferred default
  }
}
```

### Add New Task
Copy an existing task block and modify:

```json
{
  "label": "My Custom Task",
  "type": "shell",
  "command": "powershell.exe",
  "args": ["-File", "${workspaceFolder}\\my-script.ps1"],
  "group": "build"
}
```

### Environment Variables
Add to task definition:

```json
{
  "options": {
	"env": {
	  "FLIGHT_MODE": "debug",
	  "TZ": "UTC"
	}
  }
}
```

## Terminal Integration

Tasks run in the integrated terminal, which means:
- ✅ Color output preserved
- ✅ Interactive prompts work
- ✅ Multiple tasks can run simultaneously
- ✅ Output persists after completion

## Troubleshooting

### PowerShell Execution Policy
If scripts don't run, the task includes `-ExecutionPolicy Bypass`.

### Virtual Environment
Python tasks use `.venv\Scripts\python.exe` explicitly.
Run "Install Python Dependencies" task if modules are missing.

### Path Issues
Tasks use `${workspaceFolder}` variable for cross-machine compatibility.

### Task Not Found
1. Ensure `.vscode/tasks.json` exists
2. Reload VS Code window: `Ctrl+Shift+P` → "Developer: Reload Window"

## Visual Studio Integration

For Visual Studio 2026, the tasks.json format is compatible with VS Code.
You can also use Task Runner Explorer:

1. View → Other Windows → Task Runner Explorer
2. tasks.json tasks appear automatically
3. Double-click to run
4. Right-click → Bind to Build/Rebuild/Clean

## CI/CD Integration

These tasks mirror the GitHub Actions workflow in `.github/workflows/test.yml`.
Running "Run All Tests" locally ensures your code passes CI before pushing.

## Links

- [VS Code Tasks Documentation](https://code.visualstudio.com/docs/editor/tasks)
- [Task Variables Reference](https://code.visualstudio.com/docs/editor/variables-reference)
- [Custom Keybindings Guide](https://code.visualstudio.com/docs/getstarted/keybindings)

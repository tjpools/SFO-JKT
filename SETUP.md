# Setup Guide

Complete setup instructions for the SFO-JKT Flight Tracker.

## Prerequisites

### For Python Version
- Python 3.7 or higher
- pip (Python package manager)

### For PowerShell Version
- PowerShell 5.1 or higher (comes with Windows)
- Windows Terminal (recommended for best visuals)

### Optional
- Git (for cloning the repository)
- GitHub account (for contributing)

---

## Installation

### Option 1: Clone from GitHub
```bash
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT
```

### Option 2: Download ZIP
1. Go to https://github.com/tjpools/SFO-JKT
2. Click "Code" → "Download ZIP"
3. Extract to your desired location
4. Open terminal in that folder

---

## Python Setup

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

This installs:
- `pytz` - Timezone support
- `python-dateutil` - Date utilities
- `tabulate` - Pretty table formatting

### 2. Run the Tracker
```bash
python flight_tracker.py
```

### 3. (Optional) Create Virtual Environment
```bash
# Create venv
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Mac/Linux)
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

---

## PowerShell Setup

### 1. No Installation Needed!
PowerShell scripts have zero external dependencies.

### 2. Allow Script Execution (First Time Only)
Open PowerShell as Administrator:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 3. Run Any Script
```powershell
# Basic tracker
.\flight-tracker.ps1

# All-in-one (recommended)
.\flight-tracker-all.ps1 -ShowAll

# Other variations
.\flight-map.ps1
.\flight-tracker-with-delays.ps1
.\flight-tracker-utc.ps1
```

---

## Windows Terminal Theme Setup

### 1. Install Windows Terminal
Download from Microsoft Store (free) or:
```powershell
winget install Microsoft.WindowsTerminal
```

### 2. Apply the Theme
1. Open Windows Terminal
2. Press `Ctrl + ,` (opens Settings)
3. Click **"Open JSON file"** (bottom-left corner)
4. Find the `"schemes"` array
5. Add the contents of `windows-terminal-theme.json`:

```json
{
  "schemes": [
	{
	  "name": "GreenYellowFlight",
	  "background": "#001010",
	  "foreground": "#E5F7C0",
	  ...
	}
  ],
  "profiles": {
	"defaults": {},
	"list": [
	  {
		"guid": "{your-powershell-guid}",
		"name": "PowerShell",
		"colorScheme": "GreenYellowFlight"  // Add this line
	  }
	]
  }
}
```

6. Save and restart Windows Terminal

### 3. Verify Theme
The terminal should now have a dark green background with bright green/yellow text.

---

## Customization

### Change Flight Data

#### Python
Edit `flight_tracker.py`, find the `create_itinerary()` function:
```python
flight1 = Flight(
	flight_number="YOUR FLIGHT",
	origin="ABC",
	destination="XYZ",
	departure_time=datetime(2026, 7, 2, 8, 40, tzinfo=pytz.UTC),
	arrival_time=datetime(2026, 7, 2, 19, 25, tzinfo=pytz.UTC),
	origin_tz="America/Los_Angeles",
	destination_tz="Asia/Tokyo",
	seats="12A, 12B",
	duration="10h 45m"
)
```

#### PowerShell
Edit any `.ps1` file, find the `$flights` array:
```powershell
[Flight]::new("YOUR FLIGHT","ABC → XYZ",
	(DT 2026 7 2 1 40),"PDT",-7,
	(DT 2026 7 3 4 25),"JST",9,
	([timespan]::FromMinutes(10*60+45)),
	"12A, 12B",
	(DT 2026 7 3 4 35),"✓ Arrived")
```

### Change Dates
Use the `DT` helper function:
```powershell
(DT year month day hour minute)
(DT 2026 7 2 1 40)  # July 2, 2026, 01:40
```

---

## Troubleshooting

### Python: "Module not found"
```bash
pip install -r requirements.txt
```

### PowerShell: "Script cannot be loaded"
Run as Administrator:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Colors not showing
- Install Windows Terminal
- Apply the theme from `windows-terminal-theme.json`
- Restart terminal

### Wrong timezone
- Python: Uses `pytz` timezone names (e.g., "America/Los_Angeles")
- PowerShell: Manually set UTC offset (e.g., -7 for PDT, +9 for JST)

---

## Creating Aliases

### PowerShell Profile
Edit your profile:
```powershell
notepad $PROFILE
```

Add these lines:
```powershell
function flights { & "C:\path\to\SFO-JKT\flight-tracker-all.ps1" -ShowAll }
function flights-map { & "C:\path\to\SFO-JKT\flight-map.ps1" }
```

Save, then:
```powershell
. $PROFILE  # Reload profile
flights      # Now you can use this!
```

### Bash/Zsh (Mac/Linux)
Edit `~/.bashrc` or `~/.zshrc`:
```bash
alias flights='python ~/path/to/SFO-JKT/flight_tracker.py'
```

Reload:
```bash
source ~/.bashrc  # or ~/.zshrc
```

---

## Next Steps

1. ✅ Install dependencies (if using Python)
2. ✅ Run your first flight tracker
3. ✅ Apply Windows Terminal theme (optional)
4. ✅ Customize with your own flights
5. ✅ Create aliases for quick access
6. ✅ Star the repo on GitHub! ⭐

---

**Need help? Open an issue on GitHub!**

https://github.com/tjpools/SFO-JKT/issues

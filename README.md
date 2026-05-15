<div align="center">

# ✈️ SFO-JKT Flight Tracker

**A Personal Flight Tracking Toolchain**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![PowerShell 5.1+](https://img.shields.io/badge/powershell-5.1+-blue.svg)](https://github.com/PowerShell/PowerShell)
[![CI Status](https://img.shields.io/badge/CI-GitHub_Actions-brightgreen.svg)](.github/workflows/test.yml)
[![pip install](https://img.shields.io/badge/pip-installable-blue.svg)](#-installation)

*A complete flight tracking system for the **San Francisco ✈️ Jakarta** route via Tokyo*

**Built with Python & PowerShell • Zero-config • Terminal-first • Timezone-aware**

</div>

---

<div align="center">

**Route**: SFO → HND → CGK → HND → SFO  
**Dates**: July 2-3, 2026 (Outbound) | July 19-20, 2026 (Return)  
**Airline**: All Nippon Airways (ANA)  
**Mission**: Track, visualize, and analyze your itinerary from the command line

[Quick Start](#-quick-start) • [Installation](#-installation) • [Features](#-features) • [Documentation](#-documentation)

</div>

---

## 📸 Output Preview

<details>
<summary><b>🐍 Python Tracker</b> (click to expand)</summary>

```
🛫🛫🛫🛫🛫🛫 FLIGHT TRACKER APPLICATION 🛬🛬🛬🛬🛬🛬

══════════════════════════════════════════════════════════════════════

OUTBOUND FLIGHTS:

FLIGHT ANA 107 — SFO → HND
Departure : Jul 02, 01:40 AM PDT → Arrival : Jul 03, 04:25 AM JST
Duration  : 10h 45m | Seats : 34A, 34C | Status : ✅ Arrived

LAYOVER: 5h 50m in Tokyo (HND)

FLIGHT ANA 855 — HND → CGK
Departure : Jul 03, 10:15 AM JST → Arrival : Jul 03, 04:00 PM WIB
Duration  : 7h 45m | Seats : 21A, 21B | Status : ✅ Arrived

══════════════════════════════════════════════════════════════════════

Summary Table:
┏━━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━┓
┃ Flight    ┃ Route       ┃ Departure           ┃ Arrival             ┃ Duration ┃ Seats  ┃
┡━━━━━━━━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━┩
│ ANA 107   │ SFO → HND   │ Jul 02, 01:40 AM    │ Jul 03, 04:25 AM    │ 10h 45m  │ 34A,   │
│           │             │ PDT                 │ JST                 │          │ 34C    │
│ ANA 855   │ HND → CGK   │ Jul 03, 10:15 AM    │ Jul 03, 04:00 PM    │ 7h 45m   │ 21A,   │
│           │             │ JST                 │ WIB                 │          │ 21B    │
└───────────┴─────────────┴─────────────────────┴─────────────────────┴──────────┴────────┘
```
</details>

<details>
<summary><b>⚡ PowerShell Tracker</b> (click to expand)</summary>

```powershell
PS> .\flight-tracker-all.ps1 -ShowAll

════════════════════════════════════════
    ✈️  FLIGHT TRACKER - SFO TO JKT  ✈️
════════════════════════════════════════

📍 OUTBOUND FLIGHTS

Flight: ANA 107 (SFO → HND)
  Depart: 2026-07-02 01:40 AM PDT
  Arrive: 2026-07-03 04:25 AM JST
  Status: ⏱️  Scheduled
  Seats : 34A, 34C

⏳ Layover: 5:50 in Tokyo (HND)

Flight: ANA 855 (HND → CGK)
  Depart: 2026-07-03 10:15 AM JST
  Arrive: 2026-07-03 04:00 PM WIB
  Status: ⏱️  Scheduled
  Seats : 21A, 21B

════════════════════════════════════════
```
</details>

<details>
<summary><b>🗺️ Route Map</b> (click to expand)</summary>

```
════════════════════════════════════════════════════════════
                   🗺️  FLIGHT ROUTE MAP  🗺️
════════════════════════════════════════════════════════════

OUTBOUND: San Francisco → Jakarta (via Tokyo)

    SFO (San Francisco)
     |
     | Flight ANA 107
     | Duration: 10:45
     |
     ↓
    HND (Tokyo Haneda)
     |
     | Layover: 5:50
     |
     | Flight ANA 855
     | Duration: 7:45
     |
     ↓
    CGK (Jakarta)

════════════════════════════════════════════════════════════
```
</details>

---

## 🚀 Installation

### Option 1: pip (Recommended)
```bash
pip install git+https://github.com/tjpools/SFO-JKT.git
flight-tracker  # Run from anywhere!
```

### Option 2: Clone & Use
```bash
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT

# Python
pip install -r requirements.txt
python flight_tracker.py

# PowerShell
.\flight-tracker-all.ps1 -ShowAll
```

### Option 3: PowerShell Module
```powershell
Import-Module .\FlightTools.psd1
Show-FlightTracker -ShowAll
```

### Option 4: VS Code Tasks
```
Ctrl+Shift+B  # Run default tracker
Ctrl+Shift+P → Tasks: Run Task  # Browse all tasks
```

See [PYTHON_PACKAGE.md](PYTHON_PACKAGE.md) and [TASK_RUNNER.md](TASK_RUNNER.md) for details.

---

## ⚡ Quick Start

### Python
```bash
python flight_tracker.py
```

### PowerShell (Basic)
```powershell
.\flight-tracker.ps1
```

### PowerShell (All Features)
```powershell
.\flight-tracker-all.ps1 -ShowAll
```

---

## 🎯 Features

<table>
<tr>
<td width="50%">

### 🐍 Python
- ✅ Timezone-aware datetime handling
- ✅ Beautiful table output (tabulate)
- ✅ Next-flight status
- ✅ Layover calculations
- ✅ UTC conversions
- ✅ pip-installable package
- ✅ Cross-platform (Win/Mac/Linux)

</td>
<td width="50%">

### ⚡ PowerShell
- ✅ Zero dependencies
- ✅ Color-coded output
- ✅ Delay tracking
- ✅ ASCII route map
- ✅ Modular FlightLeg class
- ✅ Command-line switches
- ✅ Importable module

</td>
</tr>
</table>

### 🛠️ Development Tools
- ✅ **GitHub Actions CI** - Auto-test on push
- ✅ **VS Code Tasks** - One-click execution (`Ctrl+Shift+B`)
- ✅ **PowerShell Module** - `Import-Module FlightTools`
- ✅ **Local Test Suite** - `test-all.ps1` validates everything
- ✅ **Windows Terminal Theme** - Custom green/yellow color scheme

---

## 📦 What's Inside

```
SFO-JKT/
├── 🐍 Python Implementation
│   ├── flight_tracker.py          # Main tracker app
│   ├── requirements.txt           # Dependencies
│   └── pyproject.toml             # Package config
│
├── ⚡ PowerShell Scripts
│   ├── flight-tracker.ps1         # Basic tracker
│   ├── flight-tracker-all.ps1     # All-in-one (recommended)
│   ├── flight-tracker-with-delays.ps1
│   ├── flight-tracker-utc.ps1
│   ├── flight-map.ps1             # ASCII map
│   ├── FlightLeg.ps1              # Modular class
│   └── utc-converter.ps1
│
├── 📦 PowerShell Module
│   ├── FlightTools.psd1           # Module manifest
│   └── FlightTools.psm1           # Module code
│
├── 🔧 Development Tools
│   ├── .vscode/tasks.json         # VS Code integration
│   ├── .github/workflows/test.yml # CI pipeline
│   └── test-all.ps1               # Local verification
│
├── 🎨 Extras
│   └── windows-terminal-theme.json
│
└── 📚 Documentation
	├── README.md                   # You are here
	├── QUICKSTART.md
	├── PYTHON_PACKAGE.md
	├── TASK_RUNNER.md
	├── README-PowerShell.md
	└── [and 10+ more docs]
```

---

## 🌍 Languages / Bahasa

- 🇺🇸 **English** - You are here
- 🇮🇩 **[Bahasa Indonesia](README.id.md)** - Versi Indonesia

---

## 📖 Usage Examples

### Python - Full Output
```bash
python flight_tracker.py
```
**Shows:**
- Complete itinerary with all flights
- Layover calculations
- Summary table
- Next flight countdown
- Real-time status

### PowerShell - Pick Your View

**Just the basics:**
```powershell
.\flight-tracker-all.ps1
```

**Track delays (green = early, red = late):**
```powershell
.\flight-tracker-all.ps1 -ShowDelays
```

**See UTC conversions:**
```powershell
.\flight-tracker-all.ps1 -ShowUTC
```

**Visual route map:**
```powershell
.\flight-tracker-all.ps1 -ShowMap
```

**Everything at once:**
```powershell
.\flight-tracker-all.ps1 -ShowAll
```

---

## 🔧 Customization

### Change Flight Data

#### Python (`flight_tracker.py`)
Edit the `create_itinerary()` function:
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
Edit the `$flights` array in any script:
```powershell
[Flight]::new("YOUR FLIGHT","ABC → XYZ",
	(DT 2026 7 2 1 40),"PDT",-7,
	(DT 2026 7 3 4 25),"JST",9,
	([timespan]::FromMinutes(10*60+45)),
	"12A, 12B",
	(DT 2026 7 3 4 35),"✓ Arrived")
```

### Change Colors

Edit `-ForegroundColor` parameters in PowerShell scripts:
- `Cyan` - Flight numbers and headers
- `Green` - Departures
- `Yellow` - Arrivals
- `Magenta` - Status and layovers
- `White` - General information

---

## 💡 Pro Tips

### 1. Create Aliases
Add to your PowerShell profile (`$PROFILE`):
```powershell
function flights { .\flight-tracker-all.ps1 -ShowAll }
function flights-basic { .\flight-tracker.ps1 }
function flights-map { .\flight-map.ps1 }
```

### 2. Auto-Run on Terminal Open
Add to PowerShell profile:
```powershell
& "C:\path\to\flight-tracker.ps1"
```

### 3. Export to File
```powershell
.\flight-tracker-all.ps1 -ShowAll > my-flights.txt
```

### 4. Run All Scripts
```powershell
Get-ChildItem *.ps1 | Where-Object { $_.Name -like "flight-*" } | ForEach-Object { & $_.FullName }
```

---

## 📊 Output Examples

### Basic Flight Display
```
FLIGHT ANA 107 — SFO → HND
--------------------------------------------------------------------------------
Departure : 7/2/2026 1:40:00 AM PDT
Arrival   : 7/3/2026 4:25:00 AM JST
Duration  : 10h 45m
Seats     : 34A, 34C
Status    : ✓ Arrived
```

### With UTC Conversions
```
FLIGHT ANA 107 — SFO → HND
--------------------------------------------------------------------------------
Departure : 7/2/2026 1:40:00 AM PDT
			2026-07-02 08:40 UTC
Arrival   : 7/3/2026 4:25:00 AM JST
			2026-07-02 19:25 UTC
```

### With Delay Tracking
```
FLIGHT ANA 107 — SFO → HND
--------------------------------------------------------------------------------
Arrival   : 7/3/2026 4:25:00 AM JST
Schedule Δ: -10 min  (Green = Early!)
```

### Route Map
```
		  SFO                      HND                          CGK
		  │                        │                            │
		  │  ANA 107 (10h 45m)      │  ANA 855 (7h 45m)           │
		  ├──────────────▶         ├──────────────▶             │
		  │                        │                            │
   San Francisco              Tokyo Haneda                 Jakarta
```

---

## 🛠️ Requirements

### Python
- Python 3.7+
- `pytz` - Timezone support
- `python-dateutil` - Date utilities
- `tabulate` - Pretty tables

Install with:
```bash
pip install -r requirements.txt
```

### PowerShell
- PowerShell 5.1 or later
- Windows Terminal (recommended for best colors)
- **No external dependencies!**

---

## 📝 Files Reference

| File | Purpose | Best For |
|------|---------|----------|
| `flight_tracker.py` | Python full-featured | Accurate timezone math, tables |
| `flight-tracker.ps1` | Basic PowerShell | Quick status check |
| `flight-tracker-with-delays.ps1` | Delay tracking | Monitoring early/late arrivals |
| `flight-tracker-utc.ps1` | UTC conversions | International coordination |
| `flight-map.ps1` | Route visualization | Visual overview |
| `flight-tracker-all.ps1` | **All-in-one with options** | **Most flexible, recommended!** |
| `FlightLeg.ps1` | Reusable class | Building custom scripts |

---

## 🌟 Highlights

- ✈️ **4 flights tracked** - Complete round-trip itinerary
- 🌍 **3 timezones** - PDT, JST, WIB with automatic conversions
- ⏰ **2 layovers** - 5h 50m and 16h 05m in Tokyo
- 🎨 **Full color support** - Beautiful terminal output
- 📊 **Multiple views** - Detailed, table, map, and compact formats
- 🚀 **No external dependencies** (PowerShell) or minimal deps (Python)

---

## 📚 Documentation

- **[Quick Start Guide](QUICKSTART.md)** - Get running in 60 seconds
- **[Setup Guide](SETUP.md)** - Complete installation instructions
- **[PowerShell Docs](README-PowerShell.md)** - PowerShell-specific documentation
- **[Git Commands](GIT_COMMANDS.md)** - Git workflow for this project
- **[Contributing](CONTRIBUTING.md)** - How to contribute
- **[Changelog](CHANGELOG.md)** - Version history

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Ideas for Contributions
- ✈️ Real-time flight status API integration
- 📧 Email/SMS notifications
- 🌤️ Weather at destination
- ⏱️ Airport delay information
- 🎫 Boarding pass integration
- 📅 Calendar export (ICS format)
- 🌐 Web dashboard
- 📱 Mobile app

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **All Nippon Airways (ANA)** - For the great flight service
- **pytz** - Python timezone library
- **PowerShell Community** - For inspiration and best practices
- **GitHub Community** - For supporting open source

---

## 📞 Support

- 🐛 **Found a bug?** [Open an issue](https://github.com/tjpools/SFO-JKT/issues)
- 💡 **Have a feature idea?** [Start a discussion](https://github.com/tjpools/SFO-JKT/discussions)
- ⭐ **Like this project?** Give it a star on GitHub!

---

## 🔗 Links

- **Repository**: https://github.com/tjpools/SFO-JKT
- **Issues**: https://github.com/tjpools/SFO-JKT/issues
- **Discussions**: https://github.com/tjpools/SFO-JKT/discussions

---

<div align="center">

**Happy Flying! 🛫✈️🛬**

*Built with ❤️ for travelers*

[![GitHub stars](https://img.shields.io/github/stars/tjpools/SFO-JKT?style=social)](https://github.com/tjpools/SFO-JKT/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/tjpools/SFO-JKT?style=social)](https://github.com/tjpools/SFO-JKT/network/members)

</div>


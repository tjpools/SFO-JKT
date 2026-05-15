# ✈️ SFO-JKT Flight Tracker

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![PowerShell 5.1+](https://img.shields.io/badge/powershell-5.1+-blue.svg)](https://github.com/PowerShell/PowerShell)
[![GitHub repo](https://img.shields.io/badge/GitHub-tjpools%2FSFO--JKT-green.svg)](https://github.com/tjpools/SFO-JKT)

A complete flight tracking system for the **San Francisco ✈️ Jakarta** route via Tokyo, built in **Python** and **PowerShell** with beautiful terminal output, timezone conversions, delay tracking, and route visualizations.

> **Route**: SFO → HND → CGK → HND → SFO  
> **Dates**: July 2-3, 2026 (Outbound) | July 19-20, 2026 (Return)  
> **Airline**: All Nippon Airways (ANA)

---

## 📸 Screenshots

```
🛫🛫🛫🛫🛫🛫 FLIGHT TRACKER APPLICATION 🛬🛬🛬🛬🛬🛬

FLIGHT ANA 107 — SFO → HND
Departure : Jul 02, 01:40 AM PDT → Arrival : Jul 03, 04:25 AM JST
Duration  : 10h 45m | Seats : 34A, 34C | Status : ✅ Arrived
```

## 📦 What's Included

### Python Version
- `flight_tracker.py` - Full-featured Python app with timezone support
- `requirements.txt` - Python dependencies (pytz, tabulate)

### PowerShell Scripts
- `flight-tracker.ps1` - Main tracker with colored output
- `flight-tracker-with-delays.ps1` - Delay/early arrival tracking
- `flight-tracker-utc.ps1` - UTC timezone conversions
- `flight-map.ps1` - ASCII route visualization
- `flight-tracker-all.ps1` - **All-in-one with command-line options**
- `FlightLeg.ps1` - Reusable modular class

### Extras
- `windows-terminal-theme.json` - Green-Yellow color scheme
- `README-PowerShell.md` - PowerShell-specific documentation

---

## 🚀 Quick Start

### Python Version
```bash
# Install dependencies
pip install -r requirements.txt

# Run the tracker
python flight_tracker.py
```

### PowerShell Version

#### Basic Tracker
```powershell
.\flight-tracker.ps1
```

#### With Delays
```powershell
.\flight-tracker-with-delays.ps1
```

#### With UTC Conversions
```powershell
.\flight-tracker-utc.ps1
```

#### Route Map
```powershell
.\flight-map.ps1
```

#### All-in-One (Recommended!)
```powershell
# Basic output
.\flight-tracker-all.ps1

# With delay tracking
.\flight-tracker-all.ps1 -ShowDelays

# With UTC conversions
.\flight-tracker-all.ps1 -ShowUTC

# With route map
.\flight-tracker-all.ps1 -ShowMap

# Everything!
.\flight-tracker-all.ps1 -ShowAll
```

---

## ✈️ Flight Itinerary

### Outbound (July 2-3, 2026)
1. **ANA 107**: SFO → HND (10h 45m)
   - Departure: 01:40 AM PDT | Arrival: 04:25 AM JST
   - Seats: 34A, 34C

2. **ANA 855**: HND → CGK (7h 45m)
   - Layover: 5h 50m in Tokyo
   - Departure: 10:15 AM JST | Arrival: 04:00 PM WIB
   - Seats: 21A, 21B

### Return (July 19-20, 2026)
3. **ANA 856**: CGK → HND (7h 25m)
   - Departure: 09:25 PM WIB | Arrival: 06:50 AM JST
   - Seats: 21A, 21B

4. **ANA 108**: HND → SFO (11h 00m)
   - Layover: 16h 05m in Tokyo
   - Departure: 10:55 PM JST | Arrival: 04:55 PM PDT
   - Seats: 32A, 32C

---

## 🎨 Windows Terminal Theme

To apply the beautiful **GreenYellowFlight** color scheme:

1. Open Windows Terminal
2. Press `Ctrl + ,` (Settings)
3. Click **"Open JSON file"** (bottom-left)
4. Find the `"schemes"` array
5. Copy the contents of `windows-terminal-theme.json` into the array
6. In your PowerShell profile, set:
   ```json
   {
	 "colorScheme": "GreenYellowFlight"
   }
   ```
7. Save and reload!

---

## 🎯 Features Comparison

| Feature | Python | PowerShell Basic | PowerShell All-in-One |
|---------|--------|------------------|----------------------|
| Flight Display | ✅ | ✅ | ✅ |
| Timezone Conversions | ✅ | ❌ | ✅ (with `-ShowUTC`) |
| Status Tracking | ✅ | ✅ | ✅ |
| Delay Calculations | ❌ | ❌ | ✅ (with `-ShowDelays`) |
| Route Map | ❌ | ❌ | ✅ (with `-ShowMap`) |
| Layover Info | ✅ | ❌ | ✅ |
| Table Output | ✅ | ❌ | ❌ |
| Color Output | ✅ | ✅ | ✅ |
| UTC Display | ✅ | ❌ | ✅ (with `-ShowUTC`) |

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


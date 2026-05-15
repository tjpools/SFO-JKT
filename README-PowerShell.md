# ✈️ Flight Tracker - PowerShell Edition

Complete PowerShell implementation of the flight tracking application with multiple variations.

## 📁 Files

### 1. **flight-tracker.ps1**
Basic flight tracker with colorized output.
- Displays all 4 flights with departure/arrival times
- Shows route visualization
- Status tracking

**Run it:**
```powershell
.\flight-tracker.ps1
```

### 2. **flight-tracker-timed.ps1**
Advanced version with schedule delta tracking.
- Shows scheduled vs actual arrival times
- Calculates early/late arrivals
- Color-coded delays (green = early, red = late)

**Run it:**
```powershell
.\flight-tracker-timed.ps1
```

### 3. **utc-converter.ps1**
UTC conversion utility for all flights.
- Converts local times to UTC
- Displays both local and UTC times
- Handles PDT (UTC-7), JST (UTC+9), WIB (UTC+7)

**Run it:**
```powershell
.\utc-converter.ps1
```

### 4. **FlightLeg.ps1**
Modular, reusable flight leg class.
- Compact and detailed views
- Exports to CSV
- Hashtable conversion for data processing

**Run it:**
```powershell
.\FlightLeg.ps1
```

## 🎨 Windows Terminal Color Scheme

Add this to your Windows Terminal `settings.json` under `"schemes"`:

```json
{
  "name": "GreenYellowFlight",
  "background": "#001010",
  "foreground": "#E5F7C0",
  "black":      "#000000",
  "red":        "#FF5F5F",
  "green":      "#8FD14F",
  "yellow":     "#F5E663",
  "blue":       "#4FB3FF",
  "purple":     "#C792EA",
  "cyan":       "#7FDBFF",
  "white":      "#E5F7C0",
  "brightBlack":  "#555555",
  "brightRed":    "#FF7B7B",
  "brightGreen":  "#A8E65C",
  "brightYellow": "#FFF176",
  "brightBlue":   "#64C7FF",
  "brightPurple": "#D1A9FF",
  "brightCyan":   "#9AE6FF",
  "brightWhite":  "#FFFFFF"
}
```

Then set `"colorScheme": "GreenYellowFlight"` on your PowerShell profile.

### How to Apply:

1. Open Windows Terminal
2. Press `Ctrl+,` to open settings
3. Click "Open JSON file" at bottom left
4. Add the scheme to the `"schemes"` array
5. In your profile settings, set: `"colorScheme": "GreenYellowFlight"`

## 🗺️ Route Visualization

```
OUTBOUND:
  SFO ──(ANA 107)──> HND ──(ANA 855)──> CGK
  San Francisco      Tokyo              Jakarta

RETURN:
  CGK ──(ANA 856)──> HND ──(ANA 108)──> SFO
  Jakarta            Tokyo              San Francisco
```

## 📊 Features Comparison

| Script | Colorized | UTC | Delays | CSV Export | Modular |
|--------|-----------|-----|--------|------------|---------|
| flight-tracker.ps1 | ✅ | ❌ | ❌ | ❌ | ❌ |
| flight-tracker-timed.ps1 | ✅ | ❌ | ✅ | ❌ | ❌ |
| utc-converter.ps1 | ✅ | ✅ | ❌ | ❌ | ❌ |
| FlightLeg.ps1 | ✅ | ❌ | ❌ | ✅ | ✅ |

## 🚀 Quick Start

```powershell
# Run basic tracker
.\flight-tracker.ps1

# Run with schedule tracking
.\flight-tracker-timed.ps1

# View UTC conversions
.\utc-converter.ps1

# Run modular version with CSV export
.\FlightLeg.ps1
```

## 🔧 Customization

### Change Flight Dates
Edit the `DT` function calls:
```powershell
(DT 2026 7 2 1 40)  # Year, Month, Day, Hour, Minute
```

### Add More Flights
```powershell
$newFlight = [Flight]::new("ANA 999","LAX → NRT",
    (DT 2026 8 1 10 0),"PDT",
    (DT 2026 8 2 14 30),"JST",
    ([timespan]::FromMinutes(11*60+30)),
    "15A, 15C","⏳ Scheduled")
```

### Modify Timezone Offsets
```powershell
$tzOffsets = @{
    "PDT" = -7
    "PST" = -8
    "JST" = +9
    "WIB" = +7
    "EST" = -5
}
```

## 💡 Tips

- Use `Get-Content` to read flight data from JSON files
- Pipe output to `Out-File` for logging
- Use `Start-Sleep` for dynamic refreshing displays
- Combine with Windows Task Scheduler for automated tracking

## 📝 Example Output

```
================================================================================
                           FLIGHT TRACKER APPLICATION
================================================================================

FLIGHT ANA 107 — SFO → HND
--------------------------------------------------------------------------------
Departure : 07/02/2026 01:40:00 PDT
Arrival   : 07/03/2026 04:25:00 JST
Duration  : 10h 45m
Seats     : 34A, 34C
Status    : ✓ Arrived
```

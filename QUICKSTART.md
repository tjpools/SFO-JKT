# 🚀 QUICK START GUIDE

## Run Immediately

### Python (Full Featured)
```bash
pip install -r requirements.txt
python flight_tracker.py
```

### PowerShell (Recommended - All Features)
```powershell
.\flight-tracker-all.ps1 -ShowAll
```

---

## PowerShell Command Cheat Sheet

```powershell
# Basic display
.\flight-tracker.ps1

# Show delays (green=early, red=late)
.\flight-tracker-all.ps1 -ShowDelays

# Show UTC times
.\flight-tracker-all.ps1 -ShowUTC

# Show route map
.\flight-tracker-all.ps1 -ShowMap

# Show EVERYTHING
.\flight-tracker-all.ps1 -ShowAll
```

---

## File Quick Reference

| Want to... | Use this file |
|------------|--------------|
| See all flights quickly | `flight-tracker.ps1` |
| Check for delays | `flight-tracker-with-delays.ps1` |
| Convert to UTC | `flight-tracker-utc.ps1` |
| View route map | `flight-map.ps1` |
| Everything in one | `flight-tracker-all.ps1 -ShowAll` |
| Python full features | `flight_tracker.py` |

---

## Color Scheme Setup

1. Open Windows Terminal settings (Ctrl+,)
2. Click "Open JSON file"
3. Add theme from `windows-terminal-theme.json`
4. Set `"colorScheme": "GreenYellowFlight"`
5. Restart terminal

---

## Your Itinerary at a Glance

**Outbound (July 2-3)**
- SFO → HND: ANA 107 (10h 45m) | Seats 34A, 34C
- HND → CGK: ANA 855 (7h 45m) | Seats 21A, 21B | 5h 50m layover

**Return (July 19-20)**
- CGK → HND: ANA 856 (7h 25m) | Seats 21A, 21B
- HND → SFO: ANA 108 (11h 00m) | Seats 32A, 32C | 16h 05m layover

---

**🎯 Pro Tip:** Run `.\flight-tracker-all.ps1 -ShowAll` for the best experience!

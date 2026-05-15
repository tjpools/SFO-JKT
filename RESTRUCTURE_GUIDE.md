# 🏗️ Repo Restructuring Guide

Want to turn this into a cleaner "flight-tools" repository? Here's how to restructure into a professional layout.

## 📂 Current Structure (Flat)
```
SFO-JKT/
├── flight_tracker.py
├── flight-tracker-all.ps1
├── (all other scripts and docs)
└── README.md
```

## 📂 Proposed Structure (Organized)
```
SFO-JKT/
├── src/                        # Source code
│   ├── python/
│   │   ├── flight_tracker.py
│   │   └── requirements.txt
│   └── powershell/
│       ├── flight-tracker.ps1
│       ├── flight-tracker-all.ps1
│       ├── flight-tracker-with-delays.ps1
│       ├── flight-tracker-utc.ps1
│       ├── flight-map.ps1
│       ├── FlightLeg.ps1
│       └── utc-converter.ps1
│
├── docs/                       # Documentation
│   ├── QUICKSTART.md
│   ├── SETUP.md
│   ├── GITHUB_SETUP.md
│   ├── GIT_COMMANDS.md
│   ├── PUSH_CHECKLIST.md
│   ├── README-PowerShell.md
│   └── QUICK_REFERENCE.txt
│
├── config/                     # Configuration
│   └── windows-terminal-theme.json
│
├── .github/                    # GitHub specific
│   ├── CONTRIBUTING.md
│   └── workflows/
│       └── test.yml           # (future: CI/CD)
│
├── .gitignore
├── LICENSE
├── README.md
├── CHANGELOG.md
└── START_HERE.md
```

---

## 🔄 How to Restructure

### Option 1: Automated PowerShell Script

Save this as `restructure.ps1`:

```powershell
# Create directories
New-Item -ItemType Directory -Force -Path src/python, src/powershell, docs, config, .github

# Move Python files
Move-Item flight_tracker.py src/python/
Move-Item requirements.txt src/python/

# Move PowerShell scripts
Move-Item *.ps1 src/powershell/ -Exclude restructure.ps1

# Move documentation
Move-Item QUICKSTART.md, SETUP.md, GITHUB_SETUP.md, GIT_COMMANDS.md docs/
Move-Item PUSH_CHECKLIST.md, README-PowerShell.md, QUICK_REFERENCE.txt docs/

# Move config
Move-Item windows-terminal-theme.json config/

# Move GitHub files
Move-Item CONTRIBUTING.md .github/

Write-Host "✅ Restructuring complete!" -ForegroundColor Green
Write-Host "Update your README.md to reflect new paths." -ForegroundColor Yellow
```

Run it:
```powershell
.\restructure.ps1
```

### Option 2: Manual Restructuring

```powershell
# Create directories
mkdir src\python, src\powershell, docs, config, .github

# Move files manually
# Python
move flight_tracker.py src\python\
move requirements.txt src\python\

# PowerShell
move flight-tracker*.ps1 src\powershell\
move FlightLeg.ps1 src\powershell\
move utc-converter.ps1 src\powershell\
move flight-map.ps1 src\powershell\

# Docs
move QUICKSTART.md docs\
move SETUP.md docs\
move GITHUB_SETUP.md docs\
move GIT_COMMANDS.md docs\
move PUSH_CHECKLIST.md docs\
move README-PowerShell.md docs\
move QUICK_REFERENCE.txt docs\

# Config
move windows-terminal-theme.json config\

# GitHub
move CONTRIBUTING.md .github\
```

---

## 📝 After Restructuring

### 1. Update README.md

Change installation instructions:

**Before:**
```bash
pip install -r requirements.txt
python flight_tracker.py
```

**After:**
```bash
cd src/python
pip install -r requirements.txt
python flight_tracker.py
```

### 2. Update Documentation Links

In all docs, update file paths:
- `flight_tracker.py` → `src/python/flight_tracker.py`
- `flight-tracker.ps1` → `src/powershell/flight-tracker.ps1`
- `QUICKSTART.md` → `docs/QUICKSTART.md`

### 3. Create Runner Scripts (Optional)

Create `run-python.ps1` in root:
```powershell
cd src/python
python flight_tracker.py
```

Create `run-powershell.ps1` in root:
```powershell
& .\src\powershell\flight-tracker-all.ps1 -ShowAll
```

### 4. Update Import Paths

If scripts reference each other, update paths:

**FlightLeg.ps1 usage:**
```powershell
# Before
. .\FlightLeg.ps1

# After
. .\src\powershell\FlightLeg.ps1
```

---

## 🎯 Benefits of Restructuring

✅ **Cleaner root directory** - Only essential files visible  
✅ **Logical organization** - Easy to find what you need  
✅ **Scalable** - Easy to add new features/languages  
✅ **Professional** - Industry-standard layout  
✅ **CI/CD ready** - Easy to add GitHub Actions  
✅ **Multi-language friendly** - Clear separation  

---

## 🚀 Recommended: Keep It Simple for Now

**Unless you plan to:**
- Add more programming languages
- Create a web interface
- Add extensive testing
- Build a package for distribution

**I recommend keeping the flat structure!**

It's perfectly fine for:
- Personal projects
- Small utilities
- Quick scripts
- Learning/demos

---

## 🎨 Alternative: Hybrid Approach

Keep scripts in root, but organize docs:

```
SFO-JKT/
├── flight_tracker.py           # Quick access
├── flight-tracker-all.ps1      # Quick access
├── (other main scripts)
├── docs/                       # All documentation
│   ├── QUICKSTART.md
│   ├── SETUP.md
│   └── ...
├── config/                     # Configuration
│   └── windows-terminal-theme.json
├── README.md
└── START_HERE.md
```

This keeps scripts accessible while organizing supporting files.

---

## 💡 My Recommendation

**For GitHub repo `github.com/tjpools/SFO-JKT`:**

**Keep the current flat structure!** It's perfect for this use case:
- ✅ Scripts are immediately visible
- ✅ Easy to run (`.\flight-tracker-all.ps1`)
- ✅ No path confusion
- ✅ Great for quick tools
- ✅ Visitors can see everything at a glance

**Only restructure if:**
- You add a web dashboard
- You create installable packages
- You add 10+ scripts per language
- You want to add automated testing

---

## 🔄 If You Do Restructure

### Commit Sequence
```bash
# Before restructuring
git add .
git commit -m "Pre-restructure commit - save current state"

# Do the restructure
.\restructure.ps1

# Update READMEs and paths
# (edit files)

# Commit restructure
git add .
git commit -m "Restructure: organize into src/, docs/, config/ directories"

# Push
git push
```

---

**TL;DR:** Your current flat structure is perfect. Ship it as-is! 🚀

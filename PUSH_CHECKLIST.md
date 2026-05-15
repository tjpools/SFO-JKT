# 🚀 GitHub Push Checklist

Complete this checklist before pushing to github.com/tjpools/SFO-JKT

## ✅ Pre-Push Checklist

### 1. Test Your Code
- [ ] Python version runs without errors
  ```bash
  python flight_tracker.py
  ```
- [ ] PowerShell scripts run without errors
  ```powershell
  .\flight-tracker-all.ps1 -ShowAll
  ```
- [ ] All timezone conversions are correct
- [ ] Route map displays properly

### 2. Review Documentation
- [ ] README.md is complete and accurate
- [ ] QUICKSTART.md has correct commands
- [ ] All links work (test them!)
- [ ] Screenshots/examples are up-to-date
- [ ] No sensitive information (API keys, passwords, etc.)

### 3. Check Files
- [ ] .gitignore is configured
- [ ] LICENSE file exists (MIT)
- [ ] requirements.txt is current
- [ ] All .ps1 scripts are included
- [ ] No unnecessary files (temp files, logs, etc.)

### 4. Git Configuration
- [ ] Git username configured
  ```bash
  git config --global user.name "Your Name"
  ```
- [ ] Git email configured
  ```bash
  git config --global user.email "your.email@example.com"
  ```
- [ ] Remote origin set
  ```bash
  git remote add origin https://github.com/tjpools/SFO-JKT.git
  ```

---

## 🎯 Push Commands

### First Time Push (New Repository)

```bash
# Initialize (if not done)
git init

# Add all files
git add .

# Check what will be committed
git status

# Commit
git commit -m "Initial commit - Complete flight tracker suite"

# Add remote (if not done)
git remote add origin https://github.com/tjpools/SFO-JKT.git

# Push to GitHub
git push -u origin main
```

### Repository Already Exists on GitHub

```bash
# Pull first (merge histories)
git pull origin main --allow-unrelated-histories

# If conflicts, resolve them, then:
git add .
git commit -m "Merge and add local changes"

# Push
git push origin main
```

### Standard Update (After First Push)

```bash
# Check status
git status

# Add changes
git add .

# Commit with descriptive message
git commit -m "Add delay tracking and UTC conversions"

# Push
git push
```

---

## 📋 Recommended Commit Messages

### Initial Commit
```
Initial commit - Complete flight tracker suite

- Python tracker with timezone support
- PowerShell tracker with 6 variations
- Route map visualization
- Complete documentation
- Windows Terminal theme
```

### Feature Addition
```
Add real-time flight status integration

- Connect to FlightAware API
- Display live delay information
- Update README with new feature
```

### Bug Fix
```
Fix timezone conversion for JST

- Corrected UTC offset calculation
- Updated test cases
- Verified all flight times
```

### Documentation Update
```
Update documentation and examples

- Add video tutorial link
- Fix typos in QUICKSTART.md
- Add troubleshooting section
```

---

## 🔍 Pre-Push Verification

### Check File List
```bash
git ls-files
```

**Should include:**
- ✅ All .py files
- ✅ All .ps1 files
- ✅ All .md files
- ✅ requirements.txt
- ✅ .gitignore
- ✅ LICENSE
- ✅ windows-terminal-theme.json

**Should NOT include:**
- ❌ .pyc files
- ❌ __pycache__ directories
- ❌ .vs or .vscode folders
- ❌ Personal config files
- ❌ Test output files

### Review Changes
```bash
git diff --staged
```

### Check Remote
```bash
git remote -v
```

Should show:
```
origin  https://github.com/tjpools/SFO-JKT.git (fetch)
origin  https://github.com/tjpools/SFO-JKT.git (push)
```

---

## 🎉 After Successful Push

### 1. Verify on GitHub
- [ ] Go to https://github.com/tjpools/SFO-JKT
- [ ] Check all files are present
- [ ] README displays correctly
- [ ] Badges show up (may take a moment)

### 2. Test Clone
```bash
cd /tmp
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT
python flight_tracker.py  # Test it works!
```

### 3. Configure Repository Settings
On GitHub:
- [ ] Add repository description: "Flight tracker for SFO-JKT route via Tokyo"
- [ ] Add topics: `flight-tracker`, `python`, `powershell`, `timezone`, `travel`
- [ ] Enable Issues
- [ ] Enable Discussions (optional)
- [ ] Add website link (if you have one)

### 4. Create First Release (Optional)
- [ ] Go to "Releases" → "Create a new release"
- [ ] Tag: `v1.0.0`
- [ ] Title: "v1.0.0 - Initial Release"
- [ ] Description: Copy from CHANGELOG.md
- [ ] Publish release

### 5. Share Your Project
- [ ] Tweet about it 🐦
- [ ] Share on LinkedIn 💼
- [ ] Post in relevant communities 👥
- [ ] Add to your portfolio 📂

---

## 🆘 Troubleshooting

### "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/tjpools/SFO-JKT.git
```

### "failed to push some refs"
```bash
git pull origin main --rebase
# Resolve conflicts if any
git push origin main
```

### "Permission denied"
Check your GitHub authentication:
```bash
# Use HTTPS with personal access token, or
# Set up SSH keys (recommended)
ssh -T git@github.com
```

### Large files warning
If files are too large:
1. Add to .gitignore
2. Remove from staging:
   ```bash
   git rm --cached large-file.bin
   ```
3. Commit and push

---

## 📝 Final Notes

- **Commit often** - Small, focused commits are better
- **Write clear messages** - Future you will thank you
- **Test before pushing** - Catch errors early
- **Review your changes** - Use `git diff` before committing
- **Keep it clean** - Don't commit unnecessary files

---

**Ready to push? Let's go! 🚀**

```bash
git add .
git commit -m "Your descriptive message here"
git push
```

---

Need help? Check [GIT_COMMANDS.md](GIT_COMMANDS.md) for detailed Git instructions!

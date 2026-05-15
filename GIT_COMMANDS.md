# Git Commands for SFO-JKT Project

Quick reference for common Git operations.

## Initial Setup (First Time Only)

### 1. Configure Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2. Initialize Local Repository (if not cloned)
```bash
# In your project directory
git init
```

### 3. Connect to GitHub
```bash
git remote add origin https://github.com/tjpools/SFO-JKT.git
```

### 4. Verify Connection
```bash
git remote -v
```

---

## Daily Workflow

### Check Status
```bash
git status
```

### Stage All Changes
```bash
git add .
```

### Stage Specific Files
```bash
git add flight_tracker.py
git add flight-tracker-all.ps1
git add README.md
```

### Commit Changes
```bash
git commit -m "Add flight tracker with timezone support"
```

### Push to GitHub
```bash
# First time (set upstream)
git push -u origin main

# Subsequent pushes
git push
```

### Pull Latest Changes
```bash
git pull origin main
```

---

## Initial Push (First Upload)

### Option 1: Starting Fresh
```bash
# Stage all files
git add .

# Commit
git commit -m "Initial commit - Flight tracker application"

# Push to GitHub
git push -u origin main
```

### Option 2: Repository Already Has Files
```bash
# Pull existing content first
git pull origin main --allow-unrelated-histories

# Resolve any conflicts, then:
git add .
git commit -m "Merge local and remote changes"
git push -u origin main
```

---

## Branching

### Create New Branch
```bash
git checkout -b feature/new-feature
```

### Switch Branches
```bash
git checkout main
git checkout feature/new-feature
```

### List Branches
```bash
git branch
```

### Delete Branch
```bash
git branch -d feature/old-feature
```

---

## Viewing History

### View Commit Log
```bash
git log
git log --oneline
git log --graph --oneline --all
```

### View Changes
```bash
# Unstaged changes
git diff

# Staged changes
git diff --staged

# Changes in specific file
git diff flight_tracker.py
```

---

## Undoing Changes

### Discard Unstaged Changes
```bash
# Single file
git checkout -- flight_tracker.py

# All files
git checkout -- .
```

### Unstage Files
```bash
git reset HEAD flight_tracker.py
```

### Undo Last Commit (keep changes)
```bash
git reset --soft HEAD~1
```

### Undo Last Commit (discard changes)
```bash
git reset --hard HEAD~1
```

---

## Useful Commands for This Project

### Add All PowerShell Scripts
```bash
git add *.ps1
```

### Add All Documentation
```bash
git add *.md
```

### Commit with Detailed Message
```bash
git commit -m "Add UTC conversion feature" -m "- Added UTC offset to Flight class
- Created flight-tracker-utc.ps1
- Updated documentation"
```

### View Files Being Tracked
```bash
git ls-files
```

### Remove File from Git (keep local)
```bash
git rm --cached filename.txt
```

### Update .gitignore After Commit
```bash
# Add files to .gitignore first, then:
git rm -r --cached .
git add .
git commit -m "Update .gitignore"
```

---

## GitHub Specific

### Clone Your Repository
```bash
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT
```

### Create Pull Request
1. Push your branch:
   ```bash
   git push -u origin feature/your-feature
   ```
2. Go to https://github.com/tjpools/SFO-JKT
3. Click "Compare & pull request"
4. Add description and submit

### Sync Fork (if you forked someone else's repo)
```bash
git remote add upstream https://github.com/original/repo.git
git fetch upstream
git merge upstream/main
```

---

## Quick Reference

### Typical Workflow
```bash
# 1. Make changes to files
# 2. Check what changed
git status

# 3. Stage changes
git add .

# 4. Commit
git commit -m "Description of changes"

# 5. Push to GitHub
git push
```

### Fix Mistakes
```bash
# Oops, forgot to add a file
git add forgotten-file.py
git commit --amend --no-edit

# Wrong commit message
git commit --amend -m "Correct message"
```

---

## Project-Specific Examples

### Adding New Flight Script
```bash
git add flight-tracker-new.ps1
git commit -m "Add new flight tracker variant with real-time status"
git push
```

### Updating Documentation
```bash
git add README.md QUICKSTART.md
git commit -m "Update documentation with new features"
git push
```

### Major Release
```bash
git add .
git commit -m "Release v1.0.0 - Complete flight tracker suite"
git tag -a v1.0.0 -m "Version 1.0.0"
git push origin v1.0.0
git push
```

---

## Help & Resources

### Git Help
```bash
git help
git help commit
git help push
```

### Online Resources
- [GitHub Guides](https://guides.github.com/)
- [Git Documentation](https://git-scm.com/doc)
- [Interactive Git Tutorial](https://learngitbranching.js.org/)

---

**Need more help?** Open an issue on GitHub!

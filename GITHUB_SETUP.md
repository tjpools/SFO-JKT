# 🎯 Complete GitHub Setup Guide

Step-by-step guide to get your SFO-JKT project on GitHub.

## 📋 What You'll Need

- ✅ GitHub account ([create one here](https://github.com/join))
- ✅ Git installed ([download here](https://git-scm.com/downloads))
- ✅ Your project files (already done! ✨)

---

## 🚀 Step-by-Step Setup

### Step 1: Verify Git Installation

Open PowerShell or Terminal:
```bash
git --version
```

You should see something like: `git version 2.40.0`

If not installed, download from: https://git-scm.com/downloads

---

### Step 2: Configure Git (First Time Only)

```bash
# Set your name (appears in commits)
git config --global user.name "Your Name"

# Set your email (use your GitHub email)
git config --global user.email "your.email@example.com"

# Verify settings
git config --list
```

---

### Step 3: Check Your GitHub Repository

Go to: **https://github.com/tjpools/SFO-JKT**

**Is the repository empty?** → Follow **Option A**  
**Does it have files already?** → Follow **Option B**

---

## 🎯 Option A: Empty Repository (First Upload)

### 1. Initialize Git in Your Project
```bash
# Navigate to your project folder
cd C:\Users\tmcla\source\repos\PythonSFO

# Initialize Git
git init
```

### 2. Add All Files
```bash
# Stage all files
git add .

# Check what will be committed
git status
```

You should see:
```
Changes to be committed:
  new file:   flight_tracker.py
  new file:   flight-tracker-all.ps1
  new file:   README.md
  ... (all your files)
```

### 3. Make Your First Commit
```bash
git commit -m "Initial commit - Complete SFO-JKT flight tracker suite"
```

### 4. Connect to GitHub
```bash
# Add GitHub as remote origin
git remote add origin https://github.com/tjpools/SFO-JKT.git

# Verify
git remote -v
```

### 5. Push to GitHub
```bash
# Push and set upstream
git push -u origin main
```

If you get an error about "master" vs "main":
```bash
# Rename branch to main
git branch -M main

# Then push
git push -u origin main
```

### 6. Enter GitHub Credentials
- **Username**: tjpools
- **Password**: Use a [Personal Access Token](https://github.com/settings/tokens) (NOT your GitHub password)

**To create a token:**
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Give it a name: "SFO-JKT Project"
4. Select scopes: `repo` (full control)
5. Click "Generate token"
6. **Copy the token** (you won't see it again!)
7. Use this as your password when pushing

---

## 🔄 Option B: Repository Has Existing Files

### 1. Initialize Git
```bash
cd C:\Users\tmcla\source\repos\PythonSFO
git init
```

### 2. Add Remote
```bash
git remote add origin https://github.com/tjpools/SFO-JKT.git
```

### 3. Pull Existing Content
```bash
git pull origin main --allow-unrelated-histories
```

### 4. Resolve Any Conflicts
If there are conflicts:
```bash
# List conflicted files
git status

# Edit each file to resolve conflicts
# Look for markers like: <<<<<<< HEAD

# After fixing, add them
git add .
```

### 5. Commit the Merge
```bash
git commit -m "Merge local project with remote repository"
```

### 6. Add Your Files
```bash
git add .
git commit -m "Add complete flight tracker implementation"
```

### 7. Push Everything
```bash
git push origin main
```

---

## ✅ Verify Success

### 1. Check GitHub Website
Visit: https://github.com/tjpools/SFO-JKT

You should see:
- ✅ All your files listed
- ✅ README.md displayed below file list
- ✅ Green commit indicator
- ✅ Badges showing (may take a moment)

### 2. Test Clone
```bash
# In a different directory
cd /tmp
git clone https://github.com/tjpools/SFO-JKT.git test-clone
cd test-clone
ls  # All your files should be there!
```

---

## 🎨 Enhance Your Repository

### Add Repository Description
On GitHub:
1. Go to your repository
2. Click ⚙️ (Settings) or the description area
3. Add: "Flight tracker for San Francisco → Jakarta route via Tokyo (ANA flights)"
4. Add topics: `flight-tracker`, `python`, `powershell`, `timezone`, `travel`, `ana`
5. Save

### Enable Features
In Settings:
- ✅ Issues (for bug reports)
- ✅ Discussions (optional, for community)
- ✅ Projects (optional, for roadmap)
- ✅ Wikis (optional, for expanded docs)

### Add Social Preview
1. Go to Settings → scroll to "Social preview"
2. Upload an image (1280×640px recommended)
3. This appears when sharing your repo link

---

## 📱 Clone on Another Computer

To work on this project from another computer:

```bash
# Clone the repository
git clone https://github.com/tjpools/SFO-JKT.git

# Navigate into it
cd SFO-JKT

# Install Python dependencies
pip install -r requirements.txt

# Run the tracker
python flight_tracker.py
```

---

## 🔄 Daily Workflow (After Initial Setup)

### Making Changes
```bash
# 1. Make your changes to files

# 2. Check status
git status

# 3. Stage changes
git add .

# 4. Commit with message
git commit -m "Add real-time flight status feature"

# 5. Push to GitHub
git push
```

### Getting Updates (from another computer)
```bash
git pull origin main
```

---

## 🆘 Common Issues & Solutions

### Issue: "Permission denied (publickey)"
**Solution**: Use HTTPS instead of SSH, or [set up SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

### Issue: "fatal: not a git repository"
**Solution**: Make sure you're in the project directory
```bash
cd C:\Users\tmcla\source\repos\PythonSFO
git init
```

### Issue: "failed to push some refs"
**Solution**: Pull first, then push
```bash
git pull origin main --rebase
git push origin main
```

### Issue: "large files detected"
**Solution**: Add to .gitignore
```bash
echo "large-file.bin" >> .gitignore
git rm --cached large-file.bin
git commit -m "Remove large file"
git push
```

### Issue: "Updates were rejected"
**Solution**: Force push (BE CAREFUL!)
```bash
git push --force origin main
# Only use if you're sure!
```

---

## 🎓 Learn More

### Git Basics
- [Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [GitHub Guides](https://guides.github.com/)
- [Interactive Tutorial](https://learngitbranching.js.org/)

### GitHub Features
- [GitHub Docs](https://docs.github.com/)
- [Markdown Guide](https://guides.github.com/features/mastering-markdown/)
- [GitHub Actions](https://docs.github.com/en/actions) (for automation)

---

## 🎉 Next Steps

After successful setup:

1. ⭐ Star your own repo (why not!)
2. 📝 Create your first issue
3. 🏷️ Create a release (v1.0.0)
4. 🌐 Share the link with friends
5. 📊 Check Insights → Traffic to see visitors

---

## 📞 Need Help?

- 📖 Check [GIT_COMMANDS.md](GIT_COMMANDS.md)
- 📋 Use [PUSH_CHECKLIST.md](PUSH_CHECKLIST.md)
- 🐛 Search [Stack Overflow](https://stackoverflow.com/questions/tagged/git)
- 💬 Ask in [GitHub Community](https://github.community/)

---

## ✨ You're Ready!

Your project is now on GitHub and ready to share with the world! 🌍

**Repository URL**: https://github.com/tjpools/SFO-JKT

Happy coding and happy flying! 🛫✈️🛬

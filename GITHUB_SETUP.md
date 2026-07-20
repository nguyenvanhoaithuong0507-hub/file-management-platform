# GitHub Setup Guide - Push Code to Repository

## Problem: 404 Not Found

Repository not found. This usually means:

1. Repository hasn't been created on GitHub yet
2. Repository URL is incorrect
3. Repository is private and needs authentication
4. GitHub access token is expired

---

## Solution: 3 Ways to Fix

### OPTION 1: Create Repository on GitHub (RECOMMENDED)

**Step 1: Go to GitHub**
- Visit: https://github.com/new
- Sign in with your account

**Step 2: Create New Repository**
- Repository name: `Domian-fpt` (or `Domain-fpt`)
- Description: Next.js 16 Project with FTP Deployment
- Select: **Public** (easier) or **Private** (more secure)
- Check: ✅ Add a README file
- Click: **Create repository**

**Step 3: Get Repository URL**
- Copy the HTTPS URL: `https://github.com/YOUR-USERNAME/Domian-fpt.git`
- Example: `https://github.com/dotcom-03/Domian-fpt.git`

**Step 4: Update Remote & Push**
```bash
cd /vercel/share/v0-project

# Remove old remote
git remote remove origin

# Add correct remote
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# Push code
git branch -M main
git push -u origin main
```

---

### OPTION 2: Use SSH (If You Have SSH Key)

**Step 1: Generate SSH Key (if you don't have one)**
```bash
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
# Press Enter for all prompts
```

**Step 2: Add to GitHub**
- Go to: https://github.com/settings/keys
- Click: **New SSH key**
- Paste your public key (from `~/.ssh/id_rsa.pub`)

**Step 3: Push with SSH**
```bash
cd /vercel/share/v0-project

git remote remove origin
git remote add origin git@github.com:dotcom-03/Domian-fpt.git

git branch -M main
git push -u origin main
```

---

### OPTION 3: Use GitHub CLI (Easiest)

**Step 1: Install GitHub CLI**
```bash
# macOS
brew install gh

# Ubuntu/Debian
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Windows
choco install gh
```

**Step 2: Login**
```bash
gh auth login
# Select: HTTPS
# Authenticate in browser
```

**Step 3: Create & Push**
```bash
cd /vercel/share/v0-project

# Remove old remote
git remote remove origin

# Create repository and push
gh repo create Domian-fpt --source=. --push --public
```

---

## Detailed Steps for OPTION 1 (Most Common)

### A. Create Repository on GitHub

1. Go to https://github.com/dotcom-03 (your profile)
2. Click **Repositories** tab
3. Click **New** button
4. Fill in:
   ```
   Repository name: Domian-fpt
   Description: Next.js 16 Project - FTP Deployment Guide
   Visibility: Public
   Initialize: Check "Add a README file"
   ```
5. Click **Create repository**

### B. Configure Git Locally

```bash
cd /vercel/share/v0-project

# Set username (if not set)
git config --global user.name "Your Name"
git config --global user.email "your-email@github.com"

# Check current remote
git remote -v
# Output: origin  https://github.com/dotcom-03/Domian-fpt.git (if set)

# If remote doesn't exist, add it
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# If remote is wrong, update it
git remote set-url origin https://github.com/dotcom-03/Domian-fpt.git
```

### C. Push Code to GitHub

```bash
cd /vercel/share/v0-project

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main

# You'll be prompted for GitHub credentials:
# Username: your-github-username
# Password: your-github-personal-access-token (NOT your password!)
```

### D. Generate Personal Access Token (If Needed)

If you get authentication errors:

1. Go to: https://github.com/settings/tokens
2. Click: **Generate new token** → **Generate new token (classic)**
3. Give it a name: `v0-project-push`
4. Select scopes:
   - ✅ repo (Full control of private repositories)
   - ✅ workflow
5. Click: **Generate token**
6. Copy the token (you won't see it again!)
7. Use as password when pushing

---

## Quick Commands Summary

```bash
# 1. Create repo on GitHub first! (https://github.com/new)

# 2. Setup local git
cd /vercel/share/v0-project
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# 3. Push code
git branch -M main
git push -u origin main

# 4. Verify
git remote -v
git log --oneline -5
```

---

## Common Errors & Solutions

### Error: "Repository not found"
**Solution**: Repository doesn't exist yet on GitHub
- Go to https://github.com/new
- Create repository with same name
- Then push again

### Error: "fatal: remote origin already exists"
**Solution**: Remote already configured
```bash
# Remove old remote
git remote remove origin

# Add new remote
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# Try pushing again
git push -u origin main
```

### Error: "fatal: Authentication failed"
**Solution**: Wrong credentials or token expired
- Use personal access token (not password)
- Go to: https://github.com/settings/tokens
- Create new token with `repo` scope
- Use token as password

### Error: "fatal: 'origin' does not appear to be a 'git' repository"
**Solution**: Git not initialized
```bash
cd /vercel/share/v0-project
git init
git remote add origin https://github.com/dotcom-03/Domian-fpt.git
git branch -M main
git push -u origin main
```

---

## Verification

After pushing, verify:

```bash
# Check remote
git remote -v
# Should show:
# origin  https://github.com/dotcom-03/Domian-fpt.git (fetch)
# origin  https://github.com/dotcom-03/Domian-fpt.git (push)

# Check commits
git log --oneline -5

# Visit GitHub in browser
# https://github.com/dotcom-03/Domian-fpt
# You should see all your files!
```

---

## Next Steps After Push

1. ✅ Code is on GitHub
2. Go to: https://github.com/dotcom-03/Domian-fpt
3. Verify all files are there
4. Now you can:
   - Share the link with others
   - Deploy to Vercel (click "Publish" on Vercel)
   - Collaborate with teammates
   - Use GitHub as backup

---

## Deployment After GitHub Upload

### Option A: Deploy to Vercel (EASIEST)
1. Go to https://vercel.com/new
2. Import your GitHub repository
3. Click Deploy
4. Done! (Takes ~3 minutes)

### Option B: Deploy to Server
See: `FTP_DEPLOYMENT.md`

---

## Pro Tips

- Use `git status` to check what files will be pushed
- Use `git log` to see all commits
- Use `.gitignore` to exclude files (already configured)
- Commit regularly with meaningful messages
- Use GitHub Issues for tracking tasks
- Use GitHub Projects for project management

---

**Ready to push? Follow OPTION 1 above!** 🚀

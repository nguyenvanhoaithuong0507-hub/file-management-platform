#!/bin/bash

# ============================================================================
# GitHub Push Script - Automated Code Upload
# ============================================================================
# This script helps you push all code to GitHub automatically
# Usage: bash push-to-github.sh <username> <repo-name>
# Example: bash push-to-github.sh dotcom-03 Domian-fpt
# ============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        GitHub Push Script - Next.js 16 Project             ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Error: Git is not installed${NC}"
    exit 1
fi

# Get parameters
USERNAME=${1:-}
REPONAME=${2:-}

# If no parameters, ask user
if [ -z "$USERNAME" ] || [ -z "$REPONAME" ]; then
    echo -e "${YELLOW}Please provide GitHub credentials:${NC}"
    echo ""
    
    if [ -z "$USERNAME" ]; then
        read -p "GitHub username (e.g., dotcom-03): " USERNAME
    fi
    
    if [ -z "$REPONAME" ]; then
        read -p "Repository name (e.g., Domian-fpt): " REPONAME
    fi
fi

echo ""
echo -e "${BLUE}Configuration:${NC}"
echo "  Username: $USERNAME"
echo "  Repository: $REPONAME"
echo "  URL: https://github.com/$USERNAME/$REPONAME.git"
echo ""

# Confirm
read -p "Proceed with push? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Cancelled${NC}"
    exit 0
fi

echo ""
echo -e "${BLUE}Step 1: Checking git status...${NC}"
cd "$(dirname "$0")" || exit 1
git status

echo ""
echo -e "${BLUE}Step 2: Configuring remote...${NC}"

# Check if remote exists
if git remote get-url origin &> /dev/null; then
    echo "  Updating existing remote..."
    git remote set-url origin "https://github.com/$USERNAME/$REPONAME.git"
else
    echo "  Adding new remote..."
    git remote add origin "https://github.com/$USERNAME/$REPONAME.git"
fi

echo -e "${GREEN}✓ Remote configured${NC}"

echo ""
echo -e "${BLUE}Step 3: Staging all files...${NC}"
git add -A
echo -e "${GREEN}✓ Files staged${NC}"

echo ""
echo -e "${BLUE}Step 4: Committing changes...${NC}"
git commit -m "Initial commit: Next.js 16 project with FTP deployment guide" || true
echo -e "${GREEN}✓ Changes committed${NC}"

echo ""
echo -e "${BLUE}Step 5: Setting main branch...${NC}"
git branch -M main
echo -e "${GREEN}✓ Branch set to main${NC}"

echo ""
echo -e "${BLUE}Step 6: Pushing to GitHub...${NC}"
if git push -u origin main; then
    echo -e "${GREEN}✓ Code pushed successfully!${NC}"
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                    🎉 SUCCESS! 🎉                         ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Your code is now on GitHub!"
    echo "Repository: https://github.com/$USERNAME/$REPONAME"
    echo ""
    echo "Next steps:"
    echo "  1. Visit: https://github.com/$USERNAME/$REPONAME"
    echo "  2. Verify all files are there"
    echo "  3. Deploy to Vercel (optional)"
    echo ""
else
    echo -e "${RED}❌ Push failed!${NC}"
    echo ""
    echo "Common solutions:"
    echo "  1. Repository doesn't exist yet"
    echo "     → Create it at https://github.com/new"
    echo "  2. Authentication failed"
    echo "     → Use personal access token (not password)"
    echo "     → Get token: https://github.com/settings/tokens"
    echo "  3. Check the error message above for more info"
    exit 1
fi

echo ""
echo -e "${BLUE}Additional commands:${NC}"
echo "  Check status: git status"
echo "  View commits: git log --oneline"
echo "  View remote: git remote -v"
echo ""

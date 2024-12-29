#!/bin/bash
echo "Hello, Now Start Executing Node File"

# Variables
REPO_NAME="private-repo1"
DESCRIPTION="This is a private repository."

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI (gh) is not installed. Please install it first."
    exit 1
fi

# Authenticate if not already done
if ! gh auth status &> /dev/null
then
    echo "Authenticating GitHub CLI..."
    gh auth login
fi

# Create private repository
echo "Creating private repository: $REPO_NAME"
gh repo create "$REPO_NAME" --private -d "$DESCRIPTION"

# Clone repository (optional)
echo "Cloning repository locally..."
git clone "https://github.com/dkk934/$REPO_NAME.git"
cd "$REPO_NAME" || exit

# Initialize with README
# node bin/file1.js
echo "# $REPO_NAME" > README.md
git add README.md
git commit -m "Initial commit"
git push -u origin main

echo "Private repository '$REPO_NAME' created and initialized successfully!"

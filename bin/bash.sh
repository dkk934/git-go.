#!/bin/bash
echo "Hello, Now Start Executing Node File"

# Variables
DESCRIPTION="This is a private repository."

# Check if REPO_NAME is provided
if [ -z "$REPO_NAME" ]; then
    echo "Error: Repository name (REPO_NAME) is not set."
    exit 1
fi

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) is not installed. Please install it first."
    exit 1
fi

# Authenticate if not already done
if ! gh auth status &> /dev/null; then
    echo "Authenticating GitHub CLI..."
    gh auth login
fi

# Create private repository
echo "Creating private repository: $REPO_NAME"
gh repo create "$REPO_NAME" --private -d "$DESCRIPTION"
if [ $? -ne 0 ]; then
    echo "Failed to create repository $REPO_NAME."
    exit 1
fi

# Retrieve the repository URL
REPO_URL=$(gh repo view "$REPO_NAME" --json url -q ".url")
if [ -z "$REPO_URL" ]; then
    echo "Failed to retrieve repository URL."
    exit 1
fi

echo "Repository URL: $REPO_URL"

# Clone repository
echo "Cloning repository locally..."
git clone "$REPO_URL"
if [ $? -ne 0 ]; then
    echo "Failed to clone repository $REPO_NAME."
    exit 1
fi
cd "$REPO_NAME" || exit

# Initialize with README
echo "# $REPO_NAME" > README.md
git add README.md
git commit -m "Initial commit"
git push -u origin main

echo "Private repository '$REPO_NAME' created and initialized successfully!"
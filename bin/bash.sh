#!/bin/bash

# Simulate a long-running process
long_running_task() {
    #!/bin/bash

    echo "Hello, Now Start Executing Node File"
    echo
    # Variables
    REPO_NAME="private-repo4"
    DESCRIPTION="This is a private repository."
    GITHUB_USER="dkk934"  # Replace with your GitHub username

    # Function to check command existence
    command_exists() {
    command -v "$1" &> /dev/null
    }

    # Check if GitHub CLI is installed
    if ! command_exists gh; then
        echo "GitHub CLI (gh) is not installed. Please install it first."
        exit 1
    fi

    # Authenticate if not already done
    if ! gh auth status &> /dev/null; then
        echo "Authenticating GitHub CLI..."
        gh auth login || { echo "Authentication failed."; exit 1; }
    fi

    

    # Create private repository
    echo "Creating private repository: $REPO_NAME"
    if ! gh repo create "$REPO_NAME" --private -d "$DESCRIPTION"; then
        echo "Failed to create repository. Exiting."
    fi

    cd ~/OneDrive/Desktop || { echo "Failed to navigate into repository directory. Exiting."; exit 1; }
    echo
    # Clone repository (optional)
    echo "Cloning repository locally..."
    if ! git clone "https://github.com/$GITHUB_USER/$REPO_NAME.git"; then
        echo "Failed to clone repository. Exiting."
    fi
    echo
    cd "$REPO_NAME" || { echo "Failed to navigate into repository directory. Exiting."; exit 1; }
    echo
    # Initialize with README
    echo "Initializing repository with README..."
    echo "# $REPO_NAME" > README.md
    git add README.md
    git commit -m "Initial commit"
    git push -u origin main || { echo "Failed to push changes. Exiting."; exit 1; }

    echo "Private repository '$REPO_NAME' created and initialized successfully!"

}

# Function to display the loading animation
loading_animation() {
    local pid=$1  # PID of the background process
    local delay=0.1
    local spinstr='|/-\'

    while kill -0 "$pid" 2>/dev/null; do
        for ((i = 0; i < ${#spinstr}; i++)); do
            printf "\r[%c] Loading..." "${spinstr:i:1}"
            sleep "$delay"
        done
    done
    printf "\r[✔] Done!       \n"
}

# Start the long-running process in the background
long_running_task &

# Get the PID of the background process
task_pid=$!

# Call the loading animation function
loading_animation "$task_pid"

# GitHub Repository Automation Script

This project provides an automated way to create, clone, and initialize a GitHub repository using a combination of Node.js and Bash scripts. It streamlines the process of setting up a new repository with an initial commit, making it ideal for developers who frequently initialize projects.

---

## Features

- **Node.js Script (`app.js`)**:
  - Executes the Bash script using the `child_process` module.
  - Handles errors and ensures all commands are executed in sequence.

- **Bash Script (`bash.sh`)**:
  - Creates a new private GitHub repository using the GitHub CLI.
  - Clones the repository locally.
  - Initializes the repository with a README file.
  - Performs an initial commit and pushes it to the main branch.

---

## Prerequisites

1. **GitHub CLI (`gh`)**:
   - Install it from [GitHub CLI](https://cli.github.com/).
   - Authenticate using `gh auth login`.

2. **Git**:
   - Ensure Git is installed and configured.

3. **Node.js**:
   - Required to run the `app.js` script.

4. **Environment Setup**:
   - Update the `GITHUB_USER` variable in the `bash.sh` script with your GitHub username.

---

## Installation and Usage Guide for `git-go934`

### **Installation**

#### **Global Installation** (Recommended for CLI tools):
```bash
npm install -g git-go934
```
## Usage
Once installed globally, you can use the `git-go` command directly in your terminal:
```bash
git-go
```
This will execute the script located in `./bin/app.js`.

## Example Workflow

1. Create a private repository named `private-repo4`.
2. Clone the repository locally.
3. Add a `README.md` file with the repository's name.
4. Perform an initial commit and push changes to the remote repository.

---

## Customization

- **Repository Name and Description**:
  - Modify the `REPO_NAME` and `DESCRIPTION` variables in `bash.sh`.
- **Visibility**:
  - Change the repository type from private to public by replacing `--private` with `--public`.

---

## Notes

- Ensure the GitHub CLI is properly authenticated before running the script.
- The Bash script contains a built-in loading animation for better user experience.

---

## License

This project is licensed under the MIT License.


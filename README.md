# Repository Creator and Initializer

This project is a **Node.js-based tool** for automating the creation of private GitHub repositories, cloning them locally, and initializing them with a `README.md` file. It combines the power of **GitHub CLI**, **Bash scripting**, and **Node.js** to streamline repository setup, saving developers time and effort.

---

## **Features**
1. **Interactive Repository Name Input**:
   - Users can provide the repository name via a prompt, ensuring flexibility.
2. **Automated Repository Creation**:
   - Uses GitHub CLI (`gh`) to create a private repository.
3. **Dynamic Repository Cloning**:
   - Automatically retrieves the correct repository URL and clones it locally.
4. **Repository Initialization**:
   - Creates a `README.md` file, commits it to the repository, and pushes it to GitHub.
5. **Error Handling**:
   - Handles errors such as missing dependencies, invalid GitHub credentials, or incorrect repository names.

---

## **Prerequisites**

To use this project, ensure the following tools and dependencies are installed on your system:

1. **Node.js**:
   - Download and install Node.js from [Node.js Official Site](https://nodejs.org/).
   - Verify installation:
     ```bash
     node -v
     npm -v
     ```

2. **GitHub CLI (`gh`)**:
   - Install the GitHub CLI from [GitHub CLI Documentation](https://cli.github.com/).
   - Verify installation:
     ```bash
     gh --version
     ```

3. **Git**:
   - Install Git from [Git Official Site](https://git-scm.com/).
   - Verify installation:
     ```bash
     git --version
     ```

4. **Bash Shell**:
   - Ensure a Bash shell is available. This is standard on Linux and macOS. For Windows, use Git Bash or WSL.

5. **Authentication with GitHub**:
   - Log in to GitHub via the GitHub CLI to ensure access:
     ```bash
     gh auth login
     ```

---

## **Project Structure**

```
.
├── README.md               # Project documentation
├── bin/
│   ├── app.js              # Main Node.js script
│   ├── bash.sh             # Bash script for repository creation and initialization
│   └── file1.js            # Auxiliary Node.js script for adding content and Git commands
├── package.json            # Node.js package configuration
└── package-lock.json       # Node.js dependency lock file
```

---

## **Setup Instructions**

### 1. Clone the Repository
Clone this project to your local machine:
```bash
git clone https://github.com/<your-username>/repository-creator.git
cd repository-creator
```

### 2. Install Dependencies
Install the required Node.js dependencies:
```bash
npm install
```

### 3. Make Scripts Executable
Ensure the scripts are executable:
```bash
chmod +x bin/app.js
chmod +x bin/bash.sh
```

---

## **How to Use**

### 1. Run the Script
Execute the main script using Node.js:
```bash
node bin/app.js
```

### 2. Provide Repository Name
When prompted, enter the name of the repository you wish to create:
```plaintext
Enter the name of the repository to create: my-repo-name
```

### 3. Repository Creation
- The script will:
  1. Create the private repository on GitHub.
  2. Dynamically retrieve the repository URL.
  3. Clone the repository to your local machine.
  4. Initialize the repository with a `README.md` file.
  5. Commit and push the changes to the GitHub repository.

### 4. Verify the Output
Upon successful execution:
- The repository will be available on your GitHub account.
- The cloned repository will be in your current working directory.

---

## **Example Execution**

**User Input**:
```plaintext
Enter the name of the repository to create: my-awesome-project
```

**Console Output**:
```plaintext
Hello, Now Start Executing Node File
Creating private repository: my-awesome-project
Repository URL: https://github.com/<your-username>/my-awesome-project
Cloning repository locally...
Cloning into 'my-awesome-project'...
# my-awesome-project
[master (root-commit) abc1234] Initial commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
Private repository 'my-awesome-project' created and initialized successfully!
All commands executed.
```

**Result**:
- A private repository `my-awesome-project` is created on GitHub.
- A local copy is available in your working directory.

---

## **Troubleshooting**

1. **GitHub CLI Not Installed**:
   - Ensure `gh` is installed and accessible in your PATH.
   - Install instructions: [GitHub CLI](https://cli.github.com/).

2. **Authentication Issues**:
   - Log in to GitHub:
     ```bash
     gh auth login
     ```

3. **Repository Already Exists**:
   - Use a unique repository name.

4. **Missing Dependencies**:
   - Ensure Node.js, Git, and Bash are installed and configured.

5. **Permission Denied**:
   - Check script permissions and update if necessary:
     ```bash
     chmod +x bin/app.js
     chmod +x bin/bash.sh
     ```

6. **Incorrect Repository URL**:
   - Ensure you are authenticated with the correct GitHub account.

---

## **Customization**

1. **Default Repository Description**:
   - Modify the `DESCRIPTION` variable in `bin/bash.sh` to set a custom description.

2. **Default Behavior**:
   - Adjust the script to include more initialization files (e.g., `.gitignore`).

---

## **Contributing**

1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-branch-name
   ```
3. Commit changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push changes and create a pull request.

---

## **License**

This project is licensed under the [MIT License](LICENSE).

---

## **Acknowledgments**

- **GitHub CLI**: For simplifying repository management.
- **Node.js and Bash**: For their flexibility in scripting.
- **You**: For using this tool!

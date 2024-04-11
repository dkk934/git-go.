# git_command

This is a simple Node.js command line application that executes a series of Git commands.

## Installation

You can install this package globally using npm:

bash
```npm install -g git_command```

This will install the package globally on your system, allowing you to run the git-go command from anywhere.

Please note that you might need to use sudo (for Unix-based systems) or run your command prompt/PowerShell as Administrator (for Windows) to install npm packages globally.

```sudo npm install -g git_command```

## Usage
Once installed, you can use the git-go command to execute a series of Git commands:

```git-go```

This will execute the following Git commands in order:

```git init```

```git status```

```git add .```

```git status```

Each command’s output will be logged to the console.

## Dependencies
This package depends on the child_process package.

## Author
This package was created by dk_k_934.

## License
This package is licensed under the ISC license.






#!/usr/bin/env node
import { exec } from 'child_process';
import readline from 'readline';

// Function to prompt for user input
const promptUser = (query) => {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });

    return new Promise((resolve) => rl.question(query, (answer) => {
        rl.close();
        resolve(answer);
    }));
};

// Function to execute shell commands
const execPromisified = (command) => {
    return new Promise((resolve, reject) => {
        exec(command, (error, stdout, stderr) => {
            if (error) {
                console.error(`error: ${error.message}`);
                reject(error);
            }
            if (stderr) {
                console.error(`stderr: ${stderr}`);
                reject(stderr);
            }
            console.log(`stdout: ${stdout}`);
            resolve(stdout);
        });
    });
};

// Main execution
(async () => {
    try {
        const repoName = await promptUser('Enter the name of the repository: ');
        const commands = `REPO_NAME="${repoName}" bash bin/bash.sh`;

        console.log(`Using repository name: ${repoName}`);
        await execPromisified(commands);
    } catch (error) {
        console.error(`An error occurred: ${error}`);
    }

    console.log('All commands executed.');
})();
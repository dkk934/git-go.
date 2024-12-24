#!/usr/bin/env node
import { exec } from 'child_process';

let commands = ['git init','git add .','git status'];

let execPromisified = (command) => {
    return new Promise((resolve, reject) => {
        exec(command, (error, stdout, stderr) => {
            if (error) {
                console.log(`error: ${error.message}`);
                reject(error);
            }
            if (stderr) {
                console.log(`stderr: ${stderr}`);
                reject(stderr);
            }
            console.log(`stdout: ${command} = ${stdout}`);
            resolve(stdout);
        });
    });
};

(async () => {
    for (let command of commands) {
        try {
            await execPromisified(command);
        } catch (error) {
            console.log(`An error occurred: ${error}`);
        }
    }
    console.log('All commands executed.');
})();

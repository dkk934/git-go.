#!/usr/bin/env node
import { spawn } from 'child_process';

const runCommand = (command, args = []) => {
    return new Promise((resolve, reject) => {
        const process = spawn(command, args, { stdio: 'inherit' });

        process.on('close', (code) => {
            if (code !== 0) {
                reject(`Process exited with code ${code}`);
            } else {
                resolve();
            }
        });
    });
};

(async () => {
    try {
        await runCommand('bash', ['bin/bash.sh']);
    } catch (error) {
        console.error(`Execution failed: ${error}`);
    } finally {
        console.log('All commands executed.');
    }
})();

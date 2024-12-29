import fs from 'fs';
import { exec } from 'child_process';

fs.appendFile('mynewfile1.txt', 'hello content!\n', (err) => {
  if (err) throw err;
  console.log('Saved!');
});

let commands = ["git add README.md", "git commit -m 'Initial commit'", "git push -u origin main"];
  
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
            console.log(`stdout: ${stdout}`);
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



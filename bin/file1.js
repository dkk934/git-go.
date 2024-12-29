import fs from 'fs';

fs.appendFile('mynewfile1.txt', 'hello content!\n', (err) => {
    if (err) throw err;
    console.log('Saved!');
  });

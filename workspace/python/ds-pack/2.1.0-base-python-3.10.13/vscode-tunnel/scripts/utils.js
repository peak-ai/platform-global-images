const fs = require('fs');

function sleep(milliseconds) {
  const start = new Date().getTime();
  while (new Date().getTime() - start < milliseconds);
}

function printOutput() {
  // Read the file and print its contents
  fs.readFile('output.log', 'utf8', (err, data) => {
    if (err) {
      if (err.code === 'ENOENT') {
        console.log(`File '${fileName}' not found.`);
      } else {
        console.error(`An error occurred: ${err}`);
      }
      return;
    }

    console.log(data);
  });
}

module.exports = {
  sleep,
  printOutput
}

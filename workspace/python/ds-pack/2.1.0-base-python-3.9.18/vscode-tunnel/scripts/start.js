/**
 * The script aims to start a vscode tunnel for the workspace. It does by starting a tunnel in the background.
 * Usage - node /vscode-tunnel/scripts start.js
 */
const { spawn } = require('child_process');
const fs = require('fs');
const { sleep, printOutput } = require('./utils');

function main() {
  const scriptPath = '/vscode-tunnel/scripts/start.js';

  // Open a file to store the child process's output
  const outputLogFile = fs.openSync('output.log', 'a');
  const errorLogFile = fs.openSync('error.log', 'a');

  // Spawn a child process to run the shell script with stdin, stdout, and stderr redirected
  const childProcess = spawn('bash', [scriptPath], {
    detached: true,
    stdio: ['pipe', outputLogFile, errorLogFile], // Redirect output to log files
  });

  // Close the file descriptors to release them
  fs.closeSync(outputLogFile);
  fs.closeSync(errorLogFile);

  // Check if stdin is writable before sending user input
  if (childProcess.stdin) {
    const userInput = 'User input goes here\n';
    childProcess.stdin.write(userInput);

    // Optionally, end the input stream if there's nothing more to send
    childProcess.stdin.end();
  } else {
    console.error('stdin is not writable for the child process.');
  }

  console.log('Starting tunnel...');
  sleep(3000);
  printOutput();

  // Unref the child process to allow the Node.js process to exit
  childProcess.unref();
}

main();

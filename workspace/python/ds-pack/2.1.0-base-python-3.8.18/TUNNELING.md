# Tunneling with VS Code

This README provides instructions for setting up and managing remote tunnels using this image, making it easier for you to access your workspace remotely within VS Code.

## Initializing a Remote Tunnel

To create a new remote tunnel for your workspace, you can use the provided Node.js script:

```bash
bash /vscode-tunnel/scripts/start.sh
```

Running this script initializes and starts a new tunnel in the background, which can be accessed remotely. To ensure its functionality, a brief authentication step using GitHub is required.

After executing the above command, you will see the following message in the console:

```
To grant access to the server, please log into https://github.com/login/device and use code <access-code>
```

Follow the link provided and enter the `<access-code>` displayed in the console.

That's it! Your new, secure tunnel should now be active and accessible at the following URL: `https://vscode.dev/tunnel/workspace-<workspace-id>-0`

## Managing Tunnels

### Restarting a Tunnel

If you need to restart your tunnel for smooth operation, you can use the following command:

```bash
bash /vscode-tunnel/scripts/refresh.sh
```

### Stopping a Tunnel

To stop an active tunnel, use the following command:

```bash
bash /vscode-tunnel/scripts/stop.sh
```

### Starting a Tunnel

To start a previously stopped tunnel, use this command:

```bash
bash /vscode-tunnel/scripts/start.sh
```

## Additional Notes

To view the logs of any running or closed tunnel, you can refer to the `output.log` file located at `/vscode-tunnel/logs/output.log`. Similarly, any errors related to running or closed tunnels can be found in the `/vscode-tunnel/logs/error.log` file.

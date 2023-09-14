#!/bin/bash
code-server --install-extension cweijan.vscode-database-client2@6.6.3
jupyterhub --Spawner.default_url=/lab --Spawner.http_timeout=90 --NotebookApp.terminado_settings={"shell_command":"[/bin/bash]"}
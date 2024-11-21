# workspace-python-ds-pack-2.1.1-base-python-3.8.18
This is the Python Data Science pack image made for Workspaces. 
The image runs a [Jupyterhub](https://jupyter.org/hub) server that has [PyCharm](https://lp.jetbrains.com/projector/) and [VSCode](https://github.com/coder/code-server) pre-installed with all of the essential and most used packages.
The images also comes pre installed with [peak-sdk](https://docs.peak.ai/sdk/).

## Image details
### Base image
This image uses [python:3.8.18-slim-bookworm](https://hub.docker.com/layers/library/python/3.8.18-slim-bookworm/images/sha256-05928e4bd868a725705a451f59eab0638a3509899099955bb326624a3f9bb597?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other details
```
Debian         GNU/Linux 12 (bookworm)
Linux Kernel   5.10.186-179.751.amzn2.x86_64
Python         3.8.18
```

### Important Linux packages installed
```
aws-cli        2.7.4
curl           7.88.1
git            2.39.2
jq             1.6
nano           7.2
vim            9.0
fish           3.6.0
zsh            5.9
R              4.3.1
node           18.17.1
docker         24.0.6
htop           3.2.0
pandoc         2.17.1.1
less           590
latex          3.141592653-2.6-1.40.24
vscode-cli     1.82.2
```

### Python libraries installed
```
boto3                             1.35.65
ipywidgets                        8.1.0
jupyter-server-proxy              4.0.0
jupyterhub                        4.0.2
jupyterlab                        3.6.5
jupyterlab-git                    0.42.0
jupyterlab-lsp                    4.2.0
jupyterlab_widgets                3.0.8
jupysql                           0.10.1
jupytext                          1.15.1
lckr-jupyterlab-variableinspector 3.0.9
mypy-ls                           0.5.1
nbconvert                         7.8.0
notebook                          6.5.5
pandas                            2.2.3
peak-sdk                          1.13.0
poetry                            1.8.4
pyenv                             2.4.19
pyls-black                        0.4.7
pyls-flake                        80.4.0
pyls-isort                        0.2.2
pyls-mypy                         0.1.8
python-dotenv                     1.0.1
python-lsp-black                  1.3.0
python-lsp-server[all]            1.4.1
virtualenv                        20.27.0
```

### DWH connector libraries installed
```
psycopg2-binary                   2.9.10
redshift-connector                2.1.3
sqlalchemy-redshift               0.8.14
snowflake-connector-python        3.12.3
snowflake-sqlalchemy              1.6.1
snowflake-snowpark-python         1.25.0
```

### VS Code extensions installed
```
cweijan.vscode-database-client2   6.6.3    
```

### VS Code Tunneling

The image supports creating [remote tunnels](https://code.visualstudio.com/docs/remote/tunnels). For simplicity the image comes in handy with some node/bash scripts which can be used to `initialise`, `start`, `stop`, and `restart` the remote tunnels. More info can be found [here](./TUNNELING.md).

## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-ds-pack-2.1.0-base-python-3.8.18
```

## Using the image
To use the image, select it when configuring the Workspace.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

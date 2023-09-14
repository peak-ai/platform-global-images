# workspace-python-ds-pack-2.1.0-base-python-3.8.17
This is the Python Data Science pack image made for Workspaces. 
The image runs a [Jupyterhub](https://jupyter.org/hub) server that has [PyCharm](https://lp.jetbrains.com/projector/) and [VSCode](https://github.com/coder/code-server) pre-installed with all of the essential and most used packages.
The images also comes pre installed with [peak-sdk](https://docs.peak.ai/sdk/).

## Image details
### Base image
This image uses [python:3.8.17-bookworm](https://hub.docker.com/layers/library/python/3.8.17-bookworm/images/sha256-bd86c439c587a78e17b8406c6d85c95fab696aae5572e23a7e385ccde75487ad?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other details
```
Debian         GNU/Linux 12 (bookworm)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
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
R              4.2.0
node           18.17.1
docker         24.0.6
htop           3.2.0
pandoc         2.17.1.1
less           590
latex          3.141592653-2.6-1.40.24
```

### Python libraries installed
```
ipywidgets                        8.1.0
jupyter-server-proxy              4.0.0
jupyterhub                        4.0.2
jupyterlab-git                    0.42.0
jupyterlab-lsp                    4.2.0
jupyterlab                        3.6.5
jupyterlab_widgets                3.0.8
jupytext                          1.15.1
lckr-jupyterlab-variableinspector 3.0.9
mypy-ls                           0.5.1
nbconvert                         7.8.0
notebook                          6.5.5
pyls-black                        0.4.7
pyls-flake                        80.4.0
pyls-isort                        0.2.2
pyls-mypy                         0.1.8
python-lsp-black                  1.3.0
python-lsp-server[all]            1.4.1
virtualenv                        20.24.5
peak-sdk                          1.0.0
jupysql                           0.10.1
```

## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-ds-pack-2.1.0-base-python-3.8.17
```

## Using the image
To use the image, select it when configuring the Workspace.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

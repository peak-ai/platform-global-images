# workspace-python-ds-pack-v1
This is the Python Data Science pack image made for Workspaces. 
The image runs a [Jupyterhub](https://jupyter.org/hub) server that has [PyCharm](https://lp.jetbrains.com/projector/) and [VSCode](https://github.com/coder/code-server) pre-installed with all of the essential and most used packages.

## Image details
### Base image
This image uses [python:3.11.2-slim-bullseye](https://hub.docker.com/layers/library/python/3.11.2-slim-bullseye/images/sha256-bb315a212e098bf2a95d9b444f0eee78b5dffb96caac78ac5fddf2ce3134adf1?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other details
```
Debian         GNU/Linux 11 (bullseye) (11.6-slim-bullseye)
Linux Kernel   5.10.176
Python         3.11.2
```

### Important Linux packages installed
```
aws-cli        2.7.20
curl           7.74.0
git            2.30.2
jq             1.6-2.1
nano           5.4-2
vim            8.2.2434-3
fish           3.1.2-3
zsh            5.8-6
R              4.3.0
node           18.16.0
docker         23.0.6
htop           3.0.5-7
pandoc         2.9.2.1-1
less           551-2
latex          4.70b-0.2
libpq-dev      13.10-0
```

### Python libraries installed
```
ipywidgets                          8.0.4
jupyter-server-proxy                4.0.0
jupyterhub                          4.0.0
jupyterlab-git                      0.41.0
jupyterlab-lsp                      4.1.0
jupyterlab                          3.6.3
jupyterlab_widgets                  3.0.7
jupytext                            1.14.5
lckr-jupyterlab-variableinspector   3.0.9
mypy-ls                             0.5.1
nbconvert                           7.4.0
notebook                            6.5.4
pyls-black                          0.4.7
pyls-flake8                         0.4.0
pyls-isort                          0.2.2
pyls-mypy                           0.1.8
python-lsp-black                    1.2.1
python-lsp-server[all]              1.7.2
virtualenv                          20.23.0
```

## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-ds-pack-v1
```

## Using the image
To use the image, select it when configuring the Workspace.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

# workspace-python-ds-pack-v1
This is the Data Science pack Python image made for workspaces. The image runs a [Jupyterhub](https://jupyter.org/hub) server that has [PyCharm](https://lp.jetbrains.com/projector/) and [VSCode](https://github.com/coder/code-server) pre-installed along all the basic most-used packages.

## Image Details
### Base Image
This image uses [python:3.8.13-slim-buster](https://hub.docker.com/layers/python/library/python/3.8.13-slim-buster/images/sha256-6258dcdb5fea7b710bfcfc3c889e022e4c6e9dd0ea962cfa73fbc130eff2c174?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other basic details
```
Debian         GNU/Linux 10 (buster)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
```

### Important Linux Packages Installed
```
aws-cli        2.7.4
curl           7.64.0
git            2.20.1
jq             1.5-1-a5b5cb
nano           3.2
vim            8.1
fish           3.0.2
zsh            5.7.1
R              4.2.0
node           16.15.1
docker         20.10.17
htop           2.2.0
pandoc         2.2.1
less           487
latex          3.14159265-2.6-1.40.19
```

### Python Libraries Installed
```
ipywidgets                          7.6.5
jupyter-server-proxy                3.2.1
jupyterhub                          1.4.2
jupyterlab-git                      0.32.4
jupyterlab-lsp                      3.10.0
jupyterlab                          3.1.11
jupyterlab_widgets                  1.1.0
jupytext                            1.13.8
lckr-jupyterlab-variableinspector   3.0.9
mypy-ls                             0.5.1
nbconvert                           6.2.0
notebook                            6.4.3
pyls-black                          0.4.7
pyls-flake8                         0.4.0
pyls-isort                          0.2.2
pyls-mypy                           0.1.8
python-lsp-black                    1.0.0
python-lsp-server[all]              1.4.1
virtualenv                          20.8.1
```

## Building the Image
To build the image locally just run the docker build command passing in the required build arguments.
```
docker build . -t workspace-python-ds-pack-v1
```
You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).

## Using the Image
- The image can be directly used by using it in the workspace form.
- If you need to install a few more dependencies, or add some use case-specific environment variables into the image, the image can easily be extended.

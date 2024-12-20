#!/bin/bash
set -e

WORKON_HOME=${WORKON_HOME:-/opt/venv}
PYTHON_VENV_PATH=${PYTHON_VENV_PATH:-${WORKON_HOME}/reticulate}
RETICULATE_MINICONDA_ENABLED=${RETICULATE_MINICONDA_ENABLED:-FALSE}

apt-get update && apt-get install -y --no-install-recommends \
    libpython3-dev \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    python3-venv \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

# Some TF tools expect a "python" binary
if [ ! -e /usr/local/bin/python ]; then
    ln -s $(which python3) /usr/local/bin/python
fi

python -m pip --no-cache-dir install --upgrade \
    pip \
    setuptools \
    virtualenv \
    wheel

mkdir -p ${WORKON_HOME}
python -m venv ${PYTHON_VENV_PATH}

## Ensure RStudio inherits this env var
echo "" >> ${R_HOME}/etc/Renviron
echo "WORKON_HOME=${WORKON_HOME}" >> ${R_HOME}/etc/Renviron
echo "RETICULATE_MINICONDA_ENABLED=${RETICULATE_MINICONDA_ENABLED}" >> ${R_HOME}/etc/Renviron

## symlink these so that these are available when switching to a new venv
## -f check for file, -L for link, -e for either
if [ ! -e /usr/local/bin/python ]; then
    ln -s $(which python3) /usr/local/bin/python
fi

if [ ! -e /usr/local/bin/pip ]; then
    ln -s ${PYTHON_VENV_PATH}/bin/pip /usr/local/bin/pip
fi

if [ ! -e /usr/local/bin/virtualenv ]; then
    ln -s ${PYTHON_VENV_PATH}/bin/virtualenv /usr/local/bin/virtualenv
fi

# Install peak-sdk
pip install peak-sdk==1.0.0

## Allow staff-level users to modify the shared environment
chown -R :staff ${WORKON_HOME}
chmod g+wx ${WORKON_HOME}
chown :staff ${PYTHON_VENV_PATH}

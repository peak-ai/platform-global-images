# workspace-r-ds-pack-1.0.0-base-4.3.1
This is the R Data Science pack image made for Workspaces. 
The image runs a [RStudio](https://jupyter.org/hub) server and comes pre-installed pre-installed with all of the essential and most used packages.
The images also comes pre installed with [peak-sdk](https://docs.peak.ai/sdk/).

## Image Details
### Base image
This image uses [rocker/verse:4.3.0](https://hub.docker.com/layers/rocker/verse/4.3.1/images/sha256-9fa09814225979a80c398b5778ecd61d853e0ca788f806c2800d9b336d4634ca?context=explore) as its base which is maintained by [the Rocker Community](https://github.com/rocker-org/rocker).

### OS and other details
```
Ubuntu         22.04.3 LTS (Jammy Jellyfish)
Linux Kernel   5.10.186-179.751.amzn2.x86_64
R              4.3.1
```

### Linux packages installed
```
aws-cli                 2.7.4
curl                    7.81.0
git                     2.34.1
jq                      1.6
nano                    6.2
vim                     8.2
fish                    3.3.1
zsh                     5.8.1
docker                  24.0.6
htop                    3.0.5
pandoc                  3.1.1
less                    590
latex                   3.141592653-2.6-1.40.25
redshift-odbc-driver    1.4.27.1000
snowflake-odbc-driver   2.24.4
```

### Python packages installed
```
peak-sdk                1.0.0
```

### R libraries installed
None

### Environment variables
- `AMAZONREDSHIFTODBCINI`: This represents the location of `amazon.redshiftodbc.ini` file and is set to `/opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini` as we have added the file there.
- `ODBCSYSINI`: This represents the location of `odbcinst.ini` file and is set to `/etc` by default.

### ODBC Setup
- The `odbcinst.ini` file exists in the `/etc` directory, and the `ODBCSYSINI` env has been set accordingly.

You can find more details about setting up ODBC for `redshift` [here](https://docs.aws.amazon.com/redshift/latest/mgmt/configure-odbc-connection.html). For `snowflake` more details can be found [here](https://docs.snowflake.com/en/user-guide/odbc-linux.html)


## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-ds-pack-v1
```

## Using the image
To use the image, select it when configuring the Workspace.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

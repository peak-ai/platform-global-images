# workspace-r-ds-pack-v1
This is the R Data Science pack image made for Workspaces. 
The image runs a [RStudio](https://jupyter.org/hub) server and comes pre-installed pre-installed with all of the essential and most used packages.

## Image Details
### Base image
This image uses [rocker/verse:4.2.0](https://hub.docker.com/layers/verse/rocker/verse/4.2.0/images/sha256-771d3edecc8fe72ed56c41f92656c4062e4ffc79723ede8961ce4ec068f0cbfb?context=explore) as its base which is maintained by [the Rocker Community](https://github.com/rocker-org/rocker).

### OS and other details
```
Ubuntu         20.04.4 LTS (Focal Fossa)
Linux Kernel   4.14.276-211.499.amzn2.x86_64
R              4.2.0
```

### Linux packages installed
```
aws-cli                 2.2.5
curl                    7.68.0
git                     2.25.1
jq                      1.6
nano                    4.8
vim                     8.1
fish                    3.1.0
zsh                     5.8
docker                  20.10.17
htop                    2.2.0
pandoc                  2.17.1.1
less                    551
latex                   3.141592653-2.6-1.40.24
redshift-odbc-driver    1.4.27.1000
snowflake-odbc-driver   2.24.4
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

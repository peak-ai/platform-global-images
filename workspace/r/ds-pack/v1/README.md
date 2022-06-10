# workspace-r-ds-pack-v1
This is the Data Science pack Python image made for workspaces. The image runs a [RStudio](https://jupyter.org/hub) server and comes pre-installed with all the basic most-used packages.

## Image Details
### Base Image
This image uses [rocker/verse:4.2.0](https://hub.docker.com/layers/verse/rocker/verse/4.2.0/images/sha256-771d3edecc8fe72ed56c41f92656c4062e4ffc79723ede8961ce4ec068f0cbfb?context=explore) as its base which is maintained by [the Rocker Community](https://github.com/rocker-org/rocker).

### OS and other basic details
```
Debian         bookworm/sid
Linux Kernel   5.10.104-linuxkit
R              4.2.0
```

### Linux Packages Installed
```
aws-cli                 2.2.5
git                     2.35.1
redshift-odbc-driver    1.4.27.1000
snowflake-odbc-driver   2.24.4
```

### R Libraries Installed
```
odbc                    1.3.3
```

### Environment Variables
- `AMAZONREDSHIFTODBCINI`: This represents the location of `amazon.redshiftodbc.ini` file and is set to `/opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini` as we have added the file there.
- `ODBCSYSINI`: This represents the location of `odbcinst.ini` file and is set to `/etc` by default.

### ODBC Setup
- The `odbcinst.ini` file exists in the `/etc` directory, and the `ODBCSYSINI` env has been set accordingly.

You can find more details about setting up ODBC for `redshift` [here](https://docs.aws.amazon.com/redshift/latest/mgmt/configure-odbc-connection.html). For `snowflake` more details can be found [here](https://docs.snowflake.com/en/user-guide/odbc-linux.html)

## Building the Image
To build the image locally just run the docker build command passing in the required build arguments.
```
docker build . -t workspace-r-ds-pack-v1
```
You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).

## Using the Image
- The image can be directly used by using it in the workspace form.
- If you need to install a few more dependencies, or add some use case-specific environment variables into the image, the image can easily to extended.

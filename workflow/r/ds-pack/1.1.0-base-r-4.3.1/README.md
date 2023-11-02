# workflow-r-ds-pack-1.0.0-base-r-4.3.1
The workflow-r-ds-pack-1.0.0-base-r-4.3.1 image contains a set of the most commonly used dependencies in addition to the essential packages that are required for running Peak Workflows.

## Image Details
### Base image
This image uses [rocker/verse:4.3.1](https://hub.docker.com/layers/rocker/verse/4.3.1/images/sha256-9fa09814225979a80c398b5778ecd61d853e0ca788f806c2800d9b336d4634ca?context=explore) as its base which is maintained by [the Rocker Community](https://github.com/rocker-org/rocker).

### OS and other details
```
Ubuntu         22.04.3 LTS (Jammy Jellyfish)
Linux Kernel   5.10.186-179.751.amzn2.x86_64
R              4.3.1
```

### Linux packages installed
```
aws-cli                 2.7.4
git                     2.34.1
redshift-odbc-driver    1.4.27.1000
snowflake-odbc-driver   2.24.4
```

### R libraries installed
```
rlang               1.0.2
DBI                 1.1.2
odbc                1.3.3
shiny               1.7.1
shinydashboard      0.7.2
shinyWidgets        0.7.0
shinycssloaders     1.0.0
shinyjs             2.1.0
dplyr               1.0.9
plotly              4.10.0
ggplot2             3.3.6
DT                  0.23
stringr             1.4.0
stringi             1.7.6
tidyr               1.2.0
lubridate           1.8.0
glue                1.6.2
scales              1.2.0
tidymodels          0.2.0
```


### Environment variables
The Dockerfile expects the following build arguments:

`AMAZONREDSHIFTODBCINI`
This represents the location of `amazon.redshiftodbc.ini` file. 
The location is set to `/home/peak-user/redshift/amazon.redshiftodbc.ini`
 
`ODBCSYSINI`
This represents the location of `odbcinst.ini` file.
The location is set to `/home/peak-user` by default.

**ODBC setup**

Make sure the `odbcinst.ini` file exists in the `/home/peak-user` directory, and the `ODBCSYSINI` env has been set accordingly.

For more information on setting up ODBC for both Snowflake and Redshift, see:
- [ODBC for Snowflake](https://docs.snowflake.com/en/user-guide/odbc-linux.html)
- [ODBC for Redshift](https://docs.aws.amazon.com/redshift/latest/mgmt/configure-odbc-connection.html)

### Build arguments
The Dockerfile expects the following build argument:

`PEAK_USER_ID`

When a Workflow step runs with the workflow-r-standard image, this is the default user that the workflow step will run with. It is used within the image to create a new user which is then used when running the image across various services in Peak. For more details, see [Non root users and Peak](../../../../knowledge-base/non-root-user.md).

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).

## Building the image
To build the image locally, run the Docker build command and pass in the required build arguments.

    docker build . -t workflow-r-ds-pack-v1 -build-arg PEAK_USER_ID=8877

You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).

## Using the image
To use the image, select it when configuring the Workflow step.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.
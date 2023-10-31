# workflow-r-standard-pack-1.0.0-base-r-4.3.1
The workflow-r-standard-pack image contains the essential packages that are required for running Peak Workflows.

## Image details
### Base image
This image uses [r-base:4.3.1](https://hub.docker.com/layers/library/r-base/4.3.1/images/sha256-06979524919e444f50cf01c8e37403a90c7d06daf988c206c3236049f75fe3bd?context=explore) as its base which is maintained by the [Rocker Community](https://github.com/rocker-org/rocker).

### OS and other basic details
```
Debian         bookworm/sid
Linux Kernel   5.10.104-linuxkit
R              4.3.1
```

### Linux packages installed
```
aws-cli                 2.2.5
git                     2.35.1
redshift-odbc-driver    1.4.27.1000
snowflake-odbc-driver   3.1.1
```

### R librariesinstalled
```
odbc                    1.3.3
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

    docker build . -t workflow-r-standard-pack-v1 -build-arg PEAK_USER_ID=8877

You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).

## Using the image
To use the image, select it when configuring the Workflow step.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

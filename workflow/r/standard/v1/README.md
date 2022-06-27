# workflow-r-standard-v1
This is the smallest R image that allows users to run workflows. This contains the minimal set of packages installed that allows users to make the most of workflows.

## Image Details
### Base Image
This image uses [r-base:4.2.0](https://hub.docker.com/layers/r-base/library/r-base/4.2.0/images/sha256-42c5988e209690d334d3d0117bbabd932a33106f726603642a8612b584de8644?context=explore) as its base which is maintained by [the Rocker Community](https://github.com/rocker-org/rocker).

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
- `AMAZONREDSHIFTODBCINI`: This represents the location of `amazon.redshiftodbc.ini` file and is set to `/home/peak-user/redshift/amazon.redshiftodbc.ini` as we have added the file there.
- `ODBCSYSINI`: This represents the location of `odbcinst.ini` file and is set to `/home/peak-user` by default.

### ODBC Setup
- The `odbcinst.ini` file exists in the `/home/peak-user` directory, and the `ODBCSYSINI` env has been set accordingly.

You can find more details about setting up ODBC for `redshift` [here](https://docs.aws.amazon.com/redshift/latest/mgmt/configure-odbc-connection.html). For `snowflake` more details can be found [here](https://docs.snowflake.com/en/user-guide/odbc-linux.html)

### Build Arguments
The Dockerfile expects the following build arguments:
- `PEAK_USER_ID`: This is the default user that the workflow step runs with when this image is used in the Peak platform. On the Peak platform, this value must be `8877`. Inside the image we create a new user with this user id which is then used when running the image across various services in the Peak Platform.

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).

## Building the Image
To build the image locally just run the docker build command passing in the required build arguments.
```
docker build . -t workflow-r-standard-v1 -build-arg PEAK_USER_ID=8877
```
You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).
You can find more details about building an image in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/).

## Using the Image
- The image can be directly used by using it in the workflow step form.
- If you need to install a few more dependencies, or add some use case-specific environment variables into the image, the image can easily to extended.

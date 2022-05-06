# workflow-r-slim-v1
This is the smallest R image that allows users to run workflows.

## Image Details
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
snowflake-odbc-drive    2.24.4
```

### R Libraries Installed
```
odbc                    1.3.3
```

### Build Arguments
The Dockerfile expectes the following build arguments:
- `PEAK_USER_ID`: This is the default user that the workflow step runs with when this image is used in the platform. On the platform this value must be `8877`.

## Building the Image
Building the image is quite straight-forward, just run the docker build command passing in the required build arguments.
```
docker build . -t workflow-r-slim-v1 -build-arg PEAK_USER_ID=8877
```

## Using the Image
- The image can be directly used by using it in the workflow step form.
- If you need to install a few more dependencies, or add some usecase-specific environment variables into the image, the image can easily to extended.
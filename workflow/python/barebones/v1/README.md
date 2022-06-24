# workflow-python-barebones-v1
This is the smallest Python image that allows users to run workflows. This contains the minimal set of packages installed that allows users to make the most of workflows.

## Image Details
### Base Image
This image uses [python:3.10.5-slim-buster](https://hub.docker.com/layers/python/library/python/3.10.5-slim-buster/images/sha256-e826527702aa0f69734a796bc950943106c6edf78e6c7ffc13c4d70d4025fa15?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other basic details
```
Debian         GNU/Linux 10 (buster)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
```

### Linux Packages Installed
```
aws-cli        2.2.5
curl           7.64.0
git            2.20.1
jq             1.5-1-a5b5cbe
```

### Python Libraries Installed
```
boto3                 1.22.7
psycopg2              2.9.3
snowflake-sqlalchemy  1.3.2
sqlalchemy            1.4.36
```

### Build Arguments
The Dockerfile expects the following build arguments:
- `PEAK_USER_ID`: This is the default user that the workflow step runs with when this image is used in the Peak platform. On the Peak platform, this value must be `8877`. Inside the image we create a new user with this user id which is then used when running the image across various services in the Peak Platform.

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).

## Building the Image
To build the image locally just run the docker build command passing in the required build arguments.
```
docker build . -t workflow-python-barebones-v1 --build-arg PEAK_USER_ID=8877
```

## Using the Image
- The image can be directly used by using it in the workflow step form.
- If you need to install a few more dependencies, or add some use case-specific environment variables into the image, the image can easily be extended.

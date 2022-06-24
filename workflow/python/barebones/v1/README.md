# workflow-python-standard-v1
The workflow-python-standard image contains the essential packages that are required for running Peak Workflows.

## Image details
### Base image
This image uses [python:3.8.13](https://hub.docker.com/layers/python/library/python/3.8.13/images/sha256-bc07b023b1bf19aa43e8919bff2dcb9406cc2fcf83c1f7e472e4a87a2e4dd1ae?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other basic details
```
Debian         11 (bullseye)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
```

### Linux packages installed
```
aws-cli        2.2.5
git            3.8.8
```

### Python libraries installed
```
boto3          1.22.7
psycopg2       2.9.3
sqlalchemy     1.4.36
```

### Build arguments
The Dockerfile expects the following build argument:

`PEAK_USER_ID`

On the Peak platform, its value must be `8877`. 

When a Workflow step runs with the workflow-python-basic image, this is the default user that the workflow step will run with. It is used within the image to create a new user which is then used when running the image across various services in Peak.

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).

## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-barebones-v1 --build-arg PEAK_USER_ID=8877
```

## Using the image
To use the image, select it when configuring the Workflow step.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

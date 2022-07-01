# workflow-python-standard-pack-v1
The workflow-python-standard-pack image contains the essential packages that are required for running Peak Workflows.

## Image details
### Base image
This image uses [python:3.8.13-slim-buster](https://hub.docker.com/layers/python/library/python/3.8.13-slim-buster/images/sha256-6258dcdb5fea7b710bfcfc3c889e022e4c6e9dd0ea962cfa73fbc130eff2c174?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other basic details
```
Debian         GNU/Linux 10 (buster)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
```

### Linux packages installed
```
aws-cli        2.2.5
curl           7.74.0
git            2.30.2
jq             1.6
unzip          6.00
```

### Python libraries installed
```
boto3                 1.22.7
psycopg2              2.9.3
snowflake-sqlalchemy  1.3.2
sqlalchemy            1.4.36
```

### Build arguments
The Dockerfile expects the following build argument:

`PEAK_USER_ID`

When a Workflow step runs with the workflow-python-basic image, this is the default user that the workflow step will run with. It is used within the image to create a new user which is then used when running the image across various services in Peak. For more details, see [Non root users and Peak](../../../../knowledge-base/non-root-user.md).

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).

## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-standard-pack-v1 --build-arg PEAK_USER_ID=8877
```

## Using the image
To use the image, select it when configuring the Workflow step.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

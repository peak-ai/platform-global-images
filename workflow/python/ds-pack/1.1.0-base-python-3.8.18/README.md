# workflow-python-ds-pack-1.1.0-base-python-3.8.18
The workflow-python-ds-pack image contains a set of the most commonly used dependencies in addition to the essential packages that are required for running Peak Workflows.

## Image details
### Base image
This image uses [python:3.8.18-slim-bookworm](https://hub.docker.com/layers/library/python/3.8.18-slim-bookworm/images/sha256-f8a12edddd4fb9c9fd38cd7147c5861a596dee5a4852b6bded3d1d6e2c8987bd?context=explore) as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other details
```
Debian         GNU/Linux 12 (bookworm)
Linux Kernel   5.10.186-179.751.amzn2.x86_64
Python         3.8.18
```

### Linux packages installed
```
aws-cli        2.7.4
curl           7.88.1
git            2.39.2
jq             1.6
unzip          6.0-28
groff          1.22.4-10
openssl        3.0.11-1~deb12u2
```

### Python libraries installed
```
boto3                         1.26.157
pandas                        1.4.2
psycopg2                      3.1.12
sklearn                       0.0
sqlalchemy-redshift           0.8.14
snowflake-sqlalchemy          1.5.0
SQLAlchemy                    1.4.5
peak-sdk                      1.1.0
dbt-snowflake                 1.6.4
dbt-redshift                  1.6.2
dbt-duckdb                    1.6.2
oscrypto                      git+https://github.com/wbond/oscrypto.git@d5f3437ed24257895ae1edd9e503cfb352e635a8
```


### Build arguments
The Dockerfile expects the following build argument:

`PEAK_USER_ID`

When a Workflow step runs with the workflow-python-basic image, this is the default user that the workflow step will run with. It is used within the image to create a new user which is then used when running the image across various services in Peak. For more details, see [Non root users and Peak](../../../../knowledge-base/non-root-user.md).

You can find more details about build arguments in the [Docker documentation](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg).


## Building the image
To build the image locally, run the docker build command and pass in the required build arguments:
```
docker build . -t workflow-python-ds-pack-1.1.0-base-python-3.8.18 --build-arg PEAK_USER_ID=8877
```

## Using the image
To use the image, select it when configuring the Workflow step.
If you need to install additional dependencies or add some use case specific environment variables, it can be easily extended.

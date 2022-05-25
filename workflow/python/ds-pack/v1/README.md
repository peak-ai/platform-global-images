# workflow-python-ds-pack-v1
This image contains a set of most used dependencies

## Image Details
### Base Image
This image uses `python:3.8.13` as its base which is maintained by [the Docker Community](https://github.com/docker-library/python).

### OS and other basic details
```
Debian         11 (bullseye)
Linux Kernel   5.10.104-linuxkit
Python         3.8.13
```

### Linux Packages Installed
```
aws-cli        2.2.5
git            3.8.8
```

### Python Libraries Installed
```
boto3                         1.23.7
pandas                        1.4.2
psycopg2                      2.9.3
snowflake                     0.0.3
snowflake-connector-python    2.7.7
sklearn                       0.0
SQLAlchemy                    1.4.36
```

### Build Arguments
The Dockerfile expects the following build arguments:
- `PEAK_USER_ID`: This is the default user that the workflow step runs with when this image is used in the Peak platform. On the Peak platform, this value must be `8877`. Inside the image we create a new user with this user id which is then used when running the image across various services in the Peak Platform.

## Building the Image
Building the image is quite straightforward, just run the docker build command passing in the required build arguments.
```
docker build . -t workflow-python-ds-pack-v1 --build-arg PEAK_USER_ID=8877
```

## Using the Image
- The image can be directly used by using it in the workflow step form.
- If you need to install a few more dependencies, or add some use case-specific environment variables into the image, the image can easily to extended.
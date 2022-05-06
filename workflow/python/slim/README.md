# workflow-python-slim-v1
This is the smallest Python image that allows can be used to run a workflow.

## Image Details
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
boto3          1.22.7
psycopg2       2.9.3
sqlalchemy     1.4.36
```

### Build Arguments
The Dockerfile expectes the following build arguments:
- `PEAK_USER_ID`: This is the default user that the workflow step runs with when this image is used in the platform. On the platform this value must be `8877`.

## Building the Image
Building the image is quite straight-forward, just run the docker build command passing in the required build arguments.
```
docker build . -t workflow-python-slim-v1 -build-arg PEAK_USER_ID=8877
```

## Using the Image
- The image can be directly used by using it directly into the workflow step form.
- If you need to install a few more dependencies, or add some usecase-specific environment variables into the image, the image can easily to extended.
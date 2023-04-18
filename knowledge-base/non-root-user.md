# Non-root users and Peak
When configuring Docker images for use by Workflows and APIs, they must include a default non-root user.
This is done by using the `PEAK_USER_ID` build argument which represents the User ID that the non-root user should be created with. This is the User ID that the resources on the platform requires the container to run with.

## Creating an image with a non-root user
1. Add the following block at the top of your Dockerfile right after the `FROM` statement. This adds a new user (`peak-user`) in the image, creates its home directory, and gives the user ownership of that directory. It also changes the working directory to the user's home directory.
   ```Dockerfile
   ARG PEAK_USER_ID
   ENV PEAK_USER_ID=$PEAK_USER_ID

   # Add a new user, this must have the User ID of PEAK_USER_ID
   RUN id peak-user || useradd -l -m -d /home/peak-user -u $PEAK_USER_ID peak-user

   # Give the new user the permissions to the directory that it might need
   RUN chown -R peak-user:peak-user /home/peak-user

   # Set the working directory
   WORKDIR /home/peak-user
   ```
2. If you are copying over any files using the `COPY` or `ADD` command, remember to add `--chown` flag to it so that the user gets ownership of the files that are getting copied over. Here's how the `COPY` and `ADD` commands should look like -
   ```Dockerfile
   COPY --chown=peak-user . .
   ADD --chown=peak-user . .
   ```
3. If you need access to some other folders or files in the container, you will need to give users the required permissions. It can easily be done by running the `chown` command. If the user needs access to the `/var/log` directory, it can be done using the following statement
   ```Dockerfile
   RUN chown -R peak-user:peak-user /var/log
   ```
4. Add the following block to the bottom of the Dockerfile. This runs the `chown` command again to give the user ownership of any files that were added after the first block ran. It also sets the default user for the container to the `peak-user`
   ```Dockerfile
   RUN chown -R peak-user:peak-user /home/peak-user
   USER $PEAK_USER_ID
   ```

## Example
Here's an example Dockerfile for your reference
```Dockerfile
FROM python:3.8.13-slim-buster

# ------------------------------------------------
# Non-Root User Creation!
# ------------------------------------------------

ARG PEAK_USER_ID
ENV PEAK_USER_ID=$PEAK_USER_ID

# Add a new user, this must have the User ID of PEAK_USER_ID
RUN id peak-user || useradd -l -m -d /home/peak-user -u $PEAK_USER_ID peak-user

# Give the new user the permissions to the directory that it might need
RUN chown -R peak-user:peak-user /home/peak-user

# Set the working directory
WORKDIR /home/peak-user

# ------------------------------------------------
# User Created!
# ------------------------------------------------

RUN apt-get update && \
  apt-get install --no-install-recommends curl dnsutils unzip git jq libpq-dev python-dev build-essential -y 

# Install AWS CLI
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.2.5.zip" -o "awscliv2.zip" \
  && unzip -q awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

# Install all the required Python libraries
COPY --chown=peak-user:peak-user requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# ------------------------------------------------
# Set Permissions and make the user the default
# ------------------------------------------------

ENV PATH="${PATH}:/home/peak-user/.local/bin"
RUN chown -R peak-user:peak-user /home/peak-user
USER $PEAK_USER_ID

# ------------------------------------------------
# All Done!
# ------------------------------------------------
```

## References
You can refer to the following resources to learn more about the Docker commands we have used:
- [RUN](https://docs.docker.com/engine/reference/builder/#run)
- [WORKDIR](https://docs.docker.com/engine/reference/builder/#workdir)
- [COPY](https://docs.docker.com/engine/reference/builder/#copy)
- [ADD](https://docs.docker.com/engine/reference/builder/#add)
- [USER](https://docs.docker.com/engine/reference/builder/#user)

You can refer to the following resources to learn more about the Linux commands we have used:
- [chown](https://linux.die.net/man/1/chown)
- [useradd](https://man7.org/linux/man-pages/man8/useradd.8.html)
- [id](https://man7.org/linux/man-pages/man1/id.1.html)

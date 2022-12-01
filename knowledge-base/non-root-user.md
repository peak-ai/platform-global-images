# Non-root users and Peak
When configuring Docker images for use by Workflows and APIs, they must include a default non-root user.
This is done by using the `PEAK_USER_ID` build argument with a fixed value.
## Creating an image with a non-root user
1. Add `PEAK_USER_ID` as a build argument. If required, set it as an `ENV`.
   ```Dockerfile
   ARG PEAK_USER_ID
   ENV PEAK_USER_ID=$PEAK_USER_ID
   ```
2. Create a new user. This command checks whether the user exists and if it does not it adds the user and creates a home directory for the user at the path - `/home/peak-user`. Change the working directory to the user's home directory so that all new files are copied over/added in this directory.
   ```Dockerfile
   RUN id peak-user || useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user
   WORKDIR /home/peak-user
   ```
3. Change the owner of the home directory to the new user. If required, give the user ownership of other directories or files.
   ```Dockerfile
   RUN chown -R peak-user:peak-user /home/peak-user
   ```
4. Set the working directory
   ```Dockerfile
   USER $PEAK_USER_ID
   ```
5. One important thing to remember is that when running the `COPY` command, we need to pass `--chown=peak-user` so that the user gets the required privileges on the files that are copied over. Here's how the command should look like
   ```Dockerfile
   COPY --chown=peak-user . .
   ```
---
Here's an example Dockerfile for your reference
```Dockerfile
FROM python:3.8.13-slim-buster

# ----------------------------------------
# Non-Root User Creation!
# ----------------------------------------

ARG PEAK_USER_ID
ENV PEAK_USER_ID=$PEAK_USER_ID

# Add a new user, this must have the UserId of PEAK_USER_ID
RUN id peak-user || useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user

# Give the new user the permissions to the directory that it might need
RUN chown -R peak-user:peak-user /home/peak-user

# Set the working directory
WORKDIR /home/peak-user

# ----------------------------------------
# User Created!
# ----------------------------------------

RUN apt-get update && \
  apt install curl dnsutils unzip git jq libpq-dev python-dev build-essential -y 

# Install AWS CLI
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.2.5.zip" -o "awscliv2.zip" \
  && unzip -q awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

# Install all the required Python libraries
COPY --chown=peak-user:peak-user requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# -------------------------------------------
# Set Permissions and make user the default
# -------------------------------------------

ENV PATH="${PATH}:/home/peak-user/.local/bin"
RUN chown -R peak-user:peak-user /home/peak-user
USER $PEAK_USER_ID

# ----------------------------------------
# All Done!
# ----------------------------------------
```
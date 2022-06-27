FROM python:3.8.13-slim-buster

RUN apt-get update && \
  apt install curl dnsutils unzip git jq libpq-dev python-dev build-essential -y 

# Install AWS CLI
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.2.5.zip" -o "awscliv2.zip" \
  && unzip -q awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

# Install all the required Python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# -----------------------------------------
# Non-Root User Creation!!
# -----------------------------------------
ARG PEAK_USER_ID
ENV PEAK_USER_ID=$PEAK_USER_ID

# Add a new user, this must have the UserId of PEAK_USER_ID
RUN useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user

# Give the new user the permissions to the directory that it might need
RUN chown -R peak-user:peak-user /home/peak-user

# Set the working directory
WORKDIR /home/peak-user

# Set the user as default for the container
USER $PEAK_USER_ID

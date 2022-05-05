FROM r-base:4.2.0

# ----------------------------------------
# Non-Root User Creation!
# ----------------------------------------
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

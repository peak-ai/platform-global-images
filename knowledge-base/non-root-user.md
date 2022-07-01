# Non-root users and Peak
When configuring Docker images for use by Workflows and APIs, they must include a default non-root user.
This is done by using the `PEAK_USER_ID` build argument with a fixed value.
## Creating an image with a non-root user
 
 1. Add `PEAK_USER_ID` as a build argument.
  If required, set it as an `ENV`.
    ```Dockerfile
    ARG PEAK_USER_ID
    ENV PEAK_USER_ID=$PEAK_USER_ID
    ```
 2. Create a new user and a home directory with the given User ID.
    ```Dockerfile
    RUN useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user
    ```
  
 3. Change the owner of the home directory to the new user. 
 If required, give the user ownership of other directories or files.
    ```Dockerfile
    RUN chown -R peak-user:peak-user /home/peak-user
    ```
 4. Set the new user as the default user for the image.
    ```Dockerfile
    USER $PEAK_USER_ID
    ```
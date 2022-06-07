# Non-Root Users and Peak Platform
- On the Peak platform, it is compulsory to set up a non-root user in the images for Workflows and API Deployment.
- The User ID for the user has to be a fixed value which is available as a build argument - `PEAK_USER_ID` when buulding the image on the platform.
- To create an image with non-root user follow the following steps:
  - Accept `PEAK_USER_ID` as a build argument. If required set it as an env as well
    ```Dockerfile
    ARG PEAK_USER_ID
    ENV PEAK_USER_ID=$PEAK_USER_ID
    ```
  - Create a new user with the given User ID. Remember to create a home directory for the user as well.
    ```Dockerfile
    RUN useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user
    ```
  - Give permission of the home directory to the newly created user. You can add permissions to any other directory/file as required.
    ```Dockerfile
    RUN chown -R peak-user:peak-user /home/peak-user
    ```
  - Finally, set the newly created user as the default user for the image.
    ```Dockerfile
    USER $PEAK_USER_ID
    ```
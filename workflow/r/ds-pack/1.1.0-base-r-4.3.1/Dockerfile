FROM rocker/verse:4.3.1

RUN apt-get update && \
  apt-get install -y git unixodbc unixodbc-dev && \
  ln -s /usr/lib/x86_64-linux-gnu/libodbcinst.so /usr/lib/x86_64-linux-gnu/libodbcinst.so.1

# Install aws-cli
RUN wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.7.4.zip -O awscliv2.zip \
  && unzip -q awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

# Install Redshift ODBC Driver
RUN wget https://s3.amazonaws.com/redshift-downloads/drivers/odbc/1.5.7.1007/AmazonRedshiftODBC-64-bit-1.5.7.1007-1.x86_64.deb -O AmazonRedshiftODBC.deb \
  && apt install ./AmazonRedshiftODBC.deb \
  && rm ./AmazonRedshiftODBC.deb

# Install Snowflake ODBC Driver
RUN wget https://sfc-repo.snowflakecomputing.com/odbc/linux/3.1.1/snowflake-odbc-3.1.1.x86_64.deb -O SnowflakeODBC.deb \
  && apt install -y ./SnowflakeODBC.deb \
  && rm ./SnowflakeODBC.deb

# install packages
COPY packages.R /tmp/packages.R
RUN Rscript /tmp/packages.R \
  && rm /tmp/packages.R

# ----------------------------------------
# Non-Root User Creation!
# ----------------------------------------
ARG PEAK_USER_ID
ENV PEAK_USER_ID=$PEAK_USER_ID

# Add a new user, this must have the UserId of PEAK_USER_ID
RUN useradd -m -d /home/peak-user -u $PEAK_USER_ID peak-user

# Give the new user the permissions to the directory that it might need
RUN chown -R peak-user:peak-user /home/peak-user

# Copy all ODBC files to user's home directory

COPY odbcinst.ini /home/peak-user/odbcinst.ini 
COPY amazon.redshiftodbc.ini /home/peak-user/amazon.redshiftodbc.ini

ENV AMAZONREDSHIFTODBCINI=/home/peak-user/amazon.redshiftodbc.ini
ENV ODBCSYSINI=/home/peak-user

# Set the working directory
WORKDIR /home/peak-user

# Set the user as default for the container
USER $PEAK_USER_ID

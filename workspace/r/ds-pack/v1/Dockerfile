FROM rocker/verse:4.2.0

# Adding dependencies for top 100 CRAN Packages
RUN apt-get update \
    # installation requirements
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    gnupg2 \
    software-properties-common \
    lsb-release \
    # docker repo
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    docker-ce \
    gdal-bin \
    git \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libgdal-dev \
    libgeos-dev \
    libharfbuzz-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libproj-dev \
    libssh2-1-dev \
    libssl-dev \
    libtiff-dev \
    libudunits2-dev \
    libxml2-dev \
    make \
    pandoc \
    zlib1g-dev \
    # Platform Essential Packages
    curl \
    jq \
    wget \
    # Add extras for helpfulness
    fish \
    htop \
    nano \
    nano \
    vim \
    zsh \
    # For AWS CLI help
    groff \
    # ODBC Driver Manager (for snowflake)
    unixodbc \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python + all required packages
COPY install_packages.sh /tmp/install_packages.sh
RUN bash /tmp/install_packages.sh

# install AWS CLI v2
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.7.4.zip" -o "awscliv2.zip" \
    && unzip -q awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip
# don't use pager AWS CLI as will stop scripts wrapping AWSCLI
ENV AWS_PAGER=""

# https://docs.aws.amazon.com/redshift/latest/mgmt/configure-odbc-connection.html#install-odbc-driver-linux
# Install Redshift ODBC Driver
RUN wget https://s3.amazonaws.com/redshift-downloads/drivers/odbc/1.4.52.1000/AmazonRedshiftODBC-64-bit-1.4.52.1000-1.x86_64.deb -O AmazonRedshiftODBC.deb \
  && apt install ./AmazonRedshiftODBC.deb \
  && rm ./AmazonRedshiftODBC.deb

# Install Snowflake ODBC Driver
RUN wget https://sfc-repo.snowflakecomputing.com/odbc/linux/2.24.4/snowflake-odbc-2.24.4.x86_64.deb -O SnowflakeODBC.deb \
  && apt install -y ./SnowflakeODBC.deb \
  && rm ./SnowflakeODBC.deb

COPY odbcinst.ini /etc/odbcinst.ini
COPY amazon.redshiftodbc.ini /opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV ODBCSYSINI=/etc
ENV AMAZONREDSHIFTODBCINI=/opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini

# Make git not care about file permission changes
RUN git config --global credential.helper store \
    && git config --global core.filemode false

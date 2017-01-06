FROM ruby:2.3

MAINTAINER Leon Jacobs <leonja511@gmail.com>

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# install the required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \

        # metasploit dev dependencies to compile ruby extensions
        build-essential \
        libreadline-dev \
        libssl-dev \
        libpq5 \
        libpq-dev \
        libsqlite3-dev \ 
        libpcap-dev \
        zlib1g-dev \
        libxml2-dev \
        libxslt1-dev \
        libyaml-dev \
        zlib1g-dev \

        # postgres for faster searches etc.
        postgresql \

        # other dependencies 
        git \
        vim && \

        # cleanup time!
        apt-get clean && \
        rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# clone and install the metasploit gems
RUN git clone https://github.com/rapid7/metasploit-framework.git /metasploit-framework && \
    cd /metasploit-framework && \
    bundle install

# configure the database. the steps are basically from:
#   https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment#set-up-postgresql
ADD metasploitdb/pg_utf8.sql /

# run the sql and create the msf database && user.
RUN /etc/init.d/postgresql start && \
    su postgres -c "psql -f /pg_utf8.sql" && \
    su postgres -c "psql -c \"CREATE USER msf WITH PASSWORD 'msf';\"" && \
    su postgres -c "createdb -O msf msf"

# add the db configuration
ADD metasploitdb/database.yml /root/.msf4/

# expose some ports for reverse shells etc
EXPOSE 80
EXPOSE 443
EXPOSE 8443
EXPOSE 4444
EXPOSE 4445

# add the entrypoint
ADD docker-entrypoint.sh /

CMD ["/docker-entrypoint.sh"]

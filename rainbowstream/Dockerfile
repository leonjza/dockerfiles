FROM python:3.6

MAINTAINER Leon Jacobs <leonja511@gmail.com>

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# install operating system dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \

    python-dev \
    libjpeg-dev \
    libfreetype6 \
    libfreetype6-dev \
    zlib1g-dev

# install reainbowstream
RUN pip3 install rainbowstream

CMD ["rainbowstream"]

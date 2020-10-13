FROM telegraf:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent python3 python3-pip python3-setuptools python3-wheel python3-distutils software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install requests pyyaml requests unidecode

RUN mkdir /usr/local/py && wget https://raw.githubusercontent.com/bruno78310/Freebox-Revolution-Monitoring/master/freebox_059.py -O /usr/local/py/freebox_059.py

RUN apt-get install gnupg1 apt-transport-https dirmngr

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
RUN echo "deb https://ookla.bintray.com/debian $(lsb_release -sc) main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
RUN apt-get update
RUN apt-get install speedtest

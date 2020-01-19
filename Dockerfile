FROM debian:buster

RUN set -e && \
    apt-get update -y && \
    apt-get install -y python python-dev python-pip

RUN pip install pip && pip install PyYAML

RUN ln -s /usr/bin/python /usr/bin/python2.6

COPY /*.py /build/
COPY /daemon /build/daemon
WORKDIR /build

ENTRYPOINT ["/build/UnofficialDDNS.py"] 
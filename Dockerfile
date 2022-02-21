FROM debian:stable

RUN apt update -y
RUN apt install -y alien
WORKDIR /tmp

RUN mkdir img
RUN mkdir src
RUN mkdir assets
RUN mkdir assets/img

COPY src/* src
COPY assets/* assets
COPY make_deb.sh .
COPY README.md .
COPY LICENSE .

RUN chmod +x make_deb.sh
RUN ./make_deb.sh

RUN alien -r ZeroTier-GUI.deb && mv *.rpm ZeroTier-GUI.rpm
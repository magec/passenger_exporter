FROM debian:stretch-slim
MAINTAINER stn@soundcloud.com

# Install dependencies
RUN apt-get update \
    && apt-get install -y apt-transport-https gnupg \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 \
    && echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger stretch main' > /etc/apt/sources.list.d/passenger.list \
    && apt-get update \
    && apt-get install  -o Dpkg::Options::=--force-confdef -yq --no-install-recommends passenger=1:6.0.8-1~stretch1 libxml2-utils
ADD passenger_exporter_nginx /
ENTRYPOINT [ "/passenger_exporter_nginx" ]

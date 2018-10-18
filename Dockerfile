FROM ubuntu:14.04

RUN apt update \
  && apt upgrade -y -s \
  && apt install -y curl ca-certificates gnupg \
  && echo "deb http://repo.cw-ngv.com/stable binary/" > /etc/apt/sources.list.d/clearwater.list \
  && curl -L http://repo.cw-ngv.com/repo_key -o key \
  && apt-key add ./key \
  && apt update 

RUN apt install -y --force-yes clearwater-live-verification 

CMD bash

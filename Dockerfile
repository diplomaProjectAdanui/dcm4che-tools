FROM debian:11.1-slim as download

ENV dcm4che_version="5.24.2"

RUN apt update \
  && apt install -y wget unzip \
  && wget -O dcm4che.zip "https://sourceforge.net/projects/dcm4che/files/dcm4che3/${dcm4che_version}/dcm4che-${dcm4che_version}-bin.zip/download" \
  && unzip -q dcm4che.zip \
  && rm dcm4che.zip \
  && mv "/dcm4che-${dcm4che_version}" /dcm4che \
  && find /dcm4che -type f -name "*.bat" -exec rm -f {} \;

FROM openjdk:18-slim

RUN apt update \
  && apt upgrade -y \
  && apt install -y wget \
  && mkdir /input /output

COPY --from=download /dcm4che /dcm4che
ENV PATH="/dcm4che/bin:${PATH}"

ENTRYPOINT [ "/bin/bash" ]
FROM debian:11.1-slim as download

ENV dcm4che_version="5.24.2"

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget=1.21-1 unzip=6.0-26 ca-certificates=20210119 \
  && wget -q -O dcm4che.zip "https://sourceforge.net/projects/dcm4che/files/dcm4che3/${dcm4che_version}/dcm4che-${dcm4che_version}-bin.zip/download" \
  && unzip -q dcm4che.zip \
  && rm dcm4che.zip \
  && mv "/dcm4che-${dcm4che_version}" /dcm4che \
  && find /dcm4che -type f -name "*.bat" -exec rm -f {} \;

FROM openjdk:18-slim

RUN apt-get update \
  && apt-get upgrade -y --no-install-recommends \
  && apt-get install -y --no-install-recommends wget=1.21-1 \
  && mkdir /input /output

COPY --from=download /dcm4che /dcm4che
ENV PATH="/dcm4che/bin:${PATH}"

ENTRYPOINT [ "/bin/bash" ]
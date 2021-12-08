FROM debian:11.1-slim as download

ENV dcm4che_version="5.24.2"

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget unzip ca-certificates \
  && wget -q -O dcm4che.zip "https://sourceforge.net/projects/dcm4che/files/dcm4che3/${dcm4che_version}/dcm4che-${dcm4che_version}-bin.zip/download" \
  && unzip -q dcm4che.zip \
  && rm dcm4che.zip \
  && mv "/dcm4che-${dcm4che_version}" /dcm4che \
  && find /dcm4che -type f -name "*.bat" -exec rm -f {} \;

FROM openjdk:18-slim
LABEL org.opencontainers.image.authors="domi.m@outlook.com" \
  org.opencontainers.image.url="https://github.com/diplomaProjectAdanui/dcm4che-tools" \
  org.opencontainers.image.documentation="https://github.com/diplomaProjectAdanui/dcm4che-tools/blob/main/README.md" \
  org.opencontainers.image.source="https://github.com/diplomaProjectAdanui/dcm4che-tools" \
  org.opencontainers.image.licenses="MPL-1.1" \
  org.opencontainers.image.title="dcm4che-tools" \
  org.opencontainers.image.base.name="openjdk:18-slim"

RUN apt-get update \
  && apt-get upgrade -y --no-install-recommends \
  && apt-get install -y --no-install-recommends wget \
  && mkdir /input /output

COPY --from=download /dcm4che /dcm4che
ENV PATH="/dcm4che/bin:${PATH}"

ENTRYPOINT [ "/bin/bash" ]
# escape=`

FROM lltest/gamesvr-csgo

HEALTHCHECK NONE

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

LABEL maintainer="Frederik Kejs - head9x@head9x.dk" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/Head9x/LANstuff" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="NextLAN" `
      org.label-schema.description="NextLAN CSGO tournament server - based on LacledesLAN" `
      org.label-schema.vcs-url="https://github.com/Head9x/LANstuff/gameservers/CSGOtournament"

# `RUN true` lines are work around for https://github.com/moby/moby/issues/36573
COPY --chown=CSGO:root /dist/csgo-ll-tourney-configs /app/csgo
RUN true

COPY --chown=CSGO:root /dist/linux/ll-tests/gamesvr-csgo-tourney.sh /app/ll-tests/gamesvr-csgo-tourney.sh
RUN true

# UPDATE USERNAME & ensure permissions
RUN usermod -l CSGOTourney CSGO &&`
    chmod +x /app/ll-tests/*.sh &&`
    mkdir -p /app/csgo/logs &&`
    chmod 774 /app/csgo/logs

USER CSGOTourney

WORKDIR /app/

CMD ["/bin/bash"]

ONBUILD USER root

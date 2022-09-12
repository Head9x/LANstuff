# escape=`
FROM lacledeslan/gamesvr-csgo-tourney

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

LABEL maintainer="Frederik Kejs - head9x@head9x.dk" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/Head9x/LANstuff" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="NextLAN" `
      org.label-schema.description="NextLAN CSGO tournament server -- Get5 based - based on LacledesLAN" `
      org.label-schema.vcs-url="https://github.com/Head9x/LANstuff/gameservers/CSGOtournament"

# `RUN true` lines are work around for https://github.com/moby/moby/issues/36573

# Copy in linux/metamod
COPY --chown=CSGOTourney:root ./dist/linux/metamod/addons/ /app/csgo/addons/
RUN true

# Copy in os-agnostic metamod vdf
COPY --chown=CSGOTourney:root ./dist/metamod/addons/ /app/csgo/addons/
RUN true

# Copy in linux/sourcemod
COPY --chown=CSGOTourney:root ./dist/linux/sourcemod/ /app/csgo/
RUN true

# Copy in os-agnostic global LL sourcemod configs
COPY --chown=CSGOTourney:root ./dist/sourcemod-ll-configs/ /app/csgo/
RUN true

# Copy in os-agnostic get5 sourcemod plugin
COPY --chown=CSGOTourney:root ./dist/get5/ /app/csgo/
RUN true

# Copy in os-agnostic get5 LL configs
COPY --chown=CSGOTourney:root ./dist/get5-ll-configs/ /app/csgo/
RUN true

# Copy in tests
COPY --chown=CSGOTourney:root /dist/linux/ll-tests/gamesvr-csgo-tourney-get5.sh /app/ll-tests/gamesvr-csgo-tourney-get5.sh
RUN true

# UPDATE USERNAME & ensure permissions
RUN usermod -l CSGOTourneyGet5 CSGOTourney &&`
    chmod +x /app/ll-tests/*gamesvr-csgo-tourney-get5.sh

USER CSGOTourneyGet5

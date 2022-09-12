# escape=`

FROM head9x/csgo-tournament

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

LABEL maintainer="Frederik Kejs - head9x@head9x.dk" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/Head9x/LANstuff" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="NextLAN" `
      org.label-schema.description="NextLAN CSGO tournament server -- warmod overtime - based on LacledesLAN" `
      org.label-schema.vcs-url="https://github.com/Head9x/LANstuff/gameservers/CSGOtournament"
#                          ____
#                       _.' :  `._
#                   .-.'`.  ;   .'`.-.             Begun, the overtime hacks have
#          __      / : ___\ ;  /___ ; \      __
#        ,'_ ""--.:__;".-.";: :".-.":__;.--"" _`,
#        :' `.t""--.. '<@.`;_  ',@>` ..--""j.' `;
#             `:-.._J '-.-'L__ `-- ' L_..-;'
#               "-.__ ;  .-"  "-.  : __.-"
#                   L ' /.------.\ ' J
#                    "-.   "--"   .-"
#                   __.l"-:_JL_;-";.__
RUN FILE="/app/csgo/cfg/gamemode_competitive_server.cfg" &&`
        echo "//===OVERTIME HACK" >> $FILE &&`
        echo "mp_maxrounds 7" >> $FILE &&`
        echo "mp_startmoney 10000" >> $FILE

# UPDATE USERNAME & ensure permissions
RUN usermod -l CSGOTourneyOvertime CSGOTourney &&`
    chmod +x /app/ll-tests/*.sh &&`
    chmod 774 /app/csgo/cfg/*.cfg

USER CSGOTourneyOvertime

WORKDIR /app/

CMD ["/bin/bash"]

ONBUILD USER root

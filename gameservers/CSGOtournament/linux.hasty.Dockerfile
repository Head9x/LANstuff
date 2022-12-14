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
      org.label-schema.description="NextLAN CSGO tournament server -- hasty mode - based on LacledesLAN" `
      org.label-schema.vcs-url="https://github.com/Head9x/LANstuff/gameservers/CSGOtournament"

#                          ____
#                       _.' :  `._
#                   .-.'`.  ;   .'`.-.             Begun, the hasty hacks have
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
        echo "bot_difficulty 0" >> $FILE &&`
        echo "bot_quota 2" >> $FILE &&`
        echo "bot_zombie 1" >> $FILE &&`
        echo "mp_buytime 5" >> $FILE &&`
        echo "mp_c4timer 25" >> $FILE &&`
        echo "mp_defuser_allocation 2" >> $FILE &&`
        echo "mp_freezetime 5" >> $FILE &&`
        echo "mp_halftime_duration 8" >> $FILE &&`
        echo "mp_match_restart_delay 12" >> $FILE &&`
        echo "mp_maxrounds 4" >> $FILE &&`
        echo "mp_overtime_maxrounds 3" >> $FILE &&`
        echo "mp_win_panel_display_time 3" >> $FILE &&`
        echo "sv_cheats 1" >> $FILE &&`
    FILE="/app/csgo/cfg/server.cfg" &&`
        echo "sv_cheats 1" >> $FILE

# UPDATE USERNAME & ensure permissions
RUN usermod -l CSGOTourneyHasty CSGOTourney &&`
    chmod +x /app/ll-tests/*.sh &&`
    chmod 774 /app/csgo/cfg/*.cfg

USER CSGOTourneyHasty

WORKDIR /app/

CMD ["/bin/bash"]

ONBUILD USER root

docker run -it --net=host -p 0.0.0.0:27015:27015 -p 0.0.0.0:27015:27015/udp head9x/csgo-tournament ./srcds_run -game csgo +game_type 0 +game_mode 1 -tickrate 128 -console -usercon +map de_nuke +hostname \"gamesvr-csgo-tourney TEST\" +sv_lan 1 +mp_teamname_1 \"team1\" +mp_teamname_2 \"team2\" +rcon_password \"test123\" +tv_name \"gamesvr-csgo-tourney TV\" +tv_password \"test123\" +tv_relaypassword \"test123\"
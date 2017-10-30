ALTER TABLE bateador ADD (
	CONSTRAINT FOREIGN KEY bateador_equipo (id_nombre_equipo)
	REFERENCES equipolvbp (id_nombre_equipo)
);

ALTER TABLE bateador_equipo_manager ADD (
	CONSTRAINT FOREIGN KEY bateador_equipomanager (id_nombre_equipo,id_nro_jugador)
	REFERENCES bateador (id_nombre_equipo,id_numero)
);

ALTER TABLE bateador_equipo_manager ADD (
	CONSTRAINT FOREIGN KEY bateador_eqmanager (id_nombre_equipo)
	REFERENCES equipo_manager (id_nombre_equipo)
);

ALTER TABLE equipo_manager ADD (
	CONSTRAINT FOREIGN KEY usuario_equipo (id_nombre_usuario)
	REFERENCES manager (id_nombre_usuario)
);

ALTER TABLE equipo_manager ADD (
	CONSTRAINT FOREIGN KEY equipomanager_roster (nombre_eq_roster)
	REFERENCES roster_pitcher (id_nombre_equipo)
);

ALTER TABLE estadistica_bateador ADD (
	CONSTRAINT FOREIGN KEY bateador_estadisticas (id_nombre_equipo,id_nro_jugador)
	REFERENCES bateador (id_nombre_equipo,id_numero)
);

ALTER TABLE estadistica_bateador ADD (
	CONSTRAINT FOREIGN KEY estadisticas_juego (equipo_casa,equipo_visitante,fecha)
	REFERENCES juegolvbp (id_nombre_e_casa,id_nombre_e_visitante,fecha)
);

ALTER TABLE estadistica_pitcher ADD (
	CONSTRAINT FOREIGN KEY pitcher_estadisticas (id_nombre_equipo,id_nro_jugador)
	REFERENCES pitcher (id_nombre_equipo,id_nro)
);

ALTER TABLE estadistica_pitcher ADD (
	CONSTRAINT FOREIGN KEY estadisticaspitcher_juego (equipo_casa,equipo_visitante,fecha)
	REFERENCES juegolvbp (id_nombre_e_casa,id_nombre_e_visitante,fecha)
);



ALTER TABLE juegolvbp ADD (
	CONSTRAINT FOREIGN KEY equipos_participantes_juego (id_nombre_e_casa)
	REFERENCES  equipolvbp (id_nombre_equipo)
);

ALTER TABLE juegolvbp ADD (
	CONSTRAINT FOREIGN KEY equipos_participantes_juego (id_nombre_e_visitante)
	REFERENCES  equipolvbp (id_nombre_equipo)
);

ALTER TABLE juegolvbp ADD (
	CONSTRAINT FOREIGN KEY temporada_juego (fecha_inicio,fecha_fin)
	REFERENCES temporada (id_fecha_inicio,id_fecha_fin)
);



ALTER TABLE peticiones ADD (
	CONSTRAINT FOREIGN KEY peticionesmanager (id_usuario_remitente)
	REFERENCES manager (id_nombre_usuario)
);

ALTER TABLE peticiones ADD (
	CONSTRAINT FOREIGN KEY peticionesmanager (id_usuario_receptor)
	REFERENCES manager (id_nombre_usuario)
);

ALTER TABLE peticiones ADD (
	CONSTRAINT FOREIGN KEY ligapeticion (id_liga)
	REFERENCES liga (id_liga)
);

ALTER TABLE peticiones ADD (
	CONSTRAINT FOREIGN KEY ligapeticion (id_liga)
	REFERENCES liga (id_liga)
);

ALTER TABLE pitcher ADD (
	CONSTRAINT FOREIGN KEY pitcher_equipo (id_nombre_equipo)
	REFERENCES equipolvbp (id_nombre_equipo)
);

ALTER TABLE recibe ADD (
	CONSTRAINT FOREIGN KEY recibe_inv (id_invitacion)
	REFERENCES invitacion_liga (id_invitacion)
);

ALTER TABLE roster_equipo_manager ADD (
	CONSTRAINT FOREIGN KEY roster_elvbp (id_nombre_equipo)
	REFERENCES equipolvbp (id_nombre_equipo)
);

ALTER TABLE roster_equipo_manager ADD (
	CONSTRAINT FOREIGN KEY roster_usuario (id_nombre_usuario)
	REFERENCES manager (id_nombre_usuario)
);

ALTER TABLE roster_equipo_manager ADD (
	CONSTRAINT FOREIGN KEY roster_eqmanager (id_nombre_eq_manager)
	REFERENCES invitacion_liga (id_nombre_equipo)
);

ALTER TABLE roster_pitcher ADD (
	CONSTRAINT FOREIGN KEY eqlvbp (id_nombre_equipo)
	REFERENCES equipolvbp (id_nombre_equipo)
);








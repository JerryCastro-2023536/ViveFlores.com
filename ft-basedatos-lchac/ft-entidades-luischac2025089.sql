call sp_resenas_create('excelente lugar', 'me encantó la experiencia, volvería sin dudarlo', 5, '2026-02-01', 1, 1);
call sp_resenas_create('muy bonito', 'el servicio fue muy bueno y el ambiente agradable', 4, '2026-02-02', 2, 1);
call sp_resenas_create('regular', 'estuvo bien pero puede mejorar en atención', 3, '2026-02-03', 3, 2);
call sp_resenas_create('no me gustó', 'la experiencia no fue lo que esperaba', 2, '2026-02-04', 4, 2);
call sp_resenas_create('terrible servicio', 'muy mala atención y demora excesiva', 1, '2026-02-05', 5, 3);
call sp_resenas_create('hermoso lugar', 'las instalaciones son modernas y limpias', 5, '2026-02-06', 1, 3);
call sp_resenas_create('agradable visita', 'todo estuvo organizado y limpio', 4, '2026-02-07', 2, 4);
call sp_resenas_create('experiencia aceptable', 'cumple con lo básico pero nada extraordinario', 3, '2026-02-08', 3, 4);
call sp_resenas_create('muy recomendado', 'excelente atención y buena ubicación', 5, '2026-02-09', 4, 5);
call sp_resenas_create('puede mejorar', 'la comida fue buena pero el servicio lento', 3, '2026-02-10', 5, 5);


call sp_eventos_create('festival gastronómico', 'evento con comida típica y chefs invitados', null, '2026-03-01 10:00:00', '2026-03-01 18:00:00', 'parque central', 1);
call sp_eventos_create('concierto al aire libre', 'presentación de bandas locales', null, '2026-03-05 17:00:00', '2026-03-05 22:00:00', 'plaza mayor', 2);
call sp_eventos_create('feria artesanal', 'exposición y venta de productos artesanales', null, '2026-03-10 09:00:00', '2026-03-12 20:00:00', 'centro cultural', 3);
call sp_eventos_create('maratón ciudad', 'carrera deportiva de 10k y 5k', null, '2026-03-15 06:00:00', '2026-03-15 12:00:00', 'avenida principal', 4);
call sp_eventos_create('expo tecnología', 'muestra de innovación y startups', null, '2026-03-20 08:00:00', '2026-03-22 18:00:00', 'palacio de exposiciones', 5);
call sp_eventos_create('festival cultural', 'danza, música y actividades tradicionales', null, '2026-04-01 14:00:00', '2026-04-01 21:00:00', 'teatro municipal', 1);
call sp_eventos_create('cine al parque', 'proyección gratuita de películas familiares', null, '2026-04-05 19:00:00', '2026-04-05 22:30:00', 'parque del lago', 2);
call sp_eventos_create('taller de fotografía', 'aprende técnicas básicas y avanzadas', null, '2026-04-10 15:00:00', '2026-04-10 19:00:00', 'casa de la cultura', 3);
call sp_eventos_create('festival de primavera', 'celebración con música en vivo y comida', null, '2026-04-15 11:00:00', '2026-04-15 23:00:00', 'plaza central', 4);
call sp_eventos_create('encuentro literario', 'charlas con autores y firma de libros', null, '2026-04-20 16:00:00', '2026-04-20 20:00:00', 'biblioteca municipal', 5);
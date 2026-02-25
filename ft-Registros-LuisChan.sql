-- Registros categorias --
call sp_categorias_create('servicios', 'ofertas de servicios profesionales');
call sp_categorias_create('ventas', 'productos en venta');
call sp_categorias_create('educación', 'clases y cursos');
call sp_categorias_create('inmuebles', 'apartamentos y casas');
call sp_categorias_create('mascotas', 'servicios y productos para animales');
call sp_categorias_create('comida', 'restaurantes y menús');
call sp_categorias_create('tecnología', 'soporte técnico y dispositivos');
call sp_categorias_create('deportes', 'artículos deportivos');
call sp_categorias_create('jardinería', 'servicios de jardinería');
call sp_categorias_create('marketing', 'consultoría y asesoría digital');

-- Fotos --
call sp_fotos_create('isla de flores - vista aérea', 'panorámica de la isla de flores en petén', null, '2026-02-20', 1);
call sp_fotos_create('isla de flores - atardecer', 'puesta de sol sobre el lago petén itzá', null, '2026-02-21', 2);
call sp_fotos_create('isla de flores - calles coloniales', 'calles empedradas y casas coloridas en la isla', null, '2026-02-22', 3);
call sp_fotos_create('isla de flores - muelle principal', 'vista del muelle con lanchas en el lago', null, '2026-02-23', 4);
call sp_fotos_create('isla de flores - iglesia histórica', 'fachada de la iglesia en el centro de la isla', null, '2026-02-24', 5);
call sp_fotos_create('isla de flores - paseo nocturno', 'luces reflejadas en el lago durante la noche', null, '2026-02-25', 6);
call sp_fotos_create('isla de flores - mercado local', 'puestos de artesanías y comida típica', null, '2026-02-26', 7);
call sp_fotos_create('isla de flores - vista desde el lago', 'la isla observada desde una lancha en el agua', null, '2026-02-27', 8);
call sp_fotos_create('isla de flores - puente de acceso', 'puente que conecta la isla con tierra firme', null, '2026-02-28', 9);
call sp_fotos_create('isla de flores - turismo cultural', 'visitantes recorriendo las calles y museos', null, '2026-03-01', 10);

-- Favoritos --
call sp_agregar_favoritos(1, 1, 2);   -- usuario 1 guarda publicación 1 en categoría ventas
call sp_agregar_favoritos(2, 2, 1);   -- usuario 2 guarda publicación 2 en categoría servicios
call sp_agregar_favoritos(3, 3, 3);   -- usuario 3 guarda publicación 3 en categoría educación
call sp_agregar_favoritos(4, 4, 4);   -- usuario 4 guarda publicación 4 en categoría inmuebles
call sp_agregar_favoritos(5, 5, 5);   -- usuario 5 guarda publicación 5 en categoría mascotas
call sp_agregar_favoritos(6, 6, 6);   -- usuario 6 guarda publicación 6 en categoría comida
call sp_agregar_favoritos(7, 7, 7);   -- usuario 7 guarda publicación 7 en categoría tecnología
call sp_agregar_favoritos(8, 8, 8);   -- usuario 8 guarda publicación 8 en categoría deportes
call sp_agregar_favoritos(9, 9, 9);   -- usuario 9 guarda publicación 9 en categoría jardinería
call sp_agregar_favoritos(10, 10, 10);-- usuario 10 guarda publicación 10 en categoría marketing
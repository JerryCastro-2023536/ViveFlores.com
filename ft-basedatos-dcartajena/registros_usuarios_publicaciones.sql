-- registros usuarios
call sp_usuarios_create('roberto_MOD','Roberto','Gómez','roberto.g@empresa.com','Admin#2026','admin','2026-01-10');
call sp_usuarios_create('valeria_sun','Valeria','Solís','valeria.solis@mail.com','Val12345','usuario','2026-01-15');
call sp_usuarios_create('soporte_luis','Luis','Castañeda','l.castaneda@soporte.com','usuario','usuario','2026-01-20');
call sp_usuarios_create('elena_writer','Elena','Paz','elena.paz@blog.com','Write_2026','vendedor','2026-02-01');
call sp_usuarios_create('marcos_vip','Marcos','Rivas','m.rivas@premium.com','GoldPass!','usuario','2026-02-05');
call sp_usuarios_create('ventas_ana','Ana','López', 'ana.lopez@ventas.com','Sales_Ana88','usuario','2026-02-10');
call sp_usuarios_create('dev_tester','Diego','Torres','diego.dev@test.com','DevMode_On','vendedor','2026-02-12');
call sp_usuarios_create('mod_carla','Carla','Mendoza','c.mendoza@comunidad.com','Mod_Secure!','usuario','2026-02-14');
call sp_usuarios_create('pablo_edu','Pablo','Vargas', 'pvargas@universidad.edu','StudyHard26','usuario','2026-02-18');
call sp_usuarios_create('sara_mkt','Sara','Herrera','sara.h@marketing.com','Mkt_2026_Success','usuario','2026-02-22');

-- registros publicaciones
call sp_publicaciones_create('Venta de Garage', 'Muebles y electrodomésticos en buen estado.', 'Calle 10 #5-20', '', 5551234, 'ventas@correo.com', '09:00 - 18:00', '2026-01-15', 'aceptado', 1, 1);
call sp_publicaciones_create('Fontanero Express', 'Reparación de tuberías y fugas de agua.', 'Av. Central 45', '', 5559876, 'plomeria@web.com', '24 Horas', '2026-01-18', 'pendiente', 2, 2);
call sp_publicaciones_create('Clases de Guitarra', 'Nivel básico e intermedio para niños y adultos.', 'Barrio San Juan', '', 5554433, 'musica@clases.com', '14:00 - 20:00', '2026-01-20', 'aceptado', 3, 3);
call sp_publicaciones_create('Apartamento Amueblado', '2 habitaciones, cerca del centro comercial.', 'Edificio Las Palmas', '', 5552211, 'rentas@inmuebles.com', 'Lunes a Viernes', '2026-01-25', 'aceptado', 4, 4);
call sp_publicaciones_create('Paseador de Perros', 'Caminatas diarias en parques locales.', 'Sector Norte', '', 5556677, 'canino@amigos.com', '07:00 - 11:00', '2026-02-01', 'pendiente', 5, 5);
call sp_publicaciones_create('Menú del Día', 'Almuerzos económicos con sabor casero.', 'Carrera 8 #12-40', '', 5553322, 'cocina@delicia.com', '11:30 - 15:00', '2026-02-05', 'pendiente', 6, 6);
call sp_publicaciones_create('Tecnico PC', 'Soporte técnico y mantenimiento preventivo.', 'Calle Florida 200', '', 5551122, 'tech@soporte.com', '08:00 - 17:00', '2026-02-10', 'aceptado', 2, 7);
call sp_publicaciones_create('Bicicleta de Montaña', 'Casi nueva, marco de aluminio, rin 29.', 'Residencial El Bosque', '', 5558899, 'marcos_bici@mail.com', 'Fines de semana', '2026-02-12', 'aceptado', 1, 8);
call sp_publicaciones_create('Jardines Verdes', 'Poda de césped y diseño de paisajes.', 'Zona Rural 5', '', 5550011, 'jardin@verdes.com', '06:00 - 14:00', '2026-02-15', 'pendiente', 5, 9);
call sp_publicaciones_create('Asesoría Digital', 'Estrategias para redes sociales y SEO.', 'Oficina Virtual', '', 5557788, 'mkt@estrategia.com', 'Cita previa', '2026-02-20', 'aceptado', 7, 10);

create table SolicitudPublicacion(
	id_solicitud int auto_increment not null,
    fecha_solicitud date not null,
    estado varchar(10) not null,
    descripcion text not null,
    id_publicacion int not null,
    id_usuario int not null,
    primary key PK_id_solicitud(id_solicitud),
    constraint FK_id_usuario foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade,
    constraint FK_id_publicacion foreign key(id_publicacion)
    references Publicaciones(id_publicacion) on delete cascade
);

create table Servicios(
	id_servicio int auto_increment not null,
    nombre_servicio varchar(50) not null,
    descripcion text not null,
    telefono int not null,
    foto blob not null,
    fecha_creacion date not null,
    id_usuario int not null,
    primary key PK_id_servicio (id_servicio),
	constraint FK_id_usuario foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade
);

-- PROCEDIMIENTOS DE SOLICITUD PUBLICACION
delimiter $$
	create procedure sp_mostrar_solicitud()
    begin 
		select * from SolicitudPublicacion;
    end $$
delimiter ;

delimiter $$
	create procedure sp_agregar_solicitud(
		in p_fecha_solicitud date,
        in p_estado varchar(10),
        in p_descripcion text,
        in p_id_publicacion int,
        in id_usuario int
    )
    begin 
		insert into SolicitudPublicacion(fecha_solicitud, estado, descripcion, id_publicacion, id_usuario)
        values (p_fecha_solicitud, p_estado, p_descripcion, p_id_publicacion, p_id_usuario);
    end $$
delimiter ;

delimiter $$
	create procedure sp_actualizar_solicitud(
		in p_id int,
        in p_fecha_solicitud date,
        in p_estado varchar(10),
        in p_descripcion text,
        in p_id_publicacion int,
        in id_usuario int
    )
    begin 
		update SolicitudPublicacion s set s.fecha_solicitud = p_fecha_solicitud, 
        s.estado = p_estado, s.descripcion = p_descripcion, s.id_publicacion = p_id_publicacion,
        s.id_usuario = p_id_usuario where s.id_solicitud = p_id_solicitud;
    end $$
delimiter ;

delimiter $$
	create procedure sp_eliminar_solicitud(in p_id int)
    begin 
		delete from SolicitudPublicacion where id_solicitud = p_id;
    end $$
delimiter ;

delimiter $$
	create procedure sp_buscar_solicitud(in p_id int)
    begin
		select * from SolicitudPublicacion where id_solicitud = p_id;
    end $$
delimiter ;

-- PROCEDIMIENTOS DE SERVICIOS 
delimiter $$
	create procedure sp_mostrar_servicios()
	begin
		select * from Servicios;
	end $$
delimiter ;

delimiter $$
	create procedure sp_agregar_servicios(
		in p_nombre_servicio varchar(50),
		in p_descripcion text,
		in p_telefono int,
		in p_foto blob,
		in p_fecha_creacion date,
		in p_id_usuario int
	)
	begin
		insert into Servicios(nombre_servicio, descripcion, telefono, foto, fecha_creacion, id_usuario)
		values(p_nombre_servicio, p_descripcion, p_telefono, p_foto, p_fecha_creacion, p_id_usuario);
	end $$
delimiter ;

delimiter $$
	create procedure sp_actualizar_servicios(
		in p_id_servicio int,
		in p_nombre_servicio varchar(50),
		in p_descripcion text,
		in p_telefono int,
		in p_foto blob,
		in p_fecha_creacion date,
		in p_id_usuario int
	)
	begin
		update Servicios s set s.nombre_servicio = p_nombre_servicio, s.descripcion = p_descripcion,
			s.telefono = p_telefono, s.foto = p_foto, s.fecha_creacion = p_fecha_creacion,
			s.id_usuario = p_id_usuario where s.id_servicio = p_id_servicio;
	end $$
delimiter ;

delimiter $$
	create procedure sp_eliminar_servicios(in p_id int)
	begin
		delete from Servicios where id_servicio = p_id;
	end $$
delimiter ;

delimiter $$
	create procedure sp_buscar_servicios(in p_id int)
	begin
		select * from Servicios where id_servicio = p_id;
	end $$
delimiter ;
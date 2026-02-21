drop database if exists DBBlogTuristico_IN5CM;
create database DBBlogTuristico_IN5CM;
use DBBlogTuristico_IN5CM;

create table usuarios(
	id_usuario int primary key not null,
    username varchar(50) not null,
    nombre_usuario varchar(30) not null,
    apellido_usuario varchar(30) not null,
    email_usuario varchar(100) not null,
    contrasena_usuario varchar(50) not null,
    rol varchar(10) not null,
    fecha_registro date not null
);

create table Categorias (
    id_categoria int not null auto_increment,
    nombre_categoria  varchar(50)  not null,
    descripcion text,
    primary key (id_categoria)
);

create table Fotos(
	id_foto int not null auto_increment,
    titulo_foto varchar(50),
    descripcion text,
    foto blob,
    fecha_creacion date,
    id_usuario int not null,
    primary key (id_foto)
);

create table publicaciones(
	id_publicacion int primary key not null,
    nombre_publicacion varchar(100) not null,
    descripcion text not null,
    direccion varchar(50) not null,
    foto blob not null,
    telefono int not null,
    email_publicacion varchar(100) not null,
    horario varchar(100) not null,
    fecha_creacion date not null,
    estado_publicacion varchar(100) not null,
    id_categoria int not null,
    id_usuario int not null,
    constraint FK_id_categoria foreign key  (id_categoria)
    references Categorias(id_categoria) on delete cascade,
    constraint FK_id_usuario foreign key (id_usuario)
    references usuarios(id_usuario) on delete cascade 
    
);

create table Reportes(
	id_reporte int auto_increment not null,
    asunto varchar(50) not null,
    mensaje text not null,
    fecha_envio datetime not null,
    id_usuario int not null,
    primary key PK_id_reporte(id_reporte),
    constraint FK_id_usuarios foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade
);

create table Contactar(
	id_contactar int auto_increment not null,
    asunto varchar(50) not null,
    mensaje text not null,
    fecha_envio datetime not null,
    id_usuario int not null,
    id_publicacion int not null,
    primary key PK_id_contactar(id_contactar),
    constraint id_usuario_contacto foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade,
    constraint FK_id_publicacion foreign key(id_publicacion)
    references Publicaciones(id_publicacion) on delete cascade
);

create table SolicitudPublicacion(
	id_solicitud int auto_increment not null,
    fecha_solicitud date not null,
    estado varchar(10) not null,
    descripcion text not null,
    id_publicacion int not null,
    id_usuario int not null,
    primary key PK_id_solicitud(id_solicitud),
    constraint id_usuario_publicacion foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade,
    constraint id_publicacion_solicitud foreign key(id_publicacion)
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
	constraint id_usuario_servicio foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade
);

create table Resenas(
	id_resena int primary key not null auto_increment,
    titulo_resena varchar(50) not null,
    comentario text not null,
    calificacion int not null,
    fecha_creacion date not null,
    id_usuario int not null,
    id_publicacion int not null,
    constraint id_usuario_resena foreign key (id_usuario)  
	references Usuarios (id_usuario) on delete cascade,
    constraint id_publicacion_resena foreign key (id_publicacion)  
	references Publicaciones (id_publicacion) on delete cascade
);

create table Eventos(
	id_evento int primary key not null auto_increment,
    nombre_evento varchar (50) not null,
    descripcion text not null,
    foto blob not null,
    fecha_inicio datetime not null,
    fecha_fin datetime not null,
    ubicacion varchar (100) not null,
    id_usuario int not null,
    constraint id_usuario_evento foreign key (id_usuario)  
	references Usuarios (id_usuario) on delete cascade 
);


create table favoritos(
	id_favorito int not null auto_increment,
    id_usuario int not null,
    id_publicacion int not null,
    id_categoria int not null,
    primary key (id_favorito),
    constraint fk_favorito_categoria foreign key (id_categoria) 
	references Categorias (id_categoria) on delete cascade
);



-- SP USUARIOS

delimiter $$
create procedure sp_usuarios_read()
begin
    select * from usuarios;
end$$
delimiter ;

delimiter $$
create procedure sp_usuarios_buscar(in p_id int)
begin 
	select * from usuarios where id_usuario = p_id;
end$$
delimiter ;

delimiter $$
	create procedure sp_usuarios_create(
		p_username varchar(50),
        p_nombre_usuario varchar(30),
        p_apellido_usuario varchar(30),
        p_email_usuario varchar(100),
        p_contrasena_usuario varchar(50),
        p_rol varchar(10),
        p_fecha_registro date
	)
    begin
		insert into usuarios(username,nombre_usuario,apellido_usuario,email_usuario,contrasena_usuario,rol,fecha_registro)
        values (p_username,p_nombre_usuario,p_apellido_usuario,p_email_usuario,p_contrasena_usuario,p_rol,p_fecha_registro);
    end$$
delimiter ;

delimiter $$
create procedure sp_usuarios_update(
    p_id_usuario int,
    p_username varchar(50),
    p_nombre_usuario varchar(30),
    p_apellido_usuario varchar(30),
    p_email_usuario varchar(100),
    p_contrasena_usuario varchar(50),
    p_rol varchar(10),
    p_fecha_registro date
)
begin
    update usuarios 
    set username = p_username, 
        nombre_usuario = p_nombre_usuario, 
        apellido_usuario = p_apellido_usuario, 
        email_usuario = p_email_usuario, 
        contrasena_usuario = p_contrasena_usuario, 
        rol = p_rol, 
        fecha_registro = p_fecha_registro
    where id_usuario = p_id_usuario;
end$$
delimiter ;

delimiter $$
create procedure sp_usuarios_delete(
    p_id_usuario int
)
begin
    delete from usuarios where id_usuario = p_id_usuario;
end$$
delimiter ;

-- SP PUBLICACIONES

delimiter $$
create procedure sp_publicaciones_read()
begin
    select * from publicaciones;
end$$
delimiter ;

delimiter $$
create procedure sp_publicaciones_buscar(in p_id int)
begin 
	select * from publicaciones where id_publicacion = p_id;
end $$
delimiter

delimiter $$
create procedure sp_publicaciones_create(
    p_nombre_publicacion varchar(100),
    p_descripcion text,
    p_direccion varchar(50),
    p_foto blob,
    p_telefono int,
    p_email_publicacion varchar(100),
    p_horario varchar(100),
    p_fecha_creacion date,
    p_estado_publicacion varchar(100),
    p_id_categoria int,
    p_id_usuario int
)
begin
    insert into publicaciones(nombre_publicacion, descripcion, direccion, foto, telefono, email_publicacion, horario, fecha_creacion, estado_publicacion, id_categoria, id_usuario)
    values (p_nombre_publicacion, p_descripcion, p_direccion, p_foto, p_telefono, p_email_publicacion, p_horario, p_fecha_creacion, p_estado_publicacion, p_id_categoria, p_id_usuario);
end$$
delimiter ;

delimiter $$
create procedure sp_publicaciones_update(
    p_id_publicacion int,
    p_nombre_publicacion varchar(100),
    p_descripcion text,
    p_direccion varchar(50),
    p_foto blob,
    p_telefono int,
    p_email_publicacion varchar(100),
    p_horario varchar(100),
    p_fecha_creacion date,
    p_estado_publicacion varchar(100),
    p_id_categoria int,
    p_id_usuario int
)
begin
    update publicaciones 
    set nombre_publicacion = p_nombre_publicacion,
        descripcion = p_descripcion,
        direccion = p_direccion,
        foto = p_foto,
        telefono = p_telefono,
        email_publicacion = p_email_publicacion,
        horario = p_horario,
        fecha_creacion = p_fecha_creacion,
        estado_publicacion = p_estado_publicacion,
        id_categoria = p_id_categoria,
        id_usuario = p_id_usuario
    where id_publicacion = p_id_publicacion;
end$$
delimiter ;

delimiter $$
create procedure sp_publicaciones_delete(
    p_id_publicacion int
)
begin
    delete from publicaciones where id_publicacion = p_id_publicacion;
end$$
delimiter ;

-- CATEGORIAS --

delimiter $$
create procedure sp_mostrar_categorias()
begin
    select * from Categorias;
end$$
delimiter ;

delimiter $$
create procedure sp_agregar_categorias(
    in p_nombre_categoria varchar(50),
    in p_descripcion text
)
begin
    insert into Categorias (nombre_categoria, descripcion)
    values (p_nombre_categoria, p_descripcion);
end$$
delimiter ;

delimiter $$
create procedure sp_buscar_categorias(
    in p_id_categoria int
)
begin
    select * from Categorias
    where id_categoria = p_id_categoria;
end$$
delimiter ;

delimiter $$
create procedure sp_actualizar_categorias(
    in p_id_categoria int,
    in p_nombre_categoria varchar(50),
    in p_descripcion text
)
begin
    update Categorias
    set nombre_categoria = p_nombre_categoria,
        descripcion = p_descripcion
    where id_categoria = p_id_categoria;
end$$
delimiter ;

delimiter $$
create procedure sp_eliminar_categorias(
    in p_id_categoria int
)
begin
    delete from Categorias
    where id_categoria = p_id_categoria;
end$$
delimiter ;

-- FOTOS --

delimiter $$
create procedure sp_mostrar_fotos()
begin
    select * from Fotos;
end$$
delimiter ;

delimiter $$
create procedure sp_agregar_fotos(
    in p_titulo_foto varchar(50),
    in p_descripcion text,
    in p_foto longblob,
    in p_fecha_creacion date,
    in p_id_usuario int
)
begin
    insert into Fotos (titulo_foto, descripcion, foto, fecha_creacion, id_usuario)
    values (p_titulo_foto, p_descripcion, p_foto, p_fecha_creacion, p_id_usuario);
end$$
delimiter ;

delimiter $$
create procedure sp_buscar_fotos(
    in p_id_foto int
)
begin
    select * from Fotos
    where id_foto = p_id_foto;
end$$
delimiter ;

delimiter $$
create procedure sp_actualizar_fotos(
    in p_id_foto int,
    in p_titulo_foto varchar(50),
    in p_descripcion text,
    in p_foto longblob,
    in p_fecha_creacion date,
    in p_id_usuario int
)
begin
    update Fotos
    set titulo_foto = p_titulo_foto,
        descripcion = p_descripcion,
        foto = p_foto,
        fecha_creacion = p_fecha_creacion,
        id_usuario = p_id_usuario
    where id_foto = p_id_foto;
end$$
delimiter ;

delimiter $$
create procedure sp_eliminar_fotos(
    in p_id_foto int
)
begin
    delete from Fotos
    where id_foto = p_id_foto;
end$$
delimiter ;

-- FAVORITOS --

delimiter $$
create procedure sp_mostrar_favoritos()
begin
    select * from Favoritos;
end$$
delimiter ;

delimiter $$
create procedure sp_agregar_favoritos(
    in p_id_usuario int,
    in p_id_publicacion int,
    in p_id_categoria int
)
begin
    insert into Favoritos (id_usuario, id_publicacion, id_categoria)
    values (p_id_usuario, p_id_publicacion, p_id_categoria);
end$$
delimiter ;

delimiter $$
create procedure sp_buscar_favoritos(
    in p_id_favorito int
)
begin
    select * from Favoritos
    where id_favorito = p_id_favorito;
end$$
delimiter ;

delimiter $$
create procedure sp_actualizar_favoritos(
    in p_id_favorito int,
    in p_id_usuario int,
    in p_id_publicacion int,
    in p_id_categoria int
)
begin
    update Favoritos
    set id_usuario = p_id_usuario,
        id_publicacion = p_id_publicacion,
        id_categoria = p_id_categoria
    where id_favorito = p_id_favorito;
end$$
delimiter ;

delimiter $$
create procedure sp_eliminar_favoritos(
    in p_id_favorito int
)
begin
    delete from Favoritos
    where id_favorito = p_id_favorito;
end$$
delimiter ;

-- PROCEDIMIENTOS DE EVENTOS

delimiter $$
create procedure sp_Resenas_create (
	p_titulo_resena varchar (50),
    p_comentario text,
    p_calificacion int,
    p_fecha_creacion date,
    p_id_usuario int,
    p_id_publicacion int
)
begin
	insert into Resenas(titulo_resena, comentario, calificacion, fecha_creacion, id_usuario, id_publicacion)
    values (p_titulo_resena, p_comentario, p_calificacionc, p_fecha_creacion, p_id_usuario, p_id_publicacion);
    select last_insert_id() as id_resena;
end$$
delimiter ;

delimiter $$
create procedure sp_Resenas_read_all ()
begin
	select * from Resenas order by id_resena;
end$$
delimiter ;

delimiter $$
create procedure sp_Resenas_delete(in p_idRe int)
begin
	delete from Resenas where id_resena = p_idRe;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
create procedure sp_Resenas_update(
	in p_id_resena int,
    in p_titulo_resena varchar (50),
    in p_comentario text,
    in p_calificacion int,
    in p_fecha_creacion date,
    in p_id_usuario int,
    in p_id_publicacion int
)
begin
	update Resenas
    set id_resena = p_id_resena,
		titulo_resena = p_titulo_resena,
        comentario = p_comentario,
        calificaion = p_calificacion,
        fecha_creacion = p_fecha_creacion,
        id_usuario = p_id_usuario,
        id_publicacion = p_id_publicacion
	where id_resena = p_id_resena;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
	create procedure sp_Resenas_search (in id_resena int)
    begin
		select
			r.id_resena,
            r.titulo_resena,
            r.comentario,
            r.calificacion,
            r.fecha_creacion,
            r.id_usuario,
            r.id_publicacion
		from Resenas r where r.id_resena = id_resena;
    end $$
delimiter ;

-- PROCEDIMIENTOS DE EVENTOS

delimiter $$
create procedure sp_Eventos_create (
	p_nombre_evento varchar (50),
    p_descripcion text,
    p_foto blob,
    p_fecha_inicio datetime,
    p_fecha_fin datetime,
    p_ubicacion varchar (100),
    p_id_usuario int
)
begin
	insert into Eventos(nombre_evento, descripcion, foto, fecha_inicio, fecha_fin, ubicacion, id_usuario)
    values (p_nombre_evento, p_descripcion, p_foto, p_fecha_inicio, p_fecha_fin, p_ubicacion, p_id_usuario);
    select last_insert_id() as id_evento;
end$$
delimiter ;

delimiter $$
create procedure sp_Eventos_read_all ()
begin
	select * from Eventos order by id_eventos;
end$$
delimiter ;

delimiter $$
create procedure sp_Eventos_delete(in p_idEv int)
begin
	delete from Eventos where id_evento = p_idEv;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
create procedure sp_Eventos_update(
	in p_id_evento int,
    in p_nombre_evento varchar (50),
    in p_descripcion text,
    in p_foto blob,
    in p_fecha_inicio datetime,
    in p_fecha_fin datetime,
    in p_ubicacion varchar (100),
    in p_id_usuario int
)
begin
	update Eventos
    set id_evento = p_id_evento,
		nombre_evento = p_nombre_evento,
        descripcion = p_descripcion,
        foto = p_foto,
        fecha_inicio = p_fecha_inicio,
        fecha_fin = p_fecha_fin,
        ubicacion = p_ubicacion,
        id_usuario = p_id_usuario
	where id_evento = p_id_evento;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
	create procedure sp_Eventos_search (in id_evento int)
    begin
		select
			e.id_evento,
            e.nombre_evento,
            e.descripcion,
            e.foto,
            e.fecha_inicio,
			e.fecha_fin,
            e.ubicacion,
            e.id_usuario
		from Eventos e where e.id_evento = id_evento;
    end $$
delimiter ;

-- PROCEDIMIENTOS DE REPORTES
delimiter $$
	create procedure sp_mostrar_reportes()
    begin
		select * from Reportes;
    end $$
delimiter ;

delimiter $$
	create procedure sp_agregar_reportes(
		in p_asunto varchar(50),
        in p_mensaje text,
        in p_fecha_envio datetime,
        in p_id_usuario int
    )
    begin
		insert into Reportes(asunto, mensaje, fecha_envio, id_usuario) values
        (p_ausnto, p_mensaje, p_fecha_envio, p_id_usuario);
    end $$
delimiter ;
    
delimiter $$
	create procedure sp_actualizar_reportes(
		in p_id int,
		in p_asunto varchar(50),
        in p_mensaje text,
        in p_fecha_envio datetime,
        in p_id_usuario int
    )
    begin
		update Reportes r set r.asunto = p_asunto, r.mensaje = p_mensaje, r.fecha_envio = p_fecha_envio,
        r.id_usuario = p_id_usuario where r.id_reporte = p_id;
    end $$
delimiter $$

delimiter $$
	create procedure sp_eliminar_reportes(in p_id int)
    begin
		delete from Reportes where id_reporte = p_id;
    end $$
delimiter ;

delimiter $$
	create procedure sp_buscar_reportes(in p_id int)
    begin 
		select * from Reportes where id_reportes = p_id;
	end $$
delimiter ;

-- PROCEDIMIENTOS DE CONTACTAR
delimiter $$
	create procedure sp_mostrar_contactar()
    begin
		select * from Contactar;
    end $$
delimiter ;

delimiter $$
	create procedure sp_agregar_Contactar(
		in p_asunto varchar(50),
        in p_mensaje text,
        in p_fecha_envio datetime,
        in p_id_usuario int,
        in p_id_publicacion int
    )
    begin
		insert into Contactar(asunto, mensaje, fecha_envio, id_usuario, id_publicacion) values
        (p_ausnto, p_mensaje, p_fecha_envio, p_id_usuario, p_id_publicacion);
    end $$
delimiter ;
    
delimiter $$
	create procedure sp_actualizar_contactar(
		in p_id int,
		in p_asunto varchar(50),
        in p_mensaje text,
        in p_fecha_envio datetime,
        in p_id_usuario int,
        in p_id_publicacion int
    )
    begin
		update Contactar c set c.asunto = p_asunto, c.mensaje = p_mensaje, c.fecha_envio = p_fecha_envio,
        c.id_usuario = p_id_usuario, c.id_publicacion = p_id_publicacion where c.id_contactar = p_id;
    end $$
delimiter $$

delimiter $$
	create procedure sp_eliminar_contactar(in p_id int)
    begin
		delete from Contactar where id_contactar = p_id;
    end $$
delimiter ;

delimiter $$
	create procedure sp_buscar_contactar(in p_id int)
    begin 
		select * from Contactar where id_contactar = p_id;
	end $$
delimiter ;


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
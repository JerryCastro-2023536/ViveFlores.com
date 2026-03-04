create table Resenas(
	id_resena int primary key not null auto_increment,
    titulo_resena varchar(50) not null,
    comentario text not null,
    calificacion int not null,
    fecha_creacion date not null,
    id_usuario int not null,
    id_publicacion int not null,
    constraint FK_id_usuario foreign key (id_usuario)  
	references Usuarios (id_usuario) on delete cascade,
    constraint FK_id_publicacion foreign key (id_publicacion)  
	references Usuarios (id_publicacion) on delete cascade
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
    constraint FK_id_Usuario foreign key (id_usuario)  
	references Usuarios (id_usuario) on delete cascade 
);

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
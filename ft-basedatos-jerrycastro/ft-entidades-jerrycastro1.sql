create table Reportes(
	id_reporte int auto_increment not null,
    asunto varchar(50) not null,
    mensaje text not null,
    fecha_envio datetime not null,
    id_usuario int not null,
    primary key PK_id_reporte(id_reporte),
    constraint FK_id_usuario foreign key (id_usuario)
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
    constraint FK_id_usuario foreign key (id_usuario)
    references Usuarios(id_usuario) on delete cascade,
    constraint FK_id_publicacion foreign key(id_publicacion)
    references Publicaciones(id_publicacion) on delete cascade
);

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


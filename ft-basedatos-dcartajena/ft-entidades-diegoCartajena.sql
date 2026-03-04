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
    references categoria(idcategoria) on delete cascade,
    
    constraint FK_id_usuarios foreign key (id_publicacion)
    references publicaciones(id_publicacion) on delete cascade 
    
);


-- SP USUARIOS

delimiter $$
create procedure sp_usuarios_read()
begin
    select * from usuarios;
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
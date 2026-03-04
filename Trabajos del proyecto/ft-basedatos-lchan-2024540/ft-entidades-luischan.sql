create table Categorias (
    id_categoria int not null auto_increment,
    nombre_categoria  varchar(50),
    descripcion text,
    primary key (id_categoria)
);

create table Fotos(
	id_foto int not null auto_increment,
    titulo_foto varchar(50),
    descripcion text,
    foto longblob,
    fecha_creacion date,
    id_usuario int not null,
    primary key (id_foto)
);

create table Favoritos(
	id_favorito int not null auto_increment,
    id_usuario int not null,
    id_publicacion int not null,
    id_categoria int not null,
    primary key (id_favorito),
    Constraint fk_favorito_categoria
		foreign key (id_categoria) 
        references Categorias (id_categoria) on delete cascade
);

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
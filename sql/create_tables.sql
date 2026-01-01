/*seria como organisador  de tareas y de contactos*/
create database organisador

use organisador


create table roles(
id_roles int primary key identity(1,1),
nombre_rol varchar(50)not null,
descripcion varchar(70),
estado bit,
fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL    
);

create table usuarios(
id_usuario int primary key identity(1,1),
nombre_usuario  varchar(50) not null,
apellido varchar(50),
email varchar(50) unique not null,
telefono varchar(10),
password varchar(250) not null,
token varchar(60),
fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
estado bit,
id_roles int not null,
 CONSTRAINT fk_usuarios_roles FOREIGN KEY (id_roles)
    REFERENCES roles (id_roles)
);

create table contactos(
id_contacto int primary key identity(1,1),
nombre_contacto varchar(50)not null,
apellido_concatcto varchar(50),
email varchar(50) unique not null,
fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
estado bit,
id_usuario int not null,
constraint fk_usuarios_contactos foreign key(id_usuario)
references usuarios(id_usuario)

)


create table telefonos_contactos(
id_telefonos int primary key identity(1,1),
telefono varchar(10) not null,
nombre varchar(50),
fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
estado bit,
id_contacto int not null,
constraint fk_contactos_telefonos foreign key(id_contacto)
references contactos (id_contacto)
)

create table direccion_contactos(
id_direccion int primary key identity(1,1),
direccion varchar(100) not null,
fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
estado bit,
id_tipo int not null,
constraint fk_tipo_direccion foreign key(id_tipo)
references tipo_direccion (id_tipo),
id_contacto int not null,
constraint fk_direccion_contactos foreign key(id_contacto)
references contactos (id_contacto)


)

create table tipo_direccion(
id_tipo int primary key identity(1,1),
tipo_direccion varchar(50) not null
)



create table recordatorio(
id_recordatorio int primary key identity(1,1),
nombre_recordatorio varchar(50) not null,
url_recordatorio varchar(60),
 fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
estado bit,
 id_usuario int not null
 constraint fk_recordatorio_usuario foreign key (id_usuario)
 references usuarios (id_usuario)
)



create table tareas(
id_tarea int primary key identity(1,1),
descripcion_tarea varchar(50) not null,
estado_tarea bit,
 fecha_creacion datetime default getdate(),
fecha_actualizacion  datetime null,
fecha_eliminacion datetime NULL,
id_recordatorio int  not null
constraint fk_tarea_recordatorio foreign key(id_recordatorio)
references recordatorio (id_recordatorio)
)
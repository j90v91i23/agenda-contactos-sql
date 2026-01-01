/***********************************/
select * from contactos
EXEC sp_rename 'dbo.contactos.apellido_concatcto ', 'apellido_contacto ', 'COLUMN';

alter table contactos alter column  email varchar(50)
/***********************************/
drop table usuarios

alter table tareas alter column descripcion_tarea varchar(200)not null
alter table recordatorio alter column nombre_recordatorio varchar(200) not null

/***********************************/
select * from contactos
EXEC sp_rename 'dbo.contactos.apellido_concatcto ', 'apellido_contacto ', 'COLUMN';

alter table contactos alter column  email varchar(50)
/***********************************/
drop table usuarios

select * from usuarios
insert into roles (nombre_rol, descripcion, estado)
values 
('Administrador', 'Acceso completo al sistema', 1),
('Usuario', 'Acceso limitado', 1);

insert into usuarios (nombre_usuario, apellido, email, telefono, password, token, estado, id_roles)
values
('Carlos', 'Ramírez', 'carlos@correo.com', '5512345678', '1234pass', null, 1, 1),
('María', 'Gómez', 'maria@correo.com', '5523456789', '5678pass', null, 1, 2);

insert into contactos (nombre_contacto, apellido_contacto, email, estado, id_usuario)
values
('Luis', 'Martínez', 'luis@correo.com', 1, 1),
('Ana', 'Hernández', 'ana@correo.com', 1, 1),
('Pedro', 'López', 'pedro@correo.com', 1, 2);


insert into telefonos_contactos (telefono, nombre, estado, id_contacto)
values
('5511122233', 'Casa Luis', 1, 1),
('5522233344', 'Trabajo Luis', 1, 1),
('5533344455', 'Celular Ana', 1, 2);

insert into tipo_direccion (tipo_direccion)
values
('Casa'),
('Trabajo'),
('Otra');


insert into direccion_contactos (direccion, estado, id_tipo, id_contacto)
values
('Av. Reforma 123, CDMX', 1, 1, 1), -- Luis
('Insurgentes Sur 456, CDMX', 1, 2, 2), -- Ana
('Calle Juárez 789, Puebla', 1, 1, 3); -- Pedro

insert into direccion_contactos(direccion,estado,id_tipo,id_contacto) values('av.reforma 12345,cmdx',1,1,2)

insert into recordatorio (nombre_recordatorio, url_recordatorio, estado, id_usuario)
values
('Cita Médica', 'http://citasalud.com/abc123', 1, 1),
('Reunión Proyecto', 'http://meet.google.com/xyz456', 1, 2);


insert into tareas (descripcion_tarea, estado_tarea, id_recordatorio)
values
('Llevar resultados médicos', 0, 1),
('Enviar informe por correo', 1, 2),
('Preparar presentación', 0, 2);



select u.nombre_usuario, u.apellido, r.nombre_rol
from usuarios u
join roles r on u.id_roles = r.id_roles;

select u.nombre_usuario, c.nombre_contacto, c.email
from usuarios u
join contactos c on u.id_usuario = c.id_usuario;

select *from  direccion_contactos
select *from  tipo_direccion

insert into  tipo_direccion (tipo_direccion) values ('oficina')
select direccion,fecha_creacion from  direccion_contactos order by fecha_creacion

select * from  direccion_contactos c inner join tipo_direccion d on c.id_tipo = d.id_tipo where estado=1

select COUNT(direccion)as registradas from  direccion_contactos group by id_tipo 

select top 1 direccion, fecha_creacion as ultima
from direccion_contactos
order by fecha_creacion desc;

update direccion_contactos set  estado=0 where estado is null
select * from  direccion_contactos where estado  is null  
update direccion_contactos set  fecha_eliminacion='2025-09-12' where id_direccion=5
select * from  direccion_contactos where estado is null  



delete from direccion_contactos where id_direccion=4

select * from direccion_contactos where estado=1 and fecha_eliminacion is null


/*siguiente ejercio*/
select * from roles
select * from  usuarios
select* from contactos

/*insertar dos usuarios*/
insert into usuarios (nombre_usuario,apellido,email,telefono,password,estado,id_roles)
values('alex','ortis','alex@hotmail.com','5534567890',12353,1,2),
('fernado','felix','fer@hotmail.com','5534786754',33337,1,1)
/*insertar contactos*/
insert into contactos(nombre_contacto,apellido_contacto,email,estado,id_usuario)
values('carla','martinez','carla@hotmail.com',1,4),('martin','maldonado','martin@hotamil.com',1,4),
('leticia','maldonado','leticia@hotmail.com',1,5)



/*nombre_usuario, apellido, email y nombre_rol lista de usuarios conlos roles*/

select nombre_usuario,apellido,email,nombre_rol from usuarios 
inner join roles on usuarios.id_roles=roles.id_roles
/*contactos del email */

select U.nombre_usuario,U.email as Usuario,C.nombre_contacto,C.apellido_contacto,C.email FROM usuarios U
inner join contactos C ON U.id_usuario = C.id_usuario where U.email ='alex@hotmail.com' 

/*cuenta cuantos contactos tiene el usuario,nombre_usuario,cantidad_contactos*/

select *from usuarios
select* from contactos

select  u.nombre_usuario, COUNT(c.id_contacto) as cantidad_contactos    from  usuarios u inner join contactos c 
on u.id_usuario= c.id_usuario group by u.nombre_usuario  

/*actualiza telefono de un contacto*/

select * from telefonos_contactos
update telefonos_contactos set telefono ='5551234567' where telefono = '5511122233'

/*Eliminar lógico*/
update contactos set estado=0 ,fecha_eliminacion='2025-09-10' where id_contacto=1 

/*Muestra todos los usuarios (estado=1) que tienen al menos un contacto con estado=1 */
select  u.nombre_usuario,c.nombre_contacto,u.estado ,c.estado from usuarios u  inner join contactos c on
u.id_usuario = c.id_usuario where  u.estado=1 and c.estado =1


/*Muestra el nombre_usuario, email y rol de los usuarios que no tienen ningún contacto.*/
insert into usuarios (nombre_usuario,apellido,email,telefono,password,estado,id_roles)values('juan','marquez','juan@hotmail.com','5523456711','345',1,2)
select u.nombre_usuario as nombre, u.email, u.id_roles 
from usuarios u left join 
contactos c on u.id_usuario = c.id_usuario where c.id_usuario is null
create database prueba1;
use prueba1;

create table personas(
id int primary key not null unique auto_increment,
nombre varchar(50),
apellido varchar(50),
documento varchar(20),
tipo_documento enum('DNI','PASAPORTE','CE'),
sexo enum('masculino','femenino'),
fecha_nacimiento date
);

insert into personas(nombre,apellido,documento,tipo_documento,sexo,fecha_nacimiento) 
values('jhonatan','maquera','47712096','DNI','masculino','1992-08-17');
insert into personas(nombre,apellido,documento,tipo_documento,sexo,fecha_nacimiento)
values('agustin','cohaila','47851234','CE','masculino','1995-07-23');
insert into personas(nombre,apellido,documento,tipo_documento,sexo,fecha_nacimiento) 
values('solange','ajrota','10242565','PASAPORTE','femenino','1990-10-28');

select *
from personas;

describe personas;
show databases;
show tables;



create table medicos(
id int primary key not null auto_increment unique,
cmp varchar(5) not null,
nombre varchar(50) not null,
apellido varchar(50) not null
);

insert into medicos(cmp,nombre,apellido) values('10254','pedro','navaja');
insert into medicos(cmp,nombre,apellido)values('14528','placido','lopez');
insert into medicos(cmp,nombre,apellido)values('78542','licha','torrico');

select *
from medicos;


create table historial_vacunaciones(
id int primary key not null auto_increment unique,
lote varchar(10),
fecha date,
medico_id int,
persona_id int,
foreign key(medico_id) references medicos(id),
foreign key(persona_id) references personas(id)
);

select *
from historial_vacunaciones;

insert into historial_vacunaciones(lote,fecha,medico_id,persona_id) values('101','2020-01-02',1,1);
insert into historial_vacunaciones(lote,fecha,medico_id,persona_id) values('102','2020-0203',1,2);


create database escuela;
use escuela;

drop database escuela;

create table estudiante(
id int primary key not null unique auto_increment,
nombre varchar(20)
) auto_increment=10;
select * from estudiante;

insert into estudiante(nombre)values('moreno');
insert into estudiante(nombre)values('boris');


show tables;
show databases;
describe medicos;

create database tut;
drop database tut;
drop table medicos;

-- para modificar una tabla
show tables;

alter table medicos RENAME medicoBueno;
show tables;
alter table medicobueno RENAME medico;

show tables;
describe medicos;

alter table medico RENAME medicos;
alter table medicos DROP COLUMN nombre;

describe medicos;
select * from medicos;
alter table medicos DROP COLUMN apellido;

alter table medicos ADD nombre varchar(50);

describe medicos;

alter table medicos add apellido varchar(50);

describe medicos;
select *
from medicos;

alter table medicos add column sexo varchar(2);
describe medicos;


alter table medicos DROP COLUMN sexo;
alter table medicos ADD COLUMN sexo VARCHAR(20);
describe medicos;

alter table medicos add column sexo varchar(20) after nombre;
alter table medicos add column porcion varchar(2) after sexo;
describe medicos;

alter table medicos drop column sexo;
alter table medicos drop column porcion;
describe medicos;

select *
from medicos;

alter table medicos modify column nombre varchar(100);
alter table medicos modify column apellido varchar(100);

describe medicos;
alter table medicos modify column nombre varchar(20) unique not null;
alter table medicos modify column nombre varchar(10)not null;

-- para hacer actulizacion de datos
-- alter table medicos drop column
-- alter table medicos rename column medico
-- alter table medicos add column 
-- alter table medicos modify column 

-- para altualizacion de datos
desc medicos;
select * from medicos;

update medicos
set nombre="jhonaeS";
 
 -- ESTO PERMITE DE QUE NO SE PUEDA ELIMINAR O ACTUALIZAR TODOS LOS REGISTROS SIN USAR EL WHERE(MODO DE ACTUALIZACION SEGURA)
 set SQL_SAFE_UPDATES =0;
 SET SQL_SAFE_UPDATES=0;

select *
from medicos;
desc medicos;

alter table medicos modify column nombre varchar(20);

select *
from medicos;
desc medicos;

alter table medicos drop column nombre;
desc medicos;

alter table medicos add column nombre varchar(50) after cmp;
desc medicos;

set SQL_SAFE_UPDATES=0;

UPDATE MEDICOS
SET nombre="jhonael";
select *
from medicos;

update medicos
set apellido="maquera";

select *
from medicos;

update medicos
set nombre="agustin"
where id=1;
select *
from medicos;

update medicos
set apellido="herrera";

select *
from medicos;

set sql_safe_updates=1;

update medicos
set nombre="pelusa"
where id=2;
select *
from medicos;


delete from
medicos
where id=1;
set sql_safe_updates=0;

delete from medicos;

select *
from medicos;

set sql_safe_updates=1;



delete from
medicos
where id=25;
select *
from medicos;

use prueba1;
truncate medicos;

select * 
from medicos;


show tables;
show databases;


select *
from medicos;

select id as identificador, nombre as nombresito, apellido as apelliditos
from medicos;

drop table medicos;
drop table historial_vacunaciones;
 
 select * from medicos;


select id as identification, nombre as first_name, apellido as last_name 
from medicos;

select distinct nombre
from medicos;

select * 
from medicos
where cmp<14000;

use prueba1;


























































































































































































































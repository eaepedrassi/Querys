create database Recursos_Humanos

use Recursos_Humanos

create table funcionario
(	codigofunc		int	primary key	not null,
	nomefunc		varchar(30)		not null,
	emailfunc		varchar(40)		not null,
	telefonefunc	numeric(9)		not null)

create table funcionariobackupinsert
(	codigofunc		int	primary key	not null,
	nomefunc		varchar(30)		not null,
	emailfunc		varchar(40)		not null,
	telefonefunc	numeric(9)		not null)

create table funcionariobackupdelete
(	codigofunc		int	primary key	not null,
	nomefunc		varchar(30)		not null,
	emailfunc		varchar(40)		not null,
	telefonefunc	numeric(9)		not null)

create trigger trg_insertfuncionario on funcionario
	after insert
		as begin
			insert into funcionariobackupinsert
			select * from inserted 
		end

create trigger trg_deletefuncionario on funcionario
	after delete
		as begin
			insert into funcionariobackupdelete
			select * from deleted 
		end

insert into funcionario values	(5,'Edson Dionisio','edson.dionisio@gmail.com',997402801),
								(8,'Maite Silva','maite.silva@gmail.com',997402801),
								(12,'Marilia Kessia','testekessia@gmail.com',997402801);

select * from funcionario
select * from funcionariobackupinsert
select * from funcionariobackupdelete

delete from funcionario
where codigofunc = 8
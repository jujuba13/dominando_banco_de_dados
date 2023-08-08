/* UNION INTERSECTION*/
CREATE DATABASE IF NOT EXISTS Test_union;
USE Test_union;
--drop database Test_union;

CREATE TABLE unida (
A char(2)
);

CREATE TABLE uniao (
U char(2)
);

insert into unida(A) values ('A1'), ('A2'), ('A3');
insert into uniao(U) values ('U1'), ('U2'), ('U3'),('U4'), ('U5');

select * from unida;
select * from uniao;

/*complementa o except utilizando o NOT IN*/
select * from uniao where U not in (select A from unida);

/*Intersection*/

select distinct unida.A from unida where unida.A in (select uniao.U from uniao);

/* union= União dos conjuntos*/
(select distinct unida.A from unida) union (select distinct uniao.U from uniao);





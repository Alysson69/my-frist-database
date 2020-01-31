create database banco;

use banco;

create table tb_funcionarios(
id int,
nome varchar(50),
salario decimal(10,2),
admissao date,
sexo enum('F','M'),
cadastro timestamp default current_timestamp()
);

create table tb_clientes(
id int,
nome varchar(50),
idade int,
email varchar(100)
);

insert into tb_funcionarios values(0,'Alice Aparecida Santana',26540.25,'2018-02-07','M',null);

select * from tb_funcionarios;

update tb_funcionarios
SET salario = salario * 1.1;

delete from tb_pessoas;
drop table tb_funcionarios;


use banco;
insert into tb_pessoas values(1,'joao','M');

insert into tb_pessoas (sexo, nome) values('F', 'maria');

select * from tb_pessoas;

insert tb_pessoas (nome, sexo) values
('alysson', 'M'), 
('marcos', 'M'), 
('diego', 'M'), 
('carla', 'F'), 
('yohana', 'F'),
('amanda', 'F');

select * from tb_pessoas;
select * from tb_funcionarios;

insert into tb_funcionarios
select id, nome, 950, current_date(),sexo, null from tb_pessoas;

use banco;

select nome , salario as atual,
convert( salario * 1.1, dec(10,2)) as 'salario com aumentos de 10%'
from tb_funcionarios;

select * from tb_funcionarios where sexo ='m' and salario > 1300;
select * from tb_funcionarios where sexo <> 'm' or salario > 1300;
update tb_funcionarios set salario = salario * 1.4 where nome = 'carla';


select * from tb_funcionarios where nome like '%a%';

select * from tb_funcionarios where nome like 'a%';

select * from tb_funcionarios where nome like '%a';

select * from tb_funcionarios where nome like '__a%';

select * from tb_funcionarios where nome like 'a%';

select * from tb_funcionarios where nome not like '%a%';

select * from tb_funcionarios where salario	between 1400 and 2000;

select * from tb_funcionarios where soundex(nome) = soundex('alison');

select * from tb_funcionarios where cadastro > '2016-01-10';
select * from tb_funcionarios where cadastro > '2016.01.10';
select * from tb_funcionarios where cadastro > '2016/01/10';
select * from tb_funcionarios where cadastro > '20160110';

update tb_funcionarios set admissao = current_date() where id = 5;

update tb_funcionarios set admissao = date_add(current_date(), interval 30 day) where id = 2;

select datediff(admissao, current_date()) as 'diferença de dias' from tb_funcionarios where id = 1;

select * from tb_funcionarios where month (admissao) = 2;

select * from tb_funcionarios where day (admissao) = 8;

select * from tb_funcionarios where month (admissao) = 2 and year (admissao) = 2020;

select * from tb_funcionarios order by 2;

select * from tb_funcionarios order by nome; -- equivalente ao anterior

select * from tb_funcionarios order by salario;

select * from tb_funcionarios order by salario desc;

select * from tb_funcionarios order by salario desc, nome asc;

select * from tb_funcionarios order by salario limit 0 , 3; -- (0,3) 0 = onde inicia, 3 = quantos apos o inicio

select * from tb_funcionarios where year(admissao) = 2020 and day(admissao) > 8 order by salario limit 0 , 3;

update tb_funcionarios set salario = 4000, admissao = '2020-02-10' where salario > 3000 and sexo = 'm';

delete from tb_funcionarios where id = 1;

start transaction;

delete from tb_pessoas;

select * from tb_pessoas;

rollback;

commit;

insert into tb_pessoas values(null , 'josé', 'm');
select * from tb_pessoas;

truncate table tb_pessoas;


drop database banco;

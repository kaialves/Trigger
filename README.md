REPRODUZA O PRIMEIRO CÓDIGO SUGERIDO NO MYSQL WORKBENCH. EXECUTE AS ETAPAS E VERIFIQUE SEUS RESULTADOS.
` CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

create table Filmes(
id int primary key auto_increment,
titulo varchar(60),
minutos int
);

delimiter $
create trigger chk_minutos before insert on Filmes
for each row
begin
if new.minutos <0 then
set new.minutos = null;
end if;
end$
delimter ;

insert into Filmes (titulo, minutos) values ("The terrible trigger", 120);
insert into Filmes (titulo, minutos) values ("Blade runner", -88);
insert into Filmes (titulo, minutos) values ("O auto da compadecida", 200);
insert into Filmes (titulo, minutos) values ("Matrix", 0);
insert into Filmes (titulo, minutos) values ("Maze Runner", -140);
insert into Filmes (titulo, minutos) values ("A lista", 100);
insert into Filmes (titulo, minutos) values ("Metropole", 0);

select * from Filmes; 
`

<img src="https://github.com/kaialves/Trigger/blob/exemplo-1/Screenshot_120.png" alt="Tabela de filmes">

APÓS A EXECUÇÃO DO PRIMEIRO CÓDIGO REALIZE O SEGUNDO EXEMPLO. FAÇA AS ETAPAS INDICADAS DO SEGUNDO EXEMPLO. VEJA OS RESULTADOS OBTIDOS A CADA TAREFA REALIZADA E TIRE PRINT’S DOS RESULTADOS.
`
delimiter $
create trigger chk_minutos before insert on Filmes
for each row
begin
if new.minutos <0 then
-- Lançar erro 
signal sqlstate '45000' 
set message_text = "Valor inválido para minutos",
mysql_errno = 2022;
end if;
end$
delimiter ;

create table Log_delections (
id int primary key auto_increment,
titulo varchar(60),
quando datetime,
quem varchar(40)
);

delimiter $
create trigger log_deletions after delete on Filmes
for each row
begin
insert into Log_delections values (null, old.titulo, sysdate(), user());
	end$
            delimiter ;
            
DELETE FROM Filmes WHERE id = 1;
DELETE FROM Filmes WHERE id = 7;
DELETE FROM Filmes WHERE id = 3;

select * from log_delections;           

`
<img src="https://github.com/kaialves/Trigger/blob/exemplo-1/log_delete.png" alt="Tabela de filmes">

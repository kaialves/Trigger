create table Pedidos (
IDPedidos int auto_increment primary key,
DataPedido datetime,
NomeCliente varchar(100)
);
-- inserção de dados
insert into Pedidos (DataPedido, NomeCliente) VALUES
(now(), 'Ana Virgulino'),
(now(), 'Erick Verissimo'),
(now(), 'Cesar Cohen');

-- criação da trigger
delimiter $
create trigger RegistroDataCriacaoPedido
before insert on Pedidos
for each row
begin
	set new.DataPedido = now();
    end;
    delimiter ;

-- Inserção de um novo registro
insert into Pedidos (NomeCliente) values ('Elizabeth Webber');

-- consulta 
select * from Pedidos;
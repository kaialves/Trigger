REPRODUZA O PRIMEIRO CÓDIGO SUGERIDO NO MYSQL WORKBENCH. EXECUTE AS ETAPAS E VERIFIQUE SEUS RESULTADOS.
`create table Pedidos (
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
select * from Pedidos;`

<img src="https://github.com/kaialves/Trigger/blob/exemplo-1/exemplo-1.png" alt="Tabela pedidos">

APÓS A EXECUÇÃO DO PRIMEIRO CÓDIGO REALIZE O SEGUNDO EXEMPLO. FAÇA AS ETAPAS INDICADAS DO SEGUNDO EXEMPLO. VEJA OS RESULTADOS OBTIDOS A CADA TAREFA REALIZADA E TIRE PRINT’S DOS RESULTADOS.
`-- Inserção de um novo registro
insert into Pedidos (NomeCliente) values ('Elizabeth Webber');

-- consulta 
select * from Pedidos;`

<img src="https://github.com/kaialves/Trigger/blob/exemplo-1/Screenshot_121.png" alt="Tabela pedidos">

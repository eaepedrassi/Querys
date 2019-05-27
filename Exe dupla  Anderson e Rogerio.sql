CREATE DATABASE	pedido_compra

USE pedido_compra

CREATE TABLE cliente (	id_clie		int			not null PRIMARY KEY,
						nm_clie		varchar(60)	not null,
						doc_clie	varchar(15) not null,
						dtnas_clie	date);

CREATE TABLE pagamento (	id_pgto		int	not null	PRIMARY KEY,
							dsc_pgto	varchar(30));

CREATE TABLE produto	(	id_prod		int	not null	PRIMARY KEY,
							dsc_prod	varchar(40) not null,
							vl_prod		numeric(9,2));

CREATE TABLE pedido	(	id_ped	int	not null PRIMARY KEY,
						id_pgto	int	not null FOREIGN KEY REFERENCES pagamento(id_pgto),
						id_clie int not null FOREIGN KEY REFERENCES cliente(id_clie),
						dt_ped	date,
						tot_ped	numeric(10,2));

CREATE TABLE item_pedido (	id_ped			int not null FOREIGN KEY REFERENCES pedido(id_ped),
							id_prod			int not null FOREIGN KEY REFERENCES produto(id_prod),
							qtd_item_ped	numeric(7,2),
							vl_item_ped		numeric(9,2));

INSERT INTO cliente VALUES 	(1,'TORIM LTDA','55276422000186','2018-05-01'),
							(2,'DORIM ME','85476237000104','2018-05-01'),
							(3,'BURIM SA','96130380000158','2018-05-01'),
							(4,'CORIM MEI','80463974000140','2018-05-01'),
							(5,'BARIM LTDA','86715663000108','2018-05-01');

INSERT INTO pagamento VALUES (1,'A VISTA'),
							 (2,'15 DDL'),
							 (3,'30,60,90 DDL');

INSERT INTO produto VALUES	(1,'DeValle',10.50),
							(2,'Caixa de Bombom',15.00),
							(3,'BCAA',7.20),
							(4,'Oleo de Cartamo',9.75),
							(5,'Whey Protein',20.00),
							(6,'Caseina',45.00),
							(7,'Colageno',5.50),
							(8,'Pasta de Amendoin',15.50),
							(9,'Pre treino',17.45),
							(10,'Animal Pack',25.30);

INSERT INTO pedido VALUES	(1,1,1,'2019-05-01',0.00),
							(2,1,2,'2019-05-02',0.00),
							(3,2,3,'2019-05-10',0.00),
							(4,2,4,'2019-05-15',0.00),
							(5,3,5,'2019-05-16',0.00),
							(6,3,1,'2019-05-17',0.00),
							(7,2,2,'2019-05-17',0.00),
							(8,1,3,'2019-05-20',0.00);

INSERT INTO item_pedido VALUES	(1,3,1,0),
								(1,5,1,0),
								(1,6,1,0),
								(2,3,2,0),
								(2,5,1,0),
								(2,6,2,0),
								(3,3,5,0),
								(3,5,5,0),
								(3,6,5,0),
								(4,10,11,0),
								(4,9,12,0),
								(4,8,10,0),
								(5,2,3,0),
								(5,1,4,0),
								(5,6,6,0),
								(6,1,7,0),
								(6,2,8,0),
								(6,3,20,0),
								(7,3,10,0),
								(7,5,10,0),
								(7,6,10,0),
								(8,3,19,0),
								(8,5,29,0),
								(8,6,39,0);
								
								
select * from cliente order by nm_clie

select * from pagamento order by id_pgto desc

select * from pagamento where id_pgto = 2

select * from cliente where nm_clie like 'M%'

select * from pagamento where dsc_pgto like 'e'

select * from produto where vl_prod > 10.00

select * from pedido where dt_ped between '2018-02-10' and '2019-05-10'

select * from cliente inner join pedido on cliente.id_clie = pedido.id_clie order by nm_clie, id_ped

select id_ped 'Pedido',id_pgto 'Pagamento',id_clie 'Cliente',dt_ped 'Data do Pedido', tot_ped 'Total Pedido' from pedido where id_clie = 2

select * from item_pedido inner join produto on item_pedido.id_prod = produto.id_prod order by dsc_prod

select MIN(tot_ped) 'Menor Pedido' from pedido

select MAX(tot_ped) 'Maior Pedido' from pedido

select AVG(tot_ped) 'Media Pedidos' from pedido

select id_prod from item_pedido inner join pedido on item_pedido.id_ped = pedido.id_ped where pedido.id_clie = 4

select id_pgto from pedido where id_clie = '1'

select	pedido.id_ped 'número do pedido', 
		pedido.dt_ped 'data do pedido', 
		cliente.id_clie 'código do cliente',  
		cliente.nm_clie'nome do cliente', 
		pagamento.dsc_pgto 'descrição da condição de pagamento', 
		item_pedido.qtd_item_ped 'itens do produto', 
		produto.dsc_prod +' R$'+ convert(varchar,item_pedido.vl_item_ped) 'descrição e valor do produto', 
		item_pedido.qtd_item_ped*item_pedido.vl_item_ped 'valor do total do item' , 
		pedido.tot_ped 'total de pedido'

from cliente
	inner join pedido on cliente.id_clie = pedido.id_clie
	inner join item_pedido on pedido.id_ped = item_pedido.id_ped
	inner join pagamento on pedido.id_pgto = pagamento.id_pgto
	inner join produto on item_pedido.id_prod = produto.id_prod

select id_pgto from pedido where id_clie = '1'

select COUNT(id_ped) from pedido where id_clie = 3

select SUM(qtd_item_ped*vl_item_ped) from item_pedido

select COUNT(*) from cliente

select * from item_pedido right join produto on item_pedido.id_prod = produto.id_prod where Isnull(item_pedido.id_prod,'') = ''

select * from cliente right join pedido on cliente.id_clie = pedido.id_clie where Isnull(cliente.id_clie,'') = ''

alter table item_pedido add vl_tot_item numeric(12,2)

update item_pedido set vl_tot_item = qtd_item_ped * vl_item_ped

create view cliente_pedido as select cliente.id_clie, cliente.nm_clie, pedido.id_ped, pedido.dt_ped, pedido.tot_ped from cliente inner join pedido on cliente.id_clie = pedido.id_clie

drop database pedido_compra
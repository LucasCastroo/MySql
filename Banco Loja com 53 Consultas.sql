create database loja;
use loja;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fornecedor` (
  `idfornecedor` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  PRIMARY KEY (`idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `precocompra` float DEFAULT NULL,
  `precovenda` float DEFAULT NULL,
  `quantestoque` int(11) DEFAULT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vendedor` (
  `idvendedor` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `comissaomes` float DEFAULT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `produto` int(11) DEFAULT NULL,
  `vendedor` int(11) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`idvenda`),
  KEY `prodvenda_idx` (`produto`),
  KEY `vendvenda_idx` (`vendedor`),
  KEY `clivenda_idx` (`cliente`),
  CONSTRAINT `clivenda` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prodvenda` FOREIGN KEY (`produto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vendvenda` FOREIGN KEY (`vendedor`) REFERENCES `vendedor` (`idvendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL,
  `funcionario` int(11) DEFAULT NULL,
  `fornecedor` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `funccompra_idx` (`funcionario`),
  KEY `forncompra_idx` (`fornecedor`),
  KEY `prodcompra_idx` (`produto`),
  CONSTRAINT `forncompra` FOREIGN KEY (`fornecedor`) REFERENCES `fornecedor` (`idfornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funccompra` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prodcompra` FOREIGN KEY (`produto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO cliente (idcliente, nome, idade, cidade) VALUES
	(1, "Ana Maria", 69, "Palmas"),
    (2, "Ananias", 37, "Palmas"),
    (3, "Anacleto", 12, "Luzimangues"),
    (4, "José", 32, "Porto Nacional"),
    (5, "Marcela", 21, "Paraíso do Tocantins");
    
    
INSERT INTO produto (idproduto, nome, unidade, precocompra, precovenda, quantestoque) VALUES
    (1, "Leite", "Litro", 2.00, 4.00, 10),
    (2, "Farinha", "Quilo", 1.50, 3.00, 15),
    (3, "Açúcar", "Quilo", 1.20, 2.50, 4),
    (4, "Café", "Quilo", 5.00, 10.00, 8),
    (5, "Arroz", "Quilo", 2.50, 5.00, 12),
	(6, "Pinga", "Unidade", 11.00, 13.00, 21);

INSERT INTO funcionario (idfuncionario, nome, salario) VALUES
(1, 'Lucas da Silva', 2000.00),
(2, 'Mariana', 2500.00),
(3, 'Carl Souza', 3500.00),
(4, 'Ana Livia Caxias', 1270.00),
(5, 'Mário Castro', 1310.00);

INSERT INTO vendedor(idvendedor,nome,salario,comissaomes) VALUES
(1, 'Helena Fernanda Drumond', 1100.00,100.00),
(2, 'Joana', 2500.00,150.00),
(3, 'Catarina Lara', 2500.00,125.00),
(4, 'João', 2800.00,0),
(5, 'Hadassa Sara Sales', 2200.00,0);

INSERT INTO fornecedor (idfornecedor, nome, email) VALUES
(1, 'Nestle', 'nestle@gmail.com'),
(2, 'Pão da Hora', 'paodahoraB@gmail.com'),
(3, 'Piracanjuba', 'piracanjuba@gmail.com'),
(4, 'Fornecedor D', 'fornecedorD@gmail.com'),
(5, 'Fornecedor E', 'fornecedorE@gmail.com');

INSERT INTO venda (idvenda, produto, vendedor, cliente, quantidade, total) VALUES
	(1, 1, 5, 1, 5, (select precovenda from produto where idproduto = 1) * 5),
    (2, 4, 4, 2, 10, (select precovenda from produto where idproduto = 4) * 10),
    (3, 5, 2, 5, 11, (select precovenda from produto where idproduto = 5) * 11),
    (4, 2, 3, 1, 1, (select precovenda from produto where idproduto = 2) * 1),
    (5, 6, 1, 3, 34324, (select precovenda from produto where idproduto = 6) * 34324);
    

INSERT INTO compra (idcompra, funcionario, fornecedor, produto, quantidade) VALUES
	(1, 5, 4, 2, 1000),
	(2, 4, 2, 1, 1200),
	(3, 3, 1, 3, 1300),
	(4, 2, 4, 5, 110),
	(5, 1, 5, 6, 100);



-- CONSULTAS
-- 1. Listar todos os clientes de Palmas
-- 2. Listar todos os clientes com mais de 25 anos
-- 3. Listar todos os clientes entre 25 e 35 anos
-- 4. Listar todos os vendedores que ganharam comissão no mês
-- 5. Listar todos os vendedores com salário maior que 1200 
-- 6. Listar todos os funcionários com salário entre 1250 e 1350
-- 7. Listar o nome dos produtos e o preço de venda de cada um
-- 8. Listar o nome dos produtos que tem mais de 5 em estoque
-- 9. Listar todos os produtos vendidos “no quilo”
-- 10. Listar o nome dos produtos e o lucro de cada um
-- 11. Listar todos os fornecedores de quem a empresa já comprou
-- 12. Listar todos os funcionários que já realizaram alguma compra
-- 13. Listar todos os clientes para quem a empresa já vendeu
-- 14. Listar todos os vendedores que já realizaram alguma venda
-- 15. Listar todos os produtos que já foram vendidos
-- 16. Listar todos os produtos que a empresa já comprou
-- 17. Listar todos as vendas nas quais a quantidade vendida era maior que a quantidade em estoque
-- 18. Listar a soma das idades dos clientes
-- 19. Listar a média salarial dos vendedores
-- 20. Listar a maior comissão de vendedores
-- 21. Listar o menor salário de funcionários
-- 22. Listar a média do preço de compra dos produtos
-- 23. Listar a soma do total de todas as vendas
-- 24. Listar o maior preço de venda dos produtos
-- 25. Listar a quantidade total de produtos vendidos
-- 26. Listar a quantidade total de produtos comprados
-- 27. Listar a quantidade total de produtos em estoque
-- 28. Listar sem repetição todos os fornecedores de quem o funcionário Mário já fez compras
-- 29. Listar sem repetição todos os produtos que a funcionária Mariana já comprou
-- 30. Listar sem repetição todos os produtos comprados do fornecedor Nestle
-- 31. Listar sem repetição todos os fornecedores que já venderam o produto “farinha”
-- 32. Listar sem repetição todos os produtos comprados pelo cliente Ananias
-- 33. Listar sem repetição todos os clientes que já compraram o produto “pinga”
-- 34. Listar sem repetição todos os clientes atendidos pelo vendedor João
-- 35. Listar sem repetição todos os vendedores que já atenderam a cliente Ana Maria
-- 36. Listar sem repetição o preço de venda e o nome do produto de todos os produtos comprados pelo cliente Anacleto
-- 37. Listar sem repetição o nome do produto e a quantidade em estoque de todos os produtos vendidos pela vendedora Joana
-- 38. Nome do fornecedor e quantidade de compras feitas de cada um
-- 39. Nome do funcionário e quantidade de compras feitas por cada um
-- 40. Nome do vendedor e quantidade de vendas feitas por cada um
-- 41. Nome do cliente e quantidade de vendas feitas para cada um
-- 42. Nome do produto e quantidade de compras feitas de cada produto
-- 43. Nome do produto e quantidade de vendas feitas de cada produto
-- 44. Nome do fornecedor e quantidade de vendas realizadas de produtos desse fornecedor
-- 45. Idcompra e quantidade de vendas de produtos dessa compra
-- 46. Quantidade de clientes atendidos por cada vendedor
-- 47. Soma do preço de venda dos produtos vendidos por cada vendedor
-- 48. Soma da quantidade em estoque de produtos comprados por cada fornecedor
-- 51. Todos os clientes que já compraram produtos do fornecedor “Pão da Hora”
-- 52. Todos os vendedores que venderam produtos do fornecedor “Piracanjuba”
-- 53. Todos os clientes para quem já foi vendido um produto comprado pelo funcionário Mário


-- RESPOSTAS

-- 1:
select * from cliente where cidade like 'Palmas';

-- 2:
select * from cliente where idade > 25;

-- 3: 
select * from cliente where idade between 25 and 35;

-- 4:
select * from vendedor where comissaomes > 0;

-- 5:
select * from vendedor where salario > 1200;

-- 6:
select * from funcionario where salario between 1250 and 1350;

-- 7:
select produto.nome, produto.precovenda from produto;

-- 8:
select produto.nome from produto where quantestoque > 5;

-- 9:
select * from produto where unidade like 'Quilo';

-- 10:
select produto.nome, (produto.precovenda - produto.precocompra) as lucro from produto; 

-- 11:
select fornecedor.* from compra, fornecedor where compra.fornecedor = fornecedor.idfornecedor;

-- 12:
select funcionario.* from funcionario, compra where compra.funcionario = funcionario.idfuncionario;

-- 13:
select cliente.* from cliente, venda where venda.cliente = cliente.idcliente group by idcliente;

-- 14:
select vendedor.* from vendedor, venda where venda.vendedor = vendedor.idvendedor;

-- 15:
select produto.* from produto, venda where venda.produto = produto.idproduto;

-- 16:
select produto.* from produto, compra where compra.produto = produto.idproduto;

-- 17:
select venda.* from venda, produto where venda.produto = produto.idproduto and venda.quantidade > produto.quantestoque;

-- 18:
select sum(idade) as 'Soma das idades' from cliente;

-- 19:
select avg(salario) as 'Média Salarial' from vendedor;

-- 20:
select max(comissaomes) as 'Maior Comissão' from vendedor;

-- 21:
select min(salario) as 'Menor Salário' from funcionario;

-- 22:
select avg(precocompra) as 'Média Preço Compra' from produto;

-- 23:
select sum(total) as 'Total' from venda;

-- 24:
select max(total) as 'Maior Preço Venda' from venda;

-- 25:
select sum(quantidade) as 'Quantidade Total' from venda;

-- 26:
select sum(quantidade) as 'Total Produtos' from compra;

-- 27:
select sum(quantestoque) as 'Total Produtos Estoque' from produto;

-- 28:
select fornecedor.* from fornecedor, compra, funcionario where funcionario.nome like '%Mário%' and compra.funcionario = funcionario.idfuncionario and compra.fornecedor = fornecedor.idfornecedor group by idfornecedor;

-- 29:
select produto.* from produto, compra, funcionario where funcionario.nome like '%Mariana%' and compra.funcionario = funcionario.idfuncionario and compra.produto = produto.idproduto group by idproduto;

-- 30:
select produto.* from produto, compra, fornecedor where fornecedor.nome like '%Nestle%' and compra.produto = produto.idproduto and compra.fornecedor = fornecedor.idfornecedor group by idproduto;

-- 31:
select fornecedor.* from fornecedor, compra, produto where produto.nome like '%Farinha%' and compra.produto = produto.idproduto and compra.fornecedor = fornecedor.idfornecedor group by fornecedor.idfornecedor;

-- 32:
select produto.* from produto, venda, cliente where cliente.nome like '%Ananias%' and venda.produto = produto.idproduto and venda.cliente = cliente.idcliente group by idproduto;

-- 33:
select produto.* from produto, venda, cliente where produto.nome like '%Pinga%' and venda.produto = produto.idproduto and venda.cliente = cliente.idcliente group by idproduto;

-- 34:
select cliente.* from cliente, venda, vendedor where vendedor.nome like '%João%' and venda.cliente = cliente.idcliente and venda.vendedor = vendedor.idvendedor group by idcliente;

-- 35:
select vendedor.* from vendedor, venda, cliente where cliente.nome like '%Ana Maria%' and venda.cliente = cliente.idcliente and venda.vendedor = vendedor.idvendedor group by idvendedor;

-- 36:
select produto.precovenda, produto.nome from produto, venda, cliente where cliente.nome like '%Anacleto%' and venda.produto = produto.idproduto and venda.cliente = cliente.idcliente group by idproduto;

-- 37:
select produto.nome, produto.quantestoque from produto, venda, vendedor where vendedor.nome like '%Joana%' and venda.produto = produto.idproduto and venda.vendedor = vendedor.idvendedor group by idproduto;

-- 38:
select fornecedor.nome, compra.quantidade from fornecedor, compra where compra.fornecedor = fornecedor.idfornecedor;

-- 39:
select funcionario.nome, compra.quantidade from funcionario, compra where compra.funcionario = funcionario.idfuncionario;

-- 40:
select vendedor.nome, venda.quantidade from vendedor, venda where venda.vendedor = vendedor.idvendedor;

-- 41:
select cliente.nome, venda.quantidade from cliente, venda where venda.cliente = cliente.idcliente;

-- 42:
select produto.nome, compra.quantidade from produto, compra where compra.produto = produto.idproduto;

-- 43:
select produto.nome, venda.quantidade from produto, venda where venda.produto = produto.idproduto;

-- 44:
select fornecedor.nome, count(idvenda) as 'Vendas' from fornecedor, produto, venda, compra where venda.produto = produto.idproduto and compra.produto = produto.idproduto and compra.fornecedor = fornecedor.idfornecedor group by idfornecedor;

-- 45:
select compra.idcompra, count(idvenda) as vendas from compra, venda where venda.produto = compra.produto group by idcompra;

-- 46:
select vendedor.nome, count(idcliente) as clientes from vendedor, venda, cliente where venda.vendedor = vendedor.idvendedor and venda.cliente = cliente.idcliente group by idvendedor;

-- 47:
select vendedor.nome, sum(total) as valor_vendido from venda, produto, vendedor where venda.produto = produto.idproduto and venda.vendedor = vendedor.idvendedor group by idvendedor;

-- 48:
select fornecedor.nome, sum(quantestoque) as estoque from fornecedor, produto, compra where compra.produto = produto.idproduto and compra.fornecedor = fornecedor.idfornecedor group by idfornecedor;

-- 51:
select cliente.* from cliente, fornecedor, venda, compra where venda.cliente = cliente.idcliente and venda.produto = compra.produto and compra.fornecedor = fornecedor.idfornecedor and fornecedor.nome like "%Pão da hora%" group by idcliente;

-- 52:
select vendedor.* from vendedor, venda, compra, fornecedor where vendedor.idvendedor = venda.vendedor and venda.produto = compra.produto and compra.fornecedor = fornecedor.idfornecedor and fornecedor.nome like "%Piracanjuba%";

-- 53:
select cliente.* from cliente, venda, compra, funcionario where cliente.idcliente = venda.cliente and venda.produto = compra.produto and compra.funcionario = funcionario.idfuncionario and funcionario.nome like "%mário%" group by idcliente;
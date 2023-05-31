-- DROP DATABASE clinica;
CREATE DATABASE clinica;
use clinica;

CREATE TABLE `fisioterapeuta` (
  `idfisioterapeuta` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `quanttratamentos` int(11) DEFAULT NULL,
  `valorareceber` float DEFAULT NULL,
  PRIMARY KEY (`idfisioterapeuta`)
) ENGINE=InnoDB;

CREATE TABLE `paciente` (
  `idpaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `valorapagar` float DEFAULT NULL,
  PRIMARY KEY (`idpaciente`)
) ;

CREATE TABLE `tratamento` (
  `idtratamento` int(11) NOT NULL AUTO_INCREMENT,
  `fisioterapeuta` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `datainicio` date NOT NULL,
  `quantsessoes` int(11) DEFAULT NULL,
  `valortotal` float DEFAULT NULL,
  `valoremaberto` float DEFAULT NULL,
  PRIMARY KEY (`idtratamento`),
  KEY `ptt_idx` (`paciente`),
  KEY `ftt_idx` (`fisioterapeuta`),
  CONSTRAINT `ftt` FOREIGN KEY (`fisioterapeuta`) REFERENCES `fisioterapeuta` (`idfisioterapeuta`),
  CONSTRAINT `ptt` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`idpaciente`)
) ;
CREATE TABLE `sessao` (
  `idsessao` int(11) NOT NULL AUTO_INCREMENT,
  `tratamento` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `realizacao` date DEFAULT NULL,
  PRIMARY KEY (`idsessao`),
  KEY `ttt_idx` (`tratamento`),
  CONSTRAINT `ttt` FOREIGN KEY (`tratamento`) REFERENCES `tratamento` (`idtratamento`)
) ;


-- Inserts para a tabela de pacientes
INSERT INTO paciente (nome, cpf, idade, valorapagar) VALUES
  ('João Silva', '11111111111', 30, 0),
  ('Maria Santos', '22222222222', 45, 0),
  ('Pedro Almeida', '33333333333', 55, 0),
  ('Ana Costa', '44444444444', 28, 0),
  ('Lucas Oliveira', '55555555555', 37, 0);

-- Inserts para a tabela de fisioterapeutas
INSERT INTO fisioterapeuta (nome, cpf, quanttratamentos, valorareceber) VALUES
  ('Fernanda Lima', '11111111111', 24, 0),
  ('Carlos Ribeiro', '22222222222', 2, 0),
  ('Mariana Castro', '33333333333', 8, 0),
  ('Ricardo Mendes', '44444444444', 11, 0),
  ('Amanda Souza', '55555555555', 3, 0);

-- Inserts para a tabela de tratamentos
INSERT INTO tratamento (fisioterapeuta, paciente, datainicio, quantsessoes, valortotal, valoremaberto) VALUES
  (1, 1, '2023-01-05', 10, 0, 0),
  (2, 2, '2023-02-10', 8, 0, 0),
  (3, 3, '2023-03-15', 12, 0, 500),
  (4, 4, '2023-04-20', 6, 0, 100),
  (5, 5, '2023-05-25', 4, 0, 0);

-- Inserts para a tabela de sessões
INSERT INTO sessao (tratamento, valor, status, realizacao) VALUES
  (1, 50, 'Realizada', '2023-01-05'),
  (1, 50, 'Realizada', '2023-01-07'),
  (1, 50, 'Realizada', '2023-01-10'),
  (2, 75, 'Realizada', '2023-02-10'),
  (2, 75, 'Realizada', '2023-02-12'),
  (3, 60, 'Realizada', '2023-03-15'),
  (3, 60, 'Realizada', '2023-03-18'),
  (3, 60, 'Realizada', '2023-03-20'),
  (4, 100, 'Realizada', '2023-04-20'),
  (4, 100, 'Realizada', '2023-04-22'),
  (4, 100, 'Realizada', '2023-04-25'),
  (5, 120, 'Não Realizada', '2023-05-25'),
  (5, 120, 'Não Realizada', '2023-05-27'),
  (5, 120, 'Não Realizada', '2023-05-29'),
  (5, 120, 'Não Realizada', '2023-05-31');
  
  
  
  /* CONSULTAS A SEREM REALIZADAS:
1 - Obter todos os pacientes.
2 - Obter todos os fisioterapeutas.
3 - Obter todos os tratamentos e seus detalhes.
4 - Obter todas as sessões de um determinado paciente.
5 - Obter a quantidade de tratamentos realizados por cada fisioterapeuta.
6 - Obter o valor total a receber por cada fisioterapeuta.
7 - Obter a média de idade dos pacientes.
8 - Obter o paciente mais jovem.
9 - Obter o fisioterapeuta com o maior número de tratamentos.
10 - Obter as sessões não realizadas.

USANDO SUBCONSULTAS:

11 - Obter todos os pacientes que possuem tratamentos em aberto.
12 - Obter os fisioterapeutas que realizaram mais sessões do que a média de sessões realizadas por todos os fisioterapeutas.
13 - Obter os pacientes que já realizaram todos os tratamentos disponíveis.
14 - Obter o valor total recebido por cada fisioterapeuta, considerando apenas os tratamentos com mais de 5 sessões.
15 - Obter as sessões realizadas pelos pacientes menores de 12 anos.
*/

-- 1:
select * from paciente;

-- 2:
select * from fisioterapeuta;

-- 3:
select * from tratamento;

-- 4:
select paciente.* from paciente, sessao, tratamento 
where sessao.tratamento = tratamento.idtratamento 
and tratamento.paciente = paciente.idpaciente 
and paciente.nome like '%Lucas%' group by idpaciente;

-- 5:
select fisioterapeuta.nome, count(idtratamento) 
as 'Quantidade de Tratamentos Feitos' 
from tratamento, fisioterapeuta 
where tratamento.fisioterapeuta = fisioterapeuta.idfisioterapeuta
group by idfisioterapeuta; 

-- 6:
select fisioterapeuta.nome, fisioterapeuta.valorareceber from fisioterapeuta;

-- 7:
select avg(idade) as 'Média de Idade Pacientes' from paciente;

-- 8:
select paciente.nome, min(idade) as 'Mais Jovem' from paciente group by nome;

-- 9:
select fisioterapeuta.nome, max(quanttratamentos) as 'Maior número de tratamentos' from fisioterapeuta group by nome;

-- 10:
select * from sessao where sessao.status like '%Não%';


-- SUBCONSULTAS:

-- 11:
select paciente.*
from   paciente
where  idpaciente in (select paciente
                      from   tratamento
                      where  quantsessoes > (select count(idsessao)
                                             from   sessao
                                             where  tratamento = idtratamento));

-- 12:
select fisioterapeuta.nome
from   fisioterapeuta
where  (select count(idsessao)
        from   sessao
        where  sessao.tratamento in (select idtratamento
                                     from   tratamento
                                     where  tratamento.fisioterapeuta =
                                            fisioterapeuta.idfisioterapeuta)) >
       (select avg(idsessao)
        from
              sessao);
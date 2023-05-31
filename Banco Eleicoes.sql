-- ALUNOS: Lucas Araújo, Marcelo Alves e Matheus Naves
drop database eleicoes;
create database eleicoes;

use eleicoes;

create table endereco (
idEndereco int primary key auto_increment,
uf char(2) not null,
cidade varchar(40) not null,
bairro varchar(20) not null,
rua varchar(20) not null,
numero int not null
);

create table contato (
idContato int primary key auto_increment,
telefone varchar(20) not null,
email varchar(30) not null
);

create table dadosPessoais (
idDados int primary key auto_increment,
cpf varchar(20) not null,
nome varchar(40) not null,
sobrenome varchar(40) not null,
idade int not null,
enderecoId int not null,
contatoId int not null,
foreign key (enderecoId) references endereco(idEndereco),
foreign key (contatoId) references contato(idContato)
);

create table eleitor (
idEleitor int primary key auto_increment,
dadosId int not null,
ufTitulo char(2),
foreign key (dadosId) references dadosPessoais(idDados)
);

create table voto (
idVoto int primary key auto_increment,
votoDepEstadual varchar(5),
votoDepFederal varchar(4),
votoSenador varchar(3),
votoGovernador varchar(2),
votoPresidente varchar(2),
eleitorId int not null,
foreign key (eleitorId) references eleitor(idEleitor)
);

create table contatoPartido(
idContatoPartido int primary key auto_increment,
telefone varchar(20) not null,
email varchar(30) not null
);

create table partido (
idPartido int primary key auto_increment,
nomePartido varchar(40) not null,
siglaPartido varchar(20) not null,
contatoPartidoId int not null,
foreign key (contatoPartidoId) references contatoPartido(idContatoPartido)
);

create table candidato (
idCandidato int primary key auto_increment,
cargo enum('Deputado Estadual', 'Deputado Federal', 'Senador', 'Governador', 'Presidente') not null,
ufCandidatura char(2) not null,
numeroCandidato varchar(5) not null,
dadosId int not null,
partidoId int not null,
foreign key (dadosId) references dadosPessoais(idDados),
foreign key (partidoId) references partido(idPartido)
);

create table votacao (
idVotacao int primary key auto_increment,
votoId int not null,
eleitorId int not null,
foreign key (votoId) references voto(idVoto),
foreign key (eleitorId) references eleitor(idEleitor)
);

create table coligacao (
idColigacao int primary key auto_increment,
nomeColigacao varchar(20) not null,
siglaColigacao varchar(20) not null
);

create table partido_coligacao (
idPartidoColigacao int primary key auto_increment,
partidoId int not null,
coligacaoId int not null,
foreign key (partidoId) references partido(idPartido),
foreign key (coligacaoId) references coligacao(idColigacao)
);


INSERT INTO contato (telefone, email) VALUES
('(11) 1111-1111', 'joao.silva@gmail.com'),
('(11) 2222-2222', 'maria.santos@yahoo.com.br'),
('(11) 3333-3333', 'pedro.mendes@hotmail.com'),
('(11) 4444-4444', 'ana.souza@gmail.com'),
('(11) 5555-5555', 'felipe.oliveira@gmail.com'),
('(11) 6666-6666', 'mariana.lima@hotmail.com'),
('(11) 7777-7777', 'fernando.gomes@yahoo.com.br'),
('(11) 8888-8888', 'lucas.alves@gmail.com'),
('(11) 9999-9999', 'julia.rocha@hotmail.com'),
('(11) 0000-0000', 'gabriel.carvalho@yahoo.com.br'),
('(11) 1111-1111', 'leticia.ferreira@gmail.com'),
('(11) 2222-2222','rafael.santana@hotmail.com'),
('(11) 3333-3333', 'marcela.rodrigues@gmail.com'),
('(11) 4444-4444', 'vinicius.sousa@hotmail.com'),
('(11) 5555-5555', 'camila.nascimento@yahoo.com.br'),
('(11) 1234-5678', 'thiago.oliveira@gmail.com'),
('(11) 8765-4321', 'carla.gomez@hotmail.com'),
('(11) 2468-1357', 'thiago.carlos@gmail.com'),
('(11) 1357-2468', 'pedro.henrique@hotmail.com'),
('(11) 1212-3434', 'jorge.pereira@hotmail.com'),
('(11) 3211-1111', 'joao.s@gmail.com'),
('(11) 5332-2222', 'maria.s@yahoo.com.br'),
('(11) 2333-3333', 'pedro.m@hotmail.com'),
('(11) 4415-4444', 'ana.s@gmail.com'),
('(11) 6362-5555', 'felipe.o@gmail.com'),
('(11) 2342-6666', 'mariana.l@hotmail.com'),
('(11) 3331-7777', 'fernando.g@yahoo.com.br'),
('(11) 2231-8888', 'lucas.a@gmail.com'),
('(11) 0674-9999', 'julia.r@hotmail.com'),
('(11) 6450-0000', 'gabriel.c@yahoo.com.br'),
('(11) 1551-1111', 'leticia.f@gmail.com'),
('(11) 3412-2222','rafael.s@hotmail.com'),
('(63) 4525-3333', 'marcela.r@gmail.com'),
('(63) 5544-4444', 'vinicius.s@hotmail.com'),
('(63) 3525-5555', 'camila.n@yahoo.com.br'),
('(63) 2425-5678', 'thiago.o@gmail.com'),
('(63) 6312-4321', 'carla.g@hotmail.com'),
('(63) 3325-1357', 'thiago.c@gmail.com'),
('(63) 5266-2468', 'pedro.h@hotmail.com'),
('(63) 6737-3434', 'jorge.p@hotmail.com'),
('(63) 2331-6666', 'mariana.le@hotmail.com'),
('(63) 3523-7777', 'fernando.gt@yahoo.com.br'),
('(63) 2344-8888', 'lucas.ah@gmail.com'),
('(63) 0674-4329', 'julia.rh@hotmail.com'),
('(63) 6450-2430', 'gabriel.ch@yahoo.com.br'),
('(63) 1543-3341', 'leticia.fe@gmail.com'),
('(63) 3424-2222','rafael.sr@hotmail.com'),
('(63) 3424-3333', 'marcela.rt@gmail.com'),
('(63) 4424-4444', 'vinicius.se@hotmail.com'),
('(63) 1324-5555', 'camila.nt@yahoo.com.br'),
('(63) 2314-5678', 'thiago.ot@gmail.com'),
('(63) 4414-4321', 'carla.ge@hotmail.com'),
('(63) 9841-1357', 'thiago.ce@gmail.com'),
('(63) 3123-2468', 'pedro.he@hotmail.com');


INSERT INTO endereco (uf, cidade, bairro, rua, numero) VALUES 
('SP', 'São Paulo', 'Bairro 1', 'Rua 1', 100),
('SP', 'São Paulo', 'Bairro 2', 'Rua 2', 200),
('SP', 'São Paulo', 'Bairro 3', 'Rua 3', 300),
('SP', 'São Paulo', 'Bairro 4', 'Rua 4', 400),
('SP', 'São Paulo', 'Bairro 5', 'Rua 5', 500),
('SP', 'São Paulo', 'Bairro 6', 'Rua 6', 600),
('SP', 'São Paulo', 'Bairro 7', 'Rua 7', 700),
('SP', 'São Paulo', 'Bairro 8', 'Rua 8', 800),
('SP', 'São Paulo', 'Bairro 9', 'Rua 9', 900),
('SP', 'São Paulo', 'Bairro 10', 'Rua 10', 1000),
('SP', 'Campinas', 'Bairro 1', 'Rua 1', 100),
('SP', 'Campinas', 'Bairro 2', 'Rua 2', 200),
('SP', 'Campinas', 'Bairro 3', 'Rua 3', 300),
('SP', 'Campinas', 'Bairro 4', 'Rua 4', 400),
('SP', 'Campinas', 'Bairro 5', 'Rua 5', 500),
('SP', 'Campinas', 'Bairro 6', 'Rua 6', 600),
('SP', 'Campinas', 'Bairro 7', 'Rua 7', 700),
('SP', 'Campinas', 'Bairro 8', 'Rua 8', 800),
('SP', 'Campinas', 'Bairro 9', 'Rua 9', 900),
('SP', 'Campinas', 'Bairro 10', 'Rua 10', 1000),
('SP', 'São José dos Campos', 'Bairro 1', 'Rua 1', 100),
('SP', 'São José dos Campos', 'Bairro 2', 'Rua 2', 200),
('SP', 'São José dos Campos', 'Bairro 3', 'Rua 3', 300),
('SP', 'São José dos Campos', 'Bairro 4', 'Rua 4', 400),
('SP', 'São José dos Campos', 'Bairro 5', 'Rua 5', 500),
('SP', 'São José dos Campos', 'Bairro 6', 'Rua 6', 600),
('SP', 'São José dos Campos', 'Bairro 7', 'Rua 7', 700),
('SP', 'São José dos Campos', 'Bairro 8', 'Rua 8', 800),
('SP', 'São José dos Campos', 'Bairro 9', 'Rua 9', 900),
('SP', 'São José dos Campos', 'Bairro 10', 'Rua 10', 1000),
('SP', 'Osasco', 'Bairro 2', 'Rua 2', 200),
('TO', 'Palmas', 'Bairro 1', 'Rua 1', 100),
('TO', 'Palmas', 'Bairro 2', 'Rua 2', 200),
('TO', 'Palmas', 'Bairro 3', 'Rua 3', 300),
('TO', 'Palmas', 'Bairro 4', 'Rua 4', 400),
('TO', 'Palmas', 'Bairro 5', 'Rua 5', 500),
('TO', 'Palmas', 'Bairro 6', 'Rua 6', 600),
('TO', 'Palmas', 'Bairro 7', 'Rua 7', 700),
('TO', 'Palmas', 'Bairro 8', 'Rua 8', 800),
('TO', 'Palmas', 'Bairro 9', 'Rua 9', 900),
('TO', 'Palmas', 'Bairro 10', 'Rua 10', 1000),
('TO', 'Palmas', 'Bairro 11', 'Rua 11', 1100),
('TO', 'Palmas', 'Bairro 12', 'Rua 12', 1200),
('TO', 'Palmas', 'Bairro 13', 'Rua 13', 1300),
('TO', 'Palmas', 'Bairro 14', 'Rua 14', 1400),
('TO', 'Palmas', 'Bairro 15', 'Rua 15', 1500),
('TO', 'Palmas', 'Bairro 16', 'Rua 16', 1600),
('TO', 'Palmas', 'Bairro 17', 'Rua 17', 1700),
('TO', 'Palmas', 'Bairro 18', 'Rua 18', 1800),
('TO', 'Palmas', 'Bairro 19', 'Rua 19', 1900),
('TO', 'Palmas', 'Bairro 20', 'Rua 20', 2000),
('TO', 'Palmas', 'Bairro 19', 'Rua 19', 1900),
('TO', 'Palmas', 'Bairro 20', 'Rua 20', 2000),
('TO', 'Araguaína', 'Bairro 20', 'Rua 20', 200);


INSERT INTO dadosPessoais (cpf, nome, sobrenome, idade, enderecoId, contatoId)
VALUES 
('123.456.789-00', 'João', 'Silva', 18, 1, 1),
('987.654.321-00', 'Maria', 'Santos', 18, 2, 2),
('456.789.123-00', 'Pedro', 'Mendes', 19, 3, 3),
('321.654.987-00', 'Ana', 'Souza', 19, 4, 4),
('555.666.777-88', 'Felipe', 'Oliveira', 20, 5, 5),
('999.888.777-66', 'Mariana', 'Lima', 20, 6, 6),
('222.333.444-55', 'Fernando', 'Gomes' , 20, 7, 7),
('111.222.333-44', 'Lucas', 'Alves' , 21, 8, 8),
('444.555.666-77', 'Julia', 'Rocha' , 22, 9, 9),
('777.888.999-00', 'Gabriel', 'Carvalho' , 23, 10, 10),
('123.789.456-00', 'Leticia', 'Ferreira' , 24, 11, 11),
('987.321.654-00', 'Rafael', 'Santana' , 22, 12, 12),
('456.123.789-00', 'Marcela', 'Rodrigues' , 26, 13, 13),
('321.987.654-00', 'Vinicius', 'Sousa' , 25, 14, 14),
('555.777.999-11', 'Camila', 'Nascimento' , 25, 15, 15),
('999.727.555-22', 'Thiago', 'Oliveira' , 28, 16, 16),
('343.444.656-33', 'Carla', 'Gomez' , 27, 17, 17),
('955.757.555-22', 'Thiago', 'Carlos', 33, 18, 18),
('212.422.666-33', 'Pedro', 'Henrique', 44, 19, 19),
('642.443.666-33', 'Jorge', 'Pereira', 34, 20, 20),
('199.456.789-00', 'João', 'Selva', 30, 21, 21),
('988.654.321-00', 'Maria', 'Silva', 62, 22, 22),
('442.789.123-00', 'Pedro', 'Medros', 63, 23, 23),
('421.654.987-00', 'Ana', 'Sales', 44, 24, 24),
('534.666.777-88', 'Felipe', 'Olive', 65, 25, 25),
('966.888.731-66', 'Mariana', 'Leite', 40, 26, 26),
('298.333.444-55', 'Fernando', 'Gomez' , 69, 27, 27),
('145.222.333-44', 'Lucas', 'Alts' , 54, 28, 28),
('112.555.666-77', 'Julia', 'Rubh' , 78, 29, 29),
('421.888.999-00', 'Gabriel', 'Costa' , 58, 30, 30),
('133.789.456-00', 'Leticia', 'Farias' , 62, 31, 31),
('537.321.654-00', 'Rafael', 'Santos' , 93, 32, 32),
('345.123.789-00', 'Marcela', 'Rogger' , 35, 33, 33),
('056.987.654-00', 'Vinicius', 'Souza' , 62, 34, 34),
('055.534.999-11', 'Camila', 'Nalles' , 17, 35, 35),
('009.767.555-22', 'Thiago', 'Oliv' , 18, 36, 36),
('563.614.656-33', 'Carla', 'Gomes' , 58, 37, 37),
('435.761.555-22', 'Thiago', 'Carbro', 23, 38, 38),
('572.420.666-33', 'Pedro', 'Henri', 24, 39, 39),
('072.443.666-33', 'Jorge', 'Perez', 18, 40, 40),

('134.888.731-01', 'Mariana', 'Gomes', 25, 41, 41),
('668.333.444-02', 'Fernando', 'Leite' , 69, 42, 42),
('777.222.333-03', 'Lucas', 'Alts' , 54, 43, 43),
('543.555.666-04', 'Julia', 'Rubh' , 78, 44, 44),
('341.888.999-05', 'Gabriel', 'Costa' , 58, 45, 45),
('567.789.456-06', 'Leticia', 'Farias' , 62, 46, 46),
('098.321.654-07', 'Rafael', 'Santos' , 93, 47, 47),
('765.123.789-08', 'Marcela', 'Rogger' , 35, 48, 48),
('345.987.654-09', 'Vinicius', 'Souza' , 62, 49, 49),
('665.534.999-10', 'Camila', 'Nalles' , 17, 50, 50),
('324.767.555-11', 'Thiago', 'Oliv' , 18, 51, 51),
('876.614.656-12', 'Carla', 'Gomes' , 51, 52, 52),
('456.761.555-13', 'Thiago', 'Carbro', 23, 53, 53),
('232.420.666-14', 'Pedro', 'Henri', 24, 54, 54);

INSERT INTO contatoPartido (telefone, email) VALUES
('(11) 1111-1111', 'partido01@gmail.com'),
('(11) 2222-2222', 'partido02@gmail.com'),
('(11) 3333-3333', 'partido03@gmail.com'),
('(11) 4444-4444', 'partido04@gmail.com');

INSERT INTO partido (nomePartido, siglaPartido, contatoPartidoId) VALUES
('Partido Java Maioral', 'PVM', 1),
('Partido Python Brasil', 'PPB', 2),
('Partido Front Brasil', 'PFB', 3),
('Partido Dados Brasil', 'PDB', 4);

INSERT INTO candidato(cargo,ufCandidatura,numeroCandidato,dadosId,partidoId) VALUES 
('Deputado Estadual', 'SP', '11111',41,1),
('Deputado Estadual', 'SP', '22222',42,2),
('Deputado Estadual', 'TO', '33333',43,3),
('Deputado Estadual', 'SP', '44444',44,4),
('Deputado Federal', 'TO', '1111',45,1),
('Deputado Federal', 'SP', '2222',46,2),
('Deputado Federal', 'SP', '3333',47,3),
('Deputado Federal', 'TO', '4444',48,4),
('Senador', 'TO', '111',49,1),
('Senador', 'SP', '222',50,2),
('Governador', 'TO', '11',51,1),
('Governador', 'TO', '11',52,2),
('Presidente', 'TO', '11',53,1),
('Presidente', 'SP', '22',54,2);

INSERT INTO coligacao (nomeColigacao, siglaColigacao) VALUES
('Tech Avante', 'TA'),
('Sempre Tech', 'ST');

INSERT INTO eleitor (dadosId, ufTitulo)
VALUES 
(1, 'SP'),
(2, 'SP'),
(3, 'SP'),
(4, 'SP'),
(5, 'SP'),
(6, 'SP'),
(7, 'SP'),
(8, 'SP'),
(9, 'SP'),
(10, 'SP'),
(11, 'SP'),
(12, 'SP'),
(13, 'SP'),
(14, 'SP'),
(15, 'SP'),
(16, 'SP'),
(17, 'SP'),
(18, 'SP'),
(19,'SP'),
(20, 'SP'),
(21, 'SP'),
(22, 'SP'),
(23, 'SP'),
(24, 'SP'),
(25, 'SP'),
(26, 'SP'),
(27, 'SP'),
(28, 'SP'),
(29, 'SP'),
(30, 'SP'),
(31, 'SP'),
(32, 'TO'),
(33, 'TO'),
(34, 'TO'),
(35, 'TO'),
(36, 'TO'),
(37, 'TO'),
(38, 'TO'),
(39, 'TO'),
(40, 'TO'),
(41, 'TO'),
(42, 'TO'),
(43, 'TO'),
(44, 'TO'),
(45, 'TO'),
(46, 'TO'),
(47, 'TO'),
(48, 'TO'),
(49, 'TO'),
(50, 'TO'),
(51, 'TO'),
(52, 'TO'),
(53, 'TO'),
(54, 'TO');

INSERT INTO voto (votoDepEstadual, votoDepFederal, votoSenador, votoGovernador, votoPresidente, eleitorId)
VALUES 
('11111', '1111', '111', '11', '11', 1),
('11111', '1111', '111', '11', '11', 2),
('11111', '1111', '111', '11', '11', 3),
('11111', '1111', '111', '11', '11', 4),
('11111', '1111', '111', '11', '11', 5),
('11111', '1111', '111', '11', '11', 6),
('11111', '1111', '111', '11', '11', 7),
('11111', '1111', '111', '11', '11', 8),
('11111', '1111', '111', '11', '11', 9),
('11111', '1111', '111', '11', '11', 10),
('11111', '1111', '111', '11', '11', 11),
('11111', '1111', '111', '11', '11', 12),
('11111', '1111', '111', '11', '11', 13),
('11111', '1111', '111', '11', '11', 14),
('11111', '1111', '111', '11', '11', 15),
('11111', '1111', '111', '11', '11', 16),
('11111', '1111', '111', '11', '11', 17),
('0', '0', '0', '0', '0', 18),
('0', '', '', '', '0', 19),
('11111', '1111', '111', '11', '11', 20),
('22222', '2222', '222', '22', '22', 21),
('22222', '2222', '222', '22', '22', 22),
('22222', '2222', '222', '22', '22', 23),
('22222', '2222', '222', '22', '22', 24),
('22222', '2222', '222', '22', '22', 25),
('22222', '2222', '222', '22', '22', 26),
('22222', '2222', '222', '22', '22', 27),
('22222', '2222', '222', '22', '22', 28),
('22222', '2222', '222', '22', '22', 29),
('22222', '2222', '222', '22', '22', 30),
('33333', '3333', '111', '11', '11', 31),
('33333', '3333', '222', '22', '22', 32),
('33333', '3333', '0', '22', '11', 3),
('33333', '3333', '222', '22', '22', 34),
('33333', '3333', '111', '22', '11', 35),
('33333', '3333', '222', '22', '11', 36),
('33333', '3333', '111', '22', '22', 37),
('33333', '3333', '111', '22', '11', 38),
('33333', '3333', '222', '11', '22', 39),
('33333', '3333', '', '11', '11', 40),
('44444', '4444', '111', '11', '22', 41),
('44444', '4444', '111', '11', '11', 42),
('44444', '4444', '111', '11', '22', 43),
('44444', '4444', '222', '22', '22', 44),
('44444', '4444', '222', '11', '11', 45),
('22222', '1111', '111', '11', '0', 46),
('22222', '1111', '222', '11', '0', 47),
('22222', '2222', '222', '11', '0', 48),
('22222', '1111', '222', '11', '0', 49),
('22222', '2222', '222', '22', '0', 50),
('22222', '1111', '222', '22', '0', 51),
('11111', '1111', '111', '11', '11', 52),
('22222', '2222', '222', '22', '22', 53),
('11111', '2222', '111', '11', '11', 54);

INSERT INTO votacao (votoId, eleitorId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 51),
(52, 52),
(53, 53),
(54, 54);

INSERT INTO partido_coligacao (partidoId, coligacaoId)
VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2);



-- CONSULTAS --

-- 1:
SELECT dadosPessoais.nome, endereco.uf FROM eleitor, dadosPessoais, endereco 
WHERE eleitor.dadosId = dadosPessoais.idDados AND dadosPessoais.enderecoId = endereco.IdEndereco 
AND uf LIKE 'TO';

-- 2:
SELECT dadosPessoais.nome, partido.siglaPartido FROM candidato JOIN dadosPessoais 
ON candidato.dadosId = dadosPessoais.idDados JOIN partido 
ON candidato.partidoId = partido.idPartido;

-- 3:
SELECT dadosPessoais.nome, partido.siglaPartido FROM candidato JOIN partido 
ON partido.idPartido = candidato.partidoId JOIN dadosPessoais 
ON dadosPessoais.idDados = candidato.dadosId WHERE candidato.cargo = 'Governador' 
ORDER BY candidato.ufCandidatura;

-- 4:
SELECT dadosPessoais.nome AS 'Candidato', partido.siglaPartido AS 'Sigla do Partido', coligacao.siglaColigacao 
AS 'Sigla da Coligação' FROM candidato JOIN dadosPessoais ON candidato.dadosId = dadosPessoais.idDados 
JOIN partido ON candidato.partidoId = partido.idPartido JOIN partido_coligacao 
ON partido.idPartido = partido_coligacao.partidoId JOIN coligacao ON partido_coligacao.coligacaoId = coligacao.idColigacao 
WHERE candidato.cargo = 'Deputado Federal' AND candidato.ufCandidatura = 'SP' ORDER BY dadosPessoais.nome;

-- 5:
SELECT voto.idVoto, voto.votoDepEstadual, voto.votoDepFederal, voto.votoSenador, voto.votoGovernador, voto.votoPresidente, dadosPessoais.nome, dadosPessoais.sobrenome 
FROM voto JOIN candidato ON voto.votoDepEstadual = candidato.numeroCandidato 
OR voto.votoDepFederal = candidato.numeroCandidato OR voto.votoSenador = candidato.numeroCandidato 
OR voto.votoGovernador = candidato.numeroCandidato OR voto.votoPresidente = candidato.numeroCandidato 
JOIN dadosPessoais ON candidato.dadosId = dadosPessoais.idDados WHERE candidato.numeroCandidato = '22';

-- 6:
SELECT DISTINCT siglaPartido, ufCandidatura FROM partido INNER JOIN candidato ON partido.idPartido = candidato.partidoId
WHERE candidato.ufCandidatura = 'SP';

-- 7:
SELECT eleitor.idEleitor FROM voto JOIN eleitor ON voto.eleitorId = eleitor.idEleitor WHERE voto.votoSenador = '';

-- 8:
SELECT candidato.numeroCandidato, candidato.cargo, partido.nomePartido FROM candidato 
INNER JOIN partido ON candidato.partidoId = partido.idPartido INNER JOIN partido_coligacao 
ON partido.idPartido = partido_coligacao.partidoId INNER JOIN coligacao 
ON partido_coligacao.coligacaoId = coligacao.idColigacao WHERE coligacao.nomeColigacao = 'Sempre Tech';

-- 9:
SELECT voto.idVoto, candidato.numeroCandidato, candidato.ufCandidatura, eleitor.ufTitulo FROM voto 
JOIN candidato ON voto.votoDepFederal = candidato.numeroCandidato AND candidato.ufCandidatura = 'TO' 
JOIN eleitor ON voto.eleitorId = eleitor.idEleitor WHERE voto.votoDepFederal = '0';
-- NA NOSSO BANCO COLOCAMOS O 0 PARA REPRESENTAR O BRANCO E O ' '(VAZIO) PARA REPRESENTRAR O NULO!
-- NENHUMA LINHA FOI ALTERADA, POIS NÃO TEM NENHUM INSERT QUE AATENDA A ESSA CONSULTA.

-- 10:
SELECT partido.nomePartido, dadosPessoais.nome, dadosPessoais.sobrenome FROM candidato 
JOIN partido ON candidato.partidoId = partido.idPartido JOIN dadosPessoais 
ON candidato.dadosId = dadosPessoais.idDados 
WHERE candidato.cargo = 'Presidente';

-- 11: 
SELECT candidato.cargo, partido.nomePartido, candidato.ufCandidatura 
FROM candidato JOIN partido ON candidato.partidoId = partido.idPartido 
JOIN partido_coligacao ON partido.idPartido = partido_coligacao.partidoId JOIN coligacao 
ON partido_coligacao.coligacaoId = coligacao.idColigacao WHERE coligacao.nomeColigacao = 'Tech Avante';

-- 12:
SELECT dadosPessoais.nome, candidato.cargo, candidato.ufCandidatura FROM candidato 
INNER JOIN dadosPessoais ON candidato.dadosId = dadosPessoais.idDados 
ORDER BY candidato.ufCandidatura;

-- 13 
SELECT dadosPessoais.nome
FROM eleitor INNER JOIN voto ON eleitor.idEleitor = voto.eleitorId
INNER JOIN candidato ON voto.votoDepEstadual = candidato.numeroCandidato AND voto.votoDepEstadual != '00000'
INNER JOIN dadosPessoais ON eleitor.dadosId = dadosPessoais.idDados;

-- 14
SELECT dadosPessoais.nome, dadosPessoais.idade, candidato.cargo
FROM candidato JOIN dadosPessoais ON candidato.dadosId = dadosPessoais.idDados
JOIN partido ON candidato.partidoId = partido.idPartido
WHERE partido.nomePartido = 'Partido Java Maioral';

-- 15
SELECT dadosPessoais.nome AS nome_eleitor, partido.nomePartido as nome_partido
FROM voto JOIN eleitor ON voto.eleitorId = eleitor.idEleitor
JOIN dadosPessoais ON eleitor.dadosId = dadosPessoais.idDados
JOIN candidato ON voto.votoSenador = candidato.numeroCandidato
JOIN partido ON candidato.partidoId = partido.idPartido;

-- 16
-- NÃO CONSEGUI

-- 17
SELECT nome, sobrenome, idade
FROM candidato JOIN dadosPessoais ON candidato.dadosId = dadosPessoais.idDados
ORDER BY idade DESC LIMIT 5;

-- 18
-- NÃO CONSEGUI

-- 19
SELECT DISTINCT cidade FROM endereco
JOIN dadosPessoais ON endereco.idEndereco = dadosPessoais.enderecoId
JOIN eleitor ON dadosPessoais.idDados = eleitor.dadosId;

-- 20
-- NÃO CONSEGUI

-- 21
SELECT voto.votoDepEstadual, dadosPessoais.nome, dadosPessoais.sobrenome, candidato.cargo, partido.siglaPartido
FROM voto INNER JOIN eleitor ON voto.eleitorId = eleitor.idEleitor
INNER JOIN candidato ON candidato.numeroCandidato = voto.votoDepEstadual
INNER JOIN dadosPessoais ON dadosPessoais.idDados = candidato.dadosId
INNER JOIN partido ON partido.idPartido = candidato.partidoId
WHERE candidato.cargo = 'Deputado Estadual' ORDER BY eleitor.ufTitulo;

-- 22
SELECT DISTINCT partido.nomePartido, coligacao.siglaColigacao FROM partido
JOIN candidato ON partido.idPartido = candidato.partidoId
JOIN partido_coligacao ON partido.idPartido = partido_coligacao.partidoId
JOIN coligacao ON partido_coligacao.coligacaoId = coligacao.idColigacao
WHERE candidato.cargo = 'Senador';

-- 23
SELECT DISTINCT partido.nomePartido, partido.siglaPartido
FROM candidato INNER JOIN partido ON candidato.partidoId = partido.idPartido
WHERE candidato.cargo IN ('Deputado Estadual', 'Presidente')
AND partido.idPartido IN (
  select partidoId from candidato where cargo = 'Deputado Estadual'
);

-- 24
-- NÃO CONSEGUI

-- 25
-- NÃO CONSEGUI
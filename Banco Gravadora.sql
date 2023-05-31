drop database if exists lavajato;
create database lavajato;
use lavajato;

create table lavajato.cliente(
	CPF varchar(14) not null,
    NOME varchar(100) not null,
    EMAIL varchar(100) not null,
    TELEFONE varchar(20) not null,
    primary key(CPF)
);

create table lavajato.funcionario(
	MATRICULA int not null auto_increment,
    CPF varchar(14) not null,
    NOME varchar(100) not null,
    IDADE int not null,
    EMAIL varchar(100) not null,
    TELEFONE varchar(20) not null,
    SALARIO int not null,
    COMISSAO int not null,
    primary key(MATRICULA)
);

create table lavajato.carro(
	PLACA varchar(8) not null,
    CLIENTE_CPF varchar(14) not null,
    MARCA varchar(30) not null,
    MODELO varchar(50) not null, 
    COR varchar(30) not null, 
    primary key(PLACA),
    foreign key(CLIENTE_CPF) references cliente(CPF)
);

create table lavajato.lavagem(
	ID int not null auto_increment,
    CLIENTE_CPF varchar(14) not null,
    FUNCIONARIO_MATRICULA int not null,
    CARRO_PLACA varchar(8) not null,
    `DATA` date not null,
    primary key(ID),
    foreign key (CLIENTE_CPF) references cliente(CPF),
    foreign key (FUNCIONARIO_MATRICULA) references funcionario(MATRICULA),
    foreign key (CARRO_PLACA) references carro(PLACA)
);

insert into lavajato.cliente(CPF,NOME,EMAIL,TELEFONE) 
					 values ('098.745.698-79','LUCAS CASTRO','lucasunitins@gmail.com','63965471234');
                     
insert into lavajato.funcionario(CPF,NOME,IDADE,EMAIL,TELEFONE,SALARIO,COMISSAO)
						 values ('574.612.478.62','MANOEL GOMES','53','manoel@gmail.com','93987842450','1300','5');
 SET 	@MATRICULA = LAST_INSERT_ID();
 
insert into lavajato.carro(PLACA,CLIENTE_CPF,MARCA,MODELO,COR)
					values('KMH-8794','098.745.698-79','HYUNDAY','HB20','PRATA');

insert into lavajato.lavagem(CLIENTE_CPF,FUNCIONARIO_MATRICULA,CARRO_PLACA,`DATA`)
					 values ('098.745.698-79',@MATRICULA,'KMH-8794','2023-02-24');
                     
select * from cliente;
select * from funcionario;
select * from carro;
select * from lavagem;

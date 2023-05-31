drop database if exists cinema;
create database cinema;
use cinema;

create table cinema.filme(
	id int not null auto_increment,
    titulo varchar(100) not null,
    genero varchar(100) not  null,
    faixa_etaria varchar(5) not null,
    duracao float not null,
    
    primary key(id)
);

create table cinema.sala(
	id int not null auto_increment,
    capacidade int not null,
    
    primary key (id)
);

create table cinema.endereco(
	id int not null auto_increment,
    rua varchar(100) not null,
    numero int not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf varchar(50) not null,
    
    primary key(id)
);

create table cinema.cliente(
	cpf varchar(15) not null,
    rg varchar(15) not null,
    nome_completo varchar(150) not null,
    nascimento date not null,
    endereco int not null,
    sexo enum("Masculino","Feminino","Outro") not null,
    email varchar(70) not null,
    senha varchar(20) not null,
    telefone varchar(15) not null,
    
    foreign key (endereco) references cinema.endereco(id),
    primary key(cpf)
);

create table cinema.programacao(
	id int not null auto_increment,
	filme int not null,
    horario time not null,
    `data` date not null,
    sala int not null,
    
    foreign key (filme) references cinema.filme(id),
    foreign key (sala) references cinema.sala(id),
    primary key(id)
);

create table cinema.ingresso(
    tipo enum("Inteira", "Meia", "Sênior","Menor de 12 anos") not null,
    quantidade int not null,
	preco float not null,
    
    primary key (tipo)
);

create table cinema.item_ingresso(
	id int not null auto_increment,
	tipo_ingresso enum("Inteira", "Meia", "Sênior","Menor de 12 anos") not null,
    valor_total float not null,
    
    foreign key (tipo_ingresso) references cinema.ingresso(tipo),
    primary key (id)
);

create table cinema.guiche(
	id int not null auto_increment,
    cliente varchar(15) not null,
    programacao int not null,
    ingresso int not null,
    pagamento enum('Crédito') not null,
    taxa varchar(3) not null,
    
    foreign key (cliente) references cinema.cliente(cpf),
    foreign key (programacao) references cinema.programacao(id),
    foreign key (ingresso) references cinema.item_ingresso(id),
    primary key (id)
);

insert into cinema.filme(titulo,genero,faixa_etaria,duracao) values('King Kong','Ficção Científica',10,187);
insert into cinema.sala(capacidade) values(60);
insert into cinema.endereco(rua,numero,bairro,cidade,uf) values('Rua 14','43','Plano Diretor Sul','Palmas','TO');
insert into cinema.cliente(cpf,rg,nome_completo,nascimento,endereco,sexo,email,senha,telefone) values('125.566.785-90','1234567','Sebastião Nunes','1989-06-13',1,'Masculino','tiao@gmail.com','flamengo2019','(63)984321566');
insert into cinema.programacao(filme,horario,`data`,sala) values(1,'15:45:00','2023-03-17',1);
insert into cinema.ingresso(tipo,quantidade,preco) values('Inteira',2,40);
insert into cinema.item_ingresso(tipo_ingresso,valor_total) values('Inteira',80);
insert into cinema.guiche(cliente,programacao,ingresso,pagamento,taxa) values('125.566.785-90',1,1,'Credito','2%');

select * from cinema.filme;
select * from cinema.sala;
select * from cinema.cliente;
select * from cinema.endereco;
select * from cinema.programacao;
select * from cinema.ingresso;
select * from cinema.item_ingresso;
select * from cinema.guiche;

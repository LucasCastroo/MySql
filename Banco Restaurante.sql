-- Jônatas Pereira e Lucas Castro

drop database if exists buchocheio;
create database buchocheio;

create table buchocheio.cliente
(
    cpf      varchar(11)  not null,
    primary key (cpf),
    nome     varchar(50)  not null,
    endereco varchar(100) not null,
    telefone varchar(20)  not null
);



create table buchocheio.marmita
(
    tipo          enum ('Padrão', 'Plus', 'Light', 'Fit') not null,
    primary key (tipo),
    tempo_preparo int                                     not null,
    preco         float                                   not null
);

create table buchocheio.pedido
(
    id                int                                                                           not null auto_increment,
    cpfCliente        varchar(11)                                                                   not null,
    `status`          enum ('Em Produção', 'Saiu para Entrega', 'Aguardando Pagamento', 'Entregue') not null default 'Aguardando Pagamento',
    formaPagamento    enum ('Pix', 'Cartão', 'Dinheiro')                                            not null,
    `data`            date                                                                          not null,
    entregaEscalonada bool                                                                          not null default false,
    primary key (id),
    foreign key (cpfCliente) references buchocheio.cliente (cpf)
);

create table buchocheio.item_pedido
(
    id          int                                     not null auto_increment,
    idPedido    int                                     not null,
    foreign key (idPedido) references buchocheio.pedido (id),
    tipoMarmita enum ('Padrão', 'Plus', 'Light', 'Fit') not null,
    foreign key (tipoMarmita) references buchocheio.marmita (tipo),
    primary key (id, idPedido, tipoMarmita),
    quant       int                                     not null
);

create table buchocheio.entregador
(
    cnh  varchar(20) not null,
    primary key (cnh),
    nome varchar(50) not null
);

create table buchocheio.entrega_normal
(
    idPedido      int         not null,
    cnhEntregador varchar(20) not null,
    dataEntrega   datetime    not null,
    foreign key (idPedido) references buchocheio.pedido (id),
    foreign key (cnhEntregador) references buchocheio.entregador (cnh),
    primary key (idPedido)
);


create table buchocheio.entrega_escalonada
(
    idItem        int         not null,
    cnhEntregador varchar(20) not null,
    dataEntrega   datetime    not null,
    foreign key (idItem) references buchocheio.item_pedido (id),
    foreign key (cnhEntregador) references buchocheio.entregador (cnh),
    primary key (idItem)
);



insert into buchocheio.marmita (tipo, tempo_preparo, preco)
values ('Padrão', 10, 12.99),
       ('Plus', 12, 15.99),
       ('Light', 6, 13.99),
       ('Fit', 8, 16.99);


insert into buchocheio.cliente (cpf, nome, endereco, telefone)
values ('26214546158', 'Fabiana Yasmin Andrea Duarte', 'Quadra T 30 Rua NS 4 19 Jardim Taquari', '(63) 98985-0529'),
       ('02087935181', 'Felipe Cauê da Luz', 'Quadra 412 Norte Alameda 9 240 Plano Diretor Norte', '(63) 98927-3783'),
       ('55700942100', 'Severino Sebastião Gomes', 'Rua 26 620 Jardim Aureny III', '(63) 98824-9703');


insert into buchocheio.entregador (cnh, nome)
values ('68496105466', 'Erick Jorge Enzo Moura'),
       ('44417828377', 'Anderson Diego Ramos'),
       ('86688973164', 'Rafael Matheus Jesus');


-- Exemplo de pedido com entrega normal

-- criação de um novo pedido
insert into buchocheio.pedido (cpfCliente, formaPagamento, `data`, entregaEscalonada)
values ('02087935181', 'Pix', now(), false);

set @id_pedido = last_insert_id();
-- criamos uma variavel para armazenar o id do pedido que foi inserido

-- adicionando items ao pedido
insert into buchocheio.item_pedido (idPedido, tipoMarmita, quant)
values (@id_pedido, 'Padrão', 2),
       (@id_pedido, 'Plus', 1),
       (@id_pedido, 'Fit', 2);

-- visualizando o pedido
select *
from buchocheio.pedido
where id = @id_pedido;

-- depois que o cliente pagar começar a produzir as marmitas
update buchocheio.pedido
set `status` = 'Em Produção'
where id = @id_pedido;

-- depois de pronto efetuar a entrega
insert into buchocheio.entrega_normal (idPedido, cnhEntregador, dataEntrega)
values (@id_pedido, '86688973164', now());
update buchocheio.pedido
set `status` = 'Saiu para Entrega'
where id = @id_pedido;

-- depois de entreque atualizar o status
update buchocheio.pedido
set `status` = 'Entregue'
where id = @id_pedido;




-- Exemplo de pedido com entrega escalonada
insert into buchocheio.pedido (cpfCliente, formaPagamento, `data`, entregaEscalonada)
values ('55700942100', 'Dinheiro', now(), true);

set @id_pedido = last_insert_id();

-- adicionando items ao pedido
insert into buchocheio.item_pedido (idPedido, tipoMarmita, quant)
values (@id_pedido, 'Padrão', 2),
       (@id_pedido, 'Plus', 3),
       (@id_pedido, 'Light', 5),
       (@id_pedido, 'Fit', 2);

set @id_item = last_insert_id(); -- essa função retorna o id do primeiro item do nosso ultimo insert

-- verficando o status do pedido
select `status`
from buchocheio.pedido
where id = @id_pedido;

-- depois de pago começar a produzir as marmitas
update buchocheio.pedido
set `status` = 'Em Produção'
where id = @id_pedido;


-- entrega escalonada
insert into buchocheio.entrega_escalonada (idItem, cnhEntregador, dataEntrega)
values (@id_item, '44417828377', now()),     -- primeira marmita
       (@id_item + 2, '68496105466', now()), -- terceira marmita
       (@id_item + 1, '86688973164', now()); -- segunda marmita



-- visualizar as tabelas
select * from buchocheio.cliente;
select * from buchocheio.entregador;
select * from buchocheio.marmita;
select * from buchocheio.pedido;
select * from buchocheio.item_pedido;
select * from buchocheio.entrega_normal;
select * from buchocheio.entrega_escalonada;
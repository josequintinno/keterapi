/**
    Demanda: KETERAPI20241016121514
    Objetivo: Criar tabela responsável por gerenciar os contatos dos associados
    Observação: 
    Autor: José Quintinno
    Data de Criação: 16/10/2024
*/

drop table if exists tb_tipo_contato cascade;
drop table if exists tb_contato cascade;
drop table if exists tb_pessoa_contato cascade;

create table if not exists tb_tipo_contato (
	codigo serial not null,
	descricao varchar (100) not null,
	constraint pk_tipo_contato primary key (codigo),
	constraint un_tipo_contato_descricao unique (descricao)
);

comment on table tb_tipo_contato is 'Armazena os tipos de contatos gerenciados pelo sistema';
comment on column tb_tipo_contato.codigo is 'Representa o indentificador único da tabela';

create table if not exists tb_contato (
	codigo serial not null,
	id_tipo_contato integer not null,
	descricao varchar (100) not null,
	e_principal boolean not null,
	constraint pk_contato primary key (codigo),
	constraint fk_contato_id_tipo_contrato foreign key (id_tipo_contato) references tb_tipo_contato (codigo),
	constraint un_contato_descricao unique (descricao)
);

comment on table tb_contato is 'Armazena os contatos gerenciados pelo sistema';
comment on column tb_contato.codigo is 'Representa o indentificador único da tabela';
comment on column tb_contato.id_tipo_contato is 'Representa o indentificador da tabela de Tipo de Contato';
comment on column tb_contato.descricao is 'Representa o descrição do Contato';
comment on column tb_contato.e_principal is 'Representa se um determinado contato é o principal';

create table if not exists tb_pessoa_contato (
	codigo serial not null,
	id_pessoa integer not null,
	id_contato integer not null,
	constraint pk_pessoa_contato primary key (codigo),
	constraint fk_pessoa_contato_id_pessoa foreign key (id_pessoa) references tb_pessoa (codigo),
	constraint fk_pessoa_contato_id_contato foreign key (id_contato) references tb_contato (codigo)
);

comment on table tb_pessoa_contato is 'Armazena os contatos das pessoas gerenciados pelo sistema';
comment on column tb_pessoa_contato.codigo is 'Representa o indentificador único da tabela';
comment on column tb_pessoa_contato.id_pessoa is 'Representa o indentificador da tabela de Pessoa';
comment on column tb_pessoa_contato.id_contato is 'Representa o indentificador da tabela de Contato';

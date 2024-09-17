create table if not exists tb_tipo_relacionamento (
	codigo serial not null,
	descricao varchar (100) not null,
	constraint pk_tipo_relacionamento_codigo primary key (codigo),
	constraint un_tipo_relacionamento_descricao unique (descricao)
);

comment on table tb_tipo_relacionamento is 'Armazena os dados de todos os tipos de relacionamentos';
comment on column tb_tipo_relacionamento.codigo is 'Identificador Único da Tabela';
comment on column tb_tipo_relacionamento.descricao is 'Nome descritivo do tipo de relacionamento entre os associados gerenciados pelo sistema';

insert into tb_tipo_relacionamento (descricao) values ('Responsável Familiar');
insert into tb_tipo_relacionamento (descricao) values ('Pai');
insert into tb_tipo_relacionamento (descricao) values ('Mãe');
insert into tb_tipo_relacionamento (descricao) values ('Tio');
insert into tb_tipo_relacionamento (descricao) values ('Tia');
insert into tb_tipo_relacionamento (descricao) values ('Filho');
insert into tb_tipo_relacionamento (descricao) values ('Filha');
create table if not exists tb_pessoa (
	codigo serial not null,
	-- id_documento integer null,
	-- id_contato integer not null,
	-- id_endereco integer null,
	-- id_dependente integer null,
	nome_completo varchar(200) not null,
	nome_transcrito varchar(200) null,
	data_nascimento date null,
	e_ativo boolean not null default true,
	constraint pk_pessoa_codigo primary key (codigo),
	constraint un_pessoa_nome unique (nome_completo, data_nascimento)
);

create index in_pessoa_nome_completo on tb_pessoa (nome_completo);
create index in_pessoa_data_nascimento on tb_pessoa (data_nascimento);

comment on table tb_pessoa is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_pessoa.codigo is 'Identificador Único da Tabela';
comment on column tb_pessoa.nome_completo is 'Refere-se ao nome romanizado (caracteres latinos) da pessoa';
-- comment on column tb_pessoa.id_documento is 'Refere-se aos documentos vinculados	 a uma determinada pessoa';
-- comment on column tb_pessoa.id_contato is 'Refere-se aos contatos vinculados a uma determinada pessoa';
-- comment on column tb_pessoa.id_endereco is 'Refere-se aos enderecos vinculados a uma determinada pessoa';
-- comment on column tb_pessoa.id_dependente is 'Refere-se aos dependentes vinculados a uma determinada pessoa';
comment on column tb_pessoa.nome_transcrito is 'Refere-se ao nome com caracteres originais da pessoa estrangeira';
comment on column tb_pessoa.data_nascimento is 'Refere-se a data de nascimento da pessoa';
comment on column tb_pessoa.e_ativo is 'Identifica se a pessoa esta ativa';

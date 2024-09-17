create table if not exists tb_pessoa (
	codigo serial not null,
	id_documento integer null,
	id_contato integer not null,
	id_endereco integer null,
	id_dependente integer null,
	nome_completo varchar(200) not null,
	nome_transcrito varchar(200) null,
	data_nascimento date null,
	e_ativo boolean not null default true,
	constraint pk_pessoa_codigo primary key (codigo),
	constraint un_pessoa_nome unique (nome_completo, data_nascimento)
);
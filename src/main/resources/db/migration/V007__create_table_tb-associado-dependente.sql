create table if not exists tb_associado_dependente (
	codigo serial not null,
	id_associado_principal integer not null,
	id_associado_dependente integer not null,
	data_inclusao date not null default now(),
	data_alteracao date null,
	usuario_alteracao varchar(200) null,
	constraint pk_associado_dependente_codigo primary key (codigo),
	constraint fk_associado_dependente_associado_principal foreign key (id_associado_principal) references tb_associado (codigo),
	constraint fk_associado_dependente_associado_dependente foreign key (id_associado_dependente) references tb_associado (codigo)
);
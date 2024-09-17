create table if not exists tb_associado (
	codigo serial not null,
	id_tipo_relacionamento integer not null,
	id_pessoa_associado_principal integer not null,
	id_pessoa_dependente integer not null,
	data_inicial_vinculo_associacao date not null default now(),
	data_final_vinculo_associacao date null,
	constraint pk_associado_codigo primary key (codigo),
	constraint fk_associado_pessoa_associado_principal foreign key (id_pessoa_associado_principal) references tb_pessoa (codigo),
	constraint fk_associado_pessoa_dependente foreign key (id_pessoa_dependente) references tb_pessoa (codigo) 
		on delete cascade 
		on update cascade
);

create index in_associado_tipo_relacionamento on tb_associado (id_tipo_relacionamento);
create index in_associado_pessoa_associado_principal on tb_associado (id_pessoa_associado_principal);
create index in_associado_pessoa_dependente on tb_associado (id_pessoa_dependente);

comment on table tb_associado is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_associado.codigo is 'Identificador Único da Tabela';
comment on column tb_associado.id_tipo_relacionamento is 'Representa o tipo de relacionamento entre as partes. Podem ser: RESPOSAVEL_FAMILIAR, ESPOSO, ESPOSA, FILHO, FILHA, MÃE, PAI, RESPONSÁVEL LEGAL, TIO, TIA, AVÔ, AVÓ, PADRASTRO, MADRASTRA, PROCURADOR';
comment on column tb_associado.id_pessoa_associado_principal is 'Representa a pessoa responsável por uma determinada familia';
comment on column tb_associado.id_pessoa_dependente is 'Representa a pessoa que e dependente da pessoa principal';
comment on column tb_associado.data_inicial_vinculo_associacao is 'Representa a data de inicio do vínculo como associado';
comment on column tb_associado.data_final_vinculo_associacao is 'Representa a data de fim do vínculo como associado';

/**
    Demanda: KETERAPI20240912174856
    Objetivo: Criar tabela responsável por gerenciar os dados dos associados
    Observação: 
    Autor: Quintinno Digital Informática
    Data de Criação: 12/09/2024
*/

drop table tb_tipo_relacionamento cascade;
drop table tb_pessoa cascade;

create table if not exists tb_arquivo (
	codigo
	id_pessoa_responsavel
	nome
	descricao
	conteudo
	endereco
	tamanho
	data_criacao
	data_atualizacao
);

comment on table tb_arquivo is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_arquivo.codigo is 'Identificador Único da Tabela';

comment on column tb_arquivo.nome is 'Identificador Único da Tabela';
comment on column tb_arquivo.descricao is 'Identificador Único da Tabela';
comment on column tb_arquivo.conteudo is 'Identificador Único da Tabela';
comment on column tb_arquivo.endereco is 'Identificador Único da Tabela';
comment on column tb_arquivo.tamanho is 'Aarazena o tamanho do arquivo';
comment on column tb_arquivo.data_criacao is 'Representa a data de  criação de um determinado aarquivo';
comment on column tb_arquivo.data_atualizacao is 'Representa a data de atualização um determinado arquivo';

create table if not exists tb_documento (
	codigo
	id_pessoa
	id_categoria_documento
	id_orgao_emissor
	id_estado_emissor
	nome
	numero
	data_emissao
	data_cadastro	
	data_atualizacao
);

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

comment on table tb_pessoa is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_pessoa.codigo is 'Identificador Único da Tabela';
comment on column tb_pessoa.nome_completo is 'Refere-se ao nome romanizado (caracteres latinos) da pessoa';
comment on column tb_pessoa.id_documento is 'Refere-se aos documentos vinculados	 a uma determinada pessoa';
comment on column tb_pessoa.id_contato is 'Refere-se aos contatos vinculados a uma determinada pessoa';
comment on column tb_pessoa.id_endereco is 'Refere-se aos enderecos vinculados a uma determinada pessoa';
comment on column tb_pessoa.id_dependente is 'Refere-se aos dependentes vinculados a uma determinada pessoa';
comment on column tb_pessoa.nome_transcrito is 'Refere-se ao nome com caracteres originais da pessoa estrangeira';
comment on column tb_pessoa.data_nascimento is 'Refere-se a data de nascimento da pessoa';
comment on column tb_pessoa.e_ativo is 'Identifica se a pessoa esta ativa';

create table if not exists tb_tipo_relacionamento (
	codigo serial not null,
	descricao varchar (100) not null,
	constraint pk_tipo_relacionamento_codigo primary key (codigo),
	constraint un_tipo_relacionamento_descricao unique (descricao)
);

comment on table tb_associado is 'Armazena os dados de todos os tipos de relacionamentos';
comment on column tb_associado.codigo is 'Identificador Único da Tabela';
comment on column tb_associado.descricao is 'Nome descritivo do tipo de relacionamento entre os associados gerenciados pelo sistema';

insert into tb_tipo_relacionamento (descricao) values ('Responsável Familiar');
insert into tb_tipo_relacionamento (descricao) values ('Pai');
insert into tb_tipo_relacionamento (descricao) values ('Mãe');
insert into tb_tipo_relacionamento (descricao) values ('Tio');
insert into tb_tipo_relacionamento (descricao) values ('Tia');
insert into tb_tipo_relacionamento (descricao) values ('Filho');
insert into tb_tipo_relacionamento (descricao) values ('Filha');

create table if not exists tb_associado (
	codigo serial not null,
	id_pessoa_associado_principal integer not null,
	id_pessoa_dependente integer not null,
	id_tipo_relacionamento integer not null,
	data_inicio_vinculo date not null default now(),
	data_final_vinculo date null,
	constraint pk_associado_codigo primary key (codigo),
	constraint fk_associado_pessoa_associado_principal foreign key (id_pessoa_associado_principal) references tb_pessoa (codigo),
	constraint fk_associado_pessoa_dependente foreign key (id_pessoa_dependente) references tb_pessoa (codigo)
);

comment on table tb_associado is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_associado.codigo is 'Identificador Único da Tabela';
comment on column tb_associado.id_pessoa_associado_principal is 'Representa a pessoa responsável por uma determinada familia';
comment on column tb_associado.id_pessoa_dependente is 'Representa a pessoa que e dependente da pessoa principal';
comment on column tb_associado.id_relacionamento is 'Representa o tipo de relacionamento entre as partes. Podem ser: RESPOSAVEL_FAMILIAR, ESPOSO, ESPOSA, FILHO, FILHA, MÃE, PAI, RESPONSÁVEL LEGAL, TIO, TIA, AVÔ, AVÓ, PADRASTRO, MADRASTRA, PROCURADOR';
comment on column tb_associado.data_inicio_vinculo is 'Representa a data de inicio do vínculo como associado';
comment on column tb_associado.data_final_vinculo is 'Representa a data de fim do vínculo como associado';

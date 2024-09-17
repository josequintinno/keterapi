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

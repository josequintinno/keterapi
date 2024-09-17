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
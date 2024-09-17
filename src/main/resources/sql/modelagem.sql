/**
    Demanda: KETERAPI20240912174856
    Objetivo: Criar tabela responsável por gerenciar os dados dos associados
    Observação: 
    Autor: Quintinno Digital Informática
    Data de Criação: 12/09/2024
*/

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
	codigo
	id_documento -- Todos os documentos da pessoa
	id_contato -- Todos os contatos da pessoa
	id_endereco -- Todos os endereços da pessoa
	id_dependente -- Indica as pessoas que são dependentes (associados secundários) do associado principal
	nome_completo -- Refere-se ao nome em caracteres ocidentais
	nome_transcrito -- Refere-se ao nome transcrito de línguas que não possuem caracteres ocidentais
	data_nascimento
	data_associacao
	e_ativo
);

comment on table tb_pessoa is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_pessoa.codigo is 'Identificador Único da Tabela';
comment on column tb_pessoa.nome_completo is 'Refere-se ao nome romanizado (caracteres latinos) da pessoa';

create table if not exists tb_associado (
	codigo
	id_pessoa_associado_principal
	id_pessoa_viculada
	id_relacionamento
	data_inicio_vinculo
	data_final_vinculo
);

comment on table tb_associado is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_associado.codigo is 'Identificador Único da Tabela';
comment on column tb_associado.id_pessoa_associado_principal is 'Representa a pessoa responsável por uma determinada familia';
comment on column tb_associado.id_pessoa_viculada is 'Representa a pessoa que está sendo vinculada com a pessoa principal';
comment on column tb_associado.id_relacionamento is 'Representa o tipo de relacionamento entre as partes. Podem ser: RESPOSAVEL_FAMILIAR, ESPOSO, ESPOSA, FILHO, FILHA, MÃE, PAI, RESPONSÁVEL LEGAL, TIO, TIA, AVÔ, AVÓ, PADRASTRO, MADRASTRA, PROCURADOR';
comment on column tb_associado.data_inicio_vinculo is 'Representa a data de inicio do vínculo como associado';
comment on column tb_associado.data_final_vinculo is 'Representa a data de fim do vínculo como associado';

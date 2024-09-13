/**
    Demanda: KETERAPI20240912174856
    Objetivo: Criar tabela responsável por gerenciar os dados dos associados
    Observação: 
    Autor: Quintinno Digital Informática
    Data de Criação: 12/09/2024
*/

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

comment on table tb_associado is 'Armazena os dados de todos as pessoas associadas';
comment on column tb_associado.codigo is 'Identificador Único da Tabela';
comment on column tb_associado.nome_completo is 'Refere-se ao nome romanizado (caracteres latinos) da pessoa';

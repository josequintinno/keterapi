/**
    Demanda: KETERAPI20241015095144
    Objetivo: Criar tabela responsável por gerenciar os dependentes de associados
    Observação: 
    Autor: José Quintinno
    Data de Criação: 15/10/2024
*/

insert into tb_pessoa (nome_completo) values ('José Quintino da Silva Júnior');
insert into tb_pessoa (nome_completo) values ('Priscila da Silva Mariano');
insert into tb_pessoa (nome_completo) values ('Davi Nilson Mariano');
insert into tb_pessoa (nome_completo) values ('Emanuele Mariano Almeida');
insert into tb_pessoa (nome_completo) values ('Samuel Evandro Mariano');

-- "id_pessoa_dependente" deve ser representado em tabela associativa
insert into tb_associado (id_tipo_relacionamento, id_pessoa, data_inicial_vinculo_associacao, data_final_vinculo_associacao) values (
	(select codigo from tb_tipo_relacionamento where descricao = 'Associado'),
	(select codigo from tb_pessoa where nome_completo = 'José Quintino da Silva Júnior'),
	now(), null
);

insert into tb_associado (id_tipo_relacionamento, id_pessoa, data_inicial_vinculo_associacao, data_final_vinculo_associacao) values (
	(select codigo from tb_tipo_relacionamento where descricao = 'Associado'),
	(select codigo from tb_pessoa where nome_completo = 'Priscila da Silva Mariano'),
	now(), null
);

insert into tb_associado (id_tipo_relacionamento, id_pessoa, data_inicial_vinculo_associacao, data_final_vinculo_associacao) values (
	(select codigo from tb_tipo_relacionamento where descricao = 'Associado'),
	(select codigo from tb_pessoa where nome_completo = 'Davi Nilson Mariano'),
	now(), null
);

insert into tb_associado (id_tipo_relacionamento, id_pessoa, data_inicial_vinculo_associacao, data_final_vinculo_associacao) values (
	(select codigo from tb_tipo_relacionamento where descricao = 'Associado'),
	(select codigo from tb_pessoa where nome_completo = 'Emanuele Mariano Almeida'),
	now(), null
);

insert into tb_associado (id_tipo_relacionamento, id_pessoa, data_inicial_vinculo_associacao, data_final_vinculo_associacao) values (
	(select codigo from tb_tipo_relacionamento where descricao = 'Associado'),
	(select codigo from tb_pessoa where nome_completo = 'Samuel Evandro Mariano'),
	now(), null
);

insert into tb_associado_dependente (id_associado_principal, id_associado_dependente) values (
	(select codigo from tb_pessoa where nome_completo = 'José Quintino da Silva Júnior'),
	(select codigo from tb_pessoa where nome_completo = 'Priscila da Silva Mariano')
);

insert into tb_associado_dependente (id_associado_principal, id_associado_dependente) values (
	(select codigo from tb_pessoa where nome_completo = 'José Quintino da Silva Júnior'),
	(select codigo from tb_pessoa where nome_completo = 'Davi Nilson Mariano')
);

insert into tb_associado_dependente (id_associado_principal, id_associado_dependente) values (
	(select codigo from tb_pessoa where nome_completo = 'José Quintino da Silva Júnior'),
	(select codigo from tb_pessoa where nome_completo = 'Emanuele Mariano Almeida')
);

insert into tb_associado_dependente (id_associado_principal, id_associado_dependente) values (
	(select codigo from tb_pessoa where nome_completo = 'José Quintino da Silva Júnior'),
	(select codigo from tb_pessoa where nome_completo = 'Samuel Evandro Mariano')
);

/*
	select 
		pessoa_principal.nome_completo as principal,
		pessoa_dependente.nome_completo as dependente
	-- select *
	from tb_associado_dependente associado_dependente
	join tb_pessoa pessoa_principal on pessoa_principal.codigo = associado_dependente.id_associado_principal
	join tb_pessoa pessoa_dependente on pessoa_dependente.codigo = associado_dependente.id_associado_dependente 
	where associado_dependente.id_associado_principal = 1;
*/

/**
    Demanda: KETERAPI20241015100436
    Objetivo: Criar tabela responsável por gerenciar os contatos dos associados
    Observação: 
    Autor: José Quintinno
    Data de Criação: 15/10/2024
*/

insert into tb_contato (id_tipo_contato, descricao) values (
	(select codigo from tb_tipo_contato where descricao = 'E-mail'),
	'josequintino@hotmail.com.br'
);

insert into tb_contato (id_tipo_contato, descricao) values (
	(select codigo from tb_tipo_contato where descricao = 'Telefone'),
	'61996196506'
);

insert into tb_pessoa_contato (id_pessoa, id_contato) values (
	(select codigo from tb_pessoa where nome_completo = 'Nahuyn Bika Gakaron Vemailas'),
	(select codigo from tb_contato where descricao = '61996196506')
);

insert into tb_pessoa_contato (id_pessoa, id_contato) values (
	(select codigo from tb_pessoa where nome_completo = 'Nahuyn Bika Gakaron Vemailas'),
	(select codigo from tb_contato where descricao = 'josequintino@hotmail.com.br')
);
/**
    Demanda: KETERAPI20241015100436
    Objetivo: Criar tabela responsável por gerenciar os documentos dos associados
    Observação: 
    Autor: José Quintinno
    Data de Criação: 15/10/2024
*/

insert into tb_documento (id_tipo_documento, numero) values (
	(select codigo from tb_tipo_documento where sigla = 'CPF'),
	'02735845100'
);

insert into tb_documento (id_tipo_documento, numero) values (
	(select codigo from tb_tipo_documento where sigla = 'DI'),
	'5847541'
);

insert into tb_pessoa_documento (id_pessoa, id_documento) values (
	(select codigo from tb_pessoa where nome_completo = 'Baido Thurinrye Kosoaku Mukbrakh'),
	(select codigo from tb_documento where numero = '02735845100')
);

insert into tb_pessoa_documento (id_pessoa, id_documento) values (
	(select codigo from tb_pessoa where nome_completo = 'Baido Thurinrye Kosoaku Mukbrakh'),
	(select codigo from tb_documento where numero = '5847541')
);

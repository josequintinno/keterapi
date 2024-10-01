alter table tb_associado drop column id_pessoa_dependente;
alter table tb_associado rename column id_pessoa_associado_principal to id_pessoa;
drop index if exists in_associado_pessoa_dependente;
insert into tb_tipo_relacionamento (descricao) values ('Associado');
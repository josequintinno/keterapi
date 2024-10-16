/**
    Demanda: KETERAPI20241015100436
    Objetivo: Criar tabela responsável por gerenciar os documentos dos associados
    Observação: 
    Autor: José Quintinno
    Data de Criação: 15/10/2024
*/

create table if not exists tb_tipo_documento (
	codigo serial not null,
	nome varchar (100),
	sigla varchar (5),
	constraint pk_tipo_documento_codigo primary key (codigo),
	constraint un_documento_nome unique (nome),
	constraint un_documento_sigla unique (sigla)
);

insert into tb_tipo_documento (nome, sigla) values ('Documento de Identidade', 'DI');
insert into tb_tipo_documento (nome, sigla) values ('Cadastro de Pessoa Física', 'CPF');
insert into tb_tipo_documento (nome, sigla) values ('Título de Eleitor:', 'TE');
insert into tb_tipo_documento (nome, sigla) values ('Carteira de Trabalho e Previdência Social', 'CTPS');
insert into tb_tipo_documento (nome, sigla) values ('Carteira Nacional de Habilitação', 'CNH');
insert into tb_tipo_documento (nome, sigla) values ('Passaporte', 'PASS');
insert into tb_tipo_documento (nome, sigla) values ('Certificado de Reservista', 'CERR');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nascimento', 'CERN');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Casamento', 'CERC');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Óbito', 'CERO');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta Criminal', 'CNCC');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta de Débitos', 'CNCD');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta de Protestos', 'CNCP');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta de Inadimplência', 'CNCI');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta de Tributos', 'CNCT');
insert into tb_tipo_documento (nome, sigla) values ('Certidão de Nada Consta de Ação Trabalhista', 'CNCAT');
insert into tb_tipo_documento (nome, sigla) values ('Documento de Gyur', 'DOGY');
insert into tb_tipo_documento (nome, sigla) values ('Documento de Ketubah', 'DKTB');
insert into tb_tipo_documento (nome, sigla) values ('Documento de Get', 'DOCG');

comment on table tb_tipo_documento is 'Armazena os dados dos documentos gerenciados pelo sistema';
comment on column tb_tipo_documento.codigo is 'Representa o indentificador único da tabela';
comment on column tb_tipo_documento.nome is 'Representa o nome do documento';
comment on column tb_tipo_documento.sigla is 'Representa a sigla do documento';

create table if not exists tb_documento (
	codigo serial not null,
	id_tipo_documento integer not null,
	numero varchar (100) not null,
	data_cadastro date not null default now(),
	data_alteracao date null,
	usuario_alteracao varchar (50),
	constraint pk_documento_codigo primary key (codigo),
	constraint fk_documento_tipo_documento foreign key (id_tipo_documento) references tb_tipo_documento (codigo),
	constraint un_documento_numero unique (numero)
);

comment on table tb_documento is 'Armazena os dados dos documentos gerenciados pelo sistema';
comment on column tb_documento.codigo is 'Representa o indentificador único da tabela';
comment on column tb_documento.numero is 'Representa o número do documento';
comment on column tb_documento.data_cadastro is 'Representa a data de cadastro do documento';
comment on column tb_documento.data_alteracao is 'Representa a data de alteração do documento';
comment on column tb_documento.usuario_alteracao is 'Representa o usuário que alterou informações do documento';

create table if not exists tb_pessoa_documento (
	codigo serial not null,
	id_pessoa integer not null,
	id_documento integer not null,
	data_cadastro date not null default now(),
	data_alteracao date null,
	usuario_alteracao varchar (50),
	constraint pk_pessoa_documento_codigo primary key (codigo),
	constraint fk_pessoa_documento_pessoa foreign key (id_pessoa) references tb_pessoa (codigo),
	constraint fk_pessoa_documento_documento foreign key (id_documento) references tb_documento (codigo),
	constraint un_pessoa_documento_id_documento unique (id_documento)
);

comment on table tb_pessoa_documento is 'Armazena os dados dos documentos gerenciados pelo sistema';
comment on column tb_pessoa_documento.codigo is 'Representa o indentificador único da tabela pessoa';
comment on column tb_pessoa_documento.codigo is 'Representa o indentificador único da tabela documento';
comment on column tb_pessoa_documento.data_cadastro is 'Representa a data de cadastro da tabela';
comment on column tb_pessoa_documento.data_alteracao is 'Representa a data de alteração da tabela';
comment on column tb_pessoa_documento.usuario_alteracao is 'Representa o usuário que alterou informações da tabela';


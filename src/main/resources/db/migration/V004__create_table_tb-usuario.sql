create table if not exists tb_perfil (
	codigo serial not null,
	descricao varchar (100) not null,
	constraint pk_perfil_codigo primary key (codigo),
	constraint un_perfil_descricao unique (descricao)
);

create table if not exists tb_situacao_usuario (
	codigo serial not null,
	descricao varchar (100) not null,
	constraint pk_situacao_usuario_codigo primary key (codigo),
	constraint un_situacao_usuario_descricao unique (descricao)
);

create table if not exists tb_usuario (
	codigo serial not null,
	id_pessoa integer not null,
	id_perfil integer not null,
	id_situacao_usuario integer not null,
	identificador varchar (100) not null,
	senha varchar (100) not null,
	constraint pk_usuario_codigo primary key (codigo),
	constraint fk_usuario_pessoa foreign key (id_pessoa) references tb_pessoa (codigo),
	constraint fk_perfil foreign key (id_perfil) references tb_perfil (codigo),
	constraint fk_usuario_situacao_usuario foreign key (id_situacao_usuario) references tb_situacao_usuario (codigo)
);

create table if not exists tb_usuario_perfil (
	codigo serial not null,
	id_usuario integer not null,
	id_perfil integer not null,
	constraint pk_usuario_perfil_codigo primary key (codigo),
	constraint fk_usuario_perfil_usuario foreign key (id_usuario) references tb_usuario (codigo),
	constraint fk_usuario_perfil_perfil foreign key (id_perfil) references tb_perfil (codigo)
);
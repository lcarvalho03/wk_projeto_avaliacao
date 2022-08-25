-- public.clientes definition

-- Drop table

-- DROP TABLE public.clientes;

CREATE TABLE public.clientes (
	id serial4 NOT NULL,
	nome varchar(70) NOT NULL,
	cidade varchar(40) NULL,
	uf bpchar(2) NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id)
);


-- public.produtos definition

-- Drop table

-- DROP TABLE public.produtos;

CREATE TABLE public.produtos (
	id serial4 NOT NULL,
	descricao varchar(100) NOT NULL,
	valor_venda numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT produtos_pk PRIMARY KEY (id)
);


-- public.pedidos definition

-- Drop table

-- DROP TABLE public.pedidos;

CREATE TABLE public.pedidos (
	id serial4 NOT NULL,
	dt_emissao date NOT NULL,
	id_cliente int4 NOT NULL,
	valor_total numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT pedidos_pk PRIMARY KEY (id),
	CONSTRAINT pedidos_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- public.pedidos_produtos definition

-- Drop table

-- DROP TABLE public.pedidos_produtos;

CREATE TABLE public.pedidos_produtos (
	id serial4 NOT NULL,
	id_pedido int4 NOT NULL,
	id_produto int4 NOT NULL,
	qtd numeric(12, 2) NOT NULL DEFAULT 0.01,
	valor_unitario numeric(12, 2) NOT NULL DEFAULT 0,
	valor_total numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT pedidos_produtos_pk PRIMARY KEY (id),
	CONSTRAINT pedidos_produtos_fk FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pedidos_produtos_fk_1 FOREIGN KEY (id_produto) REFERENCES public.produtos(id) ON DELETE CASCADE ON UPDATE CASCADE
);
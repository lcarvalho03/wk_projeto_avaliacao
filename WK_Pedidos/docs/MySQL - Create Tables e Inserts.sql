DROP TABLE pedidos_produtos;
DROP table pedidos;
DROP TABLE produtos;
DROP TABLE clientes;


CREATE TABLE clientes (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(70) NOT NULL,
	cidade varchar(40) NULL,
	uf char(2) NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id)
);

CREATE TABLE produtos (
	id int NOT NULL AUTO_INCREMENT,
	descricao varchar(100) NOT NULL,
	valor_venda numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT produtos_pk PRIMARY KEY (id)
);

CREATE TABLE pedidos (
	id int NOT NULL AUTO_INCREMENT,
	dt_emissao date NOT NULL,
	id_cliente int NOT NULL,
	valor_total numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT pedidos_pk PRIMARY KEY (id),
	CONSTRAINT pedidos_fk FOREIGN KEY (id_cliente) REFERENCES clientes(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE pedidos_produtos (
	id int NOT NULL AUTO_INCREMENT,
	id_pedido int NOT NULL,
	id_produto int NOT NULL,
	qtd numeric(12, 2) NOT NULL DEFAULT 0.01,
	valor_unitario numeric(12, 2) NOT NULL DEFAULT 0,
	valor_total numeric(12, 2) NOT NULL DEFAULT 0,
	CONSTRAINT pedidos_produtos_pk PRIMARY KEY (id),
	CONSTRAINT pedidos_produtos_fk FOREIGN KEY (id_pedido) REFERENCES pedidos(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pedidos_produtos_fk_1 FOREIGN KEY (id_produto) REFERENCES produtos(id) ON DELETE CASCADE ON UPDATE CASCADE
);




INSERT INTO clientes (nome, cidade, uf) VALUES('Leonardo', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Solange', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Gabriel', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Yuri', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Ana Luísa', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Gabriele', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Edson', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Inaldo', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Cleonice', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Gustavo', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Daniella', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Cláudia', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Osvaldo', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Fátima', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Rafael', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (nome, cidade, uf) VALUES('Priscila', 'Florianópolis', 'SC');
INSERT INTO clientes (nome, cidade, uf) VALUES('João', 'Florianópolis', 'SC');
INSERT INTO clientes (nome, cidade, uf) VALUES('Pedro', 'Florianópolis', 'SC');
INSERT INTO clientes (nome, cidade, uf) VALUES('Maria Quitéria', 'Florianópolis', 'SC');
INSERT INTO clientes (nome, cidade, uf) VALUES('Luiz', 'Teresópolis', 'RJ');



INSERT INTO produtos (descricao, valor_venda) VALUES('Cadeira', 350);
INSERT INTO produtos (descricao, valor_venda) VALUES('Mesa', 1200);
INSERT INTO produtos (descricao, valor_venda) VALUES('Sofá', 1100);
INSERT INTO produtos (descricao, valor_venda) VALUES('Armário de casal', 1300);
INSERT INTO produtos (descricao, valor_venda) VALUES('Janela', 290);
INSERT INTO produtos (descricao, valor_venda) VALUES('Cimento', 28);
INSERT INTO produtos (descricao, valor_venda) VALUES('Tijolo', 1.20);
INSERT INTO produtos (descricao, valor_venda) VALUES('Vaso sanitário', 670);
INSERT INTO produtos (descricao, valor_venda) VALUES('Argamassa', 30);
INSERT INTO produtos (descricao, valor_venda) VALUES('Colher de pedreiro', 12);
INSERT INTO produtos (descricao, valor_venda) VALUES('Piso porcelanato', 47);
INSERT INTO produtos (descricao, valor_venda) VALUES('Tanque', 180);
INSERT INTO produtos (descricao, valor_venda) VALUES('Porta', 900);
INSERT INTO produtos (descricao, valor_venda) VALUES('Pia de cozinha', 400);
INSERT INTO produtos (descricao, valor_venda) VALUES('Pia de banheiro', 560);
INSERT INTO produtos (descricao, valor_venda) VALUES('Armário de cozinha', 385);
INSERT INTO produtos (descricao, valor_venda) VALUES('Cama de casal', 1400);
INSERT INTO produtos (descricao, valor_venda) VALUES('Cama de solteiro', 790);
INSERT INTO produtos (descricao, valor_venda) VALUES('Espelho de banheiro', 210);
INSERT INTO produtos (descricao, valor_venda) VALUES('ventilador de teto', 150);
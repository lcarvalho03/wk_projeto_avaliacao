TCliente = class
private

public
	property Id: integer;
	property Nome: string;
	property Cidade: string;
	property UF: string;
published

end;



TProduto = class
private

public
	property Id: Integer;
	property Descricao: string;
	property ValorVenda
published

end;



TPedido = class
private

public
	property Id: integer;
	property DtEmissao: TDatetime;
	property Cliente: integer;
	property ValorTotal
published

end;


TPedidoProduto = class
private

public
	property Id: integer;
	property Pedido: integer;
	property Produto: integer;
	property Qtd numeric(12, 2) NOT NULL DEFAULT 0.01,
	property ValorUnitario numeric(12, 2) NOT NULL DEFAULT 0,
	property ValorTotal
published

end;
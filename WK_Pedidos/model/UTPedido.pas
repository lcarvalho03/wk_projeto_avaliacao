unit UTPedido;

interface

uses
  UTCliente, FireDAC.Comp.Client;

type
  TPedido = class
  private
    FCliente: TCliente;
    FId: integer;
    FDtEmissao: TDatetime;
    FValorTotal: Double;
    FProdutos: TFDQuery;
    procedure SetCliente(const Value: TCliente);
    procedure SetDtEmissao(const Value: TDatetime);
    procedure SetId(const Value: integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetProdutos(const Value: TFDQuery);

  public
    constructor Create(id: Integer; dtEmissao: TDateTime; cliente: TCliente; valorTotal: Double); overload;

    property Id: integer read FId write SetId;
    property DtEmissao: TDatetime read FDtEmissao write SetDtEmissao;
    property Cliente: TCliente read FCliente write SetCliente;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property Produtos: TFDQuery read FProdutos write SetProdutos;
  published

  end;

implementation

uses ULib, System.SysUtils;

{ TPedido }

constructor TPedido.Create(id: Integer; dtEmissao: TDateTime; cliente: TCliente;
  valorTotal: Double);
begin
  SetId(id);
  SetDtEmissao(dtEmissao);
  SetCliente(cliente);
  SetValorTotal(valorTotal);

  produtos := criaObjetoQuery();
  produtos.SQL.Add('select pp.id, pp.id_pedido, pp.id_produto, p.descricao, pp.qtd, pp.valor_unitario, pp.valor_total ' +
                   'from pedidos_produtos pp ' +
                        'inner join produtos p on (pp.id_produto = p.id) ' +
                   'where (pp.id_pedido = ' + Trim(IntToStr(id)) + ') ' +
                   'order by p.descricao');
  produtos.OpenOrExecute;

  SetProdutos(produtos);
end;

procedure TPedido.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TPedido.SetDtEmissao(const Value: TDatetime);
begin
  FDtEmissao := Value;
end;

procedure TPedido.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TPedido.SetProdutos(const Value: TFDQuery);
begin
  FProdutos := Value;
end;

procedure TPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.

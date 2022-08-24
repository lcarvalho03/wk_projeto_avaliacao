unit UTPedidoProduto;

interface

uses
  UTPedido, UTProduto;

type
  TPedidoProduto = class
  private
    FProduto: TProduto;
    FQtd: Double;
    FPedido: TPedido;
    FValorUnitario: Double;
    FId: integer;
    FValorTotal: Double;
    procedure SetId(const Value: integer);
    procedure SetPedido(const Value: TPedido);
    procedure SetProduto(const Value: TProduto);
    procedure SetQtd(const Value: Double);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorUnitario(const Value: Double);

  public
    constructor Create(id: Integer; pedido: TPedido; produto: TProduto; qtd, valorUnitario, valorTotal: Double); overload;

    property Id: integer read FId write SetId;
    property Pedido: TPedido read FPedido write SetPedido;
    property Produto: TProduto read FProduto write SetProduto;
    property Qtd: Double read FQtd write SetQtd;
    property ValorUnitario: Double read FValorUnitario write SetValorUnitario;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
  published

  end;

implementation

{ TPedidoProduto }

constructor TPedidoProduto.Create(id: Integer; pedido: TPedido;
  produto: TProduto; qtd, valorUnitario, valorTotal: Double);
begin
  SetId(id);
  SetPedido(pedido);
  SetProduto(produto);
  SetQtd(qtd);
  SetValorUnitario(valorUnitario);
  SetValorTotal(valorTotal);
end;

procedure TPedidoProduto.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TPedidoProduto.SetPedido(const Value: TPedido);
begin
  FPedido := Value;
end;

procedure TPedidoProduto.SetProduto(const Value: TProduto);
begin
  FProduto := Value;
end;

procedure TPedidoProduto.SetQtd(const Value: Double);
begin
  FQtd := Value;
end;

procedure TPedidoProduto.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TPedidoProduto.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

end.

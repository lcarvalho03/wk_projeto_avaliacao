unit UTProduto;

interface

type
  TProduto = class
  private
    FValorVenda: Double;
    FDescricao: String;
    FId: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetValorVenda(const Value: Double);
  public
    constructor Create(id: Integer; descricao: string; valorVenda: Double); overload;

    property Id: Integer read FId write SetId;
  	property Descricao: String read FDescricao write SetDescricao;
  	property ValorVenda: Double read FValorVenda write SetValorVenda;
  end;

implementation

{ TProdutos }

constructor TProduto.Create(id: Integer; descricao: string; valorVenda: Double);
begin
  SetId(id);
  SetDescricao(descricao);
  SetValorVenda(valorVenda);
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduto.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

end.

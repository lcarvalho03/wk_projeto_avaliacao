unit UTCliente;

interface

type
  TCliente = class
  private
    FUF: string;
    FId: integer;
    FCidade: string;
    FNome: string;
    procedure SetCidade(const Value: string);
    procedure SetId(const Value: integer);
    procedure SetUF(const Value: string);
    procedure SetNome(const Value: string);

  public
    constructor Create(id: Integer; nome, cidade, uf: string); overload;

    property Id: integer read FId write SetId;
    property Nome: string read FNome write SetNome;
    property Cidade: string read FCidade write SetCidade;
    property UF: string read FUF write SetUF;
  end;

implementation

{ TCliente }

constructor TCliente.Create(id: Integer; nome, cidade, uf: string);
begin
  SetId(id);
  SetNome(nome);
  SetCidade(cidade);
  SetUF(uf);
end;

procedure TCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.

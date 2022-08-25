unit ULib;

interface

uses UDM, UTCliente, UTProduto, FireDAC.Comp.Client, System.Generics.Collections, Vcl.StdCtrls;

var
  fdqQuery: TFDQuery;

function CriaObjetoQuery(): TFDQuery;
function ObtemListaDeClientes(): TObjectList<TCliente>;
function ObtemListaDeProdutos(): TObjectList<TProduto>;

procedure DestroiObjetosDoComboBox(comboBox: TComboBox);
procedure MontaComboboxCliente(oCliente: TCliente; cbbCliente: TComboBox; listaDeClientes: TObjectList<TCliente>);
procedure MontaComboboxProduto(oProduto: TProduto; cbbProduto: TComboBox; listaDeProdutos: TObjectList<TProduto>);


implementation

uses
  System.SysUtils;

function CriaObjetoQuery(): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DM.FDConnection;
  Result.SQL.Clear;
end;

function ObtemListaDeClientes(): TObjectList<TCliente>;
begin
  fdqQuery := criaObjetoQuery();
  fdqQuery.SQL.Add('select c.id, c.nome, c.cidade, c.uf ' +
                   'from clientes c ' +
                   'order by c.nome');
  fdqQuery.OpenOrExecute;

  Result := TObjectList<TCliente>.Create;
  Result.Add(TCliente.Create(0, '', '', ''));

  if (not fdqQuery.IsEmpty) then
  begin
    fdqQuery.First;

    while (not fdqQuery.Eof) do
    begin
      Result.Add(TCliente.Create(fdqQuery.FieldByName('id').AsInteger,
                                 fdqQuery.FieldByName('nome').AsString,
                                 fdqQuery.FieldByName('cidade').AsString,
                                 fdqQuery.FieldByName('uf').AsString));
      fdqQuery.Next;
    end;
  end;

  FreeAndNil(fdqQuery);
end;

function ObtemListaDeProdutos(): TObjectList<TProduto>;
begin
  fdqQuery := criaObjetoQuery();
  fdqQuery.SQL.Add('select p.id, p.descricao, p.valor_venda ' +
                   'from produtos p ' +
                   'order by p.descricao');
  fdqQuery.OpenOrExecute;

  Result := TObjectList<TProduto>.Create;
  Result.Add(TProduto.Create(0, '', 0.00));

  if (not fdqQuery.IsEmpty) then
  begin
    fdqQuery.First;

    while (not fdqQuery.Eof) do
    begin
      Result.Add(TProduto.Create(fdqQuery.FieldByName('id').AsInteger,
                                 fdqQuery.FieldByName('descricao').AsString,
                                 fdqQuery.FieldByName('valor_venda').AsCurrency));
      fdqQuery.Next;
    end;
  end;

  FreeAndNil(fdqQuery);
end;

procedure MontaComboboxCliente(oCliente: TCliente; cbbCliente: TComboBox; listaDeClientes: TObjectList<TCliente>);
begin
  cbbCliente.Items.Clear;

  for oCliente in listaDeClientes do
    cbbCliente.Items.AddObject(oCliente.nome, oCliente);

  cbbCliente.ItemIndex := 0;
end;

procedure MontaComboboxProduto(oProduto: TProduto; cbbProduto: TComboBox; listaDeProdutos: TObjectList<TProduto>);
begin
  cbbProduto.Items.Clear;

  for oProduto in listaDeProdutos do
    cbbProduto.Items.AddObject(oProduto.Descricao, oProduto);

  cbbProduto.ItemIndex := 0;
end;

procedure DestroiObjetosDoComboBox(comboBox: TComboBox);
var
  i: Integer;
begin
  for I := (comboBox.GetCount - 1) downto 0 do
    try
      TObject(comboBox.Items.Objects[i]).Free;
    except
    end;
end;

end.

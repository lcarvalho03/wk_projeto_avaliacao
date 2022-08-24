unit ULib;

interface

uses UDM, UTCliente, UTProduto, FireDAC.Comp.Client, System.Generics.Collections, Vcl.StdCtrls;

var
  fdqQuery: TFDQuery;

function criaObjetoQuery(): TFDQuery;
function obtemListaDeClientes(): TObjectList<TCliente>;
function obtemListaDeProdutos(): TObjectList<TProduto>;

procedure montaComboboxCliente(oCliente: TCliente; cbbCliente: TComboBox; listaDeClientes: TObjectList<TCliente>);
procedure montaComboboxProduto(oProduto: TProduto; cbbProduto: TComboBox; listaDeProdutos: TObjectList<TProduto>);


implementation

uses
  System.SysUtils;

function criaObjetoQuery(): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := DM.FDConnection;
  Result.SQL.Clear;
end;

function obtemListaDeClientes(): TObjectList<TCliente>;
begin
  fdqQuery := criaObjetoQuery();
  fdqQuery.SQL.Add('select c.id, c.nome, c.cidade, c.uf ' +
                   'from public.clientes c ' +
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

function obtemListaDeProdutos(): TObjectList<TProduto>;
begin
  fdqQuery := criaObjetoQuery();
  fdqQuery.SQL.Add('select p.id, p.descricao, p.valor_venda ' +
                   'from public.produtos p ' +
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

procedure montaComboboxCliente(oCliente: TCliente; cbbCliente: TComboBox; listaDeClientes: TObjectList<TCliente>);
begin
  cbbCliente.Items.Clear;

  for oCliente in listaDeClientes do
    cbbCliente.Items.AddObject(oCliente.nome, oCliente);

  cbbCliente.ItemIndex := 0;
end;

procedure montaComboboxProduto(oProduto: TProduto; cbbProduto: TComboBox; listaDeProdutos: TObjectList<TProduto>);
begin
  cbbProduto.Items.Clear;

  for oProduto in listaDeProdutos do
    cbbProduto.Items.AddObject(oProduto.Descricao, oProduto);

  cbbProduto.ItemIndex := 0;
end;


end.

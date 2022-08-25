unit UTPedidoDAO;

interface

uses
  System.Generics.Collections, UTPedido, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.Comp.Client;

type
  TPedidoDAO = class
  private
  public
    class function Delete(pedido: TPedido): Boolean;
    class function Persiste(pedido: TPedido; memTable: TFDMemTable): Boolean;
    class function Valida(pedido: TPedido): string;
  end;

implementation

uses UDM, ULib, System.SysUtils, Data.DB;

//uses System.SysUtils, UDM, ULib, FireDAC.Comp.Client;

{ TPedidoDAO }

class function TPedidoDAO.Delete(pedido: TPedido): Boolean;
var
  lQueryDelete: TFDQuery;
begin
  lQueryDelete := criaObjetoQuery();

  lQueryDelete.Close;
  lQueryDelete.SQL.Clear;
  lQueryDelete.SQL.Add('delete ' +
                       'from public.pedidos ' +
                       'where (id = :pId)');

  lQueryDelete.Params.ParamByName('pId').AsInteger := pedido.id;

  DM.FDConnection.StartTransaction;

  try
    lQueryDelete.ExecSQL;
    DM.FDConnection.Commit;
    Result := True;
  except
    DM.FDConnection.Rollback;
    Result := False;
  end;

  FreeAndNil(lQueryDelete);
end;

class function TPedidoDAO.Persiste(pedido: TPedido; memTable: TFDMemTable): Boolean;
var
  lQueryInsert: TFDQuery;
begin
  lQueryInsert := criaObjetoQuery();

  lQueryInsert.Close;
  lQueryInsert.SQL.Clear;
  lQueryInsert.SQL.Add('insert into pedidos (dt_emissao, id_cliente, valor_total) ' +
                       'values (:pDtEmissao, :pIdCliente, :pValorTotal) returning id {into :id}');

  lQueryInsert.Params.ParamByName('pDtEmissao').AsDateTime := pedido.DtEmissao;
  lQueryInsert.Params.ParamByName('pIdCliente').AsInteger := pedido.Cliente.Id;
  lQueryInsert.Params.ParamByName('pValorTotal').Value := pedido.ValorTotal;

  lQueryInsert.Params.ParamByName('id').DataType := TFieldType.ftInteger;
  lQueryInsert.Params.ParamByName('id').ParamType := ptOutput;


  try
    lQueryInsert.Prepare;
    lQueryInsert.OpenOrExecute;


    lQueryInsert.Open('SELECT currval(pg_get_serial_sequence(''public.pedidos'', ''id''))');
    pedido.Id := lQueryInsert.Fields[0].AsInteger;

    lQueryInsert.Close;
    lQueryInsert.SQL.Clear;
    lQueryInsert.SQL.Add('insert into pedidos_produtos (id_pedido, id_produto, qtd, valor_unitario, valor_total) ' +
                         'values (:pIdPedido, :pIdProduto, :pQtd, :pValorUnitario, :pValorTotal)');

    memTable.recno := 1;
    while not memTable.eof do
    begin
      lQueryInsert.Close;
      lQueryInsert.Params.ParamByName('pIdPedido').AsInteger := pedido.Id;
      lQueryInsert.Params.ParamByName('pIdProduto').AsInteger := memTable.FieldByName('id_produto').AsInteger;
      lQueryInsert.Params.ParamByName('pQtd').Value := memTable.FieldByName('qtd').Value;
      lQueryInsert.Params.ParamByName('pValorUnitario').Value := memTable.FieldByName('valor_unitario').value;
      lQueryInsert.Params.ParamByName('pValorTotal').Value := memTable.FieldByName('valor_total').value;
      lQueryInsert.ExecSQL;

      memTable.next;
    end;

    DM.FDConnection.Commit;
    Result := True;
  except
    DM.FDConnection.Rollback;
    Result := False;
  end;

  FreeAndNil(lQueryInsert);
end;

class function TPedidoDAO.Valida(pedido: TPedido): string;
begin
  Result := '';

  if (pedido.Cliente.Id = 0) then
    Result := Result + #13 + '- Cliente deve ser selecionado.';

  if (pedido.ValorTotal = 0.00) then
    Result := Result + #13 + '- Valor do Pedido não pode ser zero.';
end;

end.

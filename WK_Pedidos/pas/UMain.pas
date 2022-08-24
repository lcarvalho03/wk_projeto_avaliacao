unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UTCliente, UTPedido, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    ComboBoxCliente: TComboBox;
    dbgProdutos: TDBGrid;
    Label1: TLabel;
    DataSourceProdutos: TDataSource;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    FDQueryPedidos: TFDQuery;
    FDQueryProdutos: TFDQuery;
    DataSourcePedidos: TDataSource;
    FDQueryPedidosid: TIntegerField;
    FDQueryPedidosid_cliente: TIntegerField;
    FDQueryPedidosnome: TWideStringField;
    FDQueryPedidosdt_emissao: TDateField;
    FDQueryPedidosvalor_total: TBCDField;
    FDQueryProdutosid: TIntegerField;
    FDQueryProdutosid_pedido: TIntegerField;
    FDQueryProdutosid_produto: TIntegerField;
    FDQueryProdutosdescricao: TWideStringField;
    FDQueryProdutosqtd: TBCDField;
    FDQueryProdutosvalor_unitario: TBCDField;
    FDQueryProdutosvalor_total: TBCDField;
    Label4: TLabel;
    Bevel1: TBevel;
    BitBtnAdicionarPedido: TBitBtn;
    BitBtnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FDQueryPedidosAfterScroll(DataSet: TDataSet);
    procedure ComboBoxClienteSelect(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnAdicionarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  oCliente: TCliente;
  oPedido: TPedido;

implementation

uses UDM, ULib, UCadPedido;

{$R *.dfm}

procedure TFrmMain.BitBtnAdicionarPedidoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmCadPedido, FrmCadPedido);
    FrmCadPedido.ShowModal;
  finally
    FreeAndNil(FrmCadPedido);
    ComboBoxClienteSelect(Sender);
  end;
end;

procedure TFrmMain.BitBtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.ComboBoxClienteSelect(Sender: TObject);
var
  lWhere: string;
begin
  if (ComboBoxCliente.ItemIndex > 0) then
    lWhere := ' where (p.id_cliente = ' + Trim(IntToStr(TCliente(ComboBoxCliente.Items.Objects[ComboBoxCliente.ItemIndex]).Id)) + ') '
  else
    lWhere := '';

  FDQueryPedidos.Close;
  FDQueryPedidos.SQL.Clear;
  FDQueryPedidos.SQL.Add('select p.id, p.id_cliente, c.nome, p.dt_emissao, p.valor_total ' +
                         'from public.pedidos p ' +
                              'inner join public.clientes c on (p.id_cliente = c.id) ' +
                         lWhere +
                         ' order by c.nome, p.id');
  FDQueryPedidos.OpenOrExecute;
end;

procedure TFrmMain.FDQueryPedidosAfterScroll(DataSet: TDataSet);
begin
  FDQueryProdutos.Close;

  if (not FDQueryPedidos.IsEmpty) then
  begin
    FDQueryProdutos.SQL.Clear;
    FDQueryProdutos.SQL.Add('select pp.id, pp.id_pedido, pp.id_produto, p.descricao, pp.qtd, pp.valor_unitario, pp.valor_total ' +
                            'from public.pedidos_produtos pp ' +
                                 'inner join public.produtos p on (pp.id_produto = p.id) ' +
                            'where (pp.id_pedido = ' + FDQueryPedidos.FieldByName('id').AsString + ') ' +
                            ' order by p.descricao');
    FDQueryProdutos.OpenOrExecute;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  montaComboboxCliente(oCliente, ComboBoxCliente, DM.listaDeClientes);
  ComboBoxClienteSelect(sender);
end;

end.
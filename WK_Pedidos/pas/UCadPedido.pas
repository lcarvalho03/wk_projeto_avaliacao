unit UCadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UTPedido, UTPedidoProduto, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, Vcl.NumberBox, UTProduto, UTCliente, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UTPedidoDAO;

type
  TFrmCadPedido = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtnGravarPedido: TBitBtn;
    BitBtnCancelar: TBitBtn;
    DateTimePickerEmissao: TDateTimePicker;
    Label2: TLabel;
    NumberBoxPedidoValorTotal: TNumberBox;
    Panel1: TPanel;
    ComboBoxProduto: TComboBox;
    Label3: TLabel;
    NumberBoxQtdProduto: TNumberBox;
    Label4: TLabel;
    NumberBoxValorUnitario: TNumberBox;
    NumberBoxProdutoValorTotal: TNumberBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBoxCliente: TComboBox;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    DataSourceProdutos: TDataSource;
    FDQueryProdutos: TFDQuery;
    FDQueryProdutosid: TIntegerField;
    FDQueryProdutosid_pedido: TIntegerField;
    FDQueryProdutosid_produto: TIntegerField;
    FDQueryProdutosdescricao: TWideStringField;
    FDQueryProdutosqtd: TBCDField;
    FDQueryProdutosvalor_unitario: TBCDField;
    FDQueryProdutosvalor_total: TBCDField;
    BitBtnInserirProduto: TBitBtn;
    FDMemTableProdutos: TFDMemTable;
    FDMemTableProdutosid: TIntegerField;
    FDMemTableProdutosid_pedido: TIntegerField;
    FDMemTableProdutosid_produto: TIntegerField;
    FDMemTableProdutosdescricao: TStringField;
    FDMemTableProdutosqtd: TFloatField;
    FDMemTableProdutosvalor_unitario: TCurrencyField;
    FDMemTableProdutosvalor_total: TCurrencyField;
    StatusBar: TStatusBar;
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxProdutoSelect(Sender: TObject);
    procedure NumberBoxQtdProdutoChange(Sender: TObject);
    procedure BitBtnInserirProdutoClick(Sender: TObject);
    procedure BitBtnGravarPedidoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oCliente: TCliente;
    oPedido: TPedido;
    oPedidoProduto: TPedidoProduto;

    function CalculaValorTotalProduto(qtd, valorVenda: Double): Double;
  end;

var
  FrmCadPedido: TFrmCadPedido;
  oProduto: TProduto;

implementation

uses ULib, UDM;

{$R *.dfm}

procedure TFrmCadPedido.BitBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPedido.BitBtnGravarPedidoClick(Sender: TObject);
var
  lValidacaoPedido: string;
begin
  oPedido.DtEmissao := DateTimePickerEmissao.DateTime;
  oPedido.Cliente := TCliente(ComboBoxCliente.Items.Objects[ComboBoxCliente.ItemIndex]);
  oPedido.ValorTotal := NumberBoxPedidoValorTotal.Value;
  lValidacaoPedido := TPedidoDAO.Valida(oPedido);

  if (lValidacaoPedido = '') then
  begin
    DM.FDConnection.StartTransaction;

    if (TPedidoDAO.Persiste(oPedido, FDMemTableProdutos)) then
    begin
      Application.MessageBox(PWideChar('Pedido inserido com sucesso.'), 'Inserção de dados', MB_ICONEXCLAMATION);
      Close;
    end;
  end
  else
  begin
    Application.MessageBox(PWideChar(lValidacaoPedido), 'Inconsistência de dados', MB_ICONWARNING);
    ComboBoxCliente.SetFocus;
  end;
end;

procedure TFrmCadPedido.BitBtnInserirProdutoClick(Sender: TObject);
begin
  if (ComboBoxProduto.ItemIndex > 0) and (NumberBoxQtdProduto.Value > 0.00) then
  begin
    FDMemTableProdutos.Append;
    FDMemTableProdutos.FieldByName('id_pedido').AsInteger := oPedido.Id;
    FDMemTableProdutos.FieldByName('id_produto').AsInteger := TProduto(ComboBoxProduto.Items.Objects[ComboBoxProduto.ItemIndex]).Id;
    FDMemTableProdutos.FieldByName('descricao').AsString := TProduto(ComboBoxProduto.Items.Objects[ComboBoxProduto.ItemIndex]).Descricao;
    FDMemTableProdutos.FieldByName('qtd').Value := NumberBoxQtdProduto.Value;
    FDMemTableProdutos.FieldByName('valor_unitario').Value := TProduto(ComboBoxProduto.Items.Objects[ComboBoxProduto.ItemIndex]).ValorVenda;
    FDMemTableProdutos.FieldByName('valor_total').Value := NumberBoxProdutoValorTotal.Value;
    FDMemTableProdutos.Post;

    NumberBoxPedidoValorTotal.Value := (NumberBoxPedidoValorTotal.Value + NumberBoxProdutoValorTotal.Value);
    StatusBar.Panels[0].Text := '  Valor Total do Pedido: ' + NumberBoxPedidoValorTotal.CurrencyString + ' ' + FormatFloat('#,##0.00', NumberBoxPedidoValorTotal.Value);
    ComboBoxProduto.ItemIndex := 0;
    NumberBoxQtdProduto.Value := 0;
    ComboBoxProduto.SetFocus;
  end
  else
  begin
    Application.MessageBox(PWideChar('Produto deve ser selecionado e a Quantidade deve ser maior que zero.'), 'Inconsistência de dados', MB_ICONWARNING);
    ComboBoxProduto.SetFocus;
  end;
end;

function TFrmCadPedido.CalculaValorTotalProduto(qtd, valorVenda: Double): Double;
begin
  if (qtd > 0.00) then
    Result := (qtd * valorVenda)
  else
    Result := 0.00;
end;

procedure TFrmCadPedido.ComboBoxProdutoSelect(Sender: TObject);
begin
  if (ComboBoxProduto.ItemIndex > 0) then
    NumberBoxValorUnitario.Value := TProduto(ComboBoxProduto.Items.Objects[ComboBoxProduto.ItemIndex]).ValorVenda
  else
    NumberBoxValorUnitario.Value := 0.00;

  //CalculaValorTotalProduto(NumberBoxQtdProduto.Value, NumberBoxValorUnitario.Value);
  NumberBoxQtdProdutoChange(Sender);
  NumberBoxQtdProduto.SetFocus;
end;

procedure TFrmCadPedido.FormDestroy(Sender: TObject);
begin
  DestroiObjetosDoComboBox(ComboBoxProduto);
  DestroiObjetosDoComboBox(ComboBoxCliente);
end;

procedure TFrmCadPedido.FormShow(Sender: TObject);
begin
  montaComboboxCliente(oCliente, ComboBoxCliente, DM.listaDeClientes);
  montaComboboxProduto(oProduto, ComboBoxProduto, DM.listaDeProdutos);
  oPedido := TPedido.Create(0, Now, TCliente(ComboBoxCliente.Items.Objects[0]), 0.00);
  //FDQueryProdutos.Close;
  //FDQueryProdutos := oPedido.Produtos;
  FDMemTableProdutos.Open;
end;

procedure TFrmCadPedido.NumberBoxQtdProdutoChange(Sender: TObject);
begin
  NumberBoxProdutoValorTotal.Value := CalculaValorTotalProduto(NumberBoxQtdProduto.Value, NumberBoxValorUnitario.Value);
end;

end.

program Proj_WK_Pedidos;

uses
  Vcl.Forms,
  UMain in '..\pas\UMain.pas' {FrmMain},
  UDM in '..\pas\UDM.pas' {DM: TDataModule},
  ULib in '..\pas\ULib.pas',
  UTProduto in '..\model\UTProduto.pas',
  UTCliente in '..\model\UTCliente.pas',
  UTPedido in '..\model\UTPedido.pas',
  UTPedidoProduto in '..\model\UTPedidoProduto.pas',
  UCadPedido in '..\pas\UCadPedido.pas' {FrmCadPedido},
  UTPedidoDAO in '..\dao\UTPedidoDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

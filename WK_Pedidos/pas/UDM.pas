unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, UTCliente, UTProduto, System.Generics.Collections, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TDM = class(TDataModule)
    fdqQuery: TFDQuery;
    FDConnection: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection2: TFDConnection;
    FDPhysMySQLDriverLink2: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function LerIniConexao(sSecao, sVariavel: string): string;
  public
    { Public declarations }
    listaDeClientes: TObjectList<TCliente>;
    listaDeProdutos: TObjectList<TProduto>;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
uses Vcl.Forms, Winapi.Windows, System.IniFiles, ULib;

{$R *.dfm}

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName);
  FDPhysPgDriverLink1.VendorLib := ExtractFilePath(Application.ExeName) + 'libpq.dll';
  FDPhysPgDriverLink1.Release;

  FDConnection.Connected := False;

  FDConnection.Params.Values['database'] := LerIniConexao('DatabaseName', 'BancoDeDados');
  FDConnection.Params.Values['username'] := LerIniConexao('User', 'Usuario');
  FDConnection.Params.Values['password'] := LerIniConexao('Password', 'Senha');
  FDConnection.Params.Values['server']   := LerIniConexao('Server', 'Servidor');
  FDConnection.Params.Values['port']     := LerIniConexao('Port', 'Porta');

  //FDConnection2.Connected := True;

  try
    FDConnection.Connected := True;

    if (not Assigned(listaDeClientes)) then
      listaDeClientes := obtemListaDeClientes();

    if (not Assigned(listaDeProdutos)) then
      listaDeProdutos := obtemListaDeProdutos();

  except
    Application.MessageBox(PWideChar('Falha ao tentar conectar o servidor de banco de dados!'), 'Conexão', MB_ICONERROR);
    Application.Terminate;
  end;


end;

function TDM.LerIniConexao(sSecao, sVariavel: string): string;
var
  sNomeArq: string;
  iniArq: TIniFile;
begin
  Result := '';
  sNomeArq := ExtractFileDir(application.ExeName);
  sNomeArq := sNomeArq + '\Conexao.ini';

  if FileExists(sNomeArq) then
  begin
    iniArq := TIniFile.Create(sNomeArq);
    Result := iniArq.ReadString(sSecao, sVariavel, ''); //le a string
    iniArq.Free;
  end;

  // verifica se o arquivo ini existe;
  if not FileExists(sNomeArq) then
  begin
    Application.MessageBox('O arquivo de configuração não pode ser encontrado!', 'Atenção', MB_ICONERROR + MB_OK);
    Application.Terminate;
  end;
end;

end.

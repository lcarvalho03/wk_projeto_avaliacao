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
    FDConnectionPostgreSQL: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnectionMySQL: TFDConnection;
    FDPhysMySQLDriverLink2: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionMySQLBeforeConnect(Sender: TObject);
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
  FDPhysPgDriverLink1.VendorLib := ExtractFilePath(Application.ExeName) + 'libpq.dll';
  FDPhysPgDriverLink1.Release;

  FDConnectionPostgreSQL.Connected := False;

  FDConnectionPostgreSQL.Params.Values['database'] := LerIniConexao('DatabaseName', 'BancoDeDados');
  FDConnectionPostgreSQL.Params.Values['username'] := LerIniConexao('User', 'Usuario');
  FDConnectionPostgreSQL.Params.Values['password'] := LerIniConexao('Password', 'Senha');
  FDConnectionPostgreSQL.Params.Values['server']   := LerIniConexao('Server', 'Servidor');
  FDConnectionPostgreSQL.Params.Values['port']     := LerIniConexao('Port', 'Porta');

  FDConnectionMySQL.Connected := True;

  try
    FDConnectionPostgreSQL.Connected := True;

    if (not Assigned(listaDeClientes)) then
      listaDeClientes := obtemListaDeClientes();

    if (not Assigned(listaDeProdutos)) then
      listaDeProdutos := obtemListaDeProdutos();

  except
    Application.MessageBox(PWideChar('Falha ao tentar conectar o servidor de banco de dados!'), 'Conexão', MB_ICONERROR);
    Application.Terminate;
  end;


end;

procedure TDM.FDConnectionMySQLBeforeConnect(Sender: TObject);
begin
  FDPhysMySQLDriverLink2.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
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

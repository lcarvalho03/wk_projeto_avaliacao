object DM: TDM
  OnCreate = DataModuleCreate
  Height = 576
  Width = 741
  object fdqQuery: TFDQuery
    Connection = FDConnectionPostgreSQL
    SQL.Strings = (
      'select *'
      'from public.clientes')
    Left = 56
    Top = 128
  end
  object FDConnectionPostgreSQL: TFDConnection
    Params.Strings = (
      'Database=DB_WK'
      'User_Name=postgres'
      'Password=123456'
      'Server='
      'DriverID=PG')
    FetchOptions.AssignedValues = [evAutoFetchAll]
    Left = 56
    Top = 24
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\#Leo\Projetos\Delphi\WK_Pedidos\exe\libpq.dll'
    Left = 176
    Top = 24
  end
  object FDConnectionMySQL: TFDConnection
    Params.Strings = (
      'Database=DB_WK'
      'Password=root2022'
      'User_Name=root'
      'CharacterSet=utf8'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    BeforeConnect = FDConnectionMySQLBeforeConnect
    Left = 136
    Top = 304
  end
  object FDPhysMySQLDriverLink2: TFDPhysMySQLDriverLink
    Left = 328
    Top = 304
  end
end

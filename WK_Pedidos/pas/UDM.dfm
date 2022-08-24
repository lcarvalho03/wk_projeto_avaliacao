object DM: TDM
  OnCreate = DataModuleCreate
  Height = 576
  Width = 741
  object fdqQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select *'
      'from public.clientes')
    Left = 56
    Top = 128
  end
  object FDConnection: TFDConnection
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
end

object FrmCadPedido: TFrmCadPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Pedido'
  ClientHeight = 485
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    785
    485)
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 90
    Width = 89
    Height = 15
    Caption = 'Data da emiss'#227'o:'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 44
    Width = 760
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
    ExplicitWidth = 585
  end
  object Label2: TLabel
    Left = 342
    Top = 90
    Width = 114
    Height = 15
    Caption = 'Valor Total do Pedido:'
  end
  object Label7: TLabel
    Left = 16
    Top = 59
    Width = 40
    Height = 15
    Caption = 'Cliente:'
  end
  object Label8: TLabel
    Left = 16
    Top = 243
    Width = 174
    Height = 15
    Caption = 'Produtos do Pedido selecionado:'
  end
  object BitBtnGravarPedido: TBitBtn
    Left = 591
    Top = 10
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    Caption = '&Gravar Pedido'
    TabOrder = 5
    OnClick = BitBtnGravarPedidoClick
  end
  object BitBtnCancelar: TBitBtn
    Left = 686
    Top = 10
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    Caption = '&Cancelar'
    TabOrder = 6
    OnClick = BitBtnCancelarClick
  end
  object DateTimePickerEmissao: TDateTimePicker
    Left = 112
    Top = 87
    Width = 106
    Height = 23
    Date = 44797.000000000000000000
    Time = 0.561731076391879500
    TabOrder = 1
  end
  object NumberBoxPedidoValorTotal: TNumberBox
    Left = 465
    Top = 87
    Width = 136
    Height = 23
    TabStop = False
    Alignment = taRightJustify
    Color = clInactiveCaption
    DisplayFormat = '#,##0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 16
    Top = 152
    Width = 585
    Height = 81
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 3
    object Label3: TLabel
      Left = 10
      Top = 19
      Width = 46
      Height = 15
      Caption = 'Produto:'
    end
    object Label4: TLabel
      Left = 10
      Top = 48
      Width = 26
      Height = 15
      Caption = 'Qtd.:'
    end
    object Label5: TLabel
      Left = 378
      Top = 19
      Width = 73
      Height = 15
      Caption = 'Valor unit'#225'rio:'
    end
    object Label6: TLabel
      Left = 378
      Top = 48
      Width = 56
      Height = 15
      Caption = 'Valor total:'
    end
    object ComboBoxProduto: TComboBox
      Left = 64
      Top = 16
      Width = 265
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnSelect = ComboBoxProdutoSelect
    end
    object NumberBoxQtdProduto: TNumberBox
      Left = 64
      Top = 45
      Width = 57
      Height = 23
      Alignment = taRightJustify
      DisplayFormat = '#,##0.00'
      TabOrder = 1
      OnChange = NumberBoxQtdProdutoChange
    end
    object NumberBoxValorUnitario: TNumberBox
      Left = 456
      Top = 16
      Width = 121
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clInactiveCaption
      DisplayFormat = '#,##0.00'
      ReadOnly = True
      TabOrder = 2
    end
    object NumberBoxProdutoValorTotal: TNumberBox
      Left = 456
      Top = 45
      Width = 121
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clInactiveCaption
      DisplayFormat = '#,##0.00'
      ReadOnly = True
      TabOrder = 3
    end
  end
  object ComboBoxCliente: TComboBox
    Left = 62
    Top = 56
    Width = 323
    Height = 23
    Style = csDropDownList
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 263
    Width = 760
    Height = 212
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourceProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
  object BitBtnInserirProduto: TBitBtn
    Left = 616
    Top = 181
    Width = 145
    Height = 30
    Caption = '&InserirProduto'
    TabOrder = 4
    OnClick = BitBtnInserirProdutoClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 456
    Width = 785
    Height = 29
    Panels = <
      item
        Width = 50
      end>
  end
  object DataSourceProdutos: TDataSource
    DataSet = FDMemTableProdutos
    Left = 264
    Top = 371
  end
  object FDQueryProdutos: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'select pp.id, pp.id_pedido, pp.id_produto, p.descricao, pp.qtd, ' +
        'pp.valor_unitario, pp.valor_total '
      'from public.pedidos_produtos pp '
      '     inner join public.produtos p on (pp.id_produto = p.id) '
      'where (pp.id = 0)'
      'order by p.descricao')
    Left = 264
    Top = 315
    object FDQueryProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryProdutosid_pedido: TIntegerField
      DisplayLabel = 'N'#250'mero pedido'
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
    end
    object FDQueryProdutosid_produto: TIntegerField
      DisplayLabel = 'C'#243'digo produto'
      FieldName = 'id_produto'
      Origin = 'id_produto'
    end
    object FDQueryProdutosdescricao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o do produto'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object FDQueryProdutosqtd: TBCDField
      DisplayLabel = 'Qtd'
      FieldName = 'qtd'
      Origin = 'qtd'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object FDQueryProdutosvalor_unitario: TBCDField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
    object FDQueryProdutosvalor_total: TBCDField
      DisplayLabel = 'Valor total'
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
  end
  object FDMemTableProdutos: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 440
    Top = 320
    object FDMemTableProdutosid: TIntegerField
      FieldName = 'id'
    end
    object FDMemTableProdutosid_pedido: TIntegerField
      FieldName = 'id_pedido'
    end
    object FDMemTableProdutosid_produto: TIntegerField
      DisplayLabel = 'C'#243'digo produto'
      FieldName = 'id_produto'
    end
    object FDMemTableProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o produto'
      FieldName = 'descricao'
      Size = 100
    end
    object FDMemTableProdutosqtd: TFloatField
      DisplayLabel = 'Qtd'
      FieldName = 'qtd'
    end
    object FDMemTableProdutosvalor_unitario: TCurrencyField
      DisplayLabel = 'Valor unit'#225'rio'
      FieldName = 'valor_unitario'
    end
    object FDMemTableProdutosvalor_total: TCurrencyField
      DisplayLabel = 'Valor total'
      FieldName = 'valor_total'
    end
  end
end

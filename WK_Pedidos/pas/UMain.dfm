object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Consulta de Pedidos'
  ClientHeight = 647
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    999
    647)
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 75
    Width = 40
    Height = 15
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 16
    Top = 115
    Width = 203
    Height = 15
    Caption = 'Pedidos do Cliente selecionado acima:'
  end
  object Label3: TLabel
    Left = 142
    Top = 387
    Width = 174
    Height = 15
    Caption = 'Produtos do Pedido selecionado:'
  end
  object Label4: TLabel
    Left = 16
    Top = 8
    Width = 198
    Height = 30
    Caption = 'Controle de Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 44
    Width = 975
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object ComboBoxCliente: TComboBox
    Left = 62
    Top = 72
    Width = 323
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnSelect = ComboBoxClienteSelect
  end
  object dbgProdutos: TDBGrid
    Left = 16
    Top = 136
    Width = 833
    Height = 225
    DataSource = DataSourcePedidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_emissao'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 83
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
  object DBGrid1: TDBGrid
    Left = 142
    Top = 408
    Width = 849
    Height = 224
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourceProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_pedido'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
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
        Width = 328
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
  object BitBtnAdicionarPedido: TBitBtn
    Left = 408
    Top = 72
    Width = 113
    Height = 23
    Caption = '&AdicionarPedido'
    TabOrder = 3
    OnClick = BitBtnAdicionarPedidoClick
  end
  object BitBtnSair: TBitBtn
    Left = 916
    Top = 10
    Width = 75
    Height = 30
    Anchors = [akTop, akRight]
    Caption = '&Sair'
    TabOrder = 4
    OnClick = BitBtnSairClick
  end
  object DataSourceProdutos: TDataSource
    DataSet = FDQueryProdutos
    Left = 240
    Top = 528
  end
  object FDQueryPedidos: TFDQuery
    AfterScroll = FDQueryPedidosAfterScroll
    Connection = DM.FDConnection
    SQL.Strings = (
      'select p.id, p.id_cliente, c.nome, p.dt_emissao, p.valor_total '
      'from public.pedidos p '
      '     inner join public.clientes c on (p.id_cliente = c.id) '
      'order by c.nome, p.id')
    Left = 376
    Top = 192
    object FDQueryPedidosid: TIntegerField
      DisplayLabel = 'N'#250'mero pedido'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryPedidosid_cliente: TIntegerField
      DisplayLabel = 'C'#243'digo cliente'
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
    end
    object FDQueryPedidosnome: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome cliente'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 70
    end
    object FDQueryPedidosdt_emissao: TDateField
      DisplayLabel = 'Data emiss'#227'o'
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
    end
    object FDQueryPedidosvalor_total: TBCDField
      DisplayLabel = 'Valor total'
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
  end
  object FDQueryProdutos: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'select pp.id, pp.id_pedido, pp.id_produto, p.descricao, pp.qtd, ' +
        'pp.valor_unitario, pp.valor_total '
      'from public.pedidos_produtos pp '
      '     inner join public.produtos p on (pp.id_produto = p.id) '
      'order by p.descricao')
    Left = 240
    Top = 472
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
  object DataSourcePedidos: TDataSource
    DataSet = FDQueryPedidos
    Left = 376
    Top = 248
  end
end

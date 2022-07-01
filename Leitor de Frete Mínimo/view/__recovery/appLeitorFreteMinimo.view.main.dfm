object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Leitor de Frete M'#237'nimo | Tabelas '
  ClientHeight = 819
  ClientWidth = 1755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object pnlRodape: TPanel
    Left = 0
    Top = 57
    Width = 1755
    Height = 66
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 14
      Width = 198
      Height = 21
      Caption = 'Digite o endere'#231'o web:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlLerHTML: TPanel
      Left = 1231
      Top = 14
      Width = 156
      Height = 34
      BevelOuter = bvNone
      Caption = 'Ler HTML'
      Color = 53760
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = pnlLerHTMLClick
      OnMouseEnter = pnlLerHTMLMouseEnter
      OnMouseLeave = pnlLerHTMLMouseLeave
    end
    object EditURL: TEdit
      Left = 216
      Top = 14
      Width = 997
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 
        'https://www.in.gov.br/en/web/dou/-/resolucao-n-5.959-de-20-de-ja' +
        'neiro-de-2022-375504795'
    end
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1755
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 12
      Top = 11
      Width = 783
      Height = 29
      Caption = 'Coeficientes dos pisos m'#237'nimos, referentes ao quil'#244'metro rodado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 1136
      Top = 17
      Width = 34
      Height = 28
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      Visible = False
      WordWrap = False
    end
    object Memo2: TMemo
      Left = 1176
      Top = 17
      Width = 37
      Height = 28
      Lines.Strings = (
        'Memo2')
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
  end
  object pnlConteudo: TPanel
    Left = 0
    Top = 123
    Width = 1755
    Height = 696
    Align = alClient
    TabOrder = 2
    DesignSize = (
      1755
      696)
    object Label1: TLabel
      Left = 720
      Top = 287
      Width = 79
      Height = 29
      Caption = 'Tabela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgLista: TDBGrid
      Left = 0
      Top = 55
      Width = 1125
      Height = 615
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsTemp
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 1231
      Top = 6
      Width = 156
      Height = 34
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Gerar JSON'
      Color = 16744448
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = Panel2Click
      OnMouseEnter = Panel2MouseEnter
      OnMouseLeave = Panel2MouseLeave
    end
    object pnlTabs: TPanel
      Left = 56
      Top = 6
      Width = 970
      Height = 35
      Anchors = [akTop]
      BevelOuter = bvNone
      Color = 16744448
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = pnlLerHTMLClick
      DesignSize = (
        970
        35)
      object pnlLotacao: TPanel
        Left = 3
        Top = 3
        Width = 121
        Height = 29
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Lota'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = pnlLotacaoClick
      end
      object pnlSomenteAutomotor: TPanel
        Left = 124
        Top = 3
        Width = 218
        Height = 29
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Somente automotor'
        Color = 16744448
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = pnlSomenteAutomotorClick
      end
      object pnlLotacaoAutoDesempenho: TPanel
        Left = 348
        Top = 4
        Width = 262
        Height = 29
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Lota'#231#227'o auto desempenho'
        Color = 16744448
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = pnlLotacaoAutoDesempenhoClick
      end
      object pnlSomenteAutomotorAutoDesempenho: TPanel
        Left = 616
        Top = 3
        Width = 348
        Height = 29
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Somente automotor auto desempenho'
        Color = 16744448
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = pnlSomenteAutomotorAutoDesempenhoClick
      end
    end
    object Panel9: TPanel
      Left = 1450
      Top = 6
      Width = 156
      Height = 34
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Salvar arquivo'
      Color = 2856447
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = pnlLerHTMLClick
      OnMouseEnter = Panel9MouseEnter
      OnMouseLeave = Panel9MouseLeave
    end
    object Memo3: TMemo
      Left = 1143
      Top = 55
      Width = 598
      Height = 615
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'Memo3')
      TabOrder = 4
    end
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 272
    Top = 704
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 96
    Top = 712
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp
    Left = 988
    Top = 734
  end
  object cdsTemp: TClientDataSet
    PersistDataPacket.Data = {
      5C0100009619E0BD01000000180000000B0000000000030000005C0102696401
      004900000001000557494454480200020003000D5469706F2064652043617267
      61010049000000010005574944544802000200280014436F6566696369656E74
      6520646520437573746F01004900000001000557494454480200020032000755
      6E69646164650100490000000100055749445448020002001E00076569786F73
      5F320100490000000100055749445448020002001400076569786F735F330100
      490000000100055749445448020002001400076569786F735F34010049000000
      0100055749445448020002001400076569786F735F3501004900000001000557
      49445448020002001400076569786F735F360100490000000100055749445448
      020002001400076569786F735F37010049000000010005574944544802000200
      1400076569786F735F3901004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 733
    object cdsTempid: TStringField
      DisplayWidth = 3
      FieldName = 'id'
      Size = 3
    end
    object cdsTempTipodeCarga: TStringField
      DisplayWidth = 36
      FieldName = 'Tipo de Carga'
      Size = 40
    end
    object cdsTempCoeficientedeCusto: TStringField
      DisplayWidth = 26
      FieldName = 'Coeficiente de Custo'
      Size = 50
    end
    object cdsTempUnidade: TStringField
      DisplayWidth = 19
      FieldName = 'Unidade'
      Size = 30
    end
    object cdsTempeixos_2: TStringField
      DisplayWidth = 8
      FieldName = 'eixos_2'
    end
    object cdsTempeixos_3: TStringField
      DisplayWidth = 8
      FieldName = 'eixos_3'
    end
    object cdsTempeixos_4: TStringField
      DisplayWidth = 9
      FieldName = 'eixos_4'
    end
    object cdsTempeixos_5: TStringField
      DisplayWidth = 8
      FieldName = 'eixos_5'
    end
    object cdsTempeixos_6: TStringField
      DisplayWidth = 10
      FieldName = 'eixos_6'
    end
    object cdsTempeixos_7: TStringField
      DisplayWidth = 10
      FieldName = 'eixos_7'
    end
    object cdsTempeixos_9: TStringField
      DisplayWidth = 11
      FieldName = 'eixos_9'
    end
  end
end

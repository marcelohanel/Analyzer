object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'GeoAnalises'
  ClientHeight = 622
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 602
    Width = 980
    Height = 20
    Images = ImageList1
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 0
        Text = 'Data:'
        Width = 130
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        Text = 'Vers'#227'o:'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 2
        Text = 'Arquivo:'
        Width = 700
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object cxPageControl2: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 974
    Height = 596
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    ClientRectBottom = 594
    ClientRectLeft = 2
    ClientRectRight = 972
    ClientRectTop = 2
    object cxTabSheet2: TcxTabSheet
      Caption = 'Geo Processamento'
      ImageIndex = 0
      object cxSplitter1: TcxSplitter
        Left = 359
        Top = 0
        Width = 8
        Height = 592
        HotZoneClassName = 'TcxSimpleStyle'
        AllowHotZoneDrag = False
        Control = Panel1
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 359
        Height = 592
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox3: TcxGroupBox
          Left = 13
          Top = 339
          Caption = 'Vis'#227'o'
          TabOrder = 2
          Height = 142
          Width = 331
          object BitBtn3: TcxButton
            Left = 75
            Top = 71
            Width = 184
            Height = 25
            Caption = 'Mostrar Informa'#231#245'es no Mapa'
            TabOrder = 4
            OnClick = BitBtn3Click
          end
          object cxLabel1: TcxLabel
            Left = 47
            Top = 24
            Caption = 'N'#237'vel:'
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 45
            Top = 45
            Caption = 'Estilo:'
            Transparent = True
          end
          object cbxVisao: TcxComboBox
            Left = 76
            Top = 23
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Pa'#237's'
              'Regi'#227'o'
              'Estado'
              'Meso Regi'#227'o'
              'Micro Regi'#227'o'
              'Cidade')
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 236
          end
          object cbxVisaoMapa: TcxComboBox
            Left = 76
            Top = 44
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Mapa'
              'Sat'#233'lite'
              'H'#237'brido'
              'Terreno')
            Properties.MaxLength = 0
            TabOrder = 1
            Width = 236
          end
          object chkNavegador: TcxCheckBox
            Left = 3
            Top = 112
            Caption = 'Abrir direto no navegador da Internet'
            TabOrder = 5
            Width = 256
          end
        end
        object GroupBox2: TcxGroupBox
          Left = 13
          Top = 8
          Caption = 'Filtro Informa'#231#245'es'
          TabOrder = 0
          Height = 153
          Width = 332
          object btnFiltro: TcxButton
            Left = 77
            Top = 118
            Width = 183
            Height = 25
            Caption = 'Filtro Personalizado'
            TabOrder = 6
            OnClick = btnFiltroClick
          end
          object Label3: TcxLabel
            Left = 33
            Top = 22
            Caption = 'Sum'#225'rio:'
            Transparent = True
          end
          object Label2: TcxLabel
            Left = 25
            Top = 70
            Caption = 'Dimens'#227'o:'
            Transparent = True
          end
          object cbxSumario: TcxComboBox
            Left = 77
            Top = 21
            Properties.DropDownListStyle = lsEditFixedList
            Properties.MaxLength = 0
            TabOrder = 0
            Width = 235
          end
          object cbxFuncao: TcxComboBox
            Left = 77
            Top = 42
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Somar'
              'Contar'
              'M'#233'dia'
              'M'#237'nimo'
              'M'#225'ximo')
            Properties.MaxLength = 0
            TabOrder = 1
            Width = 235
          end
          object cbxDimensao: TcxComboBox
            Left = 77
            Top = 69
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownRows = 20
            Properties.DropDownSizeable = True
            Properties.MaxLength = 0
            Properties.OnChange = cbxDimensaoPropertiesChange
            TabOrder = 2
            Width = 235
          end
          object cbbValorDimensao: TcxCheckComboBox
            Left = 77
            Top = 91
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            TabOrder = 3
            Width = 235
          end
        end
        object GroupBox1: TcxGroupBox
          Left = 13
          Top = 167
          Caption = 'Filtro Local'
          TabOrder = 1
          Height = 166
          Width = 331
          object Label4: TcxLabel
            Left = 51
            Top = 22
            Caption = 'Pa'#237's:'
            Transparent = True
          end
          object Label7: TcxLabel
            Left = 37
            Top = 43
            Caption = 'Regi'#227'o:'
            Transparent = True
          end
          object Label5: TcxLabel
            Left = 37
            Top = 64
            Caption = 'Estado:'
            Transparent = True
          end
          object Label8: TcxLabel
            Left = 9
            Top = 85
            Caption = 'Meso Regi'#227'o:'
            Transparent = True
          end
          object Label9: TcxLabel
            Left = 9
            Top = 106
            Caption = 'Micro Regi'#227'o:'
            Transparent = True
          end
          object Label6: TcxLabel
            Left = 37
            Top = 127
            Caption = 'Cidade:'
            Transparent = True
          end
          object cbbPais: TcxCheckComboBox
            Left = 76
            Top = 20
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            Properties.OnChange = cbbPaisPropertiesChange
            TabOrder = 1
            Width = 235
          end
          object cbbRegiao: TcxCheckComboBox
            Left = 76
            Top = 41
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            Properties.OnChange = cbbRegiaoPropertiesChange
            TabOrder = 3
            Width = 235
          end
          object cbbEstado: TcxCheckComboBox
            Left = 76
            Top = 62
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            Properties.OnChange = cbbEstadoPropertiesChange
            TabOrder = 5
            Width = 235
          end
          object cbbMesoRegiao: TcxCheckComboBox
            Left = 76
            Top = 83
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            Properties.OnChange = cbbMesoRegiaoPropertiesChange
            TabOrder = 7
            Width = 235
          end
          object cbbMicroRegiao: TcxCheckComboBox
            Left = 76
            Top = 104
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            Properties.OnChange = cbbMicroRegiaoPropertiesChange
            TabOrder = 9
            Width = 235
          end
          object cbbCidade: TcxCheckComboBox
            Left = 76
            Top = 125
            Properties.ShowEmptyText = False
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfCaptions
            Properties.Items = <>
            TabOrder = 11
            Width = 235
          end
        end
      end
      object Panel2: TPanel
        Left = 367
        Top = 0
        Width = 603
        Height = 592
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Memo1: TMemo
          Left = 72
          Top = 258
          Width = 308
          Height = 177
          Lines.Strings = (
            'Memo1')
          ScrollBars = ssBoth
          TabOrder = 0
          Visible = False
        end
        object WebBrowser1: TWebBrowser
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 597
          Height = 586
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 6
          ExplicitTop = 2
          ExplicitWidth = 603
          ExplicitHeight = 572
          ControlData = {
            4C000000B43D0000913C00000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
  end
  object bdDados: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 544
    Top = 32
  end
  object cdsMapaTotalRef: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'pais'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'regiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'mesoregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'microregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end
      item
        Name = 'perc'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc'
        DataType = ftFloat
      end
      item
        Name = 'abc_perc'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsMapaTotalRefIndex1'
        DescFields = 'valor'
        Fields = 'valor'
        Options = [ixDescending]
      end
      item
        Name = 'cdsMapaTotalRefIndex2'
        Fields = 'pais;regiao;estado;mesoregiao;microregiao;cidade'
      end>
    Params = <>
    StoreDefs = True
    Left = 544
    Top = 224
    object StringField1: TStringField
      FieldName = 'pais'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'regiao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object StringField3: TStringField
      FieldName = 'estado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'mesoregiao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object StringField5: TStringField
      FieldName = 'microregiao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object StringField6: TStringField
      FieldName = 'cidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 255
    end
    object FloatField1: TFloatField
      FieldName = 'valor'
    end
    object cdsMapaTotalRefperc: TFloatField
      FieldName = 'perc'
    end
    object cdsMapaTotalRefacum_perc: TFloatField
      FieldName = 'acum_perc'
    end
    object cdsMapaTotalRefabc_perc: TStringField
      FieldName = 'abc_perc'
      Size = 1
    end
  end
  object cdsMapaTotalDim: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'dimensao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsMapaTotalDimIndex1'
        Fields = 'dimensao'
      end>
    Params = <>
    StoreDefs = True
    Left = 632
    Top = 224
    object cdsMapaTotalDimdimensao: TStringField
      FieldName = 'dimensao'
      Size = 255
    end
    object cdsMapaTotalDimvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object cdsMapa: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'pais'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'regiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'mesoregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'microregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'dimensao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end
      item
        Name = 'perc_ref'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc_ref'
        DataType = ftFloat
      end
      item
        Name = 'abc_ref'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'perc_dim'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc_dim'
        DataType = ftFloat
      end
      item
        Name = 'abc_dim'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'perc'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc'
        DataType = ftFloat
      end
      item
        Name = 'abc_perc'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsMapaIndex1'
        DescFields = 'valor'
        Fields = 'pais;regiao;estado;mesoregiao;microregiao;cidade;valor'
        Options = [ixDescending]
      end
      item
        Name = 'cdsMapaIndex2'
        DescFields = 'valor'
        Fields = 'dimensao;valor'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 464
    Top = 224
    object cdsMapapais: TStringField
      FieldName = 'pais'
      Size = 255
    end
    object cdsMaparegiao: TStringField
      FieldName = 'regiao'
      Size = 255
    end
    object cdsMapaestado: TStringField
      FieldName = 'estado'
      Size = 255
    end
    object cdsMapamesoregiao: TStringField
      FieldName = 'mesoregiao'
      Size = 255
    end
    object cdsMapamicroregiao: TStringField
      FieldName = 'microregiao'
      Size = 255
    end
    object cdsMapacidade: TStringField
      FieldName = 'cidade'
      Size = 255
    end
    object cdsMapadimensao: TStringField
      FieldName = 'dimensao'
      Size = 255
    end
    object cdsMapavalor: TFloatField
      FieldName = 'valor'
    end
    object cdsMapaperc_ref: TFloatField
      FieldName = 'perc_ref'
    end
    object cdsMapaacum_perc_ref: TFloatField
      FieldName = 'acum_perc_ref'
    end
    object cdsMapaabc_ref: TStringField
      FieldName = 'abc_ref'
      Size = 1
    end
    object cdsMapaperc_dim: TFloatField
      FieldName = 'perc_dim'
    end
    object cdsMapaacum_perc_dim: TFloatField
      FieldName = 'acum_perc_dim'
    end
    object cdsMapaabc_dim: TStringField
      FieldName = 'abc_dim'
      Size = 1
    end
    object cdsMapaperc: TFloatField
      FieldName = 'perc'
    end
    object cdsMapaacum_perc: TFloatField
      FieldName = 'acum_perc'
    end
    object cdsMapaabc_perc: TStringField
      FieldName = 'abc_perc'
      Size = 1
    end
  end
  object cdsMapa1: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'pais'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'regiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'mesoregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'microregiao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'dimensao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end
      item
        Name = 'perc_ref'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc_ref'
        DataType = ftFloat
      end
      item
        Name = 'abc_ref'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'perc_dim'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc_dim'
        DataType = ftFloat
      end
      item
        Name = 'abc_dim'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'perc'
        DataType = ftFloat
      end
      item
        Name = 'acum_perc'
        DataType = ftFloat
      end
      item
        Name = 'abc_perc'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsMapaIndex1'
        DescFields = 'valor'
        Fields = 'pais;regiao;estado;mesoregiao;microregiao;cidade;valor'
        Options = [ixDescending]
      end
      item
        Name = 'cdsMapaIndex2'
        DescFields = 'valor'
        Fields = 'dimensao;valor'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 696
    Top = 224
    object StringField7: TStringField
      FieldName = 'pais'
      Size = 255
    end
    object StringField8: TStringField
      FieldName = 'regiao'
      Size = 255
    end
    object StringField9: TStringField
      FieldName = 'estado'
      Size = 255
    end
    object StringField10: TStringField
      FieldName = 'mesoregiao'
      Size = 255
    end
    object StringField11: TStringField
      FieldName = 'microregiao'
      Size = 255
    end
    object StringField12: TStringField
      FieldName = 'cidade'
      Size = 255
    end
    object StringField13: TStringField
      FieldName = 'dimensao'
      Size = 255
    end
    object FloatField2: TFloatField
      FieldName = 'valor'
    end
    object FloatField3: TFloatField
      FieldName = 'perc_ref'
    end
    object FloatField4: TFloatField
      FieldName = 'acum_perc_ref'
    end
    object StringField14: TStringField
      FieldName = 'abc_ref'
      Size = 1
    end
    object FloatField5: TFloatField
      FieldName = 'perc_dim'
    end
    object FloatField6: TFloatField
      FieldName = 'acum_perc_dim'
    end
    object StringField15: TStringField
      FieldName = 'abc_dim'
      Size = 1
    end
    object FloatField7: TFloatField
      FieldName = 'perc'
    end
    object FloatField8: TFloatField
      FieldName = 'acum_perc'
    end
    object StringField16: TStringField
      FieldName = 'abc_perc'
      Size = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 88
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object mnuAbrir: TMenuItem
        Caption = 'Informa'#231#245'es do arquivo de GeoAnalises'
        OnClick = mnuAbrirClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object EncerrarAplicao1: TMenuItem
        Caption = 'Encerrar Aplica'#231#227'o'
        ShortCut = 32883
        OnClick = EncerrarAplicao1Click
      end
    end
    object Ferramentas1: TMenuItem
      Caption = 'Ferramentas'
      object mnuLocalizacao: TMenuItem
        Caption = 'Gerar informa'#231#245'es sobre localiza'#231#245'es'
        OnClick = mnuLocalizacaoClick
      end
      object mnuEditarLocalizacao: TMenuItem
        Caption = 'Visualizar informa'#231#245'es sobre localiza'#231#245'es'
        Enabled = False
        OnClick = mnuEditarLocalizacaoClick
      end
      object N3: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuFatos: TMenuItem
        Caption = 'Visualizar informa'#231#245'es sobre a tabela de fatos'
        Enabled = False
        OnClick = mnuFatosClick
      end
    end
  end
  object cdsGeoAnalises: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'descricao'
        DataType = ftMemo
        Size = 10
      end
      item
        Name = 'dt_criacao'
        DataType = ftDateTime
      end
      item
        Name = 'connection_string'
        DataType = ftMemo
        Size = 10
      end
      item
        Name = 'tabela'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_ref'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_3'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_4'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_5'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_6'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_7'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_8'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_9'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_10'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_11'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_12'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_13'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_14'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_15'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_16'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_17'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_18'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_19'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_20'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_21'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_22'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_23'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_24'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_25'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_26'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_27'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_28'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_29'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_30'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_31'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_32'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_33'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_34'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_35'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_36'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_37'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_38'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_39'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_40'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_41'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_42'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_43'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_44'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_45'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_46'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_47'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_48'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_49'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_dimensao_50'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_3'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_4'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_5'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_6'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_7'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_8'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_9'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_10'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_11'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_12'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_13'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_14'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_15'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_16'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_17'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_18'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_19'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_20'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_21'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_22'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_23'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_24'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_25'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_26'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_27'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_28'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_29'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_30'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_31'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_32'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_33'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_34'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_35'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_36'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_37'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_38'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_39'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_40'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_41'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_42'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_43'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_44'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_45'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_46'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_47'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_48'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_49'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_sumario_50'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'maximo_itens'
        DataType = ftInteger
      end
      item
        Name = 'largura'
        DataType = ftInteger
      end
      item
        Name = 'altura'
        DataType = ftInteger
      end
      item
        Name = 'tamanho'
        DataType = ftInteger
      end
      item
        Name = 'itens_mark'
        DataType = ftInteger
      end
      item
        Name = 'visao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'visualiza_coord'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'endereco_a'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'endereco_b'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'endereco_c'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'campo_aux_1'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_2'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_3'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_4'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_5'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_6'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_7'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_8'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_9'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_10'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_11'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_12'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_13'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_14'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_16'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_17'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_18'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_19'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_20'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_21'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_22'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_23'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_24'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_25'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_26'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_27'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_28'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_29'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_30'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'campo_aux_b_1'
        DataType = ftBlob
        Size = 100
      end
      item
        Name = 'campo_aux_b_2'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_3'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_4'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_5'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_6'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_7'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_8'
        DataType = ftBlob
        Size = 10
      end
      item
        Name = 'campo_aux_b_9'
        DataType = ftBlob
        Size = 9
      end
      item
        Name = 'campo_aux_b_10'
        DataType = ftBlob
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterInsert = cdsGeoAnalisesAfterInsert
    Left = 544
    Top = 288
    object cdsGeoAnalisesid_geo: TStringField
      FieldName = 'id_geo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsGeoAnalisesdescricao: TMemoField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsGeoAnalisesdt_criacao: TDateTimeField
      FieldName = 'dt_criacao'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisesconnection_string: TMemoField
      FieldName = 'connection_string'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsGeoAnalisestabela: TStringField
      FieldName = 'tabela'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_ref: TStringField
      FieldName = 'campo_ref'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_1: TStringField
      FieldName = 'campo_dimensao_1'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_2: TStringField
      FieldName = 'campo_dimensao_2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_3: TStringField
      FieldName = 'campo_dimensao_3'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_4: TStringField
      FieldName = 'campo_dimensao_4'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_5: TStringField
      FieldName = 'campo_dimensao_5'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_6: TStringField
      FieldName = 'campo_dimensao_6'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_7: TStringField
      FieldName = 'campo_dimensao_7'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_8: TStringField
      FieldName = 'campo_dimensao_8'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_9: TStringField
      FieldName = 'campo_dimensao_9'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_10: TStringField
      FieldName = 'campo_dimensao_10'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_11: TStringField
      FieldName = 'campo_dimensao_11'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_12: TStringField
      FieldName = 'campo_dimensao_12'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_13: TStringField
      FieldName = 'campo_dimensao_13'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_14: TStringField
      FieldName = 'campo_dimensao_14'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_15: TStringField
      FieldName = 'campo_dimensao_15'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_16: TStringField
      FieldName = 'campo_dimensao_16'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_17: TStringField
      FieldName = 'campo_dimensao_17'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_18: TStringField
      FieldName = 'campo_dimensao_18'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_19: TStringField
      FieldName = 'campo_dimensao_19'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_demensao_20: TStringField
      FieldName = 'campo_dimensao_20'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_21: TStringField
      FieldName = 'campo_dimensao_21'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_22: TStringField
      FieldName = 'campo_dimensao_22'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_23: TStringField
      FieldName = 'campo_dimensao_23'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_24: TStringField
      FieldName = 'campo_dimensao_24'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_25: TStringField
      FieldName = 'campo_dimensao_25'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_26: TStringField
      FieldName = 'campo_dimensao_26'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_27: TStringField
      FieldName = 'campo_dimensao_27'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_29: TStringField
      FieldName = 'campo_dimensao_28'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_292: TStringField
      FieldName = 'campo_dimensao_29'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_30: TStringField
      FieldName = 'campo_dimensao_30'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_31: TStringField
      FieldName = 'campo_dimensao_31'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_32: TStringField
      FieldName = 'campo_dimensao_32'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_33: TStringField
      FieldName = 'campo_dimensao_33'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_34: TStringField
      FieldName = 'campo_dimensao_34'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_35: TStringField
      FieldName = 'campo_dimensao_35'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_36: TStringField
      FieldName = 'campo_dimensao_36'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_37: TStringField
      FieldName = 'campo_dimensao_37'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_38: TStringField
      FieldName = 'campo_dimensao_38'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_39: TStringField
      FieldName = 'campo_dimensao_39'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_40: TStringField
      FieldName = 'campo_dimensao_40'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_41: TStringField
      FieldName = 'campo_dimensao_41'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_42: TStringField
      FieldName = 'campo_dimensao_42'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_43: TStringField
      FieldName = 'campo_dimensao_43'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_44: TStringField
      FieldName = 'campo_dimensao_44'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_45: TStringField
      FieldName = 'campo_dimensao_45'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_46: TStringField
      FieldName = 'campo_dimensao_46'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_47: TStringField
      FieldName = 'campo_dimensao_47'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_48: TStringField
      FieldName = 'campo_dimensao_48'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_49: TStringField
      FieldName = 'campo_dimensao_49'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_dimensao_50: TStringField
      FieldName = 'campo_dimensao_50'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_1: TStringField
      FieldName = 'campo_sumario_1'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_2: TStringField
      FieldName = 'campo_sumario_2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_3: TStringField
      FieldName = 'campo_sumario_3'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_4: TStringField
      FieldName = 'campo_sumario_4'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_5: TStringField
      FieldName = 'campo_sumario_5'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_6: TStringField
      FieldName = 'campo_sumario_6'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_7: TStringField
      FieldName = 'campo_sumario_7'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_8: TStringField
      FieldName = 'campo_sumario_8'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_9: TStringField
      FieldName = 'campo_sumario_9'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_10: TStringField
      FieldName = 'campo_sumario_10'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_11: TStringField
      FieldName = 'campo_sumario_11'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_12: TStringField
      FieldName = 'campo_sumario_12'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_13: TStringField
      FieldName = 'campo_sumario_13'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_14: TStringField
      FieldName = 'campo_sumario_14'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_15: TStringField
      FieldName = 'campo_sumario_15'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_16: TStringField
      FieldName = 'campo_sumario_16'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_17: TStringField
      FieldName = 'campo_sumario_17'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_18: TStringField
      FieldName = 'campo_sumario_18'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_19: TStringField
      FieldName = 'campo_sumario_19'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_20: TStringField
      FieldName = 'campo_sumario_20'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_21: TStringField
      FieldName = 'campo_sumario_21'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_22: TStringField
      FieldName = 'campo_sumario_22'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_23: TStringField
      FieldName = 'campo_sumario_23'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_24: TStringField
      FieldName = 'campo_sumario_24'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_25: TStringField
      FieldName = 'campo_sumario_25'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_26: TStringField
      FieldName = 'campo_sumario_26'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_27: TStringField
      FieldName = 'campo_sumario_27'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_28: TStringField
      FieldName = 'campo_sumario_28'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_29: TStringField
      FieldName = 'campo_sumario_29'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_30: TStringField
      FieldName = 'campo_sumario_30'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_31: TStringField
      FieldName = 'campo_sumario_31'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_32: TStringField
      FieldName = 'campo_sumario_32'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_33: TStringField
      FieldName = 'campo_sumario_33'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_34: TStringField
      FieldName = 'campo_sumario_34'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_35: TStringField
      FieldName = 'campo_sumario_35'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_36: TStringField
      FieldName = 'campo_sumario_36'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_37: TStringField
      FieldName = 'campo_sumario_37'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_38: TStringField
      FieldName = 'campo_sumario_38'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_39: TStringField
      FieldName = 'campo_sumario_39'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_40: TStringField
      FieldName = 'campo_sumario_40'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_41: TStringField
      FieldName = 'campo_sumario_41'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_42: TStringField
      FieldName = 'campo_sumario_42'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_43: TStringField
      FieldName = 'campo_sumario_43'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_44: TStringField
      FieldName = 'campo_sumario_44'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_45: TStringField
      FieldName = 'campo_sumario_45'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_46: TStringField
      FieldName = 'campo_sumario_46'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_47: TStringField
      FieldName = 'campo_sumario_47'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_48: TStringField
      FieldName = 'campo_sumario_48'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_49: TStringField
      FieldName = 'campo_sumario_49'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_sumario_50: TStringField
      FieldName = 'campo_sumario_50'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisesmaximo_itens: TIntegerField
      FieldName = 'maximo_itens'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnaliseslargura: TIntegerField
      FieldName = 'largura'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisesaltura: TIntegerField
      FieldName = 'altura'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisestamanho: TIntegerField
      FieldName = 'tamanho'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisesitens_mark: TIntegerField
      FieldName = 'itens_mark'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisesvisao: TStringField
      FieldName = 'visao'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGeoAnalisesvisualiza_coord: TStringField
      FieldName = 'visualiza_coord'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsGeoAnalisesendereco_a: TStringField
      FieldName = 'endereco_a'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisesendereco_b: TStringField
      FieldName = 'endereco_b'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisesendereco_c: TStringField
      FieldName = 'endereco_c'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_aux_1: TStringField
      FieldName = 'campo_aux_1'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_2: TStringField
      FieldName = 'campo_aux_2'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_3: TStringField
      FieldName = 'campo_aux_3'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_4: TStringField
      FieldName = 'campo_aux_4'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_5: TStringField
      FieldName = 'campo_aux_5'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_6: TStringField
      FieldName = 'campo_aux_6'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_7: TStringField
      FieldName = 'campo_aux_7'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_8: TStringField
      FieldName = 'campo_aux_8'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_9: TStringField
      FieldName = 'campo_aux_9'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_10: TStringField
      FieldName = 'campo_aux_10'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_11: TStringField
      FieldName = 'campo_aux_11'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_12: TStringField
      FieldName = 'campo_aux_12'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_13: TStringField
      FieldName = 'campo_aux_13'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_14: TStringField
      FieldName = 'campo_aux_14'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_16: TStringField
      FieldName = 'campo_aux_16'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_17: TStringField
      FieldName = 'campo_aux_17'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_18: TStringField
      FieldName = 'campo_aux_18'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_19: TStringField
      FieldName = 'campo_aux_19'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_20: TStringField
      FieldName = 'campo_aux_20'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_21: TStringField
      FieldName = 'campo_aux_21'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_22: TStringField
      FieldName = 'campo_aux_22'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_23: TStringField
      FieldName = 'campo_aux_23'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_24: TStringField
      FieldName = 'campo_aux_24'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_25: TStringField
      FieldName = 'campo_aux_25'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_26: TStringField
      FieldName = 'campo_aux_26'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_27: TStringField
      FieldName = 'campo_aux_27'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_28: TStringField
      FieldName = 'campo_aux_28'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_29: TStringField
      FieldName = 'campo_aux_29'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_30: TStringField
      FieldName = 'campo_aux_30'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object cdsGeoAnalisescampo_aux_b_1: TBlobField
      FieldName = 'campo_aux_b_1'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsGeoAnalisescampo_aux_b_2: TBlobField
      FieldName = 'campo_aux_b_2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_3: TBlobField
      FieldName = 'campo_aux_b_3'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_4: TBlobField
      FieldName = 'campo_aux_b_4'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_5: TBlobField
      FieldName = 'campo_aux_b_5'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_6: TBlobField
      FieldName = 'campo_aux_b_6'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_7: TBlobField
      FieldName = 'campo_aux_b_7'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_8: TBlobField
      FieldName = 'campo_aux_b_8'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsGeoAnalisescampo_aux_b_9: TBlobField
      FieldName = 'campo_aux_b_9'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object cdsGeoAnalisescampo_aux_b_10: TBlobField
      FieldName = 'campo_aux_b_10'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object ImageList1: TImageList
    Left = 464
    Top = 144
    Bitmap = {
      494C01010400EC00180110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002129A5001821
      B500000000004A4A4A005A5A5A0084847B0084847B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009C0000009C0000009C0000009C0000009C0000009C000000
      9C0000009C0000009C0000009C0000009C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084736B005A63BD002121
      B50063635A00A5A5A500FFFFFF00E7E7DE00D6CECE009C94940084847B007B73
      73005A5A5A000000000000000000000000000000000000000000000000000000
      00000000000000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000009C00AD847B00B58C7B00B58C7B00B58C
      7B00B58C7B00B58C7B00B58C7B00B58C7B00B58C7B00B58C7B00B58C7B00B58C
      7B00B58C7B00000000000000000000000000000000000000000000000000009C
      CE004AB5E70063C6EF0052BDE70039B5DE004ABDE70000000000000000000000
      00000000000000000000000000000000000000000000AD9484007B73C6002121
      B500BD947300A5A5A500FFFFFF00FFFFFF00FFFFFF00D6D6CE00CEC6BD00F7EF
      DE00EFE7D600A59C94006B6B630000000000AD7B7B00B58C7B00B58C7B00B58C
      7B00B58C7B0000009C00FFFFFF00FFFFFF0000009C00FFFFFF0000009C000000
      9C0000009C0000009C00FFFFFF0000009C00AD847B00FFE7CE00F7E7CE00F7E7
      C600F7E7BD00F7DEBD00F7DEB500F7DEB500F7DEAD00F7D6AD00F7D6A500F7D6
      A500B58C7B00000000000000000000000000000000000000000008A5CE0008A5
      D6007BD6F700A5DEFF0094DEFF0094DEFF007BCEEF0073CEEF004AB5E7000000
      00000000000000000000000000000000000000000000AD9484007B73C6002121
      B500BD9C7B00A5A5A500FFFFFF00FFFFFF009C9CA50073737300313131007B7B
      7300FFF7E700FFF7E7008484840000000000AD847B00FFEFD600F7E7C600F7DE
      BD00F7DEB50000009C00FFFFFF00FFFFFF0000009C00FFFFFF00FFFFFF000000
      9C00FFFFFF00FFFFFF00FFFFFF0000009C00B5847B00FFEFD600FFEFCE00F7E7
      CE00F7E7C600F7E7C600F7DEBD00F7DEB500F7DEB500F7DEAD00F7D6AD00F7D6
      A500B58C7B00000000000000000000000000000000000000000010ADD60018AD
      DE0084DEEF00A5E7FF0094DEFF0084D6F7005ABDE7008CD6F7009CDEFF0073CE
      F7000000000000000000000000000000000000000000AD9484007B73C6002121
      B500BDA58C00A5A5A500FFFFFF00FFFFFF00CECECE00F7F7F700FFFFFF003131
      3100F7EFE700FFF7E7008484840000000000B5847B00FFEFDE00F7E7CE00F7E7
      C600F7DEBD0000009C00FFFFFF00FFFFFF0000009C00FFFFFF00FFFFFF00FFFF
      FF0000009C00FFFFFF00FFFFFF0000009C00B58C7B00FFEFDE00FFEFD600F7EF
      CE00F7E7CE00F7E7C600F7E7C600F7DEBD00F7DEBD00F7DEB500F7DEAD00F7D6
      AD00B58C7B00000000000000000000000000000000000000000021ADDE0029B5
      DE0094DEEF00B5EFFF00A5E7FF0063B5D600319CC6006BC6EF0094DEFF009CDE
      FF0031B5DE0000000000000000000000000000000000AD948C007B73CE002121
      B500BDAD9400A5A5A500FFFFFF00FFFFFF00B5B5B50084848400A5A5A5003131
      3100FFF7EF00FFF7EF008484840000000000B58C7B00FFF7E700DE9C3900F7E7
      CE00DE9C390000009C00FFFFFF0000009C0000009C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000009C00FFFFFF0000009C00BD8C7B00FFEFDE00DE9C3900DE9C
      3900DE9C3900DE9C3900DE9C3900DE9C3900DE9C3900DE9C3900DE9C3900F7DE
      B500B58C7B00000000000000000000000000000000000000000029B5DE0039BD
      E700B5E7F700CEFFFF00B5F7FF0084CEDE00297BA5006BBDE70094DEFF0094DE
      FF0031B5DE0000000000000000000000000000000000948C8400737BCE002121
      B500BDADA500A5A5A500FFFFFF00FFFFFF009C9C9C00313131007B7B7B00CECE
      CE00FFFFFF00FFF7EF008484840000000000BD8C8400FFFFEF00FFEFDE00FFEF
      D600F7E7CE0000009C00FFFFFF00FFFFFF0000009C00FFFFFF0000009C000000
      9C0000009C00FFFFFF00FFFFFF0000009C00BD8C7B00FFF7E700FFF7DE00FFEF
      DE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00000000000000000039BDE7004AC6
      EF00C6EFF700EFFFFF00CEF7FF00B5EFF70063ADBD008CCEEF009CDEFF0094DE
      FF0031B5DE00000000000000000000000000000000008C8C8C007B7BD6002121
      B500BDB5AD00A5A5A500FFFFFF00FFFFFF00BDBDBD0031313100313131003131
      3100FFFFFF00FFFFF7008484840000000000C6948400FFFFF700DE9C3900DE9C
      3900DE9C390000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000009C00C6947B00FFF7EF00DE9C3900DE9C
      3900009CCE00C6FFFF00ADFFFF00A5FFFF009CFFFF009CFFFF009CFFFF009CF7
      FF009CF7FF009CF7FF009CF7FF00009CCE00000000000000000029B5DE0042C6
      E7005AC6DE006BCEE70063CEE70063C6E7006BCEE70084DEEF009CE7FF00A5E7
      FF0031B5DE00000000000000000000000000000000008C8C8C007B7BDE002121
      B500B5B5BD00A5A5A500FFFFFF00EFEFEF00E7E7E700BDBDBD00A5A5A500DEDE
      E700FFFFFF00FFFFFF008484840000000000C69C8400FFFFFF00FFF7F700FFF7
      E700FFEFDE0000009C0000009C0000009C0000009C0000009C0000009C000000
      9C0000009C0000009C0000009C0000009C00C6947B00FFF7EF00FFF7EF00FFF7
      E700009CCE00CEFFFF00BDFFFF00ADFFFF0094EFEF009CFFFF009CFFFF009CFF
      FF009CF7FF009CF7FF009CF7FF00009CCE00000000000000000029B5DE005ACE
      E70042BDD60042BDDE0042C6DE0031B5DE004AC6E7006BCEEF009CE7FF0084D6
      F70021ADD600000000000000000000000000000000008C8C94007B84DE002121
      B500B5B5BD00A5A5A500FFFFFF00A5A5A500BDBDBD009C9CA500C6C6C600C6C6
      C600E7E7E700FFFFFF008484840000000000CE9C8400FFFFFF00FFFFFF00FFF7
      F700FFF7E700FFEFDE00FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEB500B58C
      7B0000000000000000000000000000000000CE9C7B00FFFFF700DE9C3900DE9C
      3900009CCE00DEFFFF00C6FFFF009CE7DE0084CECE009CFFFF009CFFFF009CFF
      FF009CF7FF009CF7FF009CF7FF00009CCE00000000000000000029B5D6005ACE
      DE00089CC60039B5D6008CF7FF0052D6EF0021B5DE00009CCE0021ADD60052C6
      E70018A5D600000000000000000000000000000000008C8C94007B84DE002121
      B500B5B5BD00A5A5A500FFFFFF00BDBDBD00B5B5B500ADADAD00ADADAD00BDBD
      BD00E7E7E700FFFFFF008484840000000000D6A58C00FFFFFF00DE9C3900DE9C
      3900DE9C3900DE9C3900DE9C3900FFEFD600DE9C3900DE9C3900F7DEB500B58C
      7B0000000000000000000000000000000000CE9C8400FFFFF700FFFFF700FFF7
      EF00009CCE00E7FFFF00A5C6C6009CCECE00A5F7F7009CFFFF009CFFFF009CFF
      FF009CFFFF009CF7FF009CF7FF00009CCE000000000000000000000000000894
      C6000094BD0029ADCE0084F7FF007BEFFF0042C6DE000894C600109CC60018AD
      D6000000000000000000000000000000000000000000949494007B84E7002121
      B500B5B5B500A5A5A500FFFFFF007B7B7B00E7E7E700FFFFFF00EFEFEF00BDBD
      BD00DEDEDE00FFFFFF008484840000000000D6A58C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFF7E700FFEFDE00FFEFD600F7E7CE00F7E7BD00B58C
      7B0000000000000000000000000000000000D69C8400FFFFFF00DE9C3900DE9C
      3900009CCE00EFFFFF005A6363007B9C9C00BDFFFF00A5FFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CF7FF00009CCE000000000000000000000000000000
      0000089CC600189CC6000000000039BDE70021A5CE000894C6000894C6000000
      0000000000000000000000000000000000000000000084848C00636BD6001821
      BD006B7394009C9CAD00BDBDBD007B7B73008C8C8C00EFEFE700E7E7E7006363
      630094949400FFFFFF008484840000000000DEAD8C00FFFFFF00DE9C3900DE9C
      3900DE9C3900FFFFFF00DE9C3900DE9C3900DE9C3900DE9C3900FFE7CE00B58C
      7B0000000000000000000000000000000000D6A58400FFFFFF00FFFFFF00FFFF
      F700009CCE00F7FFFF00C6D6D60008108C0000089C00B5FFFF00A5FFFF009CFF
      FF009CFFFF009CFFFF009CF7FF00009CCE000000000000000000000000000000
      00004AC6E700299CC6000000000000000000000000000894BD00088CB5000000
      0000000000000000000000000000000000000000000000000000424263002931
      7B00313184003942940039399400424294004242630052529C006B6B9400736B
      8C005A5A6300948C8C006363630000000000DEAD8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7E700FFEFD600B58C
      7B0000000000000000000000000000000000DEA58400FFFFFF00FFFFFF00FFFF
      FF00009CCE00009CCE00009CCE001021B5003152DE0000000000009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE000000000000000000000000000000
      000039A5C60073DEEF0039ADCE0000000000108CB500089CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0000000000393963004A4A4A0031316300000000003131
      840039396300101073000000000000000000DEAD8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFF7DE00B58C
      7B0000000000000000000000000000000000DEA58400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF7005A5ABD003939AD00FFF7E700FFF7
      E700B58C7B000000000000000000000000000000000000000000000000000000
      0000000000004AB5CE007BE7EF006BD6E7004ABDE700189CC600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A
      4A0000000000000000000000000000000000DEA58400DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B58C
      7B0000000000000000000000000000000000DEA58400DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA5
      8400DEA584000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C87FF800FFFFFFFF8007F8000007E07F
      800100000007C01F800100000007C00F800100000007C007800100000007C007
      800100000000C007800100000000C007800100000000C0078001000F0000C007
      8001000F0000E00F8001000F0000F21F8001000F0000F39FC001000F0000F13F
      FA23000F0007F83FFCCF000F0007FFFF00000000000000000000000000000000
      000000000000}
  end
  object cxLocalizer1: TcxLocalizer
    Left = 472
    Top = 88
  end
  object qryMapa: TADOQuery
    Connection = bdDados
    Parameters = <>
    Left = 632
    Top = 288
  end
  object ImageList2: TImageList
    Left = 388
    Top = 144
    Bitmap = {
      494C010105007C00A80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF0000000000000000000000000000000000000000006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF0000000000000000006B6BFF006B6BFF006B6BFF00000000000000
      00006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF0000000000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF0000000000000000006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF0000000000000000006B6BFF006B6BFF0000000000000000000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF00000000000000000000000000000000006B6BFF000000
      0000000000006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF006B6B
      FF006B6BFF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001810B50000000000000000000000
      0000000000000000000000000000000000000000000000FF0000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000FF0000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000000000000000000000000000000000187B
      1800187B1800187B1800187B1800187B1800187B1800187B1800187B1800187B
      1800187B1800187B180000000000000000000000000000000000000000000000
      00000000000000000000000000007B4AAD000029F7007B4AAD00000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000007B6B
      840000D6000000D6000000D6000000D6000000D6000000D6000000D6000000D6
      000000CE00007B6B840000000000000000000000000000000000000000000000
      00000000000000000000000000001810B5000029F7001810B500000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00001084100000D6000000D6000000D6000000D6000000D6000000D6000000D6
      0000187B18000000000000000000000000000000000000000000000000000000
      000000000000000000007B4AAD000029F7000029F7000029F7007B4AAD000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00005A845A0000D6000000D6000000D6000000D6000000D6000000D6000000CE
      00007B6B84000000000000000000000000000000000000000000000000000000
      000000000000000000001810B5000029F7000029F7000029F7001810B5000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000001084100000D6000000D6000000D6000000D6000000D60000187B
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000007B4AAD000029F7000029F7000029F7000029F7000029F7007B4A
      AD00000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF0000000000000000000000FF000000FF000000FF0000000000000000
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000005A845A0000D6000000D6000000D6000000D6000000CE00007B6B
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000001810B5000029F7000029F7000029F7000029F7000029F7001810
      B500000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF0000000000000000000000FF000000FF0000000000000000000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000001084100000D6000000D6000000D60000187B18000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B4AAD000029F7000029F7000029F7000029F7000029F7000029F7000029
      F7007B4AAD000000000000000000000000000000000000FF000000FF000000FF
      000000FF0000000000000000000000FF000000FF0000000000000000000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000005A845A0000D6000000D6000000CE00007B6B84000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001810B5000029F7000029F7000029F7000029F7000029F7000029F7000029
      F7001810B5000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF00000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000001084100000D60000187B1800000000000000
      0000000000000000000000000000000000000000000000000000000000001810
      B5000029F7000029F7000029F7000029F7000029F7000029F7000029F7000029
      F7000029F7001810B50000000000000000000000000000FF000000FF000000FF
      000000FF000000FF00000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000005A845A0000CE00007B6B8400000000000000
      0000000000000000000000000000000000000000000000000000000000001810
      B5001810B5001810B5001810B5001810B5001810B5001810B5001810B5001810
      B5001810B5001810B50000000000000000000000000000FF000000FF000000FF
      000000FF000000FF00000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000187B180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFF7F00000000E003FE3F00000000E003FE3F00000000F007FC1F00000000
      F007FC1F00000000F80FF80F00000000F80FF80F00000000FC1FF00700000000
      FC1FF00700000000FE3FE00300000000FE3FE00300000000FF7FFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'Black'
    UseSkins = False
    Left = 488
    Top = 32
  end
  object tblGeoAnalise: TADOTable
    Connection = bdAnalyzer
    CursorLocation = clUseServer
    TableName = 'GEO_ANALISES'
    Left = 696
    Top = 88
    object tblGeoAnaliseID_GEO: TWideStringField
      FieldName = 'ID_GEO'
      Size = 50
    end
    object tblGeoAnaliseDESCRICAO: TWideMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftWideMemo
    end
    object tblGeoAnaliseARQUIVO: TBlobField
      FieldName = 'ARQUIVO'
    end
    object tblGeoAnalisePODE_VISUALIZAR: TWideMemoField
      FieldName = 'PODE_VISUALIZAR'
      BlobType = ftWideMemo
    end
    object tblGeoAnalisePODE_ALTERAR: TWideMemoField
      FieldName = 'PODE_ALTERAR'
      BlobType = ftWideMemo
    end
    object tblGeoAnalisePODE_APAGAR: TWideMemoField
      FieldName = 'PODE_APAGAR'
      BlobType = ftWideMemo
    end
    object tblGeoAnaliseDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
  end
  object bdAnalyzer: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=AnalyzerSQL;Data Source=DESKS' +
      'IM;Initial File Name="";Server SPN="";'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 696
    Top = 40
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 456
    Top = 360
  end
end

object frmInformacoes: TfrmInformacoes
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es sobre o GeoAnalises'
  ClientHeight = 545
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Nome'
    Transparent = True
  end
  object pgcPrincipal: TcxPageControl
    Left = 6
    Top = 48
    Width = 520
    Height = 461
    TabOrder = 2
    Properties.ActivePage = tabDescricao
    Properties.CustomButtons.Buttons = <>
    OnChange = pgcPrincipalChange
    ClientRectBottom = 459
    ClientRectLeft = 2
    ClientRectRight = 518
    ClientRectTop = 22
    object tabDescricao: TcxTabSheet
      Caption = 'Descri'#231#227'o'
      object mnoDescricao: TcxDBMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alClient
        DataBinding.DataField = 'descricao'
        DataBinding.DataSource = DataSource1
        Properties.ScrollBars = ssBoth
        TabOrder = 0
        Height = 431
        Width = 510
      end
    end
    object tabDadosBasicos: TcxTabSheet
      Caption = 'Informa'#231#245'es B'#225'sicas'
      ImageIndex = 1
      object lbl2: TcxLabel
        Left = 2
        Top = 5
        Caption = 'Tabela'
        Transparent = True
      end
      object lbl3: TcxLabel
        Left = 2
        Top = 47
        Caption = 'Campo Refer'#234'ncia'
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 2
        Top = 89
        Caption = 'Altura'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 90
        Top = 89
        Caption = 'Largura'
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 2
        Top = 135
        Caption = 'M'#225'ximo de itens nos campos de pesquisa'
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 178
        Top = 89
        Caption = 'Tamanho do Mapa'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 218
        Top = 135
        Caption = 'N'#250'mero m'#225'ximo de itens na caixa de informa'#231#245'es do mapa'
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 2
        Top = 264
        Caption = 'Endere'#231'o '#205'cone A'
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 2
        Top = 304
        Caption = 'Endere'#231'o '#205'cone B'
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 2
        Top = 344
        Caption = 'Endere'#231'o '#205'cone C'
        Transparent = True
      end
      object edtTabela: TcxDBTextEdit
        Left = 2
        Top = 20
        DataBinding.DataField = 'tabela'
        DataBinding.DataSource = DataSource1
        TabOrder = 1
        Width = 510
      end
      object edtCampoRef: TcxDBTextEdit
        Left = 2
        Top = 62
        DataBinding.DataField = 'campo_ref'
        DataBinding.DataSource = DataSource1
        TabOrder = 3
        Width = 510
      end
      object edtAltura: TcxDBCurrencyEdit
        Left = 2
        Top = 105
        DataBinding.DataField = 'altura'
        DataBinding.DataSource = DataSource1
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.MinValue = 1.000000000000000000
        Properties.Nullable = False
        TabOrder = 6
        Width = 63
      end
      object edtLargura: TcxDBCurrencyEdit
        Left = 90
        Top = 105
        DataBinding.DataField = 'largura'
        DataBinding.DataSource = DataSource1
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.MinValue = 1.000000000000000000
        Properties.Nullable = False
        TabOrder = 8
        Width = 63
      end
      object edtMaximoItens: TcxDBCurrencyEdit
        Left = 2
        Top = 151
        DataBinding.DataField = 'maximo_itens'
        DataBinding.DataSource = DataSource1
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.MinValue = 1.000000000000000000
        Properties.Nullable = False
        TabOrder = 11
        Width = 63
      end
      object edtTamanho: TcxDBCurrencyEdit
        Left = 178
        Top = 105
        DataBinding.DataField = 'tamanho'
        DataBinding.DataSource = DataSource1
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.MaxValue = 9.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Properties.Nullable = False
        TabOrder = 9
        Width = 63
      end
      object edtItensMark: TcxDBCurrencyEdit
        Left = 218
        Top = 151
        DataBinding.DataField = 'itens_mark'
        DataBinding.DataSource = DataSource1
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Properties.MaxValue = 9.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Properties.Nullable = False
        TabOrder = 13
        Width = 63
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 2
        Top = 179
        Caption = 'Vis'#227'o Inicial do Mapa'
        DataBinding.DataField = 'visao'
        DataBinding.DataSource = DataSource1
        Properties.Columns = 4
        Properties.DefaultCaption = 'Mapa'
        Properties.DefaultValue = 'Mapa'
        Properties.Items = <
          item
            Caption = 'Mapa'
            Value = 'Mapa'
          end
          item
            Caption = 'Sat'#233'lite'
            Value = 'Sat'#233'lite'
          end
          item
            Caption = 'H'#237'brido'
            Value = 'H'#237'brido'
          end
          item
            Caption = 'Terreno'
            Value = 'Terreno'
          end>
        TabOrder = 21
        Height = 53
        Width = 510
      end
      object chkCoord: TcxDBCheckBox
        Left = 2
        Top = 239
        Caption = 'Visualizar Coordenadas Geogr'#225'ficas durante a navega'#231#227'o'
        DataBinding.DataField = 'visualiza_coord'
        DataBinding.DataSource = DataSource1
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 14
        Transparent = True
        Width = 313
      end
      object edtA: TcxDBTextEdit
        Left = 2
        Top = 279
        DataBinding.DataField = 'endereco_a'
        DataBinding.DataSource = DataSource1
        Properties.MaxLength = 100
        TabOrder = 16
        Width = 510
      end
      object edtB: TcxDBTextEdit
        Left = 2
        Top = 319
        DataBinding.DataField = 'endereco_b'
        DataBinding.DataSource = DataSource1
        Properties.MaxLength = 100
        TabOrder = 18
        Width = 510
      end
      object edtC: TcxDBTextEdit
        Left = 2
        Top = 359
        DataBinding.DataField = 'endereco_c'
        DataBinding.DataSource = DataSource1
        Properties.MaxLength = 100
        TabOrder = 20
        Width = 510
      end
    end
    object tabDimensao: TcxTabSheet
      Caption = 'Dimens'#245'es'
      ImageIndex = 2
      object chkDimensoes: TcxCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 510
        Height = 407
        Align = alTop
        Items = <>
        Sorted = True
        TabOrder = 0
      end
      object cxLabel9: TcxLabel
        Left = 3
        Top = 415
        Caption = 'OBS.: Somente s'#227'o permitidos selecionar no m'#225'ximo 50 campos'
        Transparent = True
      end
    end
    object tabSumarios: TcxTabSheet
      Caption = 'Sum'#225'rios'
      ImageIndex = 3
      object chkSumarios: TcxCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 510
        Height = 408
        Align = alTop
        Items = <>
        Sorted = True
        TabOrder = 0
      end
      object cxLabel10: TcxLabel
        Left = 3
        Top = 415
        Caption = 'OBS.: Somente s'#227'o permitidos selecionar no m'#225'ximo 50 campos'
        Transparent = True
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Base de Dados'
      ImageIndex = 4
      object cxLabel12: TcxLabel
        Left = 2
        Top = 5
        Caption = 'SGBD'
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 2
        Top = 184
        Caption = 'Formato da Data para os filtros (Ex. DD/MM/YYYY, MM/DD/YYYY)'
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 3
        Top = 202
        DataBinding.DataField = 'campo_aux_2'
        DataBinding.DataSource = DataSource1
        TabOrder = 2
        Width = 154
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 3
        Top = 229
        Caption = 'Suporta BETWEEN nos filtros personalizados'
        DataBinding.DataField = 'campo_aux_3'
        DataBinding.DataSource = DataSource1
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 3
        Transparent = True
        Width = 238
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 3
        Top = 253
        Caption = 'Suporta IN nos filtros personalizados'
        DataBinding.DataField = 'campo_aux_4'
        DataBinding.DataSource = DataSource1
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 4
        Transparent = True
        Width = 238
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 3
        Top = 277
        Caption = 'Suporta LIKE nos filtros personalizados'
        DataBinding.DataField = 'campo_aux_5'
        DataBinding.DataSource = DataSource1
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 5
        Transparent = True
        Width = 238
      end
      object cxLabel13: TcxLabel
        Left = 3
        Top = 48
        Caption = 'String de Conex'#227'o'
        Transparent = True
      end
      object cxDBMemo2: TcxDBMemo
        Left = 3
        Top = 68
        DataBinding.DataField = 'connection_string'
        DataBinding.DataSource = DataSource1
        Enabled = False
        Properties.ScrollBars = ssVertical
        TabOrder = 7
        Height = 77
        Width = 510
      end
      object btnConectar: TcxButton
        Left = 3
        Top = 151
        Width = 510
        Height = 25
        Caption = 'Clique aqui para montar a string de conex'#227'o'
        TabOrder = 8
        OnClick = btnConectarClick
      end
      object cbxSGBD: TcxComboBox
        Left = 3
        Top = 21
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Microsoft Access'
          'Microsoft SQL Server'
          'MySQL'
          'Postgres'
          'Firebird ou Interbase'
          'Oracle')
        TabOrder = 9
        Text = 'Microsoft Access'
        Width = 510
      end
    end
  end
  object edtNome: TcxDBTextEdit
    Left = 8
    Top = 24
    DataBinding.DataField = 'id_geo'
    DataBinding.DataSource = DataSource1
    Enabled = False
    TabOrder = 1
    Width = 521
  end
  object cxButton1: TcxButton
    Left = 370
    Top = 515
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 451
    Top = 515
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = frmPrincipal.cdsGeoAnalises
    Left = 440
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = frmPrincipal.bdDados
    Parameters = <>
    Left = 368
    Top = 16
  end
end

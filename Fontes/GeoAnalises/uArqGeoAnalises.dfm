object frmArqGeoAnalises: TfrmArqGeoAnalises
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Criar arquivo de GeoAnalises'
  ClientHeight = 408
  ClientWidth = 369
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
  object cxButton1: TcxButton
    Left = 202
    Top = 377
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 283
    Top = 377
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 8
    Top = 27
    DataBinding.DataField = 'id_geo'
    DataBinding.DataSource = DataSource1
    TabOrder = 2
    Width = 350
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 9
    Caption = 'Nome:'
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 54
    Caption = 'Descri'#231#227'o:'
    Transparent = True
  end
  object cxDBMemo1: TcxDBMemo
    Left = 8
    Top = 73
    DataBinding.DataField = 'descricao'
    DataBinding.DataSource = DataSource1
    Properties.ScrollBars = ssVertical
    TabOrder = 5
    Height = 112
    Width = 350
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 200
    Caption = 'String de Conex'#227'o:'
    Transparent = True
  end
  object cxDBMemo2: TcxDBMemo
    Left = 8
    Top = 220
    DataBinding.DataField = 'connection_string'
    DataBinding.DataSource = DataSource1
    Enabled = False
    Properties.ScrollBars = ssVertical
    TabOrder = 7
    Height = 77
    Width = 350
  end
  object btnConectar: TcxButton
    Left = 8
    Top = 303
    Width = 350
    Height = 25
    Caption = 'Clique aqui para montar a string de conex'#227'o'
    TabOrder = 8
    OnClick = btnConectarClick
  end
  object cbxSGBD: TcxComboBox
    Left = 44
    Top = 334
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
    Width = 314
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 335
    Caption = 'SGBD:'
    Transparent = True
  end
  object DataSource1: TDataSource
    DataSet = frmPrincipal.cdsGeoAnalises
    Left = 264
    Top = 256
  end
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Left = 248
    Top = 112
  end
  object qryAtualiza: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 184
    Top = 112
  end
end

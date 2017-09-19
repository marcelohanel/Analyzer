object frmInstrucao: TfrmInstrucao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Instru'#231#227'o'
  ClientHeight = 660
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfirmar: TcxButton
    Left = 203
    Top = 627
    Width = 115
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 15
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TcxButton
    Left = 324
    Top = 627
    Width = 115
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 17
    OnClick = btnCancelarClick
  end
  object cxLabel1: TcxLabel
    Left = 40
    Top = 16
    Caption = 'Nome:'
    Transparent = True
  end
  object edtNome: TcxTextEdit
    Left = 78
    Top = 15
    ParentFont = False
    Properties.MaxLength = 50
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Text = 'edtNome'
    Width = 360
  end
  object cxLabel2: TcxLabel
    Left = 35
    Top = 44
    Caption = 'Ordem:'
    Transparent = True
  end
  object edtOrdem: TcxCurrencyEdit
    Left = 78
    Top = 43
    EditValue = 10.000000000000000000
    ParentFont = False
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Properties.MaxLength = 4
    Properties.MaxValue = 9999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.Nullable = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 40
  end
  object cxLabel3: TcxLabel
    Left = 47
    Top = 72
    Caption = 'Tipo:'
    Transparent = True
  end
  object cbxTipo: TcxComboBox
    Left = 78
    Top = 71
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'Instru'#231#227'o SQL Banco de Dados'
      'Linha de Comando')
    Properties.OnChange = cbxTipoPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Text = 'Instru'#231#227'o SQL Banco de Dados'
    Width = 360
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 99
    Caption = 'Conex'#227'o:'
    Transparent = True
  end
  object mmoConexao: TcxMemo
    Left = 78
    Top = 99
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 5
    Height = 69
    Width = 360
  end
  object cxLabel5: TcxLabel
    Left = 25
    Top = 207
    Caption = 'Inst.SQL:'
    Transparent = True
  end
  object mmoSQL: TcxMemo
    Left = 78
    Top = 207
    Enabled = False
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
    Height = 170
    Width = 360
  end
  object cxLabel6: TcxLabel
    Left = 22
    Top = 383
    Caption = 'Comando:'
    Transparent = True
  end
  object mmoComando: TcxMemo
    Left = 78
    Top = 383
    Enabled = False
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 10
    Height = 98
    Width = 360
  end
  object btnConexao: TcxButton
    Left = 78
    Top = 174
    Width = 362
    Height = 27
    Caption = 'Assistente de Conex'#227'o'
    TabOrder = 6
    OnClick = btnConexaoClick
  end
  object chkAtiva: TcxCheckBox
    Left = 78
    Top = 591
    Caption = 'Ativa'
    State = cbsChecked
    TabOrder = 13
    Transparent = True
    Width = 121
  end
  object cxLabel7: TcxLabel
    Left = 12
    Top = 487
    Caption = 'Par'#226'metros:'
    Transparent = True
  end
  object mmoParametros: TcxMemo
    Left = 78
    Top = 487
    Enabled = False
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 12
    Height = 98
    Width = 360
  end
  object Connection: TADOConnection
    CursorLocation = clUseServer
    KeepConnection = False
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 391
    Top = 10
  end
end

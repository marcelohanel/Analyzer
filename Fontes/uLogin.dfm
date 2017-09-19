object frmLogin: TfrmLogin
  Left = 375
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 359
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    252
    359)
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 252
    Height = 359
    Align = alClient
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 357
    ClientRectLeft = 2
    ClientRectRight = 250
    ClientRectTop = 2
  end
  object cxImage1: TcxImage
    Left = 75
    Top = 18
    TabStop = False
    Properties.ReadOnly = True
    Properties.Stretch = True
    TabOrder = 1
    Height = 121
    Width = 105
  end
  object cxLabel1: TcxLabel
    Left = 37
    Top = 155
    Caption = 'Usu'#225'rio'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clWindowText
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edtUsuario: TcxComboBox
    Left = 37
    Top = 170
    Properties.OnEditValueChanged = edtUsuarioPropertiesEditValueChanged
    Properties.OnInitPopup = edtUsuarioPropertiesInitPopup
    TabOrder = 3
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 37
    Top = 192
    Caption = 'Senha'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clWindowText
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edtSenha: TcxTextEdit
    Left = 37
    Top = 207
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 5
    Width = 177
  end
  object chkLembrar: TcxCheckBox
    Left = 37
    Top = 235
    Caption = 'Lembrar meu usu'#225'rio'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clWindowText
    Style.TextStyle = []
    Style.IsFontAssigned = True
    TabOrder = 6
    Transparent = True
    Width = 126
  end
  object chkSenha: TcxCheckBox
    Left = 37
    Top = 258
    Caption = 'Lembrar minha senha'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clWindowText
    Style.TextStyle = []
    Style.IsFontAssigned = True
    TabOrder = 7
    Transparent = True
    Width = 152
  end
  object BitBtn1: TcxButton
    Left = 20
    Top = 318
    Width = 102
    Height = 28
    Hint = 'Confirmar'
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'Confirmar'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object BitBtn2: TcxButton
    Left = 128
    Top = 318
    Width = 102
    Height = 28
    Hint = 'Cancelar'
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = BitBtn2Click
  end
end

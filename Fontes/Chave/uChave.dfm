object frmChave: TfrmChave
  Left = 157
  Top = 23
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Chave Analzyer'
  ClientHeight = 534
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 339
    Top = 501
    Width = 91
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 432
    Height = 492
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 15
      Width = 160
      Height = 13
      Caption = 'Arquivo do C'#243'digo de Seguran'#231'a:'
    end
    object Label2: TLabel
      Left = 12
      Top = 57
      Width = 82
      Height = 13
      Caption = 'Nome do Usu'#225'rio'
    end
    object Label3: TLabel
      Left = 12
      Top = 99
      Width = 103
      Height = 13
      Caption = 'C'#243'digo de Seguran'#231'a'
    end
    object Label4: TLabel
      Left = 12
      Top = 142
      Width = 157
      Height = 13
      Caption = 'Vers'#227'o do C'#243'digo de Seguran'#231'a:'
    end
    object Label5: TLabel
      Left = 13
      Top = 393
      Width = 91
      Height = 13
      Caption = 'Chave de Ativa'#231#227'o'
    end
    object Label6: TLabel
      Left = 12
      Top = 285
      Width = 92
      Height = 13
      Caption = 'Senha Base Dados'
    end
    object Label7: TLabel
      Left = 240
      Top = 285
      Width = 67
      Height = 13
      Caption = 'Data Validade'
    end
    object Label8: TLabel
      Left = 13
      Top = 350
      Width = 96
      Height = 13
      Caption = 'N'#250'mero de Usu'#225'rios'
    end
    object Edit1: TEdit
      Left = 12
      Top = 31
      Width = 329
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 347
      Top = 31
      Width = 75
      Height = 21
      Caption = 'Importar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit2: TEdit
      Left = 12
      Top = 73
      Width = 329
      Height = 21
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 12
      Top = 115
      Width = 329
      Height = 21
      TabOrder = 3
    end
    object Edit4: TEdit
      Left = 12
      Top = 158
      Width = 329
      Height = 21
      TabOrder = 4
    end
    object Memo1: TMemo
      Left = 13
      Top = 409
      Width = 329
      Height = 72
      TabStop = False
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 24
    end
    object Button3: TButton
      Left = 347
      Top = 409
      Width = 75
      Height = 21
      Caption = 'Gerar'
      Enabled = False
      TabOrder = 23
      OnClick = Button3Click
    end
    object chkAnalises: TCheckBox
      Left = 12
      Top = 185
      Width = 97
      Height = 17
      Caption = 'An'#225'lises'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chkRelatorios: TCheckBox
      Left = 12
      Top = 204
      Width = 97
      Height = 17
      Caption = 'Relat'#243'rios'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object chkScored: TCheckBox
      Left = 133
      Top = 185
      Width = 85
      Height = 17
      Caption = 'Scored Cards'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object chkDynamics: TCheckBox
      Left = 133
      Top = 204
      Width = 85
      Height = 17
      Caption = 'Dynamics'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object edtSenha: TEdit
      Left = 12
      Top = 301
      Width = 225
      Height = 21
      TabOrder = 19
    end
    object chkABC: TCheckBox
      Left = 12
      Top = 223
      Width = 85
      Height = 17
      Caption = 'An'#225'lise ABC'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object chkCubo: TCheckBox
      Left = 133
      Top = 223
      Width = 85
      Height = 17
      Caption = 'Decision Cube'
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
    object chkFotografica: TCheckBox
      Left = 12
      Top = 242
      Width = 117
      Height = 17
      Caption = 'An'#225'lise Fotogr'#225'fica'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object chkFrequencia: TCheckBox
      Left = 235
      Top = 185
      Width = 117
      Height = 17
      Caption = 'An'#225'lise Freq'#252'encia'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object edtValidade: TEdit
      Left = 240
      Top = 301
      Width = 101
      Height = 21
      TabOrder = 20
    end
    object chkValidar: TCheckBox
      Left = 13
      Top = 327
      Width = 324
      Height = 17
      Caption = 'Validar informa'#231#245'es de hardware'
      Checked = True
      State = cbChecked
      TabOrder = 21
    end
    object chkScheduler: TCheckBox
      Left = 133
      Top = 242
      Width = 117
      Height = 17
      Caption = 'Scheduler'
      Checked = True
      State = cbChecked
      TabOrder = 15
    end
    object edtUsuario: TEdit
      Left = 13
      Top = 366
      Width = 101
      Height = 21
      TabOrder = 22
    end
    object chkSmart: TCheckBox
      Left = 235
      Top = 204
      Width = 117
      Height = 17
      Caption = 'SmartDocs'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object chkAccess: TCheckBox
      Left = 235
      Top = 223
      Width = 117
      Height = 17
      Caption = 'Access'
      Checked = True
      State = cbChecked
      TabOrder = 13
    end
    object chkReporting: TCheckBox
      Left = 235
      Top = 242
      Width = 117
      Height = 17
      Caption = 'Reporting Services'
      Checked = True
      State = cbChecked
      TabOrder = 16
    end
    object chkVisio: TCheckBox
      Left = 12
      Top = 261
      Width = 55
      Height = 17
      Caption = 'Visio'
      Checked = True
      State = cbChecked
      TabOrder = 17
    end
    object chkGeo: TCheckBox
      Left = 133
      Top = 261
      Width = 85
      Height = 17
      Caption = 'GeoAnalises'
      Checked = True
      State = cbChecked
      TabOrder = 18
    end
    object chkWebBI: TCheckBox
      Left = 235
      Top = 261
      Width = 85
      Height = 17
      Caption = 'WebBI'
      Checked = True
      State = cbChecked
      TabOrder = 25
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.sec'
    Filter = 'Arquivos de Seguran'#231'a|*.sec'
    Left = 384
    Top = 112
  end
  object cxLocalizer1: TcxLocalizer
    Left = 288
    Top = 112
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 264
    Top = 8
  end
end

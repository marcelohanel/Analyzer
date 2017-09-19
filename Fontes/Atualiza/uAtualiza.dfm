object frmAtualiza: TfrmAtualiza
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza'#231#227'o do Analyzer'
  ClientHeight = 121
  ClientWidth = 257
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
  object cxButton2: TcxButton
    Left = 174
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object cxArquivo: TcxProgressBar
    Left = 8
    Top = 61
    TabStop = False
    TabOrder = 1
    Transparent = True
    Width = 241
  end
  object cxGeral: TcxProgressBar
    Left = 8
    Top = 21
    TabStop = False
    TabOrder = 0
    Transparent = True
    Width = 241
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 4
    Caption = 'Progresso Geral'
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 45
    Caption = 'Progresso Individual'
    Transparent = True
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 88
    Width = 104
    Height = 25
    Caption = 'Iniciar Atualiza'#231#227'o'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'Black'
    UseSkins = False
    Left = 200
    Top = 8
  end
  object cxLocalizer1: TcxLocalizer
    Left = 144
    Top = 16
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 88
    Top = 16
  end
end

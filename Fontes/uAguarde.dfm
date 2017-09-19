object frmAguarde: TfrmAguarde
  Left = 185
  Top = 155
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Aguarde'
  ClientHeight = 89
  ClientWidth = 541
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 89
    Align = alClient
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 0
    object Label1: TcxLabel
      Left = 8
      Top = 8
      Caption = 'Aguarde'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -32
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label2: TcxLabel
      Left = 7
      Top = 52
      Caption = 'Mensagem'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxProgressBar1: TcxProgressBar
      Left = 7
      Top = 54
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = 54056
      Properties.PeakValue = 50.000000000000000000
      TabOrder = 2
      Visible = False
      Width = 523
    end
  end
end

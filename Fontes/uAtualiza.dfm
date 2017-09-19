object frmAtualiza: TfrmAtualiza
  Left = 159
  Top = 244
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Atualiza'#231#227'o'
  ClientHeight = 153
  ClientWidth = 652
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 153
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    object lblTarefa: TcxLabel
      Left = 7
      Top = 96
      Caption = 'Tarefa'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object lblMensagem: TcxLabel
      Left = 7
      Top = 9
      Caption = 'Mensagem'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -24
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label1: TcxLabel
      Left = 7
      Top = 49
      Caption = 'Progresso Geral'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object pbGeral: TcxProgressBar
      Left = 7
      Top = 68
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = 54056
      Properties.PeakSize = 1
      TabOrder = 3
      Width = 631
    end
    object pbTarefa: TcxProgressBar
      Left = 7
      Top = 115
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = 54056
      Properties.PeakSize = 1
      TabOrder = 4
      Width = 631
    end
  end
end

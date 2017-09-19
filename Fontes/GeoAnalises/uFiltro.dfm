object frmFiltro: TfrmFiltro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Filtro Personalizado'
  ClientHeight = 353
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfirmar: TButton
    Left = 264
    Top = 323
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 0
    OnClick = btnConfirmarClick
  end
  object Button1: TButton
    Left = 345
    Top = 323
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 422
    Height = 314
    ActivePage = cxTabSheet1
    Align = alTop
    TabOrder = 2
    ClientRectBottom = 312
    ClientRectLeft = 2
    ClientRectRight = 420
    ClientRectTop = 22
    object cxTabSheet2: TcxTabSheet
      Caption = 'Instru'#231#227'o SQL'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo1: TcxMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alClient
        Properties.ScrollBars = ssVertical
        TabOrder = 0
        Height = 284
        Width = 412
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Assistente de Filtro'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cbxFiltro1: TcxDBFilterControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 412
        Height = 253
        Align = alTop
        DataSet = qryFiltro
        Items = <>
        LookAndFeel.Kind = lfStandard
        TabOrder = 0
      end
      object cxButton1: TcxButton
        Left = 96
        Top = 262
        Width = 217
        Height = 25
        Caption = 'Clique aqui para atualizar a intru'#231#227'o SQL'
        TabOrder = 1
        OnClick = cxButton1Click
      end
    end
  end
  object qryFiltro: TADOQuery
    Connection = frmPrincipal.bdDados
    CursorLocation = clUseServer
    Parameters = <>
    Left = 136
    Top = 116
  end
end

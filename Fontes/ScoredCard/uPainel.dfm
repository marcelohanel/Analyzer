object frmPainel: TfrmPainel
  Left = 142
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Painel'
  ClientHeight = 517
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 773
    Height = 476
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object mValor: TAb270Meter
      Left = 243
      Top = 49
      Width = 300
      Height = 282
      Digit = 1002
      LimitUpper = 651.000000000000000000
      LimitLower = 0.000099999997473788
      SectorSettings.Sector1Color = clRed
      SectorSettings.Sector1To = 538
      SectorSettings.Sector2Color = clYellow
      SectorSettings.Sector2From = 539
      SectorSettings.Sector2To = 700
      SectorSettings.Sector3Color = clGreen
      SectorSettings.Sector3From = 701
      SectorSettings.Offset = 0
      SectorSettings.WidthOffset = 0
      SignalSettings.DigitalTo = 0
      SignalSettings.Name1 = 'Valor'
      SignalSettings.Name2 = 'SignalName2'
      SignalSettings.ValueFormat = '###,##0'
      SignalSettings.ValueTo = 650.000000000000000000
      SignalSettings.ValueUnit = 'Valor'
      MinMax.MinVisible = False
      MinMax.MaxVisible = False
      Value = 651.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      FontUnit.Charset = DEFAULT_CHARSET
      FontUnit.Color = clBlack
      FontUnit.Height = -13
      FontUnit.Name = 'System'
      FontUnit.Style = []
      BevelInner.Style = bsLowered
      BevelInner.BevelLine = blInner
      BevelInner.SurfaceGrad.Visible = False
      BevelInner.SurfaceGrad.Style = gsHorizontal1
      BevelOuter.Style = bsRaised
      BevelOuter.BevelLine = blOuter
      BevelOuter.SurfaceGrad.Visible = False
      BevelOuter.SurfaceGrad.Style = gsHorizontal1
      Options = [opName1, opOverflow, opLimit, opSector]
      ScaleSettings.Color = clBlack
      ScaleSettings.PointerColor = clLime
      ScaleSettings.DrawLine = False
      ScaleSettings.Font.Charset = DEFAULT_CHARSET
      ScaleSettings.Font.Color = clWindowText
      ScaleSettings.Font.Height = -13
      ScaleSettings.Font.Name = 'Arial'
      ScaleSettings.Font.Style = []
      ScaleSettings.PosLeftTop = False
      ScaleSettings.Steps = 6
      ScaleSettings.SubSteps = 3
      ScaleSettings.ValueFormat = '###,##0'
      ScaleSettings.ValueFormatLog = '0e-0'
    end
    object mPercMinimo: TAb180Meter
      Left = 560
      Top = 199
      Width = 196
      Height = 153
      Digit = 200
      LimitUpper = 101.000000000000000000
      LimitLower = -1.000000000000000000
      SectorSettings.Sector1Color = clRed
      SectorSettings.Sector2Color = clYellow
      SectorSettings.Sector3Color = clGreen
      SectorSettings.Offset = 0
      SectorSettings.WidthOffset = 0
      SignalSettings.Name1 = '% Valor M'#237'nimo'
      SignalSettings.Name2 = 'SignalName2'
      SignalSettings.ValueFormat = '##0'
      SignalSettings.ValueTo = 100.000000000000000000
      SignalSettings.ValueUnit = '% Vlr M'#237'nimo'
      MinMax.UseSectorCol = False
      MinMax.MinVisible = False
      MinMax.MaxVisible = False
      Value = 20.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      FontUnit.Charset = DEFAULT_CHARSET
      FontUnit.Color = clBlack
      FontUnit.Height = -13
      FontUnit.Name = 'System'
      FontUnit.Style = []
      BevelInner.Style = bsLowered
      BevelInner.BevelLine = blInner
      BevelInner.SurfaceGrad.Visible = False
      BevelInner.SurfaceGrad.Style = gsHorizontal1
      BevelOuter.Style = bsRaised
      BevelOuter.BevelLine = blOuter
      BevelOuter.SurfaceGrad.Visible = False
      BevelOuter.SurfaceGrad.Style = gsHorizontal1
      Options = [opName1, opOverflow, opLimit, opSector]
      ScaleSettings.Color = clBlack
      ScaleSettings.PointerColor = clLime
      ScaleSettings.DrawLine = False
      ScaleSettings.Font.Charset = DEFAULT_CHARSET
      ScaleSettings.Font.Color = clWindowText
      ScaleSettings.Font.Height = -16
      ScaleSettings.Font.Name = 'Arial'
      ScaleSettings.Font.Style = []
      ScaleSettings.PosLeftTop = False
      ScaleSettings.Steps = 5
      ScaleSettings.SubSteps = 2
      ScaleSettings.ValueFormat = '##0'
      ScaleSettings.ValueFormatLog = '0e-0'
    end
    object mPercMaximo: TAb180Meter
      Left = 560
      Top = 31
      Width = 196
      Height = 153
      Digit = 200
      LimitUpper = 101.000000000000000000
      LimitLower = -1.000000000000000000
      SectorSettings.Sector1Color = clRed
      SectorSettings.Sector2Color = clYellow
      SectorSettings.Sector3Color = clGreen
      SectorSettings.Offset = 0
      SectorSettings.WidthOffset = 0
      SignalSettings.Name1 = '% Valor M'#225'ximo'
      SignalSettings.Name2 = 'SignalName2'
      SignalSettings.ValueFormat = '##0'
      SignalSettings.ValueTo = 100.000000000000000000
      SignalSettings.ValueUnit = '% Vlr M'#237'nimo'
      MinMax.UseSectorCol = False
      MinMax.MinVisible = False
      MinMax.MaxVisible = False
      Value = 20.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      FontUnit.Charset = DEFAULT_CHARSET
      FontUnit.Color = clBlack
      FontUnit.Height = -13
      FontUnit.Name = 'System'
      FontUnit.Style = []
      BevelInner.Style = bsLowered
      BevelInner.BevelLine = blInner
      BevelInner.SurfaceGrad.Visible = False
      BevelInner.SurfaceGrad.Style = gsHorizontal1
      BevelOuter.Style = bsRaised
      BevelOuter.BevelLine = blOuter
      BevelOuter.SurfaceGrad.Visible = False
      BevelOuter.SurfaceGrad.Style = gsHorizontal1
      Options = [opName1, opOverflow, opLimit, opSector]
      ScaleSettings.Color = clBlack
      ScaleSettings.PointerColor = clLime
      ScaleSettings.DrawLine = False
      ScaleSettings.Font.Charset = DEFAULT_CHARSET
      ScaleSettings.Font.Color = clWindowText
      ScaleSettings.Font.Height = -16
      ScaleSettings.Font.Name = 'Arial'
      ScaleSettings.Font.Style = []
      ScaleSettings.PosLeftTop = False
      ScaleSettings.Steps = 5
      ScaleSettings.SubSteps = 2
      ScaleSettings.ValueFormat = '##0'
      ScaleSettings.ValueFormatLog = '0e-0'
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 8
      Caption = 'T'#237'tulo:'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 14
      Top = 32
      Caption = 'Valor:'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 14
      Top = 57
      Caption = 'Situa'#231#227'o:'
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 14
      Top = 81
      Caption = 'Situa'#231#227'o Anterior:'
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 14
      Top = 106
      Caption = 'Situa'#231#227'o Original:'
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 14
      Top = 130
      Caption = 'Valor M'#237'nimo:'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 14
      Top = 155
      Caption = 'Valor M'#225'ximo:'
      Transparent = True
    end
    object cxLabel8: TcxLabel
      Left = 14
      Top = 178
      Caption = '% M'#237'nimo:'
      Transparent = True
    end
    object cxLabel9: TcxLabel
      Left = 14
      Top = 202
      Caption = '% M'#225'ximo:'
      Transparent = True
    end
    object cxLabel10: TcxLabel
      Left = 14
      Top = 226
      Caption = 'Falta M'#237'nimo:'
      Transparent = True
    end
    object cxLabel11: TcxLabel
      Left = 14
      Top = 250
      Caption = 'Falta M'#225'ximo:'
      Transparent = True
    end
    object cxLabel12: TcxLabel
      Left = 14
      Top = 275
      Caption = '% Falta M'#237'nimo:'
      Transparent = True
    end
    object cxLabel13: TcxLabel
      Left = 14
      Top = 299
      Caption = '% Falta M'#225'ximo:'
      Transparent = True
    end
    object cxTextEdit1: TcxTextEdit
      Left = 101
      Top = 6
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 1
      Width = 348
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 101
      Top = 31
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem1
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 3
      Width = 121
    end
    object cxImageComboBox1: TcxImageComboBox
      Left = 101
      Top = 55
      RepositoryItem = frmMostraScored.cxEditRepository1ImageComboBoxItem1
      Properties.Items = <>
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = False
      Style.PopupBorderStyle = epbsDefault
      TabOrder = 5
      Width = 121
    end
    object cxImageComboBox2: TcxImageComboBox
      Left = 101
      Top = 79
      RepositoryItem = frmMostraScored.cxEditRepository1ImageComboBoxItem2
      Properties.Items = <>
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 7
      Width = 121
    end
    object cxImageComboBox3: TcxImageComboBox
      Left = 101
      Top = 103
      RepositoryItem = frmMostraScored.cxEditRepository1ImageComboBoxItem2
      Properties.Items = <>
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 8
      Width = 121
    end
    object cxCurrencyEdit2: TcxCurrencyEdit
      Left = 101
      Top = 127
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem1
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 10
      Width = 121
    end
    object cxCurrencyEdit3: TcxCurrencyEdit
      Left = 101
      Top = 152
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem1
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 12
      Width = 121
    end
    object cxCurrencyEdit4: TcxCurrencyEdit
      Left = 101
      Top = 200
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 17
      Width = 121
    end
    object cxCurrencyEdit5: TcxCurrencyEdit
      Left = 101
      Top = 176
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 15
      Width = 121
    end
    object cxCurrencyEdit6: TcxCurrencyEdit
      Left = 101
      Top = 224
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem1
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 19
      Width = 121
    end
    object cxCurrencyEdit7: TcxCurrencyEdit
      Left = 101
      Top = 248
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem1
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 21
      Width = 121
    end
    object cxCurrencyEdit8: TcxCurrencyEdit
      Left = 101
      Top = 272
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 22
      Width = 121
    end
    object cxCurrencyEdit9: TcxCurrencyEdit
      Left = 101
      Top = 297
      RepositoryItem = frmMostraScored.cxEditRepository1CurrencyItem2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 25
      Width = 121
    end
    object Chart1: TChart
      Left = 0
      Top = 354
      Width = 773
      Height = 122
      BackWall.Gradient.EndColor = 11118482
      BottomWall.Gradient.EndColor = 16580349
      BottomWall.Gradient.StartColor = 3114493
      LeftWall.Gradient.EndColor = 2413052
      LeftWall.Gradient.StartColor = 900220
      Legend.Alignment = laBottom
      Legend.CheckBoxes = True
      Legend.DividingLines.Color = clSilver
      Legend.Font.Color = 6553600
      Legend.Gradient.Direction = gdTopBottom
      Legend.Gradient.EndColor = 13556735
      Legend.Gradient.MidColor = 14739177
      Legend.Gradient.StartColor = 16774122
      Legend.Shadow.Color = clGray
      Legend.Symbol.Pen.Visible = False
      Legend.Symbol.Squared = True
      Legend.Visible = False
      Title.Color = clBlack
      Title.Font.Style = [fsBold]
      Title.Frame.Color = 10083835
      Title.Frame.Width = 2
      Title.Gradient.Balance = 40
      Title.Gradient.Direction = gdRightLeft
      Title.Gradient.EndColor = clBlack
      Title.Gradient.MidColor = 8388672
      Title.Gradient.StartColor = clGray
      Title.Gradient.Visible = True
      Title.Shadow.HorizSize = 4
      Title.Shadow.Transparency = 70
      Title.Shadow.VertSize = 4
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.LabelsAngle = 90
      BottomAxis.MinorGrid.Color = 15066597
      BottomAxis.MinorTicks.Color = clBlack
      BottomAxis.TicksInner.Color = clBlack
      BottomAxis.Title.Visible = False
      BottomAxis.Visible = False
      DepthAxis.MinorTicks.Color = clBlack
      DepthAxis.TicksInner.Color = clBlack
      DepthTopAxis.MinorTicks.Color = clBlack
      DepthTopAxis.TicksInner.Color = clBlack
      LeftAxis.MinorTicks.Color = clBlack
      LeftAxis.TicksInner.Color = clBlack
      LeftAxis.Title.Visible = False
      LeftAxis.Visible = False
      RightAxis.MinorTicks.Color = clBlack
      RightAxis.TicksInner.Color = clBlack
      RightAxis.Visible = False
      Shadow.Color = clBlack
      TopAxis.MinorTicks.Color = clBlack
      TopAxis.TicksInner.Color = clBlack
      TopAxis.Visible = False
      View3DWalls = False
      Align = alBottom
      Color = clWhite
      TabOrder = 26
      PrintMargins = (
        15
        20
        15
        20)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      773
      41)
    object SpeedButton1: TcxButton
      Left = 736
      Top = 4
      Width = 33
      Height = 33
      Hint = 'Sair do formul'#225'rio'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = SpeedButton1Click
    end
  end
end

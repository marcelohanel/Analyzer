object frmSelecaoGraficoFotografia: TfrmSelecaoGraficoFotografia
  Left = 18
  Top = 25
  Caption = 'Selecionar dados para o Gr'#225'fico'
  ClientHeight = 483
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 711
    Height = 443
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 711
      Height = 443
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Visible = True
        DataController.DataModeController.SyncMode = False
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoFocusTopRowAfterSorting]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 40
    Align = alTop
    TabOrder = 0
    DesignSize = (
      711
      40)
    object Label1: TcxLabel
      Left = 4
      Top = 10
      Caption = 'Estilos:'
      Transparent = True
    end
    object ComboBox1: TcxComboBox
      Left = 41
      Top = 9
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = ComboBox1PropertiesChange
      TabOrder = 1
      Width = 137
    end
    object cxButton15: TcxButton
      Left = 483
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Limpar Padr'#245'es'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF1877EA1574E0FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1776E615
        73E7136FDC126ED30F6AC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1676CA268BE5278CEB2184E3116CCF0C67C40B64BB0962
        B4075CA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF258BD83EABEE45
        B4F72687DD3DAAF41E80D50F69BF065BAA0458A004579A035495FF00FFFF00FF
        FF00FFFF00FF01500A319CF739A4F41B6DC448B7FA2687DD41ADFA3BA7F81F81
        D4197ACC065B9F025291FF00FFFF00FFFF00FF0B6344185F6901500A166AD425
        81CE1160C02889E340ACFE359EF23CA6FF3CA6FF2D95EFFF00FFFF00FFFF00FF
        06630925AC461CB62F1CB62F1CB62F01500A01500A196DA32380E12C8FEB38A3
        FF38A1FFFF00FFFF00FFFF00FF096D111C9A3147F77936E5541CB62F0E912D12
        805B1CB62F1CB62F01500A01500AFF00FFFF00FFFF00FFFF00FFFF00FF1C982F
        18902935E05D21C2390CA015008600008300068E0F1DA6572D9197FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF035A0617992811AA1D018202007B0004
        8A0B005D01005D01FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1387232AD149048807005C00005D01046D0AFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0E78182CD44D068C09005400FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08690E2BCE49
        07960D005800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0D82170C9D15005E00FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B8913006501
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = cxButton15Click
    end
    object SpeedButton9: TcxButton
      Left = 515
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Salvar Cen'#225'rio Atual'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        98403F953A3A8B3435957D7DB0B8B7BDBCBBC0BCBBBBB8B7B6BBBAA487878028
        29812C2C903737FF00FFFF00FFAA5D56C14B4BC54D4DA64041836666AC8A89D9
        C2C0FEF7F2FFFCF8EEF3F0C59F9F7E1918811D1DB141419C3E3FFF00FFA95D56
        BC4A4AC04C4CA54242876062862B2BA45B5AE0D5D3FCFAF7FEFFFCCEA7A67E1A
        1A811E1EAF40409A3E3FFF00FFA95D56BC4A4AC04B4CA54242926A6981232383
        2020BFAAA9EEEBE9FFFFFFD9B2B07E1919801E1EAF40409A3E3FFF00FFA95D56
        BC4A4AC04B4BA441419E7675882F2F7B1D1D908282C9D0CCF8FFFEDEBAB87A18
        187E1C1CAD3F3F9A3E3FFF00FFA95D56BC4A4AC14B4BA94141B27776B17E7D9F
        6C6C957475A78B8AD8BBB8D193938C23238E2727B24242993D3EFF00FFA95D56
        BD4A4BBC4949BC4949BC4849BD4C4CBF4C4CBD4949B84141BA4343BB4646BD4A
        4ABF4B4BC14D4D973C3DFF00FFAA5E57A439379E413DB66C6AC58E8BC99695C9
        9593C99695C98F8EC99291C99593CA9997C68484BF4B4B973B3CFF00FFAA5D56
        9D3533DCBFBCF8F4F4F6F0EFF7F2F0F7F2F0F7F2F0F7F3F2F7F2F0F7F2F0FAFA
        F8D4ACABB44142983C3DFF00FFAA5D569F3735E5CBCAFBFAF8F4EBEAF4EDEBF4
        EDEBF4EDEBF4EDEBF4EDEBF3EDEBFAF7F6D4AAA9B24141983C3DFF00FFAA5D56
        9F3735E5CBC7EBEAEACCC9C7CFCBCBCFCBCBCFCBCBCFCBCBCFCBCBCCC9C9E6E6
        E5D7ABAAB14141983C3DFF00FFAA5D569F3735E5CBC9EFEDEDD4CFCED5D0D0D5
        D0D0D5D0D0D5D0D0D5D0D0D3CFCEE9E9E9D7ABAAB24141983C3DFF00FFAA5D56
        9F3735E3CBC9F2F0EFDCD5D4DDD8D7DDD8D7DDD8D7DDD8D7DDD8D7DCD5D5EEED
        EBD5ABA9B24141983C3DFF00FFAA5D569F3735E5CBCAEDEBEACEC9C9CFCCCBCF
        CCCBCFCCCBCFCCCBCFCCCBCCC9C9E7E6E5D8ACABB24141983C3DFF00FFAA5D55
        9F3735E2CAC7FEFAFAF8EFEEF8EFEEF8EFEEF8EFEEF8EFEEF8EFEEF8EFEEFCF8
        F7D4AAA9B24141983C3DFF00FFFF00FF923633BAA3A1C6C9C7C4C0C0C4C0C0C4
        C0C0C4C0C0C4C0C0C4C0C0C4C0C0C6C7C7BC99988C3435FF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = SpeedButton9Click
    end
    object cxButton2: TcxButton
      Left = 547
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Enviar as informa'#231#245'es para o Excel'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF006A00006A00006A00006A00006A00006A00006A00006A
        00006A00006A00006A0095655FA5696AA5696AA5696AA5696A006A00FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006A00986860FBE5C0
        F4D5ADF0CF9FEFCA96006A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF006A009D6B62FCE7C9F2D5B5F0D0A9EECB9E006A00FFFFFF78
        BB78006A001C831CFAFCFA6AB46A006A004DA34DFFFFFF006A00A36F64FEEED4
        F4DDC0F2D7B5F0D1AA006A00FFFFFFFFFFFFB4DAB4016C010D780D006A006AB4
        6AFFFFFFFFFFFF006A00A77466FFF4E1F6E1CAF3DCBFF2D7B4006A00FFFFFFFF
        FFFFFFFFFF4EA44E006A000A760AFAFCFAFFFFFFFFFFFF006A00AD7869FFFBEE
        F7E7D5F4E1CAF3DCBF006A00FFFFFFFFFFFF5FAD5F006A004AA14A016C012389
        23EEF7EEFFFFFF006A00B47E6BFFFFFBF8EDE1F7E6D4F6E1C9006A00FFFFFF46
        9F46006A0060AD60FFFFFFBBDDBB016B01238923FFFFFF006A00BA836DFFFFFF
        FCF4EEFAEDE1F8E9D5006A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF006A00BF8770FFFFFFFFFBFAFEF4EDFAEEE0006A00FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006A00C48C72FFFFFF
        FFFFFFFFFCFAFCF4ED006A00006A00006A00006A00006A00006A00006A00006A
        00006A00006A00006A00CA9174FFFFFFFFFFFFFFFFFFFFFCFAFCF4EDFAEDDEF8
        E7D4FCEBD3E3D3BBB7AD9CA5696AFF00FFFF00FFFF00FFFF00FFCE9576FFFFFF
        FFFFFFFFFFFFFFFFFFFEFCFAFCF6EBFAEFE0A5696AA5696AA5696AA5696AFF00
        FFFF00FFFF00FFFF00FFD39778FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF4
        EBE6A5696AE2A35BEF9938BB704FFF00FFFF00FFFF00FFFF00FFD59A79FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FEA5696AE5A55FC2805CFF00FFFF00
        FFFF00FFFF00FFFF00FFD0906BD0906BD0906BD0906BD0906BD0906BD0906BD0
        906BA5696ABB7F6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object SpeedButton6: TcxButton
      Left = 579
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Enviar as informa'#231#245'es por E-Mail'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000000000C6737300B57B
        7B00BD7B7B00C67B7B00B5847B00BD847B00C6847B00C68C7B00DE9C7B00B584
        8400BD848400C6848400BD8C8400C68C8400CE8C8400CE948400DE9C8400DEA5
        8400A5848C00B58C8C00C68C8C00DEA58C00E7B58C00EFB58C00B5949400BD94
        9400C6949400CE949400DEAD9400EFB59400FFCE9400AD949C00AD9C9C00CEA5
        9C00EFBD9C00FFD69C00B5A5A500CEA5A500D6A5A500D6ADA500EFC6A500D6B5
        AD00F7CEAD00F7D6AD009CADB500CEB5B500F7D6B50073A5BD0094B5BD00DEC6
        BD007BB5C60084BDC600ADBDC600E7C6C600E7CEC600EFDEC600F7DEC6006BAD
        CE0094C6CE00EFDECE00F7E7CE0084BDD600A5CED600DED6D600EFD6D600EFDE
        D600EFE7D600A5DEDE00EFE7DE00F7E7DE00F7EFDE0073D6E70084D6E7006BDE
        E70084DEE700A5DEE700CEE7E700E7E7E700F7E7E700FFF7E7006BDEEF007BDE
        EF00D6EFEF00E7EFEF00F7EFEF00F7F7EF006BDEF700C6EFF700E7F7F700EFF7
        F700F7F7F700FFFFF700FF00FF006BDEFF0073E7FF0073EFFF006BF7FF0073F7
        FF00F7F7FF008CFFFF00EFFFFF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C0D11081010
        1010101010100810055C0D0F1D1E1E1E1E1E1E1E1E1E23160D050D160D2A2B2A
        2A2A2A2A2A2B280D220D0A2E152137373737373737371A1C370A0A3B2E073142
        4141414144290F3C3B0A0C444F280C4044414142360D3755440C0C5455270D1A
        0A0A0A141A0B3666540D14401A2554544D4D4D4D583F192644140A1935666565
        656464646464582D1A0A04436666656565656564585852573401052466666659
        534C3E3A3332392F12015C001943635147494950505D3D13035C5C5C5C09305F
        605F5F605E2C0A5C5C5C5C5C5C5C0320485F5F481F035C5C5C5C5C5C5C5C5C5C
        0A18180A5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = SpeedButton6Click
    end
    object SpeedButton4: TcxButton
      Left = 611
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Imprimir as informa'#231#245'es'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000000000181818002118
        21001821210031313100393939004242420052525200636363006B6B6B007373
        7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
        9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
        A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
        BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
        C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
        DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
        F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
        103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
        2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
        22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
        2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
        343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
        24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
        261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
        261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = SpeedButton4Click
    end
    object SpeedButton1: TcxButton
      Left = 643
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Cancelar as modifica'#231#245'es'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0032800032800032800032800032
        80003280003280003280FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00328000328000378E003E9E
        0042AA0043AC0043AC0042AA003E9E00378E003280003280FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00378E00338200399200
        45B1004CC2004EC7004DC5004CC2004CC2004DC5004EC7004CC20047B6003B97
        003280003280FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00378E0037
        8E0041A7004EC7004DC5004ABD0049BB0048B8004ABD004ABD004ABD004ABD00
        49BB004CC20050CC0042AA003382003280FF00FFFF00FFFF00FFFF00FFFF00FF
        00378E0038900043AC004FCA004ABD0049BB004ABD004ABD004ABD004ABD004A
        BD004ABD004ABD004ABD004ABD0049BB0050CC0043AC003484003280FF00FFFF
        00FFFF00FFFF00FF003A950042AA004EC7004ABD004BC0004CC1004CC1004BC0
        004BBF004ABD004ABD004ABD004ABD004ABD004ABD004ABD0049BB0050CC0042
        AA003280FF00FFFF00FFFF00FF00378E0040A3004CC2004ABD004BBF004DC400
        50CB0051CE0051CC004EC7004DC4004BC0004ABD004ABD004ABD004ABD004ABD
        004ABD004ABD004FCA003B97003280FF00FFFF00FF003E9E0047B6004EC7004E
        C70050CC0055D70057DA0057DA0054D70054D70052D10050CA004DC5004BC000
        4BC0004ABD004ABD004ABD0049BB004DC50045B1003280FF00FF0042AA0041A7
        0050CC0055D90057DE005BE7015FEF0160EFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0353CA004ABD004ABD004ABD004ABD004DC500389000
        32800F60CF0049BB005BE9005EF00062F80065FF0369FF0368FBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0153CE004CC1004ABD004ABD004A
        BD004EC7003FA00032800F60CF0051CF0268FF056BFF066CFF096FFF0C73FF09
        70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0156D9004FC9
        004BC0004ABD004ABD004DC50042AA0032800F60CF005AE6167AFF1B7EFF1277
        FF167AFF197DFF167BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF015CE50052D1004DC5004BBF0049BB004DC50043AC0032800F62D10064FF
        3590FF4298FF2686FF2584FF2787FF2284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0263F20057DC004FC9004BC00049BB004DC50043AC00
        32800F60CF0064FF4C9EFF6BB0FF3F96FF348FFF3590FF2E8BFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0369FB015AE30051CC004BC1004A
        BD004DC50042AA0032800F60CF005CEB52A1FF8FC4FF69AFFF4599FF4298FF3B
        93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF076EFF025EE7
        0052CF004CC1004ABD004EC7003FA00032800F60CF0050CC4298FF9DCCFFA0CF
        FF65ACFF51A0FF4398FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF076EFF045EE20152CC004CC1004ABD004CC200378E003280FF00FF0F67DE
        187BFF8CC2FFC5E1FF9ACBFF6AB0FF4C9EFF59A6FF489CFF3691FF328CFF2C8A
        FF2584FF1E81FF1274F61274F6055CD80150C7004ABD004DC50045B1003280FF
        00FFFF00FF0F60CF0059E365ACFFBADCFFCCE5FF97CAFF5DA9FF4A9DFF3E95FF
        3791FF328EFF2C89FF2384FF1A7EFF1274F60A65E10355CB014EC2004BBF004F
        CA003A95003280FF00FFFF00FFFF00FF0F67DE0E74FF8CC2FFCEE6FFD1E7FF93
        C7FF6BB0FF4197FF3590FF2A88FF1E80FF1479FF0A70FF0766ED0458D3014EC2
        004BBF0050CC0041A5003280FF00FFFF00FFFF00FFFF00FF0F60CF0F69E3167A
        FF8FC4FFC6E2FFD7EAFFB1D7FF8AC1FF55A4FF2D8AFF1D7FFF1176FF0A6FFF04
        6AFF0162F30056D90050CC0041A7003382003B97FF00FFFF00FFFF00FFFF00FF
        FF00FF0F60CF0F68E11176FF72B4FFABD4FFCAE5FFCAE3FFB4D9FF90C5FF76B6
        FF5EA9FF50A0FF328EFF0E74FF005AE60041A7003484003B97FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF0F60CF0F66DC005AE62686FF65ACFF88C0FF
        9DCCFF9DCCFF8CC2FF6FB2FF469AFF1579FF0056DC0040A3003589003B97FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F60CF00
        47B60054D70167FF1277FF197DFF1378FF056BFF0057DE0045B1003B97003B97
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0F60CF0F60CF0F60CF0F5FCC0F5CC50F60CF0F60CF0F
        60CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TcxButton
      Left = 675
      Top = 3
      Width = 33
      Height = 33
      Hint = 'Confirmar as modifica'#231#245'es'
      Anchors = [akTop, akRight]
      OptionsImage.Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A1E1E4A1E1E4A1E1E4A1E1E4A1E
        1E4A1E1E4A1E1E4A1E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A1E1E4A1E1E60271680340D
        953B079D3E059D3E05963D0782350C6428154B1E1E4A1E1EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60271651211B6C2B12A3
        4104C44E00C75000C64F00C44F00C44E00C64F00C75000C44E00A94404742D10
        4D1F1C4D1F1CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6027166027
        16923C08C95100C64F00BC4B00BB4A00BA4900BC4B00BC4B00BC4B00BC4B00BC
        4B00C44F00CC5100973D0751211B4D1F1CFF00FFFF00FFFF00FFFF00FFFF00FF
        602716692A13993D06CA5100BF4D00BA4800C05307C96D20C1580DBA4500BC4B
        00BC4B00BC4B00BC4B00BC4B00BD4C00CC5100993D0652211C4D1F1CFF00FFFF
        00FFFF00FFFF00FF702D119A3F05C75000BD4B00BC4B00BA4300C25811EECAA7
        EAC59FC25B13BA4500BB4A00BC4B00BC4B00BC4B00BC4B00BB4A00CC5100973D
        074C1F1DFF00FFFF00FFFF00FF6027168B3709C44E00BD4C00BC4B00BC4B00BA
        4500C0540CEAC49DFFFFFFF0D4B8C76821BA4300BB4800BC4B00BC4B00BC4B00
        BC4B00BC4B00CA5000742D104C1F1DFF00FFFF00FF81340CAC4503C54F00BF4F
        02C05003C05304BD4C00C4590DEAC49DFFFFFFFFFFFFF3DDC6CE742FBB4602BB
        4800BC4B00BC4B00BC4B00BC4B00C54E00A743034C1F1DFF00FF9A3F05913A09
        C15303C55706C55B09C65C0CC75E0DC55706C96414EEC7A1FFFFFFFFFFFFFFFF
        FFFCF6EDDA9659BF4E06BA4500BC4B00BC4B00BC4B00BC4B00C64F006528154A
        1E1E9A3F05A44408CC5F0AC96210CB6513CC6716CE6917CB6210CF6E1FEECAA7
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3AF7FC1560DB84200BB4800BC4B00BC4B
        00C7500082350C4A1E1E9A3F05B1500BD46B16D16C1CD16D1DD37020D47323D3
        6D1AD57728F0CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9C098C5621B
        BB4900BC4B00BC4B00C64F00953B074A1E1E9A3F05BB5B12DA7E2DD88134D878
        2AD97A2CDA7D2ED87726DA8135F3D3B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF3DDC6C7671CBB4800BB4A00C54E009D3E054A1E1E9F4004C1631B
        E2934BE39957E0883BE08739E2893CE08335E18C41F4D7B7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFEDCBAAC76319BB4A00BB4A00C54E009D3E054A
        1E1E9A3F05C1641BE79F5EEBB27DE69952E69145E79549E68F41E6964DF7D9BC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0A773BF540BBA4500BC4B00BC4B
        00C64F00953B074A1E1E9A3F05BC5B13EAA363F2C69CEFB177ED9D54EE9F58ED
        994FED9F59F8DDC1FFFFFFFFFFFFFFFFFFFFFFFFFCF3EDE1A168BF4E03BA4300
        BC4B00BC4B00BC4B00C7500080340D4A1E1E9A3F05B44E09E69955F4CCA6F8D0
        A9F3B074F4AB67F3A55EF2A765FAE0C6FFFFFFFFFFFFFFFFFFF8E5D1DD9353C5
        5607BD4B00BD4C00BC4B00BC4B00BD4B00C44E006228164A1E1EFF00FFB14702
        D57D33F6C495FAE3CBF8D0A9FBBD80FAB26EF4AF6DFAE0C6FFFFFFFFFFFFF3D4
        B5DA863ACB620FC65909C05204BC4C00BC4B00BC4B00C64F00A542034A1E1EFF
        00FFFF00FF963D07BC590FEFAF72FBDDBFFCEAD7FED5ACFBBB7AF4B06EFAE5D0
        FFFFFFF3D3B2DD873AD16B18CE6715C75E0DC05204BC4C00BC4B00BD4B00CA50
        006D2C124A1E1EFF00FFFF00FFFF00FFB24701CF742AF8C592FCE7D3FEEEDEFA
        D3ACF6BB86F8DDC1F3CAA1E18A3ED87625D3701FCC6716C65C0CC05103BC4C00
        BD4C00CC51008E38094C1F1DFF00FFFF00FFFF00FFFF00FF963D07B44903D37B
        33F7C697FBE5CEFEEEDEF8DDC1F3C79CEBA669E18E42D98133D47627CF6F20CB
        6A1BC56213C45707CC51009038094F1F1C6E2D13FF00FFFF00FFFF00FFFF00FF
        FF00FF963D07B24903CF762DF2B67EFAD5B1FAE5D0FAE5D0F6D9BDEEC7A1EAB8
        88E5AB75E1A168DA904DD47627CA5B0A9139085423196E2D13FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF963D07AF4602BA5913D78742EBAF75F2C495
        F4CCA6F3CCA7F0C59AEAB581E29D5CD17B31AF53137F35105C25166E2D13FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF963D07A9
        4404AD5211BA6624C57637C97D3EC47739BA682CA1511C843B146E2D136E2D13
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF963D07963D07963D0791390888350A963D07963D0796
        3D07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = SpeedButton3Click
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink1
    PreviewOptions.ShowExplorer = True
    PreviewOptions.WindowState = wsMaximized
    Version = 0
    Left = 256
    Top = 88
    object dxComponentPrinterLink1: TdxGridReportLink
      Component = cxGrid1
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 38835.692293287030000000
      ReportDocument.Creator = 'mhanel'
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsCards.Shadow.Color = clBlack
      BuiltInReportLink = True
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 368
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Excel|*.xls'
    Left = 224
    Top = 88
  end
end

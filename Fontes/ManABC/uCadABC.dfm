object frmCadABC: TfrmCadABC
  Left = 15
  Top = 90
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'An'#225'lises ABC'
  ClientHeight = 434
  ClientWidth = 681
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
  DesignSize = (
    681
    434)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton3: TcxButton
    Left = 480
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Alterar'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
      8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
      F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
      83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
      A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
      F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
      83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
      6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
      FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
      79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
      A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
      FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
      69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
      7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
      FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
      5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
      F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
      F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
      FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
      CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
      A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TcxButton
    Left = 512
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Apagar'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
      0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
      B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
      0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
      00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
      05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
      00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
      0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = SpeedButton4Click
  end
  object cxButton4: TcxButton
    Left = 544
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Atualizar Informa'#231#245'es'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
      69A46769A46769FF00FFFF00FFFF00FFA46769FEE9C7C6CC93D5CE96F2D0A0E7
      CA91E9C588EDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
      A46769FCEACE99C0772D98226FAC4E2091162191165FA139CAB770E9BD7FE9BD
      7FEFC481A46769FF00FFFF00FFFF00FFA0675BFEEFDABFCE99108C0D00820100
      820100820100820129921ADEBB7DE9BD7FEFC481A46769FF00FFFF00FFFF00FF
      A0675BFFF4E5BDD19F138F0F0082011B9114A9BD7573AB4D04840377A948EABF
      81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF0BCD5A70A8A0A00820104
      860482B55FF0D0A9A5B76E6DAD4EEBC28AEFC583A46769FF00FFFF00FFFF00FF
      A7756BFFFFFCE1E7D0A4CC9099C68193C17799C077EED4AFF0D0A79FC279EBC7
      93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFA7D9A4FAEFE6F4E9D59D
      C68495C17797BF759FBD75EACFA3EECC9EF3CE97A46769FF00FFFF00FFFF00FF
      BC8268FFFFFF74C575B0D8A9FAEFE684C1760586040082010A8909F3D4B0F0D0
      A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFF81CA820586057AC475AF
      D4A01C9518008201138E0FF3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
      D1926DFFFFFFF3FAF32DA12D008201008201008201008201118E0FFBEACEDECE
      B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFDDF2DD67BF6724
      9C2422992175BF6B2D9926956D56A56B5FA56B5FA46769FF00FFFF00FFFF00FF
      DA9D75FFFFFFFFFFFFFFFFFFFFFFFFE1F3E1E0F2DDFFFEF7ACB6928B6E51E19E
      55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
      E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
      6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
      926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = cxButton4Click
  end
  object SpeedButton6: TcxButton
    Left = 576
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Visualizar'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
      69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
      CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
      1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
      7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
      D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
      A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
      81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
      7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
      A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
      93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
      E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
      BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
      A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
      EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
      D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
      B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
      8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
      DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
      55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
      E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
      6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
      926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TcxButton
    Left = 608
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Permiss'#245'es'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FF0286BD30A4D745B0E13AAADA269ED134A6D8FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF038AC0058FC465C5ED89D5FE7FCFFA7A
      CEF862BFEA58BBE92FA4D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0892C70E9ACC69CCE989DAFA7ACFF768C2EE3FA9D776CBF482D1FA5BBCEBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF109ACC1AA4D47BD5EA9DE9F88BE0FC49
      9EC42083AF54B7E57DCFFA82D1FA1F9DCFFF00FFFF00FFFF00FFFF00FFFF00FF
      19A1D328ACDC9DDDEDC1F6FCA3F0FF69BAD416658A4EABD77BD0FB7DCFF81E9C
      CEFF00FFFF00FFFF00FFFF00FFFF00FF23A9DA2FB0E1B5E1F0E6F8FCBBF2FA9F
      E6F24893AD72C1E181D5FE7BCCF81E9CCEFF00FFFF00FFFF00FFFF00FFFF00FF
      1A9FD02CB0D943AFD051B8D747B8D945B7D953C1E06CCCE986D9F78BD8FE1F9D
      CFFF00FFFF00FFFF00FFFF00FFFF00FF169FCC5AD1E01D728F23829F4ED8EB2C
      BDE011A1CE0995C6189ACA5EC2E7219FCFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1C9ECA35A9C459CBDA80FCFF66EDF836C1DE078AB8017FB2088EC10B8F
      C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3AC1E031
      BBDC2DB0D30782B20680B1078FC2078BC1FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0684B5037BAFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0273A5016D9FFF00FFFF
      00FFFF00FF0382B60478AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF1A9CCF0F88BBFF00FFFF00FFFF00FF0384B80479ABFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF33A1C94DC2E3FF00FFFF
      00FFFF00FF0381B50379ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF41B4CE5DD5E535A6C72799C50E90C4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3BADC73B
      AFCA35A7CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = SpeedButton7Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 345
    Height = 378
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      DataController.DataSource = dtsABC
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGrid1DBTableView1DBColumn1
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = 'An'#225'lise ABC'
        DataBinding.FieldName = 'ID_ABC'
        SortIndex = 0
        SortOrder = soAscending
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DBEdit1: TcxDBTextEdit
    Left = 360
    Top = 24
    TabStop = False
    DataBinding.DataField = 'ID_ABC'
    DataBinding.DataSource = dtsABC
    TabOrder = 1
    Width = 315
  end
  object DBEdit2: TcxDBTextEdit
    Left = 360
    Top = 66
    TabStop = False
    DataBinding.DataField = 'ID_ANALISE'
    DataBinding.DataSource = dtsABC
    TabOrder = 2
    Width = 315
  end
  object DBMemo2: TcxDBMemo
    Left = 360
    Top = 110
    TabStop = False
    DataBinding.DataField = 'DESCRICAO'
    DataBinding.DataSource = dtsABC
    Properties.ScrollBars = ssBoth
    TabOrder = 3
    Height = 276
    Width = 313
  end
  object Label1: TcxLabel
    Left = 360
    Top = 8
    Caption = 'Nome'
    Transparent = True
  end
  object Label2: TcxLabel
    Left = 360
    Top = 50
    Caption = 'An'#225'lise'
    Transparent = True
  end
  object Label4: TcxLabel
    Left = 360
    Top = 94
    Caption = 'Descri'#231#227'o'
    Transparent = True
  end
  object SpeedButton1: TcxButton
    Left = 640
    Top = 397
    Width = 33
    Height = 33
    Hint = 'Sair do Formul'#225'rio'
    Anchors = [akRight, akBottom]
    OptionsImage.Glyph.Data = {
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
    TabOrder = 12
    OnClick = SpeedButton1Click
  end
  object dtsABC: TDataSource
    AutoEdit = False
    DataSet = tblABC
    Left = 624
    Top = 8
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 64
    Top = 72
  end
  object bdDados: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=AnalyzerSQL;Data Source=local' +
      'host;Initial File Name="";Server SPN="";'
    CursorLocation = clUseServer
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLNCLI10.1'
    Left = 64
    Top = 132
  end
  object bdArmazena: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\analyzer\analyz' +
      'er.accdb;Persist Security Info=False;'
    CursorLocation = clUseServer
    KeepConnection = False
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 136
    Top = 132
  end
  object cxLocalizer1: TcxLocalizer
    Left = 136
    Top = 72
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'Black'
    UseSkins = False
    Left = 208
    Top = 72
  end
  object tblAnalises: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    OnFilterRecord = tblAnalisesFilterRecord
    TableName = 'ANALISES'
    Left = 368
    Top = 208
    object tblAnalisesID_ANALISE: TWideStringField
      DisplayLabel = 'An'#225'lise'
      FieldName = 'ID_ANALISE'
      Size = 50
    end
    object tblAnalisesDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
    end
    object tblAnalisesBASE_ORIGEM: TMemoField
      DisplayLabel = 'Base de Origem'
      FieldName = 'BASE_ORIGEM'
      BlobType = ftMemo
    end
    object tblAnalisesVISAO_ORIGEM: TWideStringField
      DisplayLabel = 'Vis'#227'o de Origem'
      FieldName = 'VISAO_ORIGEM'
      Size = 50
    end
    object tblAnalisesVISAO_DESTINO: TWideStringField
      DisplayLabel = 'Vis'#227'o de Destino'
      FieldName = 'VISAO_DESTINO'
      Size = 50
    end
    object tblAnalisesINCREMENTAL: TWideStringField
      FieldName = 'INCREMENTAL'
      Size = 1
    end
    object tblAnalisesPODE_VISUALIZAR: TMemoField
      FieldName = 'PODE_VISUALIZAR'
      BlobType = ftMemo
    end
    object tblAnalisesPODE_ALTERAR: TMemoField
      FieldName = 'PODE_ALTERAR'
      BlobType = ftMemo
    end
    object tblAnalisesPODE_ATUALIZAR: TMemoField
      FieldName = 'PODE_ATUALIZAR'
      BlobType = ftMemo
    end
    object tblAnalisesPODE_APAGAR: TMemoField
      FieldName = 'PODE_APAGAR'
      BlobType = ftMemo
    end
    object tblAnalisesDT_ATUALIZACAO: TDateTimeField
      FieldName = 'DT_ATUALIZACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tblAnalisesINTERNA: TWideStringField
      FieldName = 'INTERNA'
      Size = 1
    end
    object tblAnalisesANALISES_IGNORADOS: TMemoField
      FieldName = 'ANALISES_IGNORADOS'
      BlobType = ftMemo
    end
    object tblAnalisesVALORES_IGNORADOS: TMemoField
      FieldName = 'VALORES_IGNORADOS'
      BlobType = ftMemo
    end
    object tblAnalisesGRID: TWideStringField
      FieldName = 'GRID'
      Size = 1
    end
    object tblAnalisesGRUPO: TWideStringField
      FieldName = 'GRUPO'
      Size = 50
    end
    object tblAnalisesDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
  end
  object tblCenarios: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    BeforePost = tblCenariosBeforePost
    BeforeDelete = tblCenariosBeforeDelete
    OnFilterRecord = tblCenariosFilterRecord
    TableName = 'CENARIOS'
    Left = 440
    Top = 152
    object tblCenariosID_CENARIO: TWideStringField
      FieldName = 'ID_CENARIO'
      Size = 50
    end
    object tblCenariosID_USUARIO: TWideStringField
      FieldName = 'ID_USUARIO'
    end
    object tblCenariosID_ANALISE: TWideStringField
      FieldName = 'ID_ANALISE'
      Size = 50
    end
    object tblCenariosID_ABC: TWideStringField
      FieldName = 'ID_ABC'
      Size = 50
    end
    object tblCenariosFILTROS: TMemoField
      FieldName = 'FILTROS'
      BlobType = ftMemo
    end
    object tblCenariosELEMENTOS: TMemoField
      FieldName = 'ELEMENTOS'
      BlobType = ftMemo
    end
    object tblCenariosVALORES: TMemoField
      FieldName = 'VALORES'
      BlobType = ftMemo
    end
    object tblCenariosA: TWideStringField
      FieldName = 'A'
      Size = 5
    end
    object tblCenariosB: TWideStringField
      FieldName = 'B'
      Size = 5
    end
    object tblCenariosC: TWideStringField
      FieldName = 'C'
      Size = 5
    end
    object tblCenariosD: TWideStringField
      FieldName = 'D'
      Size = 5
    end
    object tblCenariosE: TWideStringField
      FieldName = 'E'
      Size = 5
    end
    object tblCenariosFOTOGRAFIA_DATA: TWideStringField
      FieldName = 'FOTOGRAFIA_DATA'
      Size = 50
    end
    object tblCenariosFOTOGRAFIA_VALOR: TWideStringField
      FieldName = 'FOTOGRAFIA_VALOR'
      Size = 50
    end
    object tblCenariosFOTOGRAFIA_DT_FOT_INI: TWideStringField
      FieldName = 'FOTOGRAFIA_DT_FOT_INI'
      Size = 10
    end
    object tblCenariosFOTOGRAFIA_DT_FOT_FIM: TWideStringField
      FieldName = 'FOTOGRAFIA_DT_FOT_FIM'
      Size = 10
    end
    object tblCenariosFOTOGRAFIA_DT_COM_INI: TWideStringField
      FieldName = 'FOTOGRAFIA_DT_COM_INI'
      Size = 10
    end
    object tblCenariosFOTOGRAFIA_DT_COM_FIM: TWideStringField
      FieldName = 'FOTOGRAFIA_DT_COM_FIM'
      Size = 10
    end
    object tblCenariosFREQUENCIA_DATA: TWideStringField
      FieldName = 'FREQUENCIA_DATA'
      Size = 50
    end
    object tblCenariosFREQUENCIA_VALOR: TWideStringField
      FieldName = 'FREQUENCIA_VALOR'
      Size = 50
    end
    object tblCenariosFREQUENCIA_DT_FRE_INI: TWideStringField
      FieldName = 'FREQUENCIA_DT_FRE_INI'
      Size = 10
    end
    object tblCenariosFREQUENCIA_DT_FRE_FIM: TWideStringField
      FieldName = 'FREQUENCIA_DT_FRE_FIM'
      Size = 10
    end
    object tblCenariosFREQUENCIA_DATA_BASE: TWideStringField
      FieldName = 'FREQUENCIA_DATA_BASE'
      Size = 50
    end
    object tblCenariosID_FOTOGRAFIA: TWideStringField
      FieldName = 'ID_FOTOGRAFIA'
      Size = 50
    end
    object tblCenariosID_FREQUENCIA: TWideStringField
      FieldName = 'ID_FREQUENCIA'
      Size = 50
    end
    object tblCenariosORDEM: TWideStringField
      FieldName = 'ORDEM'
      Size = 100
    end
    object tblCenariosORDEM_TIPO: TWideStringField
      FieldName = 'ORDEM_TIPO'
      Size = 1
    end
    object tblCenariosLINHAS: TIntegerField
      FieldName = 'LINHAS'
    end
    object tblCenariosFILTRO_PERSONALIZADO_TEXTO: TWideMemoField
      FieldName = 'FILTRO_PERSONALIZADO_TEXTO'
      BlobType = ftWideMemo
    end
    object tblCenariosFILTRO_PERSONALIZADO_GRAFICO: TBlobField
      FieldName = 'FILTRO_PERSONALIZADO_GRAFICO'
    end
    object tblCenariosREGISTROS: TIntegerField
      FieldName = 'REGISTROS'
    end
    object tblCenariosFREQUENCIA_DIAS: TIntegerField
      FieldName = 'FREQUENCIA_DIAS'
    end
    object tblCenariosFREQUENCIA_ATUAL: TWideStringField
      FieldName = 'FREQUENCIA_ATUAL'
      Size = 1
    end
  end
  object qryAtualiza: TADOQuery
    Connection = bdDados
    CursorLocation = clUseServer
    Parameters = <>
    Left = 488
    Top = 208
  end
  object tblABC: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    BeforePost = tblABCBeforePost
    BeforeDelete = tblABCBeforeDelete
    OnFilterRecord = tblABCFilterRecord
    TableName = 'ABC'
    Left = 432
    Top = 208
    object tblABCID_ABC: TWideStringField
      FieldName = 'ID_ABC'
      Size = 50
    end
    object tblABCID_ANALISE: TWideStringField
      FieldName = 'ID_ANALISE'
      Size = 50
    end
    object tblABCDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
    end
    object tblABCPODE_VISUALIZAR: TMemoField
      FieldName = 'PODE_VISUALIZAR'
      BlobType = ftMemo
    end
    object tblABCPODE_ALTERAR: TMemoField
      FieldName = 'PODE_ALTERAR'
      BlobType = ftMemo
    end
    object tblABCPODE_APAGAR: TMemoField
      FieldName = 'PODE_APAGAR'
      BlobType = ftMemo
    end
    object tblABCDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
  end
end
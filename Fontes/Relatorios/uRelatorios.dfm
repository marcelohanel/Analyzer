object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmRelatorios'
  ClientHeight = 61
  ClientWidth = 415
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
  object Memo1: TMemo
    Left = 64
    Top = 8
    Width = 448
    Height = 249
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
  end
  object cxLabel1: TcxLabel
    Left = 64
    Top = 8
    Caption = 'Analyzer Relat'#243'rios'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -32
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object bdDados: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\analyzer\analyz' +
      'er.accdb;Persist Security Info=False;'
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 8
    Top = 16
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'Black'
    UseSkins = False
    Left = 184
    Top = 16
  end
  object tblRelatorios: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    AfterInsert = tblRelatoriosAfterInsert
    TableName = 'RELATORIOS'
    Left = 97
    Top = 10
    object tblRelatoriosID_RELATORIO: TWideStringField
      FieldName = 'ID_RELATORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object tblRelatoriosDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object tblRelatoriosRELATORIO: TBlobField
      FieldName = 'RELATORIO'
      ProviderFlags = [pfInUpdate]
    end
    object tblRelatoriosPODE_VISUALIZAR: TMemoField
      FieldName = 'PODE_VISUALIZAR'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object tblRelatoriosPODE_ALTERAR: TMemoField
      FieldName = 'PODE_ALTERAR'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object tblRelatoriosPODE_APAGAR: TMemoField
      FieldName = 'PODE_APAGAR'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object tblRelatoriosDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsRelatorios: TDataSource
    DataSet = tblRelatorios
    Left = 136
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = pplRelatorios
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = pplRelatorios
    Template.DatabaseSettings.Name = 'cccc'
    Template.DatabaseSettings.NameField = 'ID_RELATORIO'
    Template.DatabaseSettings.TemplateField = 'RELATORIO'
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BackgroundPrintSettings.Enabled = True
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 96
    Top = 64
    Version = '14.07'
    mmColumnWidth = 0
    DataPipelineName = 'pplRelatorios'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    AllowDataSettingsChange = True
    Caption = 'Analyzer'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = True
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqSQL2
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\Analyzer\Temp\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 56
    Top = 64
  end
  object pplRelatorios: TppDBPipeline
    DataSource = dtsRelatorios
    UserName = 'lRelatorios'
    Left = 16
    Top = 64
  end
  object cxLocalizer1: TcxLocalizer
    Left = 144
    Top = 16
  end
  object bdArmazena: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\analyzer\analyz' +
      'er.accdb;Persist Security Info=False;'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 48
    Top = 16
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 168
    Top = 64
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 216
    Top = 64
  end
end

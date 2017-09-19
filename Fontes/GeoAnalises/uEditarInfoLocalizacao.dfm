object frmEditarInfoLocalizacao: TfrmEditarInfoLocalizacao
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es sobre localiza'#231#245'es'
  ClientHeight = 512
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 693
    Height = 512
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsGeoReferencia
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ColumnHeaderHints = False
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.Indicator = True
      object cxGrid1DBTableView1ID_REFERENCIA: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_REFERENCIA'
        Width = 150
      end
      object cxGrid1DBTableView1CIDADE: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'CIDADE'
        Width = 150
      end
      object cxGrid1DBTableView1MICROREGIAO: TcxGridDBColumn
        Caption = 'Micro Regi'#227'o'
        DataBinding.FieldName = 'MICROREGIAO'
        Width = 150
      end
      object cxGrid1DBTableView1MESOREGIAO: TcxGridDBColumn
        Caption = 'Meso Regi'#227'o'
        DataBinding.FieldName = 'MESOREGIAO'
        Width = 150
      end
      object cxGrid1DBTableView1ESTADO: TcxGridDBColumn
        Caption = 'Estado'
        DataBinding.FieldName = 'ESTADO'
        Width = 150
      end
      object cxGrid1DBTableView1REGIAO: TcxGridDBColumn
        Caption = 'Regi'#227'o'
        DataBinding.FieldName = 'REGIAO'
        Width = 150
      end
      object cxGrid1DBTableView1PAIS: TcxGridDBColumn
        Caption = 'Pa'#237's'
        DataBinding.FieldName = 'PAIS'
        Width = 150
      end
      object cxGrid1DBTableView1REF_PAIS: TcxGridDBColumn
        Caption = 'Ref. Pa'#237's'
        DataBinding.FieldName = 'REF_PAIS'
        Width = 50
      end
      object cxGrid1DBTableView1REF_REGIAO: TcxGridDBColumn
        Caption = 'Ref. Regi'#227'o'
        DataBinding.FieldName = 'REF_REGIAO'
        Width = 50
      end
      object cxGrid1DBTableView1REF_ESTADO: TcxGridDBColumn
        Caption = 'Ref. Estado'
        DataBinding.FieldName = 'REF_ESTADO'
        Width = 50
      end
      object cxGrid1DBTableView1REF_MESO: TcxGridDBColumn
        Caption = 'Ref. Meso R.'
        DataBinding.FieldName = 'REF_MESO'
        Width = 50
      end
      object cxGrid1DBTableView1REF_MICRO: TcxGridDBColumn
        Caption = 'Ref. Micro R.'
        DataBinding.FieldName = 'REF_MICRO'
        Width = 50
      end
      object cxGrid1DBTableView1LATITUDE: TcxGridDBColumn
        Caption = 'Latitude'
        DataBinding.FieldName = 'LATITUDE'
        Width = 90
      end
      object cxGrid1DBTableView1LONGITUDE: TcxGridDBColumn
        Caption = 'Longitude'
        DataBinding.FieldName = 'LONGITUDE'
        Width = 90
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object qryGeoReferencia: TADOQuery
    Connection = frmPrincipal.bdDados
    CursorType = ctOpenForwardOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM GEO_REFERENCIA')
    Left = 616
    Top = 16
    object qryGeoReferenciaID_REFERENCIA: TWideStringField
      FieldName = 'ID_REFERENCIA'
      Size = 255
    end
    object qryGeoReferenciaCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object qryGeoReferenciaMICROREGIAO: TWideStringField
      FieldName = 'MICROREGIAO'
      Size = 45
    end
    object qryGeoReferenciaMESOREGIAO: TWideStringField
      FieldName = 'MESOREGIAO'
      Size = 45
    end
    object qryGeoReferenciaESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qryGeoReferenciaREGIAO: TWideStringField
      FieldName = 'REGIAO'
      Size = 255
    end
    object qryGeoReferenciaPAIS: TWideStringField
      FieldName = 'PAIS'
      Size = 255
    end
    object qryGeoReferenciaREF_PAIS: TWideStringField
      FieldName = 'REF_PAIS'
      Size = 1
    end
    object qryGeoReferenciaREF_REGIAO: TWideStringField
      FieldName = 'REF_REGIAO'
      Size = 1
    end
    object qryGeoReferenciaREF_ESTADO: TWideStringField
      FieldName = 'REF_ESTADO'
      Size = 1
    end
    object qryGeoReferenciaREF_MESO: TWideStringField
      FieldName = 'REF_MESO'
      Size = 1
    end
    object qryGeoReferenciaREF_MICRO: TWideStringField
      FieldName = 'REF_MICRO'
      Size = 1
    end
    object qryGeoReferenciaLATITUDE: TFloatField
      FieldName = 'LATITUDE'
    end
    object qryGeoReferenciaLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
    end
  end
  object dtsGeoReferencia: TDataSource
    AutoEdit = False
    DataSet = qryGeoReferencia
    Left = 536
    Top = 16
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 504
    Top = 176
  end
end

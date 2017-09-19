object frmScripts: TfrmScripts
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Script de Atualiza'#231#227'o'
  ClientHeight = 490
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 39
    Align = alTop
    TabOrder = 0
    object btnAdicionar: TcxButton
      Left = 8
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Adicionar Instru'#231#227'o'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnSair: TcxButton
      Left = 598
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnAlterar: TcxButton
      Left = 129
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Alterar Instru'#231#227'o'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnApagar: TcxButton
      Left = 250
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Apagar Instru'#231#227'o'
      TabOrder = 3
      OnClick = btnApagarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 719
    Height = 451
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 711
      Height = 443
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = btnAlterarClick
        NavigatorButtons.ConfirmDelete = False
        FilterBox.CustomizeDialog = False
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGrid1DBTableView1Ordem: TcxGridDBColumn
          DataBinding.FieldName = 'Ordem'
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 53
        end
        object cxGrid1DBTableView1Nome: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          Options.Editing = False
          Width = 193
        end
        object cxGrid1DBTableView1Tipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          Options.Editing = False
          Width = 178
        end
        object cxGrid1DBTableView1Conexao: TcxGridDBColumn
          DataBinding.FieldName = 'Conexao'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Width = 57
        end
        object cxGrid1DBTableView1SQL: TcxGridDBColumn
          DataBinding.FieldName = 'SQL'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Width = 56
        end
        object cxGrid1DBTableView1Comando: TcxGridDBColumn
          DataBinding.FieldName = 'Comando'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Width = 57
        end
        object cxGrid1DBTableView1Parametros: TcxGridDBColumn
          Caption = 'Par'#226'metros'
          DataBinding.FieldName = 'Aux_1'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.ReadOnly = True
          Width = 66
        end
        object cxGrid1DBTableView1Ativa: TcxGridDBColumn
          DataBinding.FieldName = 'Ativa'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Options.CellMerging = True
          Width = 35
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = frmUpdateBase.cdsScript
    Left = 632
    Top = 56
  end
end

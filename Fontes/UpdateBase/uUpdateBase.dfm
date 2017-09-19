object frmUpdateBase: TfrmUpdateBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'UpdateBase'
  ClientHeight = 221
  ClientWidth = 249
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
  object btnScript: TcxButton
    Left = 8
    Top = 78
    Width = 233
    Height = 25
    Caption = 'Script de Atualiza'#231#227'o'
    Enabled = False
    TabOrder = 0
    OnClick = btnScriptClick
  end
  object cxButton2: TcxButton
    Left = 8
    Top = 140
    Width = 233
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object btnCriar: TcxButton
    Left = 8
    Top = 16
    Width = 233
    Height = 25
    Caption = 'Criar Arquivo de Script'
    TabOrder = 2
    OnClick = btnCriarClick
  end
  object btnAbrir: TcxButton
    Left = 8
    Top = 47
    Width = 233
    Height = 25
    Caption = 'Abrir Arquivo de Script'
    TabOrder = 3
    OnClick = btnAbrirClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 182
    Caption = 'Arquivo de Script:'
    Transparent = True
  end
  object lblArquivo: TcxLabel
    Left = 8
    Top = 197
    Caption = 'Arquivo'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object btnExecutar: TcxButton
    Left = 8
    Top = 109
    Width = 233
    Height = 25
    Caption = 'Executar Script'
    Enabled = False
    TabOrder = 6
    OnClick = btnExecutarClick
  end
  object mmoLog: TcxMemo
    Left = 32
    Top = 78
    Lines.Strings = (
      'mmoLog')
    Properties.ScrollBars = ssBoth
    TabOrder = 7
    Visible = False
    Height = 89
    Width = 185
  end
  object CEVersionInfo1: TCEVersionInfo
    Left = 184
    Top = 8
  end
  object cxLocalizer1: TcxLocalizer
    Left = 120
    Top = 8
  end
  object dxSkinController1: TdxSkinController
    Kind = lfStandard
    NativeStyle = False
    SkinName = 'Black'
    UseSkins = False
    Left = 152
    Top = 8
  end
  object cdsScript: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    IndexFieldNames = 'Ordem'
    Params = <>
    Left = 216
    Top = 8
    object cdsScriptNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object cdsScriptOrdem: TIntegerField
      FieldName = 'Ordem'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsScriptTipo: TStringField
      FieldName = 'Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsScriptConexao: TMemoField
      FieldName = 'Conexao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptSQL: TMemoField
      FieldName = 'SQL'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptComando: TMemoField
      FieldName = 'Comando'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptAtiva: TBooleanField
      FieldName = 'Ativa'
      ProviderFlags = [pfInUpdate]
    end
    object cdsScriptAux_1: TMemoField
      FieldName = 'Aux_1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptAux_2: TMemoField
      FieldName = 'Aux_2'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptAux_3: TMemoField
      FieldName = 'Aux_3'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptAux_4: TMemoField
      FieldName = 'Aux_4'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
    object cdsScriptAux_5: TMemoField
      FieldName = 'Aux_5'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 10
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.xml'
    Filter = 'Arquivos XML|*.xml'
    Left = 88
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xml'
    Filter = 'Arquivos XML|*.xml'
    Left = 56
    Top = 8
  end
  object bdBase: TADOConnection
    CursorLocation = clUseServer
    KeepConnection = False
    LoginPrompt = False
    Left = 144
    Top = 176
  end
  object qryAtualiza: TADOQuery
    Connection = bdBase
    CursorLocation = clUseServer
    Parameters = <>
    Left = 192
    Top = 176
  end
end

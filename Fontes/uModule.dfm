object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 378
  Width = 542
  object bdDados: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=AnalyzerSQL;Data Source=MAR' +
      'CELOHANEL-PC\SQLEXPRESS;Initial File Name="";Server SPN="";'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 480
    Top = 16
  end
  object tblUsuarios: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    BeforePost = tblUsuariosBeforePost
    BeforeDelete = tblUsuariosBeforeDelete
    OnCalcFields = tblUsuariosCalcFields
    TableName = 'USUARIOS'
    Left = 96
    Top = 184
    object tblUsuariosID_USUARIO: TWideStringField
      FieldName = 'ID_USUARIO'
    end
    object tblUsuariosNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tblUsuariosSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object tblUsuariosACESSA_USUARIOS: TWideStringField
      FieldName = 'ACESSA_USUARIOS'
      Size = 1
    end
    object tblUsuariosACESSA_VISOES: TWideStringField
      FieldName = 'ACESSA_VISOES'
      Size = 1
    end
    object tblUsuariosACESSA_RELATORIOS: TWideStringField
      FieldName = 'ACESSA_RELATORIOS'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_ANALISES: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_ANALISES'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_RELATORIOS: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_RELATORIOS'
      Size = 1
    end
    object tblUsuariosBASE_DADOS: TMemoField
      FieldName = 'BASE_DADOS'
      BlobType = ftMemo
    end
    object tblUsuariosBASE_DADOS_PEDE_SENHA: TWideStringField
      FieldName = 'BASE_DADOS_PEDE_SENHA'
      Size = 1
    end
    object tblUsuariosACESSA_SCORED: TWideStringField
      FieldName = 'ACESSA_SCORED'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_SCORED: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_SCORED'
      Size = 1
    end
    object tblUsuariosACESSA_DYNAMICS: TWideStringField
      FieldName = 'ACESSA_DYNAMICS'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_DYNAMICS: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_DYNAMICS'
      Size = 1
    end
    object tblUsuariosACESSA_ABC: TWideStringField
      FieldName = 'ACESSA_ABC'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_ABC: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_ABC'
      Size = 1
    end
    object tblUsuariosACESSA_CUBO: TWideStringField
      FieldName = 'ACESSA_CUBO'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_CUBO: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_CUBO'
      Size = 1
    end
    object tblUsuariosACESSA_FOTOGRAFIA: TWideStringField
      FieldName = 'ACESSA_FOTOGRAFIA'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_FOTOGRAFIA'
      Size = 1
    end
    object tblUsuariosACESSA_FREQUENCIA: TWideStringField
      FieldName = 'ACESSA_FREQUENCIA'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_FREQUENCIA: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_FREQUENCIA'
      Size = 1
    end
    object tblUsuariosSCHEDULER_CAMINHO: TWideStringField
      FieldName = 'SCHEDULER_CAMINHO'
      Size = 200
    end
    object tblUsuariosACESSA_SMARTDOCS: TWideStringField
      FieldName = 'ACESSA_SMARTDOCS'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_SMARTDOCS: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_SMARTDOCS'
      Size = 1
    end
    object tblUsuariosSESSAO: TStringField
      FieldKind = fkLookup
      FieldName = 'SESSAO'
      LookupDataSet = tblLogin
      LookupKeyFields = 'ID_USUARIO'
      LookupResultField = 'SESSAO'
      KeyFields = 'ID_USUARIO'
      Size = 50
      Lookup = True
    end
    object tblUsuariosLOGADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'LOGADO'
      Size = 3
      Calculated = True
    end
    object tblUsuariosLOCAL_ATUALIZACOES: TWideStringField
      FieldName = 'LOCAL_ATUALIZACOES'
      Size = 200
    end
    object tblUsuariosATUALIZA_ONLINE: TWideStringField
      FieldName = 'ATUALIZA_ONLINE'
      Size = 1
    end
    object tblUsuariosSGBD: TWideStringField
      FieldName = 'SGBD'
      Size = 50
    end
    object tblUsuariosSKIN: TWideStringField
      FieldName = 'SKIN'
      Size = 50
    end
    object tblUsuariosIMAGEM: TBlobField
      FieldName = 'IMAGEM'
    end
    object tblUsuariosACESSA_ACCESS: TWideStringField
      FieldName = 'ACESSA_ACCESS'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_ACCESS: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_ACCESS'
      Size = 1
    end
    object tblUsuariosACESSA_REPORT: TWideStringField
      FieldName = 'ACESSA_REPORT'
      Size = 1
    end
    object tblUsuariosLINK_REPORT: TWideStringField
      FieldName = 'LINK_REPORT'
      Size = 255
    end
    object tblUsuariosACESSA_VISIO: TWideStringField
      FieldName = 'ACESSA_VISIO'
      Size = 1
    end
    object tblUsuariosACESSA_PARAMETROS: TWideStringField
      FieldName = 'ACESSA_PARAMETROS'
      Size = 1
    end
    object tblUsuariosMAIL: TWideStringField
      FieldName = 'MAIL'
      Size = 50
    end
    object tblUsuariosSENHA_MAIL: TWideStringField
      FieldName = 'SENHA_MAIL'
      Size = 50
    end
    object tblUsuariosUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Size = 50
    end
    object tblUsuariosACESSA_GEO_ANALISE: TWideStringField
      FieldName = 'ACESSA_GEO_ANALISE'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_GEO_ANALISE: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_GEO_ANALISE'
      Size = 1
    end
    object tblUsuariosACESSA_LOGS: TWideStringField
      FieldName = 'ACESSA_LOGS'
      Size = 1
    end
    object tblUsuariosGERA_LOG: TWideStringField
      FieldName = 'GERA_LOG'
      Size = 1
    end
    object tblUsuariosACESSA_PERMISSOES_VISIO: TWideStringField
      FieldName = 'ACESSA_PERMISSOES_VISIO'
      Size = 1
    end
    object tblUsuariosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object tblUsuariosACESSA_WEBBI: TWideStringField
      FieldName = 'ACESSA_WEBBI'
      Size = 1
    end
  end
  object bdArmazena: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=AnalyzerSQL;Data Source=local' +
      'host;Initial File Name="";Server SPN=""'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 480
    Top = 72
  end
  object tblLogin: TADOTable
    Connection = bdDados
    CursorLocation = clUseServer
    BeforePost = tblLoginBeforePost
    TableName = 'LOGIN'
    Left = 40
    Top = 184
    object tblLoginSESSAO: TWideStringField
      FieldName = 'SESSAO'
      Size = 50
    end
    object tblLoginID_USUARIO: TWideStringField
      FieldName = 'ID_USUARIO'
    end
    object tblLoginDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object tblLoginHORA: TDateTimeField
      FieldName = 'HORA'
    end
  end
  object qryAtualiza: TADOQuery
    Connection = bdDados
    CursorLocation = clUseServer
    Parameters = <>
    Left = 480
    Top = 192
  end
end

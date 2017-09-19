unit uModule;

interface

uses
  Forms, xhConsts, SysUtils, Classes, DB, ADODB;

function VerificaVersaoBase(Versao: Integer): Boolean;

type
  TdtmPrincipal = class(TDataModule)
    bdDados: TADOConnection;
    tblUsuarios: TADOTable;
    tblUsuariosID_USUARIO: TWideStringField;
    tblUsuariosNOME: TWideStringField;
    tblUsuariosSENHA: TWideStringField;
    tblUsuariosACESSA_USUARIOS: TWideStringField;
    tblUsuariosACESSA_VISOES: TWideStringField;
    tblUsuariosACESSA_RELATORIOS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ANALISES: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_RELATORIOS: TWideStringField;
    tblUsuariosBASE_DADOS: TMemoField;
    tblUsuariosBASE_DADOS_PEDE_SENHA: TWideStringField;
    bdArmazena: TADOConnection;
    tblUsuariosACESSA_SCORED: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_SCORED: TWideStringField;
    tblUsuariosACESSA_DYNAMICS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_DYNAMICS: TWideStringField;
    tblUsuariosACESSA_ABC: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ABC: TWideStringField;
    tblUsuariosACESSA_CUBO: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_CUBO: TWideStringField;
    tblUsuariosACESSA_FOTOGRAFIA: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA: TWideStringField;
    tblUsuariosACESSA_FREQUENCIA: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_FREQUENCIA: TWideStringField;
    tblUsuariosSCHEDULER_CAMINHO: TWideStringField;
    tblLogin: TADOTable;
    tblLoginSESSAO: TWideStringField;
    tblLoginID_USUARIO: TWideStringField;
    tblLoginDATA: TDateTimeField;
    tblLoginHORA: TDateTimeField;
    tblUsuariosACESSA_SMARTDOCS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_SMARTDOCS: TWideStringField;
    tblUsuariosSESSAO: TStringField;
    tblUsuariosLOGADO: TStringField;
    tblUsuariosLOCAL_ATUALIZACOES: TWideStringField;
    tblUsuariosATUALIZA_ONLINE: TWideStringField;
    tblUsuariosSGBD: TWideStringField;
    tblUsuariosSKIN: TWideStringField;
    tblUsuariosIMAGEM: TBlobField;
    tblUsuariosACESSA_ACCESS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ACCESS: TWideStringField;
    tblUsuariosACESSA_REPORT: TWideStringField;
    tblUsuariosLINK_REPORT: TWideStringField;
    tblUsuariosACESSA_VISIO: TWideStringField;
    tblUsuariosACESSA_PARAMETROS: TWideStringField;
    tblUsuariosMAIL: TWideStringField;
    tblUsuariosSENHA_MAIL: TWideStringField;
    tblUsuariosUSER_MAIL: TWideStringField;
    tblUsuariosACESSA_GEO_ANALISE: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_GEO_ANALISE: TWideStringField;
    tblUsuariosACESSA_LOGS: TWideStringField;
    tblUsuariosGERA_LOG: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_VISIO: TWideStringField;
    qryAtualiza: TADOQuery;
    tblUsuariosCOD_USUARIO: TIntegerField;
    tblUsuariosACESSA_WEBBI: TWideStringField;
    procedure tblLoginBeforePost(DataSet: TDataSet);
    procedure tblUsuariosBeforePost(DataSet: TDataSet);
    procedure tblUsuariosBeforeDelete(DataSet: TDataSet);
    procedure tblUsuariosCalcFields(DataSet: TDataSet);
    procedure AtualizaVersaoBase(Versao: integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InicializaBanco;
    procedure CriaBaseDados;
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

uses
  Dialogs, uPrincipal, uFuncoes;

{$R *.dfm}

procedure TdtmPrincipal.tblUsuariosBeforeDelete(DataSet: TDataSet);
var
   aux : string;
    lPode : boolean;
begin
    if tblUsuariosID_USUARIO.Value = frmPrincipal.sUsuario then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_41'), mtInformation, [mbOK], 0);
        Abort;
    end;

    lPode := True;
    try
       aux := #39 + tblUsuariosID_USUARIO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES',          'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS_CUBO',    'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS',         'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS_DYNAMICS','ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'LOGIN',            'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'LOGS',             'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'DECISION_USUARIO', 'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS_DECISION','ID_USUARIO',aux) then Abort;
    end;

    GeraLog(bdDados,frmPrincipal.sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TdtmPrincipal.tblUsuariosBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       auxAntigo := #39 + tblUsuariosID_USUARIO.OldValue + #39;
       auxNovo   := #39 + tblUsuariosID_USUARIO.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'LOGIN',            'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'LOGS',             'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'PADROES',          'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS_CUBO',    'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS',         'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS_DYNAMICS','ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'DECISION_USUARIO', 'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS_DECISION','ID_USUARIO',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TdtmPrincipal.tblUsuariosCalcFields(DataSet: TDataSet);
begin
    if tblUsuariosSESSAO.Value <> '' then
       tblUsuariosLOGADO.Value := 'Sim'
    else
       tblUsuariosLOGADO.Value := '';
end;

procedure TdtmPrincipal.InicializaBanco;
begin
  try
    bdDados.Close;
    bdArmazena.Close;
    bdDados.ConnectionString := frmPrincipal.sConexao;

    if frmPrincipal.sSenhaBancoDados <> '' then
       bdDados.ConnectionString := bdDados.ConnectionString + ';Password=' + frmPrincipal.sSenhaBancoDados;

    bdDados.Open;
  except
    on E: Exception do
    begin
      MessageDlg(HCLResourceStrings.FindID('sString_48') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
      Application.Terminate;
    end;
  end;
end;

procedure TdtmPrincipal.CriaBaseDados;
var
    iCodUsuario : integer;
    Query : TADOQuery;
begin
  {$REGION '20100036'}
  if VerificaVersaoBase(20100036) then
  begin
      try
        qryAtualiza.Close;
        qryAtualiza.SQL.Clear;
        qryAtualiza.SQL.Add('DROP TABLE FOLDER');
        qryAtualiza.ExecSQL;
        qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE FAVORITOS');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(100)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE FAVORITOS');
          qryAtualiza.SQL.Add('ADD SUB_GRUPO NVARCHAR(100)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100036);
  end;
  {$ENDREGION}

  {$REGION '20100037'}
  if VerificaVersaoBase(20100037) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE SCORED_CARD_FILTRO');
          qryAtualiza.SQL.Add('ADD ULTIMO_MAIL_ENVIADO NVARCHAR(1)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DROP TABLE FAVORITOS');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE SCORED_CARD');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE ACCESS');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE VISIO');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE RELATORIOS');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION_MY_SQL');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE GEO_ANALISES');
          qryAtualiza.SQL.Add('ADD GRUPO NVARCHAR(50)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100037);
  end;
  {$ENDREGION}

  {$REGION '20100044'}
  if VerificaVersaoBase(20100044) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE SCORED_CARD_FILTRO');
          qryAtualiza.SQL.Add('ADD FILTRO_MINIMO_PRINCIPAL NVARCHAR(1)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE SCORED_CARD_FILTRO');
          qryAtualiza.SQL.Add('ADD FILTRO_MAXIMO_PRINCIPAL NVARCHAR(1)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100044);
  end;
  {$ENDREGION}

  {$REGION '20100045'}
  if VerificaVersaoBase(20100045) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('CREATE TABLE TASK');
          qryAtualiza.SQL.Add('(');
          qryAtualiza.SQL.Add('CHAVE NVARCHAR(100) NOT NULL PRIMARY KEY,');
          qryAtualiza.SQL.Add('ID_USUARIO NVARCHAR(20) NOT NULL,');
          qryAtualiza.SQL.Add('FORMULARIO NVARCHAR(100) NOT NULL,');
          qryAtualiza.SQL.Add('INSTRUCAO NVARCHAR(100),');
          qryAtualiza.SQL.Add('VALOR NVARCHAR(100),');
          qryAtualiza.SQL.Add('CAMPO IMAGE,');
          qryAtualiza.SQL.Add(')');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('CREATE INDEX ID_USUARIO ON TASK (ID_USUARIO)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('CREATE INDEX FORMULARIO ON TASK (FORMULARIO)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('CREATE INDEX FORMULARIO ON TASK (INSTRUCAO)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100045);
  end;
  {$ENDREGION}

  {$REGION '20100046'}
  if VerificaVersaoBase(20100046) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE SCORED_CARD_FILTRO DROP CONSTRAINT [CK SCORED_CARD_FILTRO PERC_AJUSTE]');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100046);
  end;
  {$ENDREGION}

  {$REGION '20100047'}
  if VerificaVersaoBase(20100047) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION_MY_SQL DROP COLUMN SQL_BASICO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN ACESSA_DECISION_MY_SQL');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN ACESSA_PERMISSOES_DECISION_MY_SQL');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DROP TABLE CUBO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DROP TABLE CENARIOS_CUBO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DROP INDEX ID_CUBO ON CENARIOS');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DROP INDEX ID_CUBO ON PADROES');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE CENARIOS DROP COLUMN ID_CUBO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PADROES DROP COLUMN ID_CUBO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DELETE FROM PADROES WHERE ID_CENARIO LIKE ' + #39 + '_#CUBO#_%' + #39);
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('DELETE FROM CENARIOS WHERE ID_CENARIO LIKE ' + #39 + '_#CUBO#_%' + #39);
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('sp_rename ' + #39 + 'CENARIOS_DECISION_MY_SQL' + #39 + ', ' + #39 + 'CENARIOS_DECISION' + #39);

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('sp_rename ' + #39 + 'DECISION_MY_SQL' + #39 + ', ' + #39 + 'DECISION' + #39);

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('sp_rename ' + #39 + 'DECISION_MY_SQL_USUARIO' + #39 + ', ' + #39 + 'DECISION_USUARIO' + #39);

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD MY_SQL_HOSTNAME NVARCHAR(30)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD MY_SQL_DATA_BASE NVARCHAR(30)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD MY_SQL_USUARIO NVARCHAR(30)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD MY_SQL_SENHA NVARCHAR(30)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD MY_SQL_PORT INT');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN HOSTNAME');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN DATA_BASE');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN USUARIO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN SENHA');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN PORT');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE DECISION DROP COLUMN FECTHROWS');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100047);
  end;
  {$ENDREGION}

  {$REGION '20100048'}
  if VerificaVersaoBase(20100048) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN MY_SQL_HOSTNAME');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN MY_SQL_DATA_BASE');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN MY_SQL_USUARIO');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN MY_SQL_SENHA');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS DROP COLUMN MY_SQL_PORT');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100048);
  end;
  {$ENDREGION}

  {$REGION '20100051'}
  if VerificaVersaoBase(20100051) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD COD_PARAMETRO INT');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD UTILIZAR_SSL BIT');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD DT_LIMITE_ATUALIZACAO DATETIME');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD MAIL_ASSUNTO NVARCHAR(100)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD MAIL_MENSAGEM NVARCHAR(500)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('UPDATE PARAMETROS');
          qryAtualiza.SQL.Add('SET COD_PARAMETRO = 1');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS ALTER COLUMN COD_PARAMETRO INTEGER NOT NULL');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE PARAMETROS');
          qryAtualiza.SQL.Add('ADD CONSTRAINT pk_PARAMETROS PRIMARY KEY (COD_PARAMETRO)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD ACESSA_WEBBI NVARCHAR(1)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE USUARIOS');
          qryAtualiza.SQL.Add('ADD COD_USUARIO INT');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('CREATE INDEX ixCOD_USUARIO ON USUARIOS (COD_USUARIO)');

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('UPDATE USUARIOS');
          qryAtualiza.SQL.Add('SET COD_USUARIO = 1');
          qryAtualiza.SQL.Add('WHERE ID_USUARIO = ' + #39 + 'admin' + #39);

          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          Query                := TADOQuery.Create(Application);
          Query.Connection     := dtmPrincipal.bdDados;
          Query.CursorLocation := clUseServer;

          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('SELECT ID_USUARIO FROM USUARIOS');
          Query.SQL.Add('WHERE ID_USUARIO <> ' + #39 + 'admin' + #39);
          Query.Open;
          Query.First;

          iCodUsuario := 2;

          while not Query.Eof do
          begin
              try
                  qryAtualiza.Close;
                  qryAtualiza.SQL.Clear;
                  qryAtualiza.SQL.Add('UPDATE USUARIOS');
                  qryAtualiza.SQL.Add('SET COD_USUARIO = ' + IntToStr(iCodUsuario));
                  qryAtualiza.SQL.Add('WHERE ID_USUARIO = ' + #39 + Query.FieldByName('ID_USUARIO').AsString + #39);
                  qryAtualiza.ExecSQL;
                  qryAtualiza.Close;
              except
              end;

              iCodUsuario := iCodUsuario + 1;
              Query.Next;
          end;

          Query.Close;
          Query.Free;
      except
      end;

      AtualizaVersaoBase(20100051);
  end;
  {$ENDREGION}

  {$REGION '20100052'}
  if VerificaVersaoBase(20100052) then
  begin
      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE EXCEL');
          qryAtualiza.SQL.Add('ADD MAIL_ASSUNTO NVARCHAR(100)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      try
          qryAtualiza.Close;
          qryAtualiza.SQL.Clear;
          qryAtualiza.SQL.Add('ALTER TABLE EXCEL');
          qryAtualiza.SQL.Add('ADD MAIL_MENSAGEM NVARCHAR(500)');
          qryAtualiza.ExecSQL;
          qryAtualiza.Close;
      except
      end;

      AtualizaVersaoBase(20100052);
  end;
  {$ENDREGION}

end;

function VerificaVersaoBase(Versao: Integer): Boolean;
var
    Query : TADOQuery;
begin
    Result := True;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT VERSAO_BASE FROM PARAMETROS');
        Query.Open;
        if not Query.IsEmpty then
        begin
           if Versao <= Query.Fields[0].AsInteger then
              Result := False;
        end
        else
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('INSERT INTO PARAMETROS (VERSAO_BASE) VALUES (0)');
            Query.ExecSQL;

            Result := True;
        end;
    except
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('CREATE TABLE PARAMETROS');
        Query.SQL.Add('(');
        Query.SQL.Add('VERSAO_BASE INT NOT NULL');
        Query.SQL.Add(')');
        Query.ExecSQL;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('INSERT INTO PARAMETROS (VERSAO_BASE) VALUES (0)');
        Query.ExecSQL;

        Result := True;
    end;

    Query.Close;
    Query.Free;
end;

procedure TdtmPrincipal.AtualizaVersaoBase(Versao: integer);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE PARAMETROS SET VERSAO_BASE = ' + IntToStr(Versao));
    Query.ExecSQL;

    Query.Close;
    Query.Free;
end;

procedure TdtmPrincipal.tblLoginBeforePost(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblLoginID_USUARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'USUARIOS','ID_USUARIO',aux) then abort;
end;

end.


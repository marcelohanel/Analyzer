unit uFuncoes;

interface

uses
   IdSSLOpenSSL, xhConsts, inifiles, ADODB, Forms, Variants, ComObj, Windows, Dialogs, Messages, SysUtils, Classes, Controls, StdCtrls,
   Graphics, DBGrids, DB, TeExport, IdBaseComponent, IdTCPConnection,
  IdSMTP, IdMessage, cxLocalization;

function NumEntries(Texto, Separador: String): integer;
function Entry(Entrada: Integer; Texto, Separador: String): String;
function enviaEmail(sEmailFrom, sEmailTo, sAssunto, sMensagem, sUserMail, sSenhaMail, sServidorEmail : String; iPorta: integer): boolean;
function VersaoExe(ArquivoExe: string): String;
function FindReplace (const Enc, subs: String; Var Texto: TMemo): boolean;
function NumEntry(Entrada: Integer; Texto, Separador: String): String;
function Entries(Texto, Separador: String): integer;
function Localiza (const Enc: String; Var Texto: TMemo): boolean;
function tbGetShortStr(const S: string; const Sep: Char): string;
function tbGetLongStr(const S: string; const Sep: Char): string;
function EnDecryptString(StrValue: AnsiString): AnsiString;
function SerialNum(FDrive:String) :String;
function ExecAndWait(const FileName, Parm: string; const WindowState: Word): boolean;
function DiaExtenso(Data:TDateTime): String;
function VerificaEmail(email: string): boolean;
function ReplaceStr (Text,oldstring,newstring:string):string;
function EncontraLista(Lista, Valor, Separador: string): boolean;
function ExistePadao(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String): boolean;
function DiasQuinzena(Data: TDateTime): integer;
function DiasMes(Mes: integer): integer;
function DiasTrimestre(Data: TDateTime): integer;
function DiasSemestre(Data: TDateTime): integer;
function DiasAno(Data: TDateTime): integer;
function LocalizaEntre(const TextoIni, TextoFim, Texto: String): string;
function RemoveAcento(Str: string): string;
function getVersion : string;
function VerificaPermissao(Conexao: TADOConnection; Usuario, CampoPermissao, CampoTitulo, Tabela, Filtro: string): Boolean;
function DeleteRestrict(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, ValorOrigem: String): boolean;
function DeleteCascade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, Valor: String): boolean;
function UpdateCascade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, ValorAntigo, ValorNovo: String): boolean;
function Integridade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, Valor: String): boolean;
function LePadraoString(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String): string;
function GeraSenhaHex(Digitos: Integer; Min: Boolean; Mai: Boolean; Num: Boolean): string;

procedure LePadraoStream(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String; var Stream: TMemoryStream);
procedure CopiaArquivo(Origem, Destino: string);
procedure EnviaMail(Arquivo, Titulo: string);
procedure GetBuildInfo(var V1, V2, V3, V4: Word);
procedure GeraLog(Conexao: TADOConnection; Usuario, Localizacao, Evento, Observacoes: string);
procedure SetLanguage(Tipo: integer; Localizer: TcxLocalizer);
procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
procedure LePadraoArquivo(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave, Arquivo: String);
procedure SalvaPadraoString(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave, Valor: String);
procedure SalvaPadraoString_1(Conexao: TADOConnection; Filtro, Campo, Campo1, Campo2, ValorCampo, ValorCampo1, ValorCampo2, Usuario, Formulario, Chave, Valor: String);
procedure SalvaPadraoStream(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave: String; Stream: TMemoryStream);
procedure SalvaPadraoStream_1(Conexao: TADOConnection; Usuario, Formulario, Chave: String; Stream: TMemoryStream);
procedure SalvaPadraoStream_2(Conexao: TADOConnection; Filtro, Campo, Campo1, Campo2, ValorCampo, ValorCampo1, ValorCampo2, Usuario, Formulario, Chave: String; Stream: TMemoryStream);
procedure SalvaPadraoArquivo(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave, Arquivo: String);

const
  msg1 = 'Caractere(s) inválido(s) no início do e-mail.';
  msg2 = 'Símbolo @ não foi encontrado.';
  msg3 = 'Excesso do símbolo @.';
  msg4 = 'Caractere(s) inválido(s) antes do símbolo @.';
  msg5 = 'Caractere(s) inválido(s) depois do símbolo @.';
  msg6 = 'Agrupamento de caractere(s) inválido(s) a esqueda do @.';
  msg7 = 'Não existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'Ausência de caractere(s) após o último ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada após o @.';
  msg12 = 'Caractere(s) inválido(s) antes do ponto.';
  msg13 = 'Caractere(s) inválido(s) depois do ponto.';

type
  TRoundToRange = -37..37;

var
  vet_valido: array [0..35] of string = ('0','1','2','3','4','5','6','7', '8','9','a','b','c','d','e','f', 'g','h','i','j','k','l','m','n', 'o','p','q','r','s','t','u','v', 'w','x','y','z');

implementation

function GeraSenhaHex(Digitos: Integer; Min: Boolean; Mai: Boolean; Num: Boolean): string;
const
MinC = 'abcdef';
MaiC = 'ABCDEF';
NumC = '1234567890';
var
p, q : Integer;
Char, Senha: String;
begin
Char := '';
If Min then Char := Char + MinC;
If Mai then Char := Char + MaiC;
If Num then Char := Char + NumC;
for p := 1 to Digitos do
  begin
    Randomize;
    q := Random(Length(Char)) + 1;
    Senha := Senha + Char[q];
  end;
Result := Senha;
end;

procedure SalvaPadraoArquivo(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave, Arquivo: String);
var
    Query   : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    try
       if FileExists(Arquivo) then
       begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('SELECT ' + Campo + ', ID_USUARIO, FORMULARIO, CHAVE, VALOR FROM PADROES');
           Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
           Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
           Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

           if Filtro <> '' then
              Query.SQL.Add('AND ' + Filtro);

           Query.Open;
           Query.First;

           if Query.IsEmpty then
              Query.Insert
           else
              Query.Edit;

           Query.Fields[0].Value := ValorCampo;
           Query.Fields[1].Value := Usuario;
           Query.Fields[2].Value := Formulario;
           Query.Fields[3].Value := Chave;
           TBlobField(Query.Fields[4]).LoadFromFile(Arquivo);

           Query.Post;
           Query.Close;
       end;
    except
    end;

    Query.Free;
end;

procedure SalvaPadraoStream(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave: String; Stream: TMemoryStream);
var
    Query   : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    try
         Query.Close;
         Query.SQL.Clear;
         Query.SQL.Add('SELECT ' + Campo + ', ID_USUARIO, FORMULARIO, CHAVE, VALOR FROM PADROES');
         Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
         Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
         Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

         if Filtro <> '' then
            Query.SQL.Add('AND ' + Filtro);

         Query.Open;
         Query.First;

         if Query.IsEmpty then
            Query.Insert
         else
            Query.Edit;

         Query.Fields[0].Value := ValorCampo;
         Query.Fields[1].Value := Usuario;
         Query.Fields[2].Value := Formulario;
         Query.Fields[3].Value := Chave;
         Stream.Position := 0;
         TBlobField(Query.Fields[4]).LoadFromStream(Stream);

         Query.Post;
         Query.Close;
    except
    end;

    Query.Free;
end;

procedure SalvaPadraoStream_1(Conexao: TADOConnection; Usuario, Formulario, Chave: String; Stream: TMemoryStream);
var
    Query   : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    try
         Query.Close;
         Query.SQL.Clear;
         Query.SQL.Add('SELECT ID_USUARIO, FORMULARIO, CHAVE, VALOR FROM PADROES');
         Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
         Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
         Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

         Query.Open;
         Query.First;

         if Query.IsEmpty then
            Query.Insert
         else
            Query.Edit;

         Query.Fields[0].Value := Usuario;
         Query.Fields[1].Value := Formulario;
         Query.Fields[2].Value := Chave;
         Stream.Position := 0;
         TBlobField(Query.Fields[3]).LoadFromStream(Stream);

         Query.Post;
         Query.Close;
    except
    end;

    Query.Free;
end;

procedure SalvaPadraoStream_2(Conexao: TADOConnection; Filtro, Campo, Campo1, Campo2, ValorCampo, ValorCampo1, ValorCampo2, Usuario, Formulario, Chave: String; Stream: TMemoryStream);
var
    Query   : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    try
         Query.Close;
         Query.SQL.Clear;
         Query.SQL.Add('SELECT ' + Campo + ',' + Campo1 + ',' + Campo2 + ', ID_USUARIO, FORMULARIO, CHAVE, VALOR FROM PADROES');
         Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
         Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
         Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

         if Filtro <> '' then
            Query.SQL.Add('AND ' + Filtro);

         Query.Open;
         Query.First;

         if Query.IsEmpty then
            Query.Insert
         else
            Query.Edit;

         Query.Fields[0].Value := ValorCampo;
         Query.Fields[1].Value := ValorCampo1;
         Query.Fields[2].Value := ValorCampo2;
         Query.Fields[3].Value := Usuario;
         Query.Fields[4].Value := Formulario;
         Query.Fields[5].Value := Chave;
         Stream.Position := 0;
         TBlobField(Query.Fields[6]).LoadFromStream(Stream);

         Query.Post;
         Query.Close;
    except
    end;

    Query.Free;
end;

procedure SalvaPadraoString(Conexao: TADOConnection; Filtro, Campo, ValorCampo, Usuario, Formulario, Chave, Valor: String);
var
    Query   : TADOQuery;
    lInsert : boolean;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    lInsert := True;

    try
        if ExistePadao(Conexao,Filtro,Usuario,Formulario,Chave) then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('UPDATE PADROES');
            Query.SQL.Add('  SET      VALOR = ' + #39 + Valor + #39);
            Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
            Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
            Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

            if Filtro <> '' then
               Query.SQL.Add('AND ' + Filtro);

            Query.ExecSQL;
            Query.Close;
        end
        else
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('INSERT INTO PADROES (VALOR, ' + Campo + ', ID_USUARIO, FORMULARIO, CHAVE)');
            Query.SQL.Add('VALUES (' + #39 + Valor + #39);
            Query.SQL.Add(',' + #39 + ValorCampo + #39);
            Query.SQL.Add(',' + #39 + Usuario + #39);
            Query.SQL.Add(',' + #39 + Formulario + #39);
            Query.SQL.Add(',' + #39 + Chave + #39 + ')');
            Query.ExecSQL;
            Query.Close;
        end;
    except
    end;

    Query.Free;
end;

procedure SalvaPadraoString_1(Conexao: TADOConnection; Filtro, Campo, Campo1, Campo2, ValorCampo, ValorCampo1, ValorCampo2, Usuario, Formulario, Chave, Valor: String);
var
    Query   : TADOQuery;
    lInsert : boolean;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    lInsert := True;

    try
        if ExistePadao(Conexao,Filtro,Usuario,Formulario,Chave) then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('UPDATE PADROES');
            Query.SQL.Add('  SET      VALOR = ' + #39 + Valor + #39);
            Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
            Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
            Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

            if Filtro <> '' then
               Query.SQL.Add('AND ' + Filtro);

            Query.ExecSQL;
            Query.Close;
        end
        else
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('INSERT INTO PADROES (VALOR, ' + Campo + ',' + Campo1 + ',' + Campo2 + ', ID_USUARIO, FORMULARIO, CHAVE)');
            Query.SQL.Add('VALUES (' + #39 + Valor + #39);
            Query.SQL.Add(',' + #39 + ValorCampo + #39);
            Query.SQL.Add(',' + #39 + ValorCampo1 + #39);
            Query.SQL.Add(',' + #39 + ValorCampo2 + #39);
            Query.SQL.Add(',' + #39 + Usuario + #39);
            Query.SQL.Add(',' + #39 + Formulario + #39);
            Query.SQL.Add(',' + #39 + Chave + #39 + ')');
            Query.ExecSQL;
            Query.Close;
        end;
    except
    end;

    Query.Free;
end;

procedure LePadraoArquivo(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave, Arquivo: String);
var
    Query : TADOQuery;
begin
    try
        Query                := TADOQuery.Create(Application);
        Query.Connection     := Conexao;
        Query.CursorLocation := clUseServer;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT VALOR FROM PADROES');
        Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
        Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
        Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

        if Filtro <> '' then
           Query.SQL.Add('AND ' + Filtro);

        Query.Open;
        Query.First;
        if not Query.IsEmpty then
           TBlobField(Query.Fields[0]).SaveToFile(Arquivo);

        Query.Close;
        Query.Free;
    except
    end;
end;

procedure LePadraoStream(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String; var Stream: TMemoryStream);
var
    Query : TADOQuery;
begin
    try
        Query                := TADOQuery.Create(Application);
        Query.Connection     := Conexao;
        Query.CursorLocation := clUseServer;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT VALOR FROM PADROES');
        Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
        Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
        Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

        if Filtro <> '' then
           Query.SQL.Add('AND ' + Filtro);

        Query.Open;
        Query.First;
        if not Query.IsEmpty then
           TBlobField(Query.Fields[0]).SaveToStream(Stream);

        Query.Close;
        Query.Free;
    except
    end;
end;

function LePadraoString(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String): string;
var
    Query : TADOQuery;
    sReturn : string;
begin
    sReturn := '';

    try
        Query                := TADOQuery.Create(Application);
        Query.Connection     := Conexao;
        Query.CursorLocation := clUseServer;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT VALOR FROM PADROES');
        Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
        Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
        Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

        if Filtro <> '' then
           Query.SQL.Add('AND ' + Filtro);

        Query.Open;
        Query.First;

        sReturn := Query.Fields[0].AsString;

        Query.Close;
        Query.Free;
    except
    end;

    result := sReturn;
end;

function ExistePadao(Conexao: TADOConnection; Filtro, Usuario, Formulario, Chave: String): boolean;
var
    Query   : TADOQuery;
    lExiste : boolean;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    lExiste := False;

    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT COUNT(ID_USUARIO) FROM PADROES');
        Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
        Query.SQL.Add('  AND FORMULARIO = ' + #39 + Formulario + #39);
        Query.SQL.Add('  AND      CHAVE = ' + #39 + Chave + #39);

        if Filtro <> '' then
           Query.SQL.Add('AND ' + Filtro);

        Query.Open;
        Query.First;

        if Query.Fields[0].AsInteger > 0 then
           lExiste := True;

        Query.Close;
    except
    end;

    Query.Free;

    Result := lExiste;
end;

function DeleteRestrict(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, ValorOrigem: String): boolean;
var
    qryIntegridade : TADOQuery;
begin
    Result := True;

    qryIntegridade                := TADOQuery.Create(Application);
    qryIntegridade.Connection     := Conexao;
    qryIntegridade.CursorLocation := clUseServer;

    if Tipo = 0 then
    begin
        if (ValorOrigem <> '') and (pchar(ValorOrigem) <> nil) and (ValorOrigem <> #39 + #39) then
        begin
            try
                qryIntegridade.Close;
                qryIntegridade.SQL.Clear;
                qryIntegridade.SQL.Add('SELECT TOP 1 ' + CampoDestino + ' FROM [' + TabelaDestino + ']');
                qryIntegridade.SQL.Add('WHERE [' + CampoDestino + '] = ' + ValorOrigem);
                qryIntegridade.Open;
                if qryIntegridade.IsEmpty = False then
                begin
                    qryIntegridade.Close;
                    MessageDlg(HCLResourceStrings.FindID('sString_49') + TabelaDestino, mtInformation, [mbOK], 0);
                    Result := False;
                end;
            except
                on E: Exception do
                begin
                    qryIntegridade.Close;
                    MessageDlg(HCLResourceStrings.FindID('sString_23') +#13+#10 +
                               HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                    Result := False;
                end;
            end;

            qryIntegridade.Close;
        end;
    end;

    qryIntegridade.Close;
    qryIntegridade.Free;
end;

function DeleteCascade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, Valor: String): boolean;
var
    qryIntegridade : TADOQuery;
begin
    Result := True;

    qryIntegridade                := TADOQuery.Create(Application);
    qryIntegridade.Connection     := Conexao;
    qryIntegridade.CursorLocation := clUseServer;

    if Tipo = 0 then
    begin
        try
            qryIntegridade.Close;
            qryIntegridade.SQL.Clear;
            qryIntegridade.SQL.Add('DELETE FROM [' + TabelaDestino + ']');
            qryIntegridade.SQL.Add('WHERE [' + CampoDestino + '] = ' + Valor);
            qryIntegridade.ExecSQL;
            qryIntegridade.Close;
        except
            on E: Exception do
            begin
                qryIntegridade.Close;
                MessageDlg(HCLResourceStrings.FindID('sString_23') +#13+#10 +
                           HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                Result := False;
            end;
        end;
    end;

    qryIntegridade.Close;
    qryIntegridade.Free;
end;

function UpdateCascade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, ValorAntigo, ValorNovo: String): boolean;
var
    qryIntegridade : TADOQuery;
begin
    Result := True;

    qryIntegridade                := TADOQuery.Create(Application);
    qryIntegridade.Connection     := Conexao;
    qryIntegridade.CursorLocation := clUseServer;

    if Tipo = 0 then
    begin
        if ValorAntigo <> ValorNovo then
        begin
            try
                qryIntegridade.Close;
                qryIntegridade.SQL.Clear;
                qryIntegridade.SQL.Add('UPDATE [' + TabelaDestino + ']');
                qryIntegridade.SQL.Add('SET    [' + CampoDestino + '] = ' + ValorNovo);
                qryIntegridade.SQL.Add('WHERE  [' + CampoDestino + '] = ' + ValorAntigo);
                qryIntegridade.ExecSQL;
                qryIntegridade.Close;
            except
                on E: Exception do
                begin
                    qryIntegridade.Close;
                    MessageDlg(HCLResourceStrings.FindID('sString_23') +#13+#10 +
                               HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                    Result := False;
                end;
            end;
        end;
    end;

    qryIntegridade.Close;
    qryIntegridade.Free;
end;

function Integridade(Conexao: TADOConnection; Tipo: Integer; TabelaDestino, CampoDestino, Valor: String): boolean;
var
    qryIntegridade : TADOQuery;
begin
    Result := True;

    qryIntegridade                := TADOQuery.Create(Application);
    qryIntegridade.Connection     := Conexao;
    qryIntegridade.CursorLocation := clUseServer;

    if Tipo = 0 then
    begin
        if (Valor <> '') and (pchar(Valor) <> nil) and (Valor <> #39 + #39) then
        begin
            try
                qryIntegridade.Close;
                qryIntegridade.SQL.Clear;
                qryIntegridade.SQL.Add('SELECT TOP 1 ' + CampoDestino + ' FROM [' + TabelaDestino + ']');
                qryIntegridade.SQL.Add('WHERE [' + CampoDestino + '] = ' + Valor);
                qryIntegridade.Open;
                if qryIntegridade.IsEmpty then
                begin
                    qryIntegridade.Close;
                    MessageDlg(HCLResourceStrings.FindID('sString_52') + TabelaDestino, mtInformation, [mbOK], 0);
                    Result := False;
                end;
            except
                on E: Exception do
                begin
                    qryIntegridade.Close;
                    MessageDlg(HCLResourceStrings.FindID('sString_23') +#13+#10 +
                               HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                    Result := False;
                end;
            end;

            qryIntegridade.Close;
        end;
    end;

    qryIntegridade.Close;
    qryIntegridade.Free;
end;

function VerificaPermissao(Conexao: TADOConnection; Usuario, CampoPermissao, CampoTitulo, Tabela, Filtro: string): Boolean;
var
    Query : TADOQuery;
    lPode : boolean;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT');
    Query.SQL.Add(' ' + CampoTitulo);
    Query.SQL.Add(',' + CampoPermissao);

    if Tabela = 'ANALISES' then
       Query.SQL.Add(', INTERNA');

    Query.SQL.Add('FROM');
    Query.SQL.Add(Tabela);

    if Filtro <> '' then
       Query.SQL.Add('WHERE ' + CampoTitulo + ' = ' + #39 + Filtro + #39);

    Query.Open;

    Query.Open;
    Query.First;

    lPode := False;

    if EncontraLista(Query.FieldByName(campoPermissao).Value,'#*'         ,',') then lPode := False else
    if EncontraLista(Query.FieldByName(campoPermissao).Value,'#' + Usuario,',') then lPode := False else
    if EncontraLista(Query.FieldByName(campoPermissao).Value,'*'          ,',') then lPode := True  else
    if EncontraLista(Query.FieldByName(campoPermissao).Value,Usuario      ,',') then lPode := True;

    if lPode then
       if Tabela = 'ANALISES' then
          if Query.FieldByName('INTERNA').Value = 'S' then
             lPode := False;

    Query.Close;
    Query.Free;

    Result := lPode;
end;

procedure SetResourceString(AResString: PResStringRec; ANewValue: PChar);
var
    POldProtect: DWORD;
begin
    VirtualProtect(AResString, SizeOf(AResString^), PAGE_EXECUTE_READWRITE, @POldProtect);
    AResString^.Identifier := Integer(ANewValue);
    VirtualProtect(AResString, SizeOf(AResString^), POldProtect, @POldProtect);
end;

function RemoveAcento(Str: string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
   x: Integer;
begin;
  for x := 1 to Length(Str) do
  if Pos(Str[x],ComAcento) <> 0 then
    Str[x] := SemAcento[Pos(Str[x], ComAcento)];

  Result := Str;
end;

procedure SetLanguage(Tipo: integer; Localizer: TcxLocalizer);
var
  FileResource : TIniFile;
  ListResource : TStringList;
  iResource : integer;
  sFile : string;
begin
    sFile := ExtractFilePath(Application.ExeName) + 'Language.ini';

    if not FileExists(sFile) then
       sFile := 'C:\Analyzer\Language.ini';

    if not FileExists(sFile) then
       Exit;

    if Tipo = 1 then
    begin
        try
            ListResource := TStringList.Create;
            FileResource := TIniFile.Create(sFile);
            FileResource.ReadSection('Custom Resource Strings',ListResource);

            for iResource := 0 to ListResource.Count - 1 do
                AddResStr(ListResource.Strings[iResource],FileResource.ReadString('Custom Resource Strings',ListResource.Strings[iResource],''));

            FileResource.Free;
            ListResource.Free;
        except
        end;
    end;

    if Tipo = 2 then
    begin
        try
            Localizer.FileName := sFile;
            Localizer.Active   := True;
            Localizer.Language := Localizer.Languages[0].Name;
        except
        end;
    end;
end;

procedure GeraLog(Conexao: TADOConnection; Usuario, Localizacao, Evento, Observacoes: string);
var
    lpBuffer : array[0..20] of Char;
    nSize : dword;
    Query : TADOQuery;
    sCom : string;
    sAplic : string;
    sGera : string;
begin
    nSize := 120;
    GetComputerName(lpBuffer,nSize);
    sCom  := lpBuffer;
    sAplic := Application.ExeName;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := Conexao;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT GERA_LOG FROM USUARIOS');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + Usuario + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
       sGera := Query.Fields[0].AsString;

    Query.Close;

    if sGera <> 'S' then
       Exit;

    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('INSERT INTO LOGS ( ID_USUARIO, LOCALIZACAO, EVENTO, EQUIPAMENTO, APLICATIVO, OBSERVACOES, VERSAO )');
        Query.SQL.Add('VALUES (');
        Query.SQL.Add(' ' + #39 + ReplaceStr(Usuario,#39,'')     + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(Localizacao,#39,'') + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(Evento,#39,'')      + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(sCom,#39,'')        + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(sAplic,#39,'')      + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(Observacoes,#39,'') + #39);
        Query.SQL.Add(',' + #39 + ReplaceStr(GetVersion,#39,'')  + #39);
        Query.SQL.Add(')');
        Query.ExecSQL;
    except
    end;

    Query.Close;
    Query.Free;
end;

function enviaEmail(sEmailFrom, sEmailTo, sAssunto, sMensagem, sUserMail, sSenhaMail, sServidorEmail : String; iPorta: integer): boolean;
var
  IdSMTP     : TIdSMTP;
  IdMessage1 : TIdMessage;
begin
   Result := True;

  // Esta função envia emails apartir dos parametros passados
  // remetente
  IdMessage1                           := TIdMessage.Create(Application);
  IdMessage1.From.Address              := sEmailFrom;
  IdMessage1.From.Domain               := Entry(2,sEmailFrom,'@');
  IdMessage1.From.Text                 := sEmailFrom;
  IdMessage1.From.User                 := Entry(1,sEmailFrom,'@');
  IdMessage1.Recipients.EMailAddresses := sEmailTo;
  IdMessage1.Subject                   := sAssunto;
  IdMessage1.Body.Text                 := sMensagem;

  //servidor de email
  IdSMTP          := TIdSMTP.Create(Application);
  IdSMTP.Host     := sServidorEmail;
  IdSMTP.Password := sSenhaMail;
  IdSMTP.Username := sUserMail;
  IdSMTP.Port     := iPorta;


{  if sDirAnexo <> '' then
    TIdAttachmentFile.Create(IdMessage1.MessageParts, sDirAnexo);
 }
  try
    try
      idSMTP.Connect;
      idSMTP.Send(IdMessage1);
    except
    begin
        {MessageDlg('Erro ao enviar email, reveja parâmetros: ' + #13#10 + #13+#10 +
                   'Servidor de email: ' + sServidorEmail      + #13#10 + #13+#10 +
                   'Remetente: '         + sEmailFrom          + #13#10 + #13+#10 +
                   'Destinatário: '      + sEmailTo, mtWarning, [mbOK], 0);
      Abort;}
    end;
    end;
  finally
      IdSMTP.Disconnect;
  end;
end;

function NumEntries(Texto, Separador: String): integer;
var
    i : integer;
    cont : integer;
begin
    cont := 1;
    for i := 1 to Length(Texto) do
    begin
        if Copy(Texto,i,1) = Separador then
           cont := cont + 1;
    end;

{    if cont = 1 then
       cont := -1;}

    result := cont;
end;

function Entry(Entrada: Integer; Texto, Separador: String): String;
var
    c, i : integer;
    aux :  string;
begin
    c   := 1;
    aux := '';

    if NumEntries(Texto,Separador) >= Entrada then
    begin
        for i := 1 to Length(Texto) do
        begin
            if Texto[i] <> Separador then
            begin
                aux := aux + Texto[i];
            end
            else
            begin
                if c = Entrada then
                   break;

                c := c + 1;
                aux := '';
            end;
        end;
    end;

    result := aux;
end;

function Criptografar(Texto : String) : String;
var
   I: Integer;
   Saida : String;
   Chave : word;
begin
    Chave := 4570;
    Saida := '';

    For I := 1 to Length (Texto) do
        Saida := Saida + Char ( Not ( Ord ( Texto[I] ) - Chave ) );

    Result := Saida;
end;

function getVersion : string;
{ ---------------------------------------------------------
   Extracts the FileVersion element of the VERSIONINFO
   structure that Delphi maintains as part of a project's
   options.

   Results are returned as a standard string.  Failure
   is reported as "".

   Note that this implementation was derived from similar
   code used by Delphi to validate ComCtl32.dll.  For
   details, see COMCTRLS.PAS, line 3541.
  -------------------------------------------------------- }
const
   NOVIDATA = '';

var
  dwInfoSize,           // Size of VERSIONINFO structure
  dwVerSize,            // Size of Version Info Data
  dwWnd: DWORD;         // Handle for the size call.
  FI: PVSFixedFileInfo; // Delphi structure; see WINDOWS.PAS
  ptrVerBuf: Pointer;   // pointer to a version buffer
  strFileName,          // Name of the file to check
  strVersion : string;  // Holds parsed version number
begin

   strFileName := paramStr( 0 );
   dwInfoSize :=
      getFileVersionInfoSize( pChar( strFileName ), dwWnd);

   if ( dwInfoSize = 0 ) then
      result := NOVIDATA
   else
   begin

      getMem( ptrVerBuf, dwInfoSize );
      try

         if getFileVersionInfo( pChar( strFileName ),
            dwWnd, dwInfoSize, ptrVerBuf ) then

            if verQueryValue( ptrVerBuf, '\',
                              pointer(FI), dwVerSize ) then

            strVersion :=
               format( '%d.%d.%d.%d',
                       [ hiWord( FI.dwFileVersionMS ),
                         loWord( FI.dwFileVersionMS ),
                         hiWord( FI.dwFileVersionLS ),
                         loWord( FI.dwFileVersionLS ) ] );

      finally
        freeMem( ptrVerBuf );
      end;
    end;
  Result := strVersion;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: Word);
var
VerInfoSize, VerValueSize, Dummy: DWORD;
VerInfo: Pointer;
VerValue: PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(Pchar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(Pchar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '''', Pointer(VerValue), VerValueSize);
with VerValue^ do
begin
V1 := dwFileVersionMS shr 16;
V2 := dwFileVersionMS and $FFFF;
V3 := dwFileVersionLS shr 16;
V4 := dwFileVersionLS and $FFFF;
end;
Freemem(VerInfo, VerInfoSize);
end;

function VersaoExe(ArquivoExe: string): String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F       : PFFI;
  Handle  : Dword;
  Len     : Longint;
  Data    : Pchar;
  Buffer  : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo  := ArquivoExe;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
     Data:=StrAlloc(Len+1);
     if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
     begin
        VerQueryValue(Data, '\',Buffer,Tamanho);
        F := PFFI(Buffer);
        Result := Format('%d%d%d%d',
                         [HiWord(F^.dwFileVersionMs),
                          LoWord(F^.dwFileVersionMs),
                          HiWord(F^.dwFileVersionLs),
                          Loword(F^.dwFileVersionLs)]
                        );
     end;
     StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

procedure EnviaMail(Arquivo, Titulo: string);
begin
    try
       TeeEmailFile(Arquivo,Titulo);
    except
    end;
    DeleteFile(Arquivo);
end;

function DiasAno(Data: TDateTime): integer;
begin
    Result := DiasMes(01) +
              DiasMes(02) +
              DiasMes(03) +
              DiasMes(04) +
              DiasMes(05) +
              DiasMes(06) +
              DiasMes(07) +
              DiasMes(08) +
              DiasMes(09) +
              DiasMes(10) +
              DiasMes(11) +
              DiasMes(12);
end;

function DiasTrimestre(Data: TDateTime): integer;
begin
    if (StrToInt(Copy(DateToStr(Data),4,2)) = 01) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 02) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 03) then
        Result := DiasMes(01) + DiasMes(02) + DiasMes(03)
    else
    if (StrToInt(Copy(DateToStr(Data),4,2)) = 04) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 05) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 06) then
        Result := DiasMes(04) + DiasMes(05) + DiasMes(06)
    else
    if (StrToInt(Copy(DateToStr(Data),4,2)) = 07) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 08) or
       (StrToInt(Copy(DateToStr(Data),4,2)) = 09) then
        Result := DiasMes(07) + DiasMes(08) + DiasMes(09)
    else
        Result := DiasMes(10) + DiasMes(11) + DiasMes(12);
end;

function DiasSemestre(Data: TDateTime): integer;
begin
    if (StrToInt(Copy(DateToStr(Data),4,2)) >= 01) and
       (StrToInt(Copy(DateToStr(Data),4,2)) <= 06) then
        Result := DiasMes(01) +
                  DiasMes(02) +
                  DiasMes(03) +
                  DiasMes(04) +
                  DiasMes(05) +
                  DiasMes(06)
    else
        Result := DiasMes(07) +
                  DiasMes(08) +
                  DiasMes(09) +
                  DiasMes(10) +
                  DiasMes(11) +
                  DiasMes(12);
end;

function DiasQuinzena(Data: TDateTime): integer;
var
    Mes : integer;
begin
    Mes := DiasMes(StrToInt(Copy(DateToStr(Data),4,2)));

    if StrToInt(Copy(DateToStr(Data),1,2)) <= 15 then
       Result := 15
    else
       Result := Mes - 15;
end;

function DiasMes(Mes: integer): integer;
begin
    if (Mes = 02) then
        Result := 28
    else
    if (Mes = 01) or
       (Mes = 03) or
       (Mes = 05) or
       (Mes = 07) or
       (Mes = 08) or
       (Mes = 10) or
       (Mes = 12) then
        Result := 31
    else
    if (Mes = 04) or
       (Mes = 06) or
       (Mes = 09) or
       (Mes = 11) then
        Result := 30
    else
        Result := 30;
end;

function Entries(Texto, Separador: String): integer;
var
    i : integer;
    cont : integer;
begin
    cont := 1;
    for i := 1 to Length(Texto) do
    begin
        if Copy(Texto,i,1) = Separador then
           cont := cont + 1;
    end;
    result := cont;
end;

function EncontraLista(Lista, Valor, Separador: string): boolean;
var
    i : integer;
    aux : boolean;
begin
    aux := False;
    for i := 1 to Entries(Lista,Separador) do
    begin
        if NumEntry(i,Lista,Separador) = Valor then
           aux := True;
    end;

    Result := aux;
end;

function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

function NumEntry(Entrada: Integer; Texto, Separador: String): String;
var
    c, i : integer;
    aux, fim : string;
begin
    c   := 1;
    aux := '';

    for i := 1 to Length(Texto) do
    begin
        if Copy(Texto,i,1) <> Separador then
           aux := aux + Copy(Texto,i,1)
        else
        begin
            if c = Entrada then
               fim := aux;

            c := c + 1;
            aux := '';
        end;
    end;

    if (aux <> '') and (fim = '') then
       fim := aux;

    Result := fim;
end;

function VerificaEmail(email: string): boolean;
var
  i, j, tam_email, simb_arroba, simb_arroba2, qtd_arroba, qtd_pontos,
  qtd_pontos_esq, qtd_pontos_dir, posicao, posicao2, ponto, ponto2: integer;
  vet_email: array [0..49] of string; //50 posições, capacidade do Edit
  msg: string;
begin
  {Por Jaci Jr em 12-10-2001 (00:28 às 03:57)
  Contatos por jrcordeiro@eletroacre.com.br ou
  jrcordeiro@bol.com.br
  Nesta função (func_VerifEmail) é utilizada a função Copy, exemplo:
  Copy(s,i,t) significa trecho de s que começa em i com tamanho t}

  qtd_pontos:= 0; qtd_pontos_esq:= 0; qtd_pontos_dir:= 0; qtd_arroba:= 0;
  posicao:=0; posicao2:=0; simb_arroba:=0; simb_arroba2:=0; ponto:= 0;
  ponto2:= 0; msg:='';
  Result:= True;

  //Verificando parte inicial do E-mail
  tam_email:= Length(email);
  for i:= 0 to tam_email-1 do
  begin
  vet_email[i]:= Copy(email,i+1,1);
  if vet_email[i] = '@' then
  begin
  Inc(qtd_arroba);
  posicao:= i;
  end;
  end;

  if ((vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-')) then
  begin
  Result:= False;
  msg:= msg1;
  end;

  //Verificando se tem o símbolo @ e quantos tem
  if qtd_arroba < 1 then
  begin
  Result:= False;
  msg:= msg2;
  end
  else if qtd_arroba > 1 then
  begin
  Result:= False;
  msg:= msg3 + ' Encontrado(s): '+IntToStr(qtd_arroba)+'.';
  end
  else
  //Verificando o que vem antes e depois do símbolo @
  begin
  for i:=0 to 35 do
  begin
  if vet_email[posicao-1] <> vet_valido[i] then Inc(simb_arroba)
  else Dec(simb_arroba);
  if vet_email[posicao+1] <> vet_valido[i] then Inc(simb_arroba2)
  else Dec(simb_arroba2);
  end;
  if simb_arroba = 36 then
  begin
  //Antes do arroba há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg4;
  end
  else if simb_arroba2 = 36 then
  begin
  //Depois do arroba há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg5;
  end
  end;

  //Verificando se há pontos e quantos, e Verificando parte final do e-mail
  for j:=0 to tam_email-1 do
  if vet_email[j] = '-' then
  if ((vet_email[j-1] = '.') or (vet_email[j-1] = '-')) then
  begin
  Result:= False;
  msg:= msg6;
  end;
  for i:=0 to tam_email-1 do
  if vet_email[i] = '.' then
  begin
  Inc(qtd_pontos);
  posicao2:= i+1;
  if i > posicao then Inc(qtd_pontos_dir)
  else Inc(qtd_pontos_esq);
  if ((vet_email[i-1] = '.') or (vet_email[i-1] = '-')) then
  begin
  Result:= False;
  msg:= msg6;
  end;
  end;
  if qtd_pontos < 1 then
  begin
  Result:= False;
  msg:= msg7;
  end
  else if vet_email[tam_email-1] = '.' then
  begin
  Result:= False;
  msg:= msg8;
  end
  else if vet_email[tam_email-2] = '.' then
  begin
  Result:= False;
  msg:= msg9;
  end
  else if qtd_pontos_dir > 2 then
  begin
  Result:= False;
  msg:= msg10 + ' Encontrado(s): '+
  IntToStr(qtd_pontos)+#10+'Encontrado(s) a direita do @: '+
  IntToStr(qtd_pontos_dir)+'.';
  end
  else if (not ((((tam_email - posicao2) = 3) and (qtd_pontos_dir = 1)) or
  (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 2)) or
  (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 1)))) then
  begin
  Result:= False;
  msg:= msg11 +#10+ 'Encontrado(s) a esquerda do @: '+
  IntToStr(qtd_pontos_esq) +#10+ 'Encontrado(s) a direita do @: '+
  IntToStr(qtd_pontos_dir)+'.';
  end
  else
  //Verificando o que vem antes e depois do ponto
  begin
  for i:=0 to 35 do
  begin
  if vet_email[posicao2-2] <> vet_valido[i] then Inc(ponto)
  else Dec(ponto);
  if vet_email[posicao2] <> vet_valido[i] then Inc(ponto2)
  else Dec(ponto2);
  end;
  if ponto = 36 then
  begin
  //Antes do ponto há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg12;
  end
  else if ponto2 = 36 then
  begin
  //Depois do ponto há um símbolo desconhecido do vetor válido
  Result:= False;
  msg:= msg13;
  end
  end;

  //Verificação final
  if not Result then
  begin
  msg:= msg +#10+ 'Formato de E-mail não aceitável!!';
  MessageDlg(msg,mtWarning,[mbRetry],0);
  end;
end;

procedure CopiaArquivo(Origem, Destino: string);
var
   SR     : TSearchRec;
   I      : integer;
begin
    I := FindFirst(Origem, faAnyFile, SR);
    while I = 0 do
    begin
        if (SR.Attr and faDirectory) <> faDirectory then
           CopyFile(PChar(Origem), PChar(Destino), true);

        I := FindNext(SR);
    end;
end;

function ExecAndWait(const FileName, Parm: string; const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := Filename + ' ' + Parm;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
  cb := SizeOf(SUInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then begin
  WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  { Libera os Handles }
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
  end;
end;

function SerialNum(FDrive:String) :String;
Var
   Serial:DWord;
   DirLen,Flags: DWord;
   DLabel : Array[0..11] of Char;
begin
    Try
       GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
       Result := IntToHex(Serial,8);
    Except
       Result :='';
    end;
end;

function EnDecryptString(StrValue: AnsiString): AnsiString;
var
  I: Integer;
  OutValue : AnsiString;
  Chave: Word;
begin

  Chave := 4570;
  OutValue := '';

  for I := 1 to Length(StrValue) do

    OutValue := OutValue + AnsiChar(not(ord(StrValue[I])-Chave));

  Result := OutValue;

end;



function tbGetShortStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := S
  else
  Result := Copy(S, 1, I - 1);
end;

function tbGetLongStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := ''
  else
  Result := Copy(S, I + 1, High(integer));
end;

function Localiza(const Enc: String; Var Texto: TMemo): boolean;
Var
   i, Posicao: Integer;
   Linha: string;
   vf : boolean;
Begin
    vf := false;
    For i:= 0 to Texto.Lines.count - 1 do
    begin
        Linha := Texto.Lines[i];
        Repeat
             Posicao:=Pos(uppercase(Enc),uppercase(Linha));
             If Posicao > 0 then
             Begin
                 vf := true;
                 break;
             end;
        until Posicao = 0;
    end;

    result := vf;
end;

function LocalizaEntre(const TextoIni, TextoFim, Texto: String): string;
Var
   PosicaoIni, PosicaoFim: Integer;
   aux: string;
Begin
    aux        := '';
    PosicaoIni := Pos(uppercase(TextoIni),uppercase(Texto));
    PosicaoFim := Pos(uppercase(TextoFim),uppercase(Texto));
    if PosicaoIni > 0 then
       aux := Copy(Texto,(PosicaoIni + Length(TextoIni)),(PosicaoFim - PosicaoIni - Length(TextoFim)));

    Result := aux;
end;

function FindReplace (const Enc, subs: String; Var Texto: TMemo): boolean;
Var
   i, Posicao: Integer;
   Linha: string;
   vf : boolean;
Begin
    vf := false;
    For i:= 0 to Texto.Lines.count - 1 do
    begin
        Linha := Texto. Lines[i];
        Repeat
             Posicao:=Pos(uppercase(Enc),uppercase(Linha));
             If Posicao > 0 then
             Begin
                 vf := true;
                 Delete(Linha,Posicao,Length(Enc));
                 Insert(Subs,Linha,Posicao);
                 Texto.Lines[i]:=Linha;
             end;
        until Posicao = 0;
    end;

    result := vf;
end;

function DiaExtenso(Data:TDateTime): String;
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-Feira';
  DiaDasemana [3]:= 'Terça-Feira';
  DiaDasemana [4]:= 'Quarta-Feira';
  DiaDasemana [5]:= 'Quinta-Feira';
  DiaDasemana [6]:= 'Sexta-Feira';
  DiaDasemana [7]:= 'Sábado';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia];
end;

end.

unit uScoredCard;

interface

uses
  xhConsts, cxTL, Math, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  ADODB, cxButtons, cxDBEdit,


  cxGridDBTableView, cxGridLevel,
  cxGrid, cxLabel,









  cxLookAndFeels,
  dxSkinsForm, cxLocalization,
  CEVersionInfo, cxGraphics, cxControls, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, Menus, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxMemo, cxTextEdit,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmScoredCard = class(TForm)
    dtsScoredCard: TDataSource;
    ADOQuery1: TADOQuery;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton6: TcxButton;
    DBEdit1: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Label1: TcxLabel;
    Label4: TcxLabel;
    Label3: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    DBCheckBox1: TcxDBCheckBox;
    ADOQuery2: TADOQuery;
    cxButton1: TcxButton;
    qryFiltro: TADOQuery;
    ADOQuery3: TADOQuery;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    tblScoredCard: TADOTable;
    tblScoredCardID_SCORED: TWideStringField;
    tblScoredCardDESCRICAO: TMemoField;
    tblScoredCardINCREMENTAL: TWideStringField;
    tblScoredCardPODE_VISUALIZAR: TMemoField;
    tblScoredCardPODE_ALTERAR: TMemoField;
    tblScoredCardPODE_ATUALIZAR: TMemoField;
    tblScoredCardPODE_APAGAR: TMemoField;
    tblScoredCardDT_ATUALIZACAO: TDateTimeField;
    tblScoredCardVALOR: TBlobField;
    tblScoredCardNRO_ATUALIZACOES: TIntegerField;
    tblScoredCardDT_MOVTO: TDateTimeField;
    tblScoredCardATUALIZA_SITUACAO_ANTERIOR: TWideStringField;
    tblScoredCardDT_CRIACAO: TDateTimeField;
    tblScoredCardEXCLUIR_MOVTO: TWideStringField;
    tblParametros: TADOTable;
    tblParametrosVERSAO_BASE: TIntegerField;
    tblParametrosSERVIDOR_MAIL: TWideStringField;
    tblParametrosPORTA_MAIL: TIntegerField;
    qryAtualiza: TADOQuery;
    cxLabel2: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    tblScoredCardGRUPO: TWideStringField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizaScored;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ExcluiBaseDados;
    procedure buscaDtMovto;
    procedure Processo_1;
    procedure Processo_2;
    procedure Processo_3;
    procedure Processo_4;
    procedure Processo_5;
    procedure Processo_6;
    procedure CriaTabelas;
    procedure cxButton1Click(Sender: TObject);
    procedure ExcluiTitulos;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblScoredCardBeforeDelete(DataSet: TDataSet);
    procedure tblScoredCardBeforePost(DataSet: TDataSet);
    procedure tblScoredCardFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    lErro        : boolean;
    dt_movto     : TDateTime;
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sMail : string;
    sUserMail : string;
    sSenhaMail : string;
    sAtualiza : string;
    sScoredParam : string;
    sPermissaoPermissaoScored : boolean;
    lAtualizaBatch            : boolean;
    sTempDirUsuario : string;
  end;

var
  frmScoredCard: TfrmScoredCard;

implementation

uses uFuncoes, uPermissoesScored, uVisualizarDadosScored, uAtualiza, uManScored;

{$R *.dfm}

procedure TfrmScoredCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblScoredCard.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmScoredCard.FormCreate(Sender: TObject);
var
    sAux : TMemo;
begin
    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_417'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    SetLanguage(2, cxLocalizer1);

    if FileExists(ParamStr(2)) then
    begin
        sAux := TMemo.Create(Application);
        sAux.Parent := Self;
        sAux.ScrollBars := ssBoth;

        sAux.Lines.LoadFromFile(ParamStr(2));
    end
    else
       Application.Terminate;

    sSkin                     := sAux.Lines.Strings[0];
    sSGBD                     := sAux.Lines.Strings[3];
    sUsuario                  := sAux.Lines.Strings[4];
    sBanco                    := sAux.Lines.Strings[5];
    sPermissaoPermissaoScored := StrToBool(sAux.Lines.Strings[6]);
    lAtualizaBatch            := StrToBool(sAux.Lines.Strings[7]);
    sMail                     := sAux.Lines.Strings[8];
    sUserMail                 := sAux.Lines.Strings[9];
    sSenhaMail                := sAux.Lines.Strings[10];
    sAtualiza                 := sAux.Lines.Strings[11];
    sScoredParam              := sAux.Lines.Strings[12];
    sTempDirUsuario           := 'C:\Analyzer\Temp\' + sUsuario + '\';

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := sAux.Lines.Strings[1];

      bdArmazena.Close;
      bdArmazena.ConnectionString := sAux.Lines.Strings[2];
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    FreeAndNil(sAux);

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;
end;

procedure TfrmScoredCard.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblScoredCard.Close;
    tblScoredCard.Filtered := True;
    tblScoredCard.Open;

    if sAtualiza = 'True' then
    begin
        if tblScoredCard.Locate('ID_SCORED',VarToStr(sScoredParam),[]) then
        begin
           SpeedButton5.OnClick(Self);
           Application.Terminate;
        end;
    end;
end;

procedure TfrmScoredCard.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmScoredCard.SpeedButton2Click(Sender: TObject);
begin
    if frmManScored = nil then
    begin
        frmManScored := TfrmManScored.Create(Self);
        frmManScored.Tipo := 'Criar';
        frmManScored.ShowModal;
        FreeAndNil(frmManScored);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManScored);
    end;
end;

procedure TfrmScoredCard.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not frmScoredCard.tblScoredCard.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(frmScoredCard.tblScoredCardPODE_APAGAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_APAGAR.Value,'#' + frmScoredCard.sUsuario,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_APAGAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_APAGAR.Value,frmScoredCard.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_106'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
           begin
               try
                  ExcluiBaseDados;
               except
               end;

               frmScoredCard.tblScoredCard.Delete;
           end;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_107') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmScoredCard.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
    lSalva : Boolean;
begin
    lSalva := False;

    if not frmScoredCard.tblScoredCard.IsEmpty then
    begin
        if frmManScored = nil then
        begin
            lPode := False;
            if EncontraLista(frmScoredCard.tblScoredCardPODE_ALTERAR.Value,'#*'                       ,',') then lPode := False else
            if EncontraLista(frmScoredCard.tblScoredCardPODE_ALTERAR.Value,'#' + frmScoredCard.sUsuario,',') then lPode := False else
            if EncontraLista(frmScoredCard.tblScoredCardPODE_ALTERAR.Value,'*'                        ,',') then lPode := True  else
            if EncontraLista(frmScoredCard.tblScoredCardPODE_ALTERAR.Value,frmScoredCard.sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManScored := TfrmManScored.Create(Self);
            frmManScored.Tipo := 'Alterar';
            frmManScored.ShowModal;

            lSalva := frmManScored.lSalva;

            FreeAndNil(frmManScored);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManScored);
        end;
    end;

    if lSalva then
       SpeedButton3.OnClick(Self);
end;

procedure TfrmScoredCard.SpeedButton7Click(Sender: TObject);
begin
    if not frmScoredCard.tblScoredCard.IsEmpty then
    begin
        if frmScoredCard.sPermissaoPermissaoScored = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesScored = nil then
        begin
            frmPermissoesScored := TfrmPermissoesScored.Create(Self);
            frmPermissoesScored.ShowModal;
            FreeAndNil(frmPermissoesScored);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesScored);
        end;
    end;
end;

procedure TfrmScoredCard.tblScoredCardBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblScoredCardID_SCORED.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES',           'ID_SCORED',aux) then Abort;
        if not DeleteCascade(bdDados,0,'SCORED_CARD_FILTRO','ID_SCORED',aux) then Abort;
    end;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmScoredCard.tblScoredCardBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
        auxAntigo := #39 + tblScoredCardID_SCORED.OldValue + #39;
        auxNovo   := #39 + tblScoredCardID_SCORED.Value    + #39;
    except
        lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES',           'ID_SCORED',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'SCORED_CARD_FILTRO','ID_SCORED',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmScoredCard.tblScoredCardFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmScoredCard.ExcluiBaseDados;
begin
    // Dia
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
       ADOQuery1.SQL.Add('DROP TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
       ADOQuery1.SQL.Add('DROP TABLE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');

    ADOQuery1.ExecSQL;
end;

procedure TfrmScoredCard.Processo_1;
begin
    if frmScoredCard.tblScoredCardINCREMENTAL.Value = 'N' then
    begin
        try
           ExcluiBaseDados;
        except
        end;
    end;
end;

procedure TfrmScoredCard.CriaTabelas;
begin
   // try
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007') or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010') then
        begin
            ADOQuery1.SQL.Add('SELECT TOP 1');
            ADOQuery1.SQL.Add('0          AS [_Atualizacao_], ');
            ADOQuery1.SQL.Add('#01/01/01# AS [_Data_], ');
            ADOQuery1.SQL.Add('0          AS [_Indice_], ');
            ADOQuery1.SQL.Add(#39 + 'A' + #39 + ' AS [_Titulo_]');
            ADOQuery1.SQL.Add('INTO [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

            ADOQuery1.ExecSQL;

            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;

            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD COLUMN _Valor_    MONEY');
            ADOQuery1.SQL.Add(',  _Situacao_         TEXT(100)');
            ADOQuery1.SQL.Add(',  _EvolucaoAnterior_ MONEY');
            ADOQuery1.SQL.Add(',  _EvolucaoOriginal_ MONEY');
            ADOQuery1.SQL.Add(',  _SituacaoAnterior_ TEXT(100)');
            ADOQuery1.SQL.Add(',  _SituacaoOriginal_ TEXT(100)');
            ADOQuery1.SQL.Add(',  _ValorMinimo_      MONEY');
            ADOQuery1.SQL.Add(',  _ValorMaximo_      MONEY');
            ADOQuery1.SQL.Add(',  _Anotacao_         TEXT(255)');
            ADOQuery1.SQL.Add(',  _PercMinimo_       MONEY');
            ADOQuery1.SQL.Add(',  _PercMaximo_       MONEY');
            ADOQuery1.SQL.Add(',  _ValorFaltaMinimo_ MONEY');
            ADOQuery1.SQL.Add(',  _ValorFaltaMaximo_ MONEY');
            ADOQuery1.SQL.Add(',  _PercFaltaMinimo_  MONEY');
            ADOQuery1.SQL.Add(',  _PercFaltaMaximo_  MONEY');

            ADOQuery1.ExecSQL;
        end;

        if (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT TOP 1');
            ADOQuery1.SQL.Add('0 AS [_Atualizacao_], ');
            ADOQuery1.SQL.Add('CONVERT(DATETIME, ' + #39 + '1900-01-01' + #39 + ') AS [_Data_], ');
            ADOQuery1.SQL.Add('0 AS [_Indice_]');
            ADOQuery1.SQL.Add('INTO [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.ExecSQL;

            ADOQuery1.Close;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _Titulo_ VARCHAR(100)');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _Valor_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _Situacao_  VARCHAR(100)');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _EvolucaoAnterior_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _EvolucaoOriginal_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _SituacaoAnterior_ VARCHAR(100)');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _SituacaoOriginal_ VARCHAR(100)');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _ValorMinimo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _ValorMaximo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _Anotacao_ VARCHAR(255)');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _PercMinimo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _PercMaximo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _ValorFaltaMinimo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _ValorFaltaMaximo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _PercFaltaMinimo_ MONEY');
            ADOQuery1.ExecSQL;

            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('ADD _PercFaltaMaximo_ MONEY');
            ADOQuery1.ExecSQL;
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('CREATE TABLE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('AS SELECT');
            ADOQuery1.SQL.Add('0                          AS _Atualizacao_, ');
            ADOQuery1.SQL.Add('CAST("1900-01-01" AS DATE) AS _Data_, ');
            ADOQuery1.SQL.Add('0                          AS _Indice_, ');
            ADOQuery1.SQL.Add('"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" AS _Titulo_');
            ADOQuery1.SQL.Add('LIMIT 0,1');
            ADOQuery1.ExecSQL;

            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('ALTER TABLE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('  ADD COLUMN _Valor_            FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _Situacao_         VARCHAR(100)');
            ADOQuery1.SQL.Add(', ADD COLUMN _EvolucaoAnterior_ FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _EvolucaoOriginal_ FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _SituacaoAnterior_ VARCHAR(100)');
            ADOQuery1.SQL.Add(', ADD COLUMN _SituacaoOriginal_ VARCHAR(100)');
            ADOQuery1.SQL.Add(', ADD COLUMN _ValorMinimo_      FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _ValorMaximo_      FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _Anotacao_         VARCHAR(255)');
            ADOQuery1.SQL.Add(', ADD COLUMN _PercMinimo_       FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _PercMaximo_       FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _ValorFaltaMinimo_ FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _ValorFaltaMaximo_ FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _PercFaltaMinimo_  FLOAT');
            ADOQuery1.SQL.Add(', ADD COLUMN _PercFaltaMaximo_  FLOAT');
            ADOQuery1.ExecSQL;
        end;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
           ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
           ADOQuery1.SQL.Add('DELETE FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');

        ADOQuery1.ExecSQL;
        ADOQuery1.Close;
   //except
   // end;
end;

procedure TfrmScoredCard.Processo_2;
begin
    if frmScoredCard.tblScoredCardINCREMENTAL.Value = 'N' then
    begin
        CriaTabelas;
    end
    else
    begin
        try
            //Dia
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
               ADOQuery1.SQL.Add('SELECT TOP 1 [_Atualizacao_] FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                ADOQuery1.SQL.Add('SELECT _Atualizacao_ FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                ADOQuery1.SQL.Add('LIMIT 0,1');
            end;

            ADOQuery1.Open;
            ADOQuery1.Close;
        except
            CriaTabelas;
        end;
    end;
end;

procedure TfrmScoredCard.buscaDtMovto;
var
    Query : TADOQuery;
    Query1 : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := bdDados;
    Query1.CursorLocation := clUseServer;

    dt_movto := Date;

    if VarToStr(frmManScored.cxTreeList1.AbsoluteItems[0].Values[1]) <> '' then
    begin
        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CAMPO_DT_MOVTO, TEXTO FROM SCORED_CARD_FILTRO');
        Query1.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
        Query1.SQL.Add('  AND    TITULO = ' + #39 + frmManScored.cxTreeList1.AbsoluteItems[0].Values[0] + #39);
        Query1.Open;
        Query1.First;
        if not Query1.IsEmpty then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT VISAO_DESTINO, BASE_ORIGEM, VISAO_ORIGEM FROM ANALISES');
            Query.SQL.Add(' WHERE ID_ANALISE = ' + #39 + frmManScored.cxTreeList1.AbsoluteItems[0].Values[1] + #39);
            Query.Open;
            Query.First;
            if not Query.IsEmpty then
            begin
                ADOQuery2.Close;
                ADOQuery2.SQL.Clear;

                if Query1.FieldByName('CAMPO_DT_MOVTO').AsString <> '' then
                begin
                    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                    begin
                        ADOQuery2.SQL.Add('SELECT TOP 1 [' + Query1.FieldByName('CAMPO_DT_MOVTO').AsString + ']');

                        if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                           (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                            ADOQuery2.SQL.Add('FROM [' + Query.FieldByName('VISAO_DESTINO').AsString + ']')
                        else
                            ADOQuery2.SQL.Add('FROM [_' + Query.FieldByName('VISAO_DESTINO').AsString + ']');
                    end;

                    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                    begin
                        ADOQuery2.SQL.Add('SELECT `' + Query1.FieldByName('CAMPO_DT_MOVTO').AsString + '`');

                        if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                           (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                            ADOQuery2.SQL.Add('FROM `' + Query.FieldByName('VISAO_DESTINO').AsString + '`')
                        else
                            ADOQuery2.SQL.Add('FROM `_' + Query.FieldByName('VISAO_DESTINO').AsString + '`');

                        ADOQuery2.SQL.Add('LIMIT 0,1');
                    end;

                    if Query1.FieldByName('TEXTO').AsString <> '' then
                       ADOQuery2.SQL.Add('WHERE ' + Query1.FieldByName('TEXTO').AsString);

                    ADOQuery2.Open;
                    ADOQuery2.First;

                    dt_movto := ADOQuery2.Fields[0].AsDateTime;

                    ADOQuery2.Close;
                end;
            end;
        end;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;
end;

procedure TfrmScoredCard.ExcluiTitulos;
var
    i : integer;
    lPodeExcluir : boolean;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery1.SQL.Add('SELECT [_Titulo_] FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
        ADOQuery1.SQL.Add('GROUP BY [_Titulo_]');
    end;

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.SQL.Add('SELECT `_Titulo_` FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('GROUP BY `_Titulo_`');
    end;

    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        lPodeExcluir := True;
        for i := 0 to frmManScored.cxTreeList1.AbsoluteCount - 1 do
            if VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[0]) = ADOQuery1.Fields[0].Value then
               lPodeExcluir := False;

        if lPodeExcluir then
        begin
            ADOQuery2.Close;
            ADOQuery2.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                ADOQuery2.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
            end;

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                ADOQuery2.SQL.Add('DELETE FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
            end;

            ADOQuery2.ExecSQL;
            ADOQuery2.Close;
        end;

        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
end;

procedure TfrmScoredCard.Processo_3;
var
    i,a          : integer;
    ValorMinimo  : double;
    ValorMaximo  : double;
    Valor        : double;
    Ajuste       : double;
    AjusteMaximo : double;
    aux          : string;
    aux1         : string;
    Dia,Mes,Ano  : word;
    dtSemana     : TDateTime;
    Query : TADOQuery;
    Query1 : TADOQuery;
begin
    frmAtualiza.pbTarefa.Properties.Max := frmManScored.cxTreeList1.AbsoluteCount;
    frmAtualiza.pbTarefa.Position       := 0;
    frmAtualiza.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := bdDados;
    Query1.CursorLocation := clUseServer;

    buscaDtMovto;

    if (frmScoredCard.tblScoredCardDT_MOVTO.AsString <> '') and
       (dt_movto > frmScoredCard.tblScoredCardDT_MOVTO.AsDateTime) then
        dt_movto := frmScoredCard.tblScoredCardDT_MOVTO.AsDateTime;

    // Excluir movimentos do dia
    if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'D' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007') or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010') then
        begin
            ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('WHERE [_Data_] = CVDATE(' + #39 + DateToStr(dt_movto) + #39 + ')');
        end;

        if (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('WHERE [_Data_] = CONVERT(DATETIME,' + #39 + DateToStr(dt_movto) + #39 + ',103)');
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            aux := #39 + NumEntry(3, DateToStr(dt_movto), '/') + '-' + NumEntry(2, DateToStr(dt_movto), '/') + '-' + NumEntry(1, DateToStr(dt_movto), '/') + #39;
            ADOQuery1.SQL.Add('DELETE FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('WHERE `_Data_` = CAST(' + aux + ' AS DATE)');
        end;

        ADOQuery1.ExecSQL;
        ADOQuery1.Close;
    end
    else
    // Excluir movimentos do mes
    if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'M' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        DecodeDate(dt_movto,Ano,Mes,Dia);

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add(' WHERE Month([_Data_]) = ' + IntToStr(Mes));
            ADOQuery1.SQL.Add('   AND Year([_Data_])  = ' + IntToStr(Ano));
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('DELETE FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add(' WHERE Month(`_Data_`) = ' + IntToStr(Mes));
            ADOQuery1.SQL.Add('   AND Year(`_Data_`)  = ' + IntToStr(Ano));
        end;

        ADOQuery1.ExecSQL;
        ADOQuery1.Close;
    end
    else
    // Excluir movimentos da semana
    if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'S' then
    begin
        dtSemana := dt_movto;
        dtSemana := dtSemana - 7;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007') or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010') then
        begin
            ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('WHERE [_Data_] >= CVDate(' + #39 + DateToStr(dtSemana) + #39 + ')');
            ADOQuery1.SQL.Add('  AND [_Data_] <= CVDate(' + #39 + DateToStr(dt_movto) + #39 + ')');
        end;

        if (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('DELETE FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('WHERE [_Data_] >= CONVERT(DATETIME,' + #39 + DateToStr(dtSemana) + #39 + ',103)');
            ADOQuery1.SQL.Add('  AND [_Data_] <= CONVERT(DATETIME,' + #39 + DateToStr(dt_movto) + #39 + ',103)');
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            aux := #39  + NumEntry(3, DateToStr(dt_movto), '/') + '-' + NumEntry(2, DateToStr(dt_movto), '/') + '-' + NumEntry(1, DateToStr(dt_movto), '/') + #39;
            aux1 := #39 + NumEntry(3, DateToStr(dtSemana), '/') + '-' + NumEntry(2, DateToStr(dtSemana), '/') + '-' + NumEntry(1, DateToStr(dtSemana), '/') + #39;

            ADOQuery1.SQL.Add('DELETE FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('WHERE `_Data_` >= CAST(' + aux1 + ' AS DATE)');
            ADOQuery1.SQL.Add('  AND `_Data_` <= CAST(' + aux  + ' AS DATE)');
        end;

        ADOQuery1.ExecSQL;
        ADOQuery1.Close;
    end;

    // verifica se foram excluidos titulos do scored
    ExcluiTitulos;

    ADOQuery3.Close;
    ADOQuery3.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery3.SQL.Add('SELECT TOP 1');
        ADOQuery3.SQL.Add('[_Atualizacao_], ');
        ADOQuery3.SQL.Add('[_Data_], ');
        ADOQuery3.SQL.Add('[_Indice_], ');
        ADOQuery3.SQL.Add('[_Titulo_], ');
        ADOQuery3.SQL.Add('[_Valor_], ');
        ADOQuery3.SQL.Add('[_Situacao_], ');
        ADOQuery3.SQL.Add('[_EvolucaoAnterior_],');
        ADOQuery3.SQL.Add('[_EvolucaoOriginal_],');
        ADOQuery3.SQL.Add('[_SituacaoAnterior_],');
        ADOQuery3.SQL.Add('[_SituacaoOriginal_],');
        ADOQuery3.SQL.Add('[_ValorMinimo_],');
        ADOQuery3.SQL.Add('[_ValorMaximo_],');
        ADOQuery3.SQL.Add('[_Anotacao_],');
        ADOQuery3.SQL.Add('[_PercMinimo_],');
        ADOQuery3.SQL.Add('[_PercMaximo_],');
        ADOQuery3.SQL.Add('[_ValorFaltaMinimo_],');
        ADOQuery3.SQL.Add('[_ValorFaltaMaximo_],');
        ADOQuery3.SQL.Add('[_PercFaltaMinimo_],');
        ADOQuery3.SQL.Add('[_PercFaltaMaximo_]');
        ADOQuery3.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
    end;

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery3.SQL.Add('SELECT');
        ADOQuery3.SQL.Add('_Atualizacao_, ');
        ADOQuery3.SQL.Add('_Data_, ');
        ADOQuery3.SQL.Add('_Indice_, ');
        ADOQuery3.SQL.Add('_Titulo_, ');
        ADOQuery3.SQL.Add('_Valor_, ');
        ADOQuery3.SQL.Add('_Situacao_, ');
        ADOQuery3.SQL.Add('_EvolucaoAnterior_,');
        ADOQuery3.SQL.Add('_EvolucaoOriginal_,');
        ADOQuery3.SQL.Add('_SituacaoAnterior_,');
        ADOQuery3.SQL.Add('_SituacaoOriginal_,');
        ADOQuery3.SQL.Add('_ValorMinimo_,');
        ADOQuery3.SQL.Add('_ValorMaximo_,');
        ADOQuery3.SQL.Add('_Anotacao_,');
        ADOQuery3.SQL.Add('_PercMinimo_,');
        ADOQuery3.SQL.Add('_PercMaximo_,');
        ADOQuery3.SQL.Add('_ValorFaltaMinimo_,');
        ADOQuery3.SQL.Add('_ValorFaltaMaximo_,');
        ADOQuery3.SQL.Add('_PercFaltaMinimo_,');
        ADOQuery3.SQL.Add('_PercFaltaMaximo_');
        ADOQuery3.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery3.SQL.Add('LIMIT 0,1');
    end;

    ADOQuery3.Open;

    a := frmManScored.cxTreeList1.AbsoluteCount - 1;

    for i := 0 to a do
    begin
        if VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[1]) <> '' then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT VISAO_DESTINO, BASE_ORIGEM, VISAO_ORIGEM FROM ANALISES');
            Query.SQL.Add(' WHERE ID_ANALISE = ' + #39 + frmManScored.cxTreeList1.AbsoluteItems[i].Values[1] + #39);
            Query.Open;
            Query.First;
            if not Query.IsEmpty then
            begin
                ADOQuery2.Close;
                ADOQuery2.SQL.Clear;

                if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                   (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    ADOQuery2.SQL.Add('SELECT [' + VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[2]) + ']');

                    if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                       (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                        ADOQuery2.SQL.Add('FROM [' + Query.FieldByName('VISAO_DESTINO').AsString + ']')
                    else
                        ADOQuery2.SQL.Add('FROM [_' + Query.FieldByName('VISAO_DESTINO').AsString + ']');
                end;

                if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                begin
                    ADOQuery2.SQL.Add('SELECT `' + VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[2]) + '`');

                    if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                       (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                        ADOQuery2.SQL.Add('FROM `' + Query.FieldByName('VISAO_DESTINO').AsString + '`')
                    else
                        ADOQuery2.SQL.Add('FROM `_' + Query.FieldByName('VISAO_DESTINO').AsString + '`');
                end;

                Query1.Close;
                Query1.SQL.Clear;
                Query1.SQL.Add('SELECT TEXTO, ACUMULA_ANALISE FROM SCORED_CARD_FILTRO');
                Query1.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                Query1.SQL.Add('  AND    TITULO = ' + #39 + frmManScored.cxTreeList1.AbsoluteItems[i].Values[0] + #39);
                Query1.Open;
                Query1.First;
                if not Query1.IsEmpty then
                begin
                    if Query1.FieldByName('TEXTO').AsString <> '' then
                       ADOQuery2.SQL.Add('WHERE ' + Query1.FieldByName('TEXTO').AsString);

                    ADOQuery2.Open;
                    ADOQuery2.First;

                    if  Query1.FieldByName('ACUMULA_ANALISE').AsString = 'S' then
                    begin
                        Valor := 0;

                        while not ADOQuery2.Eof do
                        begin
                            Valor := Valor + ADOQuery2.Fields[0].Value;
                            ADOQuery2.Next;
                        end;
                    end
                    else
                    begin
                        if not ADOQuery2.IsEmpty then
                           Valor  := ADOQuery2.Fields[0].Value
                        else
                           Valor  := 0;
                    end;
                end;

                ADOQuery2.Close;
                try
                    ADOQuery3.Insert;
                    ADOQuery3.Fields[0].Value  := frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1;
                    ADOQuery3.Fields[1].Value  := dt_movto;
                    ADOQuery3.Fields[2].Value  := i;
                    ADOQuery3.Fields[3].Value  := VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[0]);
                    ADOQuery3.Fields[4].Value  := RoundTo(Valor,-4);
                    ADOQuery3.Fields[5].Value  := 'R';
                    ADOQuery3.Fields[6].Value  := 0;
                    ADOQuery3.Fields[7].Value  := 0;
                    ADOQuery3.Fields[8].Value  := 'R';
                    ADOQuery3.Fields[9].Value  := 'R';
                    ValorMinimo                := frmManScored.cxTreeList1.AbsoluteItems[i].Values[3];
                    ValorMaximo                := frmManScored.cxTreeList1.AbsoluteItems[i].Values[4];
                    Ajuste                     := 10;
                    AjusteMaximo               := 101;

                    Query1.Close;
                    Query1.SQL.Clear;
                    Query1.SQL.Add('SELECT ANALISE_MAXIMO, TEXTO_MAXIMO, ACUMULA_MAXIMO, ACUMULA_MINIMO, TEXTO_MINIMO, PERC_AJUSTE, PERC_AJUSTE_MAXIMO, ANALISE_MINIMO, CAMPO_MINIMO, CAMPO_MAXIMO FROM SCORED_CARD_FILTRO');
                    Query1.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                    Query1.SQL.Add('  AND    TITULO = ' + #39 + frmManScored.cxTreeList1.AbsoluteItems[i].Values[0] + #39);
                    Query1.Open;
                    Query1.First;
                    if not Query1.IsEmpty then
                    begin
                       Ajuste       := Query1.FieldByName('PERC_AJUSTE').Value;
                       AjusteMaximo := Query1.FieldByName('PERC_AJUSTE_MAXIMO').Value;

                       if (Query1.FieldByName('ANALISE_MINIMO').AsString <> '') and
                          (Query1.FieldByName('CAMPO_MINIMO').AsString   <> '') then
                       begin
                           Query.Close;
                           Query.SQL.Clear;
                           Query.SQL.Add('SELECT VISAO_DESTINO, BASE_ORIGEM, VISAO_ORIGEM FROM ANALISES');
                           Query.SQL.Add(' WHERE ID_ANALISE = ' + #39 + Query1.FieldByName('ANALISE_MINIMO').AsString + #39);
                           Query.Open;
                           Query.First;
                           if not Query.IsEmpty then
                           begin
                               ADOQuery2.Close;
                               ADOQuery2.SQL.Clear;

                               if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                                  (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                               begin
                                   ADOQuery2.SQL.Add('SELECT [' + Query1.FieldByName('CAMPO_MINIMO').AsString + ']');

                                   if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                                      (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                                       ADOQuery2.SQL.Add('FROM [' + Query.FieldByName('VISAO_DESTINO').AsString + ']')
                                   else
                                       ADOQuery2.SQL.Add('FROM [_' + Query.FieldByName('VISAO_DESTINO').AsString + ']');
                               end;

                               if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                               begin
                                   ADOQuery2.SQL.Add('SELECT `' + Query1.FieldByName('CAMPO_MINIMO').AsString + '`');

                                   if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                                      (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                                       ADOQuery2.SQL.Add('FROM `' + Query.FieldByName('VISAO_DESTINO').AsString + '`')
                                   else
                                       ADOQuery2.SQL.Add('FROM `_' + Query.FieldByName('VISAO_DESTINO').AsString + '`');
                               end;

                               if Query1.FieldByName('TEXTO_MINIMO').AsString <> '' then
                                  ADOQuery2.SQL.Add('WHERE ' + Query1.FieldByName('TEXTO_MINIMO').AsString);

                               ADOQuery2.Open;
                               ADOQuery2.First;

                               if Query1.FieldByName('ACUMULA_MINIMO').AsString = 'S' then
                               begin
                                   ValorMinimo := 0;

                                   while not ADOQuery2.Eof do
                                   begin
                                       try
                                          ValorMinimo := ValorMinimo + ADOQuery2.Fields[0].AsCurrency;
                                       except
                                          ValorMinimo := ValorMinimo;
                                       end;
                                       ADOQuery2.Next;
                                   end;
                               end
                               else
                               begin
                                   if not ADOQuery2.IsEmpty then
                                   begin
                                       try
                                          ValorMinimo := ADOQuery2.Fields[0].AsCurrency;
                                       except
                                          ValorMinimo := 0;
                                       end;
                                   end
                                   else
                                      ValorMinimo := 0;
                               end;

                              ADOQuery2.Close;
                           end;
                       end;

                       if (Query1.FieldByName('ANALISE_MAXIMO').AsString <> '') and
                          (Query1.FieldByName('CAMPO_MAXIMO').AsString   <> '') then
                       begin
                           Query.Close;
                           Query.SQL.Clear;
                           Query.SQL.Add('SELECT VISAO_DESTINO, BASE_ORIGEM, VISAO_ORIGEM FROM ANALISES');
                           Query.SQL.Add(' WHERE ID_ANALISE = ' + #39 + Query1.FieldByName('ANALISE_MAXIMO').AsString + #39);
                           Query.Open;
                           Query.First;
                           if not Query.IsEmpty then
                           begin
                               ADOQuery2.Close;
                               ADOQuery2.SQL.Clear;

                               if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                                  (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                                  (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                               begin
                                   ADOQuery2.SQL.Add('SELECT [' + Query1.FieldByName('CAMPO_MAXIMO').AsString + ']');


                                   if (Query.FieldByName('BASE_ORIGEM').AsString  = '.') and
                                      (Query.FieldByName('VISAO_ORIGEM').AsString = '.') then
                                       ADOQuery2.SQL.Add('FROM [' + Query.FieldByName('VISAO_DESTINO').Value + ']')
                                   else
                                       ADOQuery2.SQL.Add('FROM [_' + Query.FieldByName('VISAO_DESTINO').Value + ']');
                               end;

                               if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                               begin
                                   ADOQuery2.SQL.Add('SELECT `' + Query1.FieldByName('CAMPO_MAXIMO').AsString + '`');

                                   if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
                                      (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
                                       ADOQuery2.SQL.Add('FROM `' + Query.FieldByName('VISAO_DESTINO').Value + '`')
                                   else
                                       ADOQuery2.SQL.Add('FROM `_' + Query.FieldByName('VISAO_DESTINO').Value + '`');
                               end;

                               if Query1.FieldByName('TEXTO_MAXIMO').AsString <> '' then
                                  ADOQuery2.SQL.Add('WHERE ' + Query1.FieldByName('TEXTO_MAXIMO').AsString);

                               ADOQuery2.Open;
                               ADOQuery2.First;

                               if Query1.FieldByName('ACUMULA_MAXIMO').AsString = 'S' then
                               begin
                                   ValorMaximo := 0;

                                   while not ADOQuery2.Eof do
                                   begin
                                       try
                                          ValorMaximo := ValorMaximo + ADOQuery2.Fields[0].AsCurrency;
                                       except
                                          ValorMaximo := ValorMaximo;
                                       end;
                                       ADOQuery2.Next;
                                   end;
                               end
                               else
                               begin
                                   if not ADOQuery2.IsEmpty then
                                   begin
                                       try
                                          ValorMaximo := ADOQuery2.Fields[0].AsCurrency;
                                       except
                                          ValorMaximo := 0;
                                       end;
                                   end
                                   else
                                      ValorMaximo := 0;
                               end;

                              ADOQuery2.Close;
                           end;
                       end;
                    end;

                    if AjusteMaximo <> 0 then
                       ValorMaximo := ValorMaximo / 100 * AjusteMaximo;

                    if Ajuste <> 0 then
                       ValorMinimo := ValorMinimo / 100 * Ajuste;

{                    if ValorMaximo = 1 then
                       ValorMaximo := ValorMinimo / 100 * AjusteMaximo;

                    if ValorMinimo = 0 then
                       ValorMinimo := ValorMaximo / 100 * Ajuste;  }




                   { if not frmManScored.cxTreeList1.AbsoluteItems[ADOQuery3.Fields[2].Value].Values[5] then // Receita
                    begin
                        if ValorMaximo = 1 then
                           ValorMaximo := ValorMinimo / 100 * AjusteMaximo;

                        if ValorMinimo = 0 then
                           ValorMinimo := ValorMaximo / 100 * Ajuste;
                    end
                    else
                    begin
                        if ValorMaximo = 1 then
                           ValorMaximo := ValorMinimo / 100 * AjusteMaximo;

                        if ValorMinimo = 0 then
                           ValorMinimo := ValorMaximo / 100 * Ajuste;

                        if ValorMinimo >= ValorMaximo then
                           ValorMinimo := ValorMaximo / 100 * Ajuste;
                    end; }

                    ADOQuery3.Fields[10].Value := ValorMinimo;
                    ADOQuery3.Fields[11].Value := ValorMaximo;
                    ADOQuery3.Fields[12].Value := '';

                    if ADOQuery3.Fields[10].Value <> 0 then // valor minimo
                       ADOQuery3.Fields[13].Value := RoundTo(ADOQuery3.Fields[4].Value * 100 / ADOQuery3.Fields[10].Value, -2)
                    else
                       ADOQuery3.Fields[13].Value := 0;

                    if ADOQuery3.Fields[11].Value <> 0 then // valor máximo
                       ADOQuery3.Fields[14].Value := RoundTo(ADOQuery3.Fields[4].Value * 100 / ADOQuery3.Fields[11].Value, -2)
                    else
                       ADOQuery3.Fields[14].Value := 0;

                    if frmManScored.cxTreeList1.AbsoluteItems[ADOQuery3.Fields[2].Value].Values[5] then // tipo despesa
                    begin
                        if (ADOQuery3.Fields[4].Value > ADOQuery3.Fields[10].Value  and
                            ADOQuery3.Fields[4].Value < ADOQuery3.Fields[10].Value) then
                            ADOQuery3.Fields[5].Value := 'W';

                        if ADOQuery3.Fields[4].Value <= ADOQuery3.Fields[10].Value then
                           ADOQuery3.Fields[5].Value := 'G';

                        if ADOQuery3.Fields[4].Value > ADOQuery3.Fields[11].Value then
                           ADOQuery3.Fields[5].Value := 'R';
                    end
                    else
                    begin
                        if (ADOQuery3.Fields[4].Value > ADOQuery3.Fields[10].Value and
                            ADOQuery3.Fields[4].Value < ADOQuery3.Fields[10].Value) then
                            ADOQuery3.Fields[5].Value := 'W';

                        if ADOQuery3.Fields[4].Value < ADOQuery3.Fields[10].Value then
                           ADOQuery3.Fields[5].Value := 'R';

                        if ADOQuery3.Fields[4].Value >= ADOQuery3.Fields[11].Value then
                           ADOQuery3.Fields[5].Value := 'G';
                    end;

                    ADOQuery3.Fields[15].Value := RoundTo(ADOQuery3.Fields[10].Value - ADOQuery3.Fields[4].Value, -2);
                    ADOQuery3.Fields[16].Value := RoundTo(ADOQuery3.Fields[11].Value - ADOQuery3.Fields[4].Value, -2);
                    ADOQuery3.Fields[17].Value := RoundTo(100 - ADOQuery3.Fields[13].Value, -2);
                    ADOQuery3.Fields[18].Value := RoundTo(100 - ADOQuery3.Fields[14].Value, -2);

                    ADOQuery3.Post;
                except
                    on E: Exception do
                    begin
                        if not frmScoredCard.lAtualizaBatch then
                        begin
                            MessageDlg(HCLResourceStrings.FindID('sString_108') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                            ADOQuery3.Cancel;
                        end
                        else
                            Application.Terminate;
                    end;
                end;

                ADOQuery2.Close;
                ADOQuery2.SQL.Clear;

                if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                   (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    ADOQuery2.SQL.Add('UPDATE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                    ADOQuery2.SQL.Add('SET [_Indice_] = ' + IntToStr(i));
                    ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery3.Fields[3].AsString + #39);
                end;

                if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                begin
                    ADOQuery2.SQL.Add('UPDATE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                    ADOQuery2.SQL.Add('SET `_Indice_` = ' + IntToStr(i));
                    ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery3.Fields[3].AsString + #39);
                end;

                ADOQuery2.ExecSQL;
                ADOQuery2.Close;
            end;
        end;

        frmAtualiza.pbTarefa.Position := frmAtualiza.pbTarefa.Position + 1;
        frmAtualiza.Update;
    end;

    ADOQuery3.Close;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;

    frmAtualiza.pbTarefa.Position := 0;
    frmAtualiza.Update;
end;

procedure TfrmScoredCard.Processo_6;
var
    sTabela : string;
    sAssunto : string;
    sMensagem : string;
    i : integer;
    lPode : boolean;
    iCont : integer;
    Query : TADOQuery;
    sAvisaMail : string;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;
    Query.CursorLocation := clUseServer;

    frmScoredCard.tblParametros.Close;
    frmScoredCard.tblParametros.Open;
    frmScoredCard.tblParametros.First;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        sTabela := '[_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']';
        ADOQuery1.SQL.Add('SELECT [_Titulo_], [_Situacao_], [_Valor_]');
        ADOQuery1.SQL.Add('FROM ' + sTabela);
        ADOQuery1.SQL.Add('WHERE [_Atualizacao_] = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
        ADOQuery1.SQL.Add('GROUP BY [_Titulo_], [_Situacao_], [_Valor_]');
    end;

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        sTabela := '`_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`';
        ADOQuery1.SQL.Add('SELECT `_Titulo_`, `_Situacao_`, `_Valor_`');
        ADOQuery1.SQL.Add('FROM ' + sTabela);
        ADOQuery1.SQL.Add('WHERE `_Atualizacao_` = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
        ADOQuery1.SQL.Add('GROUP BY `_Titulo_`, `_Situacao_`, `_Valor_`');
    end;

    ADOQuery1.Open;

    frmAtualiza.pbTarefa.Properties.Max := ADOQuery1.RecordCount;
    frmAtualiza.pbTarefa.Position       := 0;
    frmAtualiza.Update;

    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        frmScoredCard.qryAtualiza.Close;
        frmScoredCard.qryAtualiza.SQL.Clear;
        frmScoredCard.qryAtualiza.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
        frmScoredCard.qryAtualiza.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCard.FieldByName('ID_SCORED').AsString + #39);
        frmScoredCard.qryAtualiza.SQL.Add('  AND TITULO    = ' + #39 + ADOQuery1.FieldByName('_Titulo_').AsString + #39);
        frmScoredCard.qryAtualiza.Open;
        frmScoredCard.qryAtualiza.First;

        if frmScoredCard.qryAtualiza.FieldByName('MAIL_AVISO').AsString <> '' then
        begin
            lPode := True;

            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                sTabela := '[_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']';
                ADOQuery3.SQL.Add('  SELECT [_Situacao_]');
                ADOQuery3.SQL.Add('    FROM ' + sTabela);
                ADOQuery3.SQL.Add('   WHERE [_Titulo_] = ' + #39 + ADOQuery1.FieldByName('_Titulo_').AsString + #39);
                ADOQuery3.SQL.Add('ORDER BY [_Atualizacao_]');
            end;

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                sTabela := '`_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`';
                ADOQuery3.SQL.Add('  SELECT `_Situacao_`');
                ADOQuery3.SQL.Add('    FROM ' + sTabela);
                ADOQuery3.SQL.Add('   WHERE `_Titulo_` = ' + #39 + ADOQuery1.FieldByName('_Titulo_').AsString + #39);
                ADOQuery3.SQL.Add('GROUP BY `_Atualizacao_`');
            end;

            ADOQuery3.Open;
            ADOQuery3.First;

            if not ADOQuery3.IsEmpty then
            begin
                iCont := 0;
                while not ADOQuery3.Eof do
                begin
                    if iCont > 1 then
                       break;

                    iCont := iCont + 1;
                    ADOQuery3.Next;
                end;

                if iCont = 1 then
                   lPode := True
                else
                begin
                    ADOQuery3.Last;
                    ADOQuery3.Prior;
                    if ADOQuery1.FieldByName('_Situacao_').AsString = ADOQuery3.FieldByName('_Situacao_').AsString then
                       lPode := False;
                end;
            end;

            ADOQuery3.Close;

            if lPode then
            begin
                sAvisaMail := '';

                for i := 1 to NumEntries(frmScoredCard.qryAtualiza.FieldByName('MAIL_AVISO').AsString,';') do
                begin
                    if (frmScoredCard.qryAtualiza.FieldByName('AVISA_GREEN').AsString = 'S') and
                       (ADOQuery1.FieldByName('_Situacao_').AsString                  = 'G') then
                    begin
                        if frmScoredCard.qryAtualiza.FieldByName('ULTIMO_MAIL_ENVIADO').AsString <> 'G' then
                        begin
                            sAvisaMail := 'G';
                            sAssunto   := 'Aviso ScoredCard Situacao VERDE';
                            sMensagem  := 'O Item ' + frmScoredCard.qryAtualiza.FieldByName('TITULO').AsString +
                                          ' do ScoredCard ' + frmScoredCard.qryAtualiza.FieldByName('ID_SCORED').AsString +
                                          ' com valor ' + FormatFloat('###,###,###,##0.00',ADOQuery1.FieldByName('_Valor_').AsFloat) +
                                          ' esta com situacao VERDE';
                        end;
                    end;

                    if (frmScoredCard.qryAtualiza.FieldByName('AVISA_YELLOW').AsString = 'S') and
                       (ADOQuery1.FieldByName('_Situacao_').AsString                   = 'Y') then
                    begin
                        if frmScoredCard.qryAtualiza.FieldByName('ULTIMO_MAIL_ENVIADO').AsString <> 'Y' then
                        begin
                            sAvisaMail := 'Y';
                            sAssunto   := 'Aviso ScoredCard Situacao AMARELA';
                            sMensagem  := 'O Item ' + frmScoredCard.qryAtualiza.FieldByName('TITULO').AsString +
                                          ' do ScoredCard ' + frmScoredCard.qryAtualiza.FieldByName('ID_SCORED').AsString +
                                          ' com valor ' + FormatFloat('###,###,###,##0.00',ADOQuery1.FieldByName('_Valor_').AsFloat) +
                                          ' esta com situacao AMARELA';
                        end;
                    end;

                    if (frmScoredCard.qryAtualiza.FieldByName('AVISA_RED').AsString = 'S') and
                       (ADOQuery1.FieldByName('_Situacao_').AsString                = 'R') then
                    begin
                        if frmScoredCard.qryAtualiza.FieldByName('ULTIMO_MAIL_ENVIADO').AsString <> 'R' then
                        begin
                            sAvisaMail := 'R';
                            sAssunto   := 'Aviso ScoredCard Situacao VERMELHA';
                            sMensagem  := 'O Item ' + frmScoredCard.qryAtualiza.FieldByName('TITULO').AsString +
                                          ' do ScoredCard ' + frmScoredCard.qryAtualiza.FieldByName('ID_SCORED').AsString +
                                          ' com valor ' + FormatFloat('###,###,###,##0.00',ADOQuery1.FieldByName('_Valor_').AsFloat) +
                                          ' esta com situacao VERMELHA';
                        end;
                    end;

                    if (sAssunto                                          <> '') and
                       (sMensagem                                         <> '') and
                       (frmScoredCard.tblParametrosSERVIDOR_MAIL.AsString <> '') then
                    begin
                        try
                            Query.Close;
                            Query.SQL.Clear;
                            Query.SQL.Add('UPDATE SCORED_CARD_FILTRO');
                            Query.SQL.Add('SET ULTIMO_MAIL_ENVIADO = ' + #39 + sAvisaMail + #39);
                            Query.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.qryAtualiza.FieldByName('ID_SCORED').AsString + #39);
                            Query.SQL.Add('  AND TITULO    = ' + #39 + frmScoredCard.qryAtualiza.FieldByName('TITULO').AsString + #39);
                            Query.ExecSQL;
                        except
                        end;

                        enviaEmail(frmScoredCard.sMail,
                                   Entry(i,frmScoredCard.qryAtualiza.FieldByName('MAIL_AVISO').AsString,';'),
                                   sAssunto,
                                   sMensagem,
                                   frmScoredCard.sUserMail,
                                   frmScoredCard.sSenhaMail,
                                   frmScoredCard.tblParametrosSERVIDOR_MAIL.AsString,
                                   frmScoredCard.tblParametrosPORTA_MAIL.AsInteger);
                    end;
                end;
            end;
        end;

        frmScoredCard.qryAtualiza.Close;

        ADOQuery1.Next;

        frmAtualiza.pbTarefa.Position := frmAtualiza.pbTarefa.Position + 1;
        frmAtualiza.Update;
    end;

    Query.Close;
    Query.Free;

    frmScoredCard.tblParametros.Close;
end;


procedure TfrmScoredCard.Processo_4;
var
    ValorOriginal : Double;
    ValorAnterior : Double;
    Original : Double;
    Anterior : Double;
    aux : string;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery1.SQL.Add('SELECT [_Titulo_]');
        ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
        ADOQuery1.SQL.Add('GROUP BY [_Titulo_]');
    end;

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.SQL.Add('SELECT _Titulo_');
        ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('GROUP BY `_Titulo_`');
    end;

    ADOQuery1.Open;

    frmAtualiza.pbTarefa.Properties.Max := ADOQuery1.RecordCount;
    frmAtualiza.pbTarefa.Position       := 0;
    frmAtualiza.Update;

    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        if frmScoredCard.tblScoredCardATUALIZA_SITUACAO_ANTERIOR.Value = 'S' then
        begin
            // Busca valor original
            ADOQuery2.Close;
            ADOQuery2.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                ADOQuery2.SQL.Add('SELECT TOP 1');
                ADOQuery2.SQL.Add('[_Valor_]');
                ADOQuery2.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery2.SQL.Add('ORDER BY [_Atualizacao_]');
            end;

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                ADOQuery2.SQL.Add('SELECT');
                ADOQuery2.SQL.Add('`_Valor_`');
                ADOQuery2.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery2.SQL.Add('ORDER BY `_Atualizacao_`');
                ADOQuery2.SQL.Add('LIMIT 0,1');
            end;

            ADOQuery2.Open;
            ADOQuery2.First;
            ValorOriginal := ADOQuery2.Fields[0].AsFloat;

            // Busca Valor Anterior
            ADOQuery2.Close;
            ADOQuery2.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                ADOQuery2.SQL.Add('SELECT TOP 1');
                ADOQuery2.SQL.Add('[_Valor_]');
                ADOQuery2.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery2.SQL.Add('AND [_Atualizacao_] < ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
                ADOQuery2.SQL.Add('ORDER BY [_Atualizacao_] DESC');
            end;

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                ADOQuery2.SQL.Add('SELECT');
                ADOQuery2.SQL.Add('_Valor_');
                ADOQuery2.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery2.SQL.Add('AND `_Atualizacao_` < ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
                ADOQuery2.SQL.Add('ORDER BY `_Atualizacao_` DESC');
                ADOQuery2.SQL.Add('LIMIT 0,1');
            end;

            ADOQuery2.Open;
            ADOQuery2.First;
            ValorAnterior := ADOQuery2.Fields[0].AsFloat;
        end;

        // Calcula valores
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery2.SQL.Add('SELECT ');
            ADOQuery2.SQL.Add('[_Atualizacao_], ');
            ADOQuery2.SQL.Add('[_Data_], ');
            ADOQuery2.SQL.Add('[_Indice_], ');
            ADOQuery2.SQL.Add('[_Titulo_], ');
            ADOQuery2.SQL.Add('[_Valor_], ');
            ADOQuery2.SQL.Add('[_Situacao_], ');
            ADOQuery2.SQL.Add('[_EvolucaoAnterior_],');
            ADOQuery2.SQL.Add('[_EvolucaoOriginal_],');
            ADOQuery2.SQL.Add('[_SituacaoAnterior_],');
            ADOQuery2.SQL.Add('[_SituacaoOriginal_],');
            ADOQuery2.SQL.Add('[_ValorMinimo_],');
            ADOQuery2.SQL.Add('[_ValorMaximo_],');
            ADOQuery2.SQL.Add('[_Anotacao_],');
            ADOQuery2.SQL.Add('[_PercMinimo_],');
            ADOQuery2.SQL.Add('[_PercMaximo_],');
            ADOQuery2.SQL.Add('[_ValorFaltaMinimo_],');
            ADOQuery2.SQL.Add('[_ValorFaltaMaximo_],');
            ADOQuery2.SQL.Add('[_PercFaltaMinimo_],');
            ADOQuery2.SQL.Add('[_PercFaltaMaximo_]');
            ADOQuery2.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
            ADOQuery2.SQL.Add('AND [_Atualizacao_] = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
            ADOQuery2.SQL.Add('ORDER BY [_Atualizacao_]');
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery2.SQL.Add('SELECT ');
            ADOQuery2.SQL.Add('`_Atualizacao_`, ');
            ADOQuery2.SQL.Add('`_Data_`, ');
            ADOQuery2.SQL.Add('`_Indice_`, ');
            ADOQuery2.SQL.Add('`_Titulo_`, ');
            ADOQuery2.SQL.Add('`_Valor_`, ');
            ADOQuery2.SQL.Add('`_Situacao_`, ');
            ADOQuery2.SQL.Add('`_EvolucaoAnterior_`,');
            ADOQuery2.SQL.Add('`_EvolucaoOriginal_`,');
            ADOQuery2.SQL.Add('`_SituacaoAnterior_`,');
            ADOQuery2.SQL.Add('`_SituacaoOriginal_`,');
            ADOQuery2.SQL.Add('`_ValorMinimo_`,');
            ADOQuery2.SQL.Add('`_ValorMaximo_`,');
            ADOQuery2.SQL.Add('`_Anotacao_`,');
            ADOQuery2.SQL.Add('`_PercMinimo_`,');
            ADOQuery2.SQL.Add('`_PercMaximo_`,');
            ADOQuery2.SQL.Add('`_ValorFaltaMinimo_`,');
            ADOQuery2.SQL.Add('`_ValorFaltaMaximo_`,');
            ADOQuery2.SQL.Add('`_PercFaltaMinimo_`,');
            ADOQuery2.SQL.Add('`_PercFaltaMaximo_`');
            ADOQuery2.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
            ADOQuery2.SQL.Add('AND `_Atualizacao_` = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
            ADOQuery2.SQL.Add('ORDER BY `_Atualizacao_`');
        end;

        ADOQuery2.Open;
        ADOQuery2.First;
        while not ADOQuery2.Eof do
        begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                ADOQuery3.SQL.Add('UPDATE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

                if ValorAnterior <> 0 then
                begin
                    aux      := FloatToStr(RoundTo((ADOQuery2.Fields[4].Value - ValorAnterior) * 100 / ValorAnterior, -4));
                    Anterior := RoundTo((ADOQuery2.Fields[4].Value - ValorAnterior) * 100 / ValorAnterior, -4);
                    aux      := ReplaceStr(aux,',','.');

                    ADOQuery3.SQL.Add('SET _EvolucaoAnterior_ = ' + aux);
                end
                else
                   ADOQuery3.SQL.Add('SET _EvolucaoAnterior_ = 0');

                if ValorOriginal <> 0 then
                begin
                    aux      := FloatToStr(RoundTo((ADOQuery2.Fields[4].Value - ValorOriginal) * 100 / ValorOriginal, -4));
                    Original := RoundTo((ADOQuery2.Fields[4].Value - ValorOriginal) * 100 / ValorOriginal, -4);
                    aux      := ReplaceStr(aux,',','.');

                    ADOQuery3.SQL.Add(', _EvolucaoOriginal_ = ' + aux);
                end
                else
                   ADOQuery3.SQL.Add(', _EvolucaoOriginal_ = 0');

                if frmManScored.cxTreeList1.AbsoluteItems[ADOQuery2.Fields[2].Value].Values[5] then // tipo receita ou despesa
                begin
                    if Anterior >= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'CR' + #39)
                    else
                    if Anterior < 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'CG' + #39);

                    if Original >= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'CR' + #39)
                    else
                    if Original < 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'CG' + #39)
                end
                else
                begin
                    if Anterior > 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'RG' + #39)
                    else
                    if Anterior <= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'RR' + #39);

                    if Original > 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'RG' + #39)
                    else
                    if Original <= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'RR' + #39);
                end;

                ADOQuery3.SQL.Add('WHERE [_Titulo_] = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery3.SQL.Add('AND [_Atualizacao_] = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
            end;

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
            begin
                ADOQuery3.SQL.Add('UPDATE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');

                if ValorAnterior <> 0 then
                begin
                    aux      := FloatToStr(RoundTo((ADOQuery2.Fields[4].Value - ValorAnterior) * 100 / ValorAnterior, -4));
                    Anterior := RoundTo((ADOQuery2.Fields[4].Value - ValorAnterior) * 100 / ValorAnterior, -4);
                    aux      := ReplaceStr(aux,',','.');

                    ADOQuery3.SQL.Add('SET _EvolucaoAnterior_ = ' + aux);
                end
                else
                   ADOQuery3.SQL.Add('SET _EvolucaoAnterior_ = 0');

                if ValorOriginal <> 0 then
                begin
                    aux      := FloatToStr(RoundTo((ADOQuery2.Fields[4].Value - ValorOriginal) * 100 / ValorOriginal, -4));
                    Original := RoundTo((ADOQuery2.Fields[4].Value - ValorOriginal) * 100 / ValorOriginal, -4);
                    aux      := ReplaceStr(aux,',','.');

                    ADOQuery3.SQL.Add(', _EvolucaoOriginal_ = ' + aux);
                end
                else
                   ADOQuery3.SQL.Add(', _EvolucaoOriginal_ = 0');

                if frmManScored.cxTreeList1.AbsoluteItems[ADOQuery2.Fields[2].Value].Values[5] then // tipo receita ou despesa
                begin
                    if Anterior >= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'CR' + #39)
                    else
                    if Anterior < 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'CG' + #39);

                    if Original >= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'CR' + #39)
                    else
                    if Original < 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'CG' + #39)
                end
                else
                begin
                    if Anterior > 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'RG' + #39)
                    else
                    if Anterior <= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoAnterior_ = ' + #39 + 'RR' + #39);

                    if Original > 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'RG' + #39)
                    else
                    if Original <= 0 then
                       ADOQuery3.SQL.Add(', _SituacaoOriginal_ = ' + #39 + 'RR' + #39);
                end;

                ADOQuery3.SQL.Add('WHERE `_Titulo_` = ' + #39 + ADOQuery1.Fields[0].AsString + #39);
                ADOQuery3.SQL.Add('AND `_Atualizacao_` = ' + IntToStr(frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1));
            end;

            ADOQuery3.ExecSQL;
            ADOQuery3.Close;

            ValorAnterior := ADOQuery2.Fields[4].Value;

            ADOQuery2.Next;
        end;
        ADOQuery2.Close;

        ADOQuery1.Next;
        frmAtualiza.pbTarefa.Position := frmAtualiza.pbTarefa.Position + 1;
        frmAtualiza.Update;
    end;

    ADOQuery1.Close;

    frmAtualiza.pbTarefa.Position := 0;
    frmAtualiza.Update;
end;

procedure TfrmScoredCard.Processo_5;
var
    i : integer;
    vetCampos  : array of string;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
       ADOQuery1.SQL.Add('SELECT TOP 1 * FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.SQL.Add('SELECT * FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('LIMIT 0,1');
    end;

    ADOQuery1.Open;
    SetLength(vetCampos,2);
    for i := 0 to ADOQuery1.FieldCount - 1 do
    begin
        vetCampos[i] := ADOQuery1.Fields[i].FieldName;
        SetLength(vetCampos,length(vetCampos) + 1);
    end;
    ADOQuery1.Close;

    try
        for i := 0 to Length(vetCampos) - 3 do
        begin
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;

            if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
               (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
               ADOQuery1.SQL.Add('CREATE INDEX [ix' + vetCampos[i] + '] ON [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '] ([' + vetCampos[i] + '])');

            if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
               ADOQuery1.SQL.Add('CREATE INDEX `ix' + vetCampos[i] + '` ON `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '` (`' + vetCampos[i] + '`)');

            ADOQuery1.ExecSQL;
            ADOQuery1.Close;;
        end;
    except
    end;
end;

procedure TfrmScoredCard.AtualizaScored;
var
    S : TMemoryStream;
begin
    if frmManScored <> nil then
       Exit;

    frmManScored := TfrmManScored.Create(Self);

    S := TMemoryStream.Create;
    frmScoredCard.tblScoredCardVALOR.SaveToStream(S);
    S.Position := 0;
    frmManScored.cxTreeList1.LoadFromStream(S);
    S.Free;

    frmAtualiza.pbGeral.Properties.Max := 6;

    frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_177');
    Processo_1;
    frmAtualiza.pbGeral.Position := 1;
    frmAtualiza.Update;

    frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_178');
    Processo_2;
    frmAtualiza.pbGeral.Position := 2;
    frmAtualiza.Update;

    frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_224');
    Processo_3;
    frmAtualiza.pbGeral.Position := 3;
    frmAtualiza.Update;

    if frmScoredCard.tblScoredCardATUALIZA_SITUACAO_ANTERIOR.Value = 'S' then
    begin
        frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_75');
        Processo_4;
        frmAtualiza.pbGeral.Position := 4;
        frmAtualiza.Update;
    end;

    frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_226');
    Processo_5;
    frmAtualiza.pbGeral.Position := 5;
    frmAtualiza.Update; 

    frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_317');
    Processo_6;
    frmAtualiza.pbGeral.Position := 6;
    frmAtualiza.Update;

    ADOQuery1.Close;
    ADOQuery2.Close;
    ADOQuery3.Close;

    FreeAndNil(frmManScored);
end;

procedure TfrmScoredCard.SpeedButton5Click(Sender: TObject);
var
    lPode : boolean;
    lPassa : boolean;
    iTime  : TTime;
begin
    if not frmScoredCard.tblScoredCard.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value,'#' + frmScoredCard.sUsuario,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value,frmScoredCard.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            if not frmScoredCard.lAtualizaBatch then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end
            else
                Application.Terminate;
        end;

       if not frmScoredCard.lAtualizaBatch then
       begin
           if MessageDlg(HCLResourceStrings.FindID('sString_109'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              lPassa := True
           else
              lPassa := False;
       end
       else
           lPassa := True;

       if lPassa then
       begin
          GeraLog(frmScoredCard.bdDados,
                  frmScoredCard.sUsuario,
                  Self.Name,
                  HCLResourceStrings.FindID('sString_357'),
                  'ScoredCard: ' + frmScoredCard.tblScoredCardID_SCORED.AsString);

          iTime := Time;
          frmAtualiza := TfrmAtualiza.Create(Self);

          //frmAtualiza.lblMensagem.Caption := HCLResourceStrings.FindID('sString_227') + frmScoredCard.tblScoredCardID_SCORED.Value;
          frmAtualiza.lblTarefa.Caption   := '';
          frmAtualiza.Show;
          frmAtualiza.Update;

          AtualizaScored;

          if not lErro then
          begin
              frmScoredCard.tblScoredCard.Edit;
              frmScoredCard.tblScoredCardDT_ATUALIZACAO.Value   := dt_movto;
              frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value := frmScoredCard.tblScoredCardNRO_ATUALIZACOES.Value + 1;
              frmScoredCard.tblScoredCard.Post;

              iTime := Time - iTime;

              if not frmScoredCard.lAtualizaBatch then
                 MessageDlg(HCLResourceStrings.FindID('sString_57') + TimeToStr(iTime), mtInformation, [mbOK], 0);
          end;

          FreeAndNil(frmAtualiza);
       end;
    end;
end;

procedure TfrmScoredCard.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not frmScoredCard.tblScoredCard.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value,'#' + frmScoredCard.sUsuario,',') then lPode := False else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value,frmScoredCard.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmVisualizarDadosScored = nil then
        begin
            frmVisualizarDadosScored := TfrmVisualizarDadosScored.Create(Self);
            frmVisualizarDadosScored.ShowModal;
            FreeAndNil(frmVisualizarDadosScored);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmVisualizarDadosScored);
        end;
    end;
end;

procedure TfrmScoredCard.cxButton1Click(Sender: TObject);
var
    aux : string;
    i : integer;
    ClickedOK: Boolean;
    Query : TADOQuery;
begin
    if frmScoredCard.tblScoredCard.IsEmpty then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_111'), mtInformation, [mbOK], 0);
        Exit;
    end;

    ClickedOK := InputQuery(HCLResourceStrings.FindID('sString_228'),HCLResourceStrings.FindID('sString_228'),aux);

    if not ClickedOK then
       exit;

    if aux = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_112'), mtInformation, [mbOK], 0);
        Exit;
    end;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;
    Query.CursorLocation := clUseServer;

    frmScoredCard.qryAtualiza.Close;
    frmScoredCard.qryAtualiza.SQL.Clear;
    frmScoredCard.qryAtualiza.SQL.Add('SELECT * FROM SCORED_CARD');
    frmScoredCard.qryAtualiza.SQL.Add('where ID_SCORED = ' + #39 + frmScoredCard.tblScoredCard.FieldByName('ID_SCORED').AsString + #39);
    frmScoredCard.qryAtualiza.Open;
    frmScoredCard.qryAtualiza.Insert;

    for i := 0 to frmScoredCard.tblScoredCard.FieldCount - 1 do
        frmScoredCard.qryAtualiza.FieldByName(frmScoredCard.tblScoredCard.Fields[i].FieldName).Value := frmScoredCard.tblScoredCard.Fields[i].Value;

    frmScoredCard.qryAtualiza.FieldByName('ID_SCORED').Value := aux;

    frmScoredCard.qryAtualiza.Post;

    frmScoredCard.qryAtualiza.Close;
    frmScoredCard.qryAtualiza.SQL.Clear;
    frmScoredCard.qryAtualiza.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
    frmScoredCard.qryAtualiza.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCard.FieldByName('ID_SCORED').AsString + #39);
    frmScoredCard.qryAtualiza.Open;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
    Query.SQL.Add('WHERE ID_SCORED = ' + #39 + '!' + #39);
    Query.Open;

    frmScoredCard.qryAtualiza.First;
    while not frmScoredCard.qryAtualiza.Eof do
    begin
        Query.Insert;

        for i := 0 to frmScoredCard.qryAtualiza.FieldCount - 1 do
           Query.FieldByName(frmScoredCard.qryAtualiza.Fields[i].FieldName).Value := frmScoredCard.qryAtualiza.Fields[i].Value;

        Query.FieldByName('ID_SCORED').Value := aux;
        Query.Post;

        frmScoredCard.qryAtualiza.Next;
    end;
    frmScoredCard.qryAtualiza.close;

    frmScoredCard.tblScoredCard.Close;
    frmScoredCard.tblScoredCard.Open;

    Query.Close;
    Query.Free;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

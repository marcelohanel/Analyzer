unit uRelatorios;

interface

uses
  ShellApi, xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  cxButtons,

  cxDBEdit, cxGridLevel,
  cxGridDBTableView,
  cxGrid, cxLabel,









  cxLookAndFeels,
  ADODB, dxSkinsForm, cxLocalization,
  CEVersionInfo, cxGraphics, cxLookAndFeelPainters, Menus, cxControls, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxContainer, cxTextEdit, cxMemo,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmRelatorios = class(TForm)
    dtsRelatorios: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton7: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBMemo2: TcxDBMemo;
    Label4: TcxLabel;
    cxButton1: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblRelatorios: TADOTable;
    tblRelatoriosID_RELATORIO: TWideStringField;
    tblRelatoriosDESCRICAO: TMemoField;
    tblRelatoriosRELATORIO: TBlobField;
    tblRelatoriosPODE_VISUALIZAR: TMemoField;
    tblRelatoriosPODE_ALTERAR: TMemoField;
    tblRelatoriosPODE_APAGAR: TMemoField;
    tblRelatoriosDT_CRIACAO: TDateTimeField;
    tblRelatoriosGRUPO: TWideStringField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblRelatoriosBeforeDelete(DataSet: TDataSet);
    procedure tblRelatoriosBeforePost(DataSet: TDataSet);
    procedure tblRelatoriosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ChamaReport(Report, Tipo: string);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoRelatorio : boolean;
    sTempDirUsuario : string;
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses uFuncoes, uPermissoesRelatorio, uAguarde, uManRelatorios;


{$R *.dfm}

procedure TfrmRelatorios.cxButton1Click(Sender: TObject);
begin
    tblRelatorios.Close;
    tblRelatorios.Open;
end;

procedure TfrmRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblRelatorios.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
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

    sSkin                        := sAux.Lines.Strings[0];
    sSGBD                        := sAux.Lines.Strings[3];
    sUsuario                     := sAux.Lines.Strings[4];
    sBanco                       := sAux.Lines.Strings[5];
    sPermissaoPermissaoRelatorio := StrToBool(sAux.Lines.Strings[6]);
    sTempDirUsuario              := 'C:\Analyzer\Temp\' + sUsuario + '\';

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

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblRelatorios.Close;
    tblRelatorios.Filtered := True;
    tblRelatorios.Open;
end;

procedure TfrmRelatorios.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmRelatorios.SpeedButton2Click(Sender: TObject);
begin
    ChamaReport('', 'New');
end;

procedure TfrmRelatorios.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblRelatorios.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblRelatoriosPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblRelatoriosPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if MessageDlg(HCLResourceStrings.FindID('sString_67'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
           tblRelatorios.Delete;
    end;
end;

procedure TfrmRelatorios.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if tblRelatorios.IsEmpty then
       Exit;

    if frmManRelatorios = nil then
    begin
        lPode := False;
        if EncontraLista(tblRelatoriosPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblRelatoriosPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        frmManRelatorios := TfrmManRelatorios.Create(Self);
        frmManRelatorios.ShowModal;
        FreeAndNil(frmManRelatorios);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManRelatorios);
    end;
end;

procedure TfrmRelatorios.ChamaReport(Report, Tipo: string);
var
  s_skin: string;
  s_connection: string;
  s_armazena: string;
  s_relatorio: string;
  comando : TStrings;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    s_skin       := dxSkinController1.SkinName;
    s_connection := bdDados.ConnectionString;
    s_armazena   := bdArmazena.ConnectionString;
    s_relatorio  := Report;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(s_skin);
    comando.Add(s_connection);
    comando.Add(s_armazena);
    comando.Add(s_relatorio);
    comando.SaveToFile(sTempDirUsuario + 'comandorelatorio.txt');

    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pRelatorios.exe'),
                 pchar('"' + sTempDirUsuario + 'comandorelatorio.txt"' + ' "' + sUsuario + '" "' + Tipo + '"'),
                 nil, sw_shownormal);

    Sleep(3000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmRelatorios.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblRelatorios.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblRelatoriosPODE_VISUALIZAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_VISUALIZAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblRelatoriosPODE_VISUALIZAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblRelatoriosPODE_VISUALIZAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        ChamaReport(tblRelatoriosID_RELATORIO.AsString, 'Report');
    end;
end;

procedure TfrmRelatorios.SpeedButton7Click(Sender: TObject);
begin
    if not tblRelatorios.IsEmpty then
    begin
        if sPermissaoPermissaoRelatorio = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesRelatorio = nil then
        begin
            frmPermissoesRelatorio := TfrmPermissoesRelatorio.Create(Self);
            frmPermissoesRelatorio.ShowModal;
            FreeAndNil(frmPermissoesRelatorio);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesRelatorio);
        end;
    end;
end;

procedure TfrmRelatorios.tblRelatoriosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblRelatoriosID_RELATORIO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_RELATORIO',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmRelatorios.tblRelatoriosBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       auxAntigo := #39 + tblRelatoriosID_RELATORIO.OldValue + #39;
       auxNovo   := #39 + tblRelatoriosID_RELATORIO.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES','ID_RELATORIO',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmRelatorios.tblRelatoriosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

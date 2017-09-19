unit uGeoAnalises;

interface

uses
  Shellapi, xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  cxButtons,

  cxDBEdit, cxGridLevel,
  cxGridDBTableView,
  cxGrid, cxLabel,







  cxLookAndFeels,


  dxSkinsForm, cxLocalization, CEVersionInfo, cxGraphics, cxLookAndFeelPainters,
  Menus, cxControls, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer, cxMemo,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeoAnalises = class(TForm)
    dtsGeoAnalises: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    grd1: TcxGrid;
    grd1DBTableView1: TcxGridDBTableView;
    grd1DBTableView1DBColumn1: TcxGridDBColumn;
    grd1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    Label1: TcxLabel;
    Label4: TcxLabel;
    SpeedButton2: TcxButton;
    cxButton2: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblGeoAnalises: TADOTable;
    tblGeoAnalisesID_GEO: TWideStringField;
    tblGeoAnalisesDESCRICAO: TWideMemoField;
    tblGeoAnalisesARQUIVO: TBlobField;
    tblGeoAnalisesPODE_VISUALIZAR: TWideMemoField;
    tblGeoAnalisesPODE_ALTERAR: TWideMemoField;
    tblGeoAnalisesPODE_APAGAR: TWideMemoField;
    tblGeoAnalisesDT_CRIACAO: TDateTimeField;
    tblGeoAnalisesGRUPO: TWideStringField;
    grd1DBTableView1Column1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxButton3: TcxButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblGeoAnalisesBeforeDelete(DataSet: TDataSet);
    procedure tblGeoAnalisesBeforePost(DataSet: TDataSet);
    procedure tblGeoAnalisesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoGeo : boolean;
    sTempDirUsuario : string;
  end;

var
  frmGeoAnalises: TfrmGeoAnalises;

implementation

uses uFuncoes, uPermissoesGeo, uDefinirGrupo;

{$R *.dfm}

procedure TfrmGeoAnalises.cxButton2Click(Sender: TObject);
begin
    tblGeoAnalises.Close;
    tblGeoAnalises.Open;
end;

procedure TfrmGeoAnalises.cxButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblGeoAnalises.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmDefinirGrupo = nil then
        begin
            frmDefinirGrupo := TfrmDefinirGrupo.Create(Self);
            frmDefinirGrupo.ShowModal;
            FreeAndNil(frmDefinirGrupo);

            tblGeoAnalises.Close;
            tblGeoAnalises.Open;
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmDefinirGrupo);
        end;
    end;
end;

procedure TfrmGeoAnalises.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblGeoAnalises.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmGeoAnalises.FormCreate(Sender: TObject);
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

    sSkin                  := sAux.Lines.Strings[0];
    sSGBD                  := sAux.Lines.Strings[3];
    sUsuario               := sAux.Lines.Strings[4];
    sBanco                 := sAux.Lines.Strings[5];
    sPermissaoPermissaoGeo := StrToBool(sAux.Lines.Strings[6]);
    sTempDirUsuario        := 'C:\Analyzer\Temp\' + sUsuario + '\';

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

procedure TfrmGeoAnalises.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblGeoAnalises.Close;
    tblGeoAnalises.Filtered := True;
    tblGeoAnalises.Open;
end;

procedure TfrmGeoAnalises.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmGeoAnalises.SpeedButton2Click(Sender: TObject);
var
    comando : TStrings;
    sCon, sPas : string;
begin
    sPas := '"kc4570mh"';
    sCon := sTempDirUsuario + 'conexaogeo.txt';

    comando := TStringList.Create;
    comando.Clear;
    comando.Add(bdDados.ConnectionString);
    comando.SaveToFile(sCon);
    comando.Free;

    ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pGeoAnalises.exe'),pchar(sPas + ' "' + dxSkinController1.SkinName + '" "' + sCon + '" "' + sUsuario + '" "/Criar"'), nil, sw_shownormal);
end;

procedure TfrmGeoAnalises.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblGeoAnalises.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblGeoAnalisesPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblGeoAnalisesPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_353'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblGeoAnalises.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_354') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmGeoAnalises.SpeedButton3Click(Sender: TObject);
var
    comando : TStrings;
    lPode : boolean;
    sCon, sPas : string;
begin
    if not tblGeoAnalises.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblGeoAnalisesPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        sPas := '"kc4570mh"';
        sCon := sTempDirUsuario + 'conexaogeo.txt';

        comando := TStringList.Create;
        comando.Clear;
        comando.Add(bdDados.ConnectionString);
        comando.SaveToFile(sCon);
        comando.Free;

        ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pGeoAnalises.exe'),pchar(sPas + ' "' + dxSkinController1.SkinName + '" "' + sCon + '" "' + sUsuario + '" "/Alterar" "' + tblGeoAnalisesID_GEO.AsString + '" "Sim"'), nil, sw_shownormal);
    end;
end;

procedure TfrmGeoAnalises.SpeedButton7Click(Sender: TObject);
begin
    if not tblGeoAnalises.IsEmpty then
    begin
        if sPermissaoPermissaoGeo = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesGeo = nil then
        begin
            frmPermissoesGeo := TfrmPermissoesGeo.Create(Self);
            frmPermissoesGeo.ShowModal;
            FreeAndNil(frmPermissoesGeo);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesGeo);
        end;
    end;
end;

procedure TfrmGeoAnalises.tblGeoAnalisesBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblGeoAnalisesID_GEO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_GEO',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmGeoAnalises.tblGeoAnalisesBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
        auxAntigo := #39 + tblGeoAnalisesID_GEO.OldValue + #39;
        auxNovo   := #39 + tblGeoAnalisesID_GEO.Value    + #39;
    except
        lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES','ID_GEO',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmGeoAnalises.tblGeoAnalisesFilterRecord(DataSet: TDataSet;
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

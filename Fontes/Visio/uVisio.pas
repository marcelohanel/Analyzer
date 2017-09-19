unit uVisio;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  TfrmVisio = class(TForm)
    dtsVisio: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    Label1: TcxLabel;
    Label4: TcxLabel;
    SpeedButton2: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    tblVisio: TADOTable;
    tblVisioID_VISIO: TWideStringField;
    tblVisioDESCRICAO: TWideMemoField;
    tblVisioARQUIVO: TWideStringField;
    tblVisioPODE_VISUALIZAR: TWideMemoField;
    tblVisioPODE_ALTERAR: TWideMemoField;
    tblVisioPODE_APAGAR: TWideMemoField;
    tblVisioDT_CRIACAO: TDateTimeField;
    qryAtualiza: TADOQuery;
    cxButton4: TcxButton;
    tblVisioGRUPO: TWideStringField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblVisioBeforeDelete(DataSet: TDataSet);
    procedure tblVisioBeforePost(DataSet: TDataSet);
    procedure tblVisioFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoVisio : boolean;
  end;

var
  frmVisio: TfrmVisio;

implementation

uses uFuncoes, uPermissoesVisio, uManVisio;

{$R *.dfm}

procedure TfrmVisio.cxButton4Click(Sender: TObject);
begin
    tblVisio.Close;
    tblVisio.Open;
end;

procedure TfrmVisio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblVisio.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmVisio.FormCreate(Sender: TObject);
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

    sSkin                    := sAux.Lines.Strings[0];
    sSGBD                    := sAux.Lines.Strings[3];
    sUsuario                 := sAux.Lines.Strings[4];
    sBanco                   := sAux.Lines.Strings[5];
    sPermissaoPermissaoVisio := StrToBool(sAux.Lines.Strings[6]);

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

procedure TfrmVisio.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblVisio.Close;
    tblVisio.Filtered := True;
    tblVisio.Open;
end;

procedure TfrmVisio.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmVisio.SpeedButton2Click(Sender: TObject);
begin
    if frmManVisio = nil then
    begin
        frmManVisio := TfrmManVisio.Create(Self);
        frmManVisio.Tipo := 'Criar';
        frmManVisio.ShowModal;
        FreeAndNil(frmManVisio);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManVisio);
    end;
end;

procedure TfrmVisio.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblVisio.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblVisioPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblVisioPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblVisioPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblVisioPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_287'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
           begin
               tblVisio.Delete;
           end;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_288') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmVisio.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblVisio.IsEmpty then
    begin
        if frmManVisio = nil then
        begin
            lPode := False;
            if EncontraLista(tblVisioPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
            if EncontraLista(tblVisioPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
            if EncontraLista(tblVisioPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
            if EncontraLista(tblVisioPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManVisio := TfrmManVisio.Create(Self);
            frmManVisio.Tipo := 'Alterar';
            frmManVisio.ShowModal;
            FreeAndNil(frmManVisio);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManVisio);
        end;
    end;
end;

procedure TfrmVisio.SpeedButton7Click(Sender: TObject);
begin
    if not tblVisio.IsEmpty then
    begin
        if sPermissaoPermissaoVisio = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesVisio = nil then
        begin
            frmPermissoesVisio := TfrmPermissoesVisio.Create(Self);
            frmPermissoesVisio.ShowModal;
            FreeAndNil(frmPermissoesVisio);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesVisio);
        end;
    end;
end;

procedure TfrmVisio.tblVisioBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblVisioID_VISIO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_VISIO',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmVisio.tblVisioBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
        auxAntigo := #39 + tblVisioID_VISIO.OldValue + #39;
        auxNovo   := #39 + tblVisioID_VISIO.Value    + #39;
    except
        lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES','ID_VISIO',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmVisio.tblVisioFilterRecord(DataSet: TDataSet;
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

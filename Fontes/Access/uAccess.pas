unit uAccess;

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
  TfrmAccess = class(TForm)
    dtsAccess: TDataSource;
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
    qryAtualiza: TADOQuery;
    tblAccess: TADOTable;
    tblAccessID_ACCESS: TWideStringField;
    tblAccessDESCRICAO: TWideMemoField;
    tblAccessARQUIVO: TWideStringField;
    tblAccessMACRO: TWideStringField;
    tblAccessPODE_VISUALIZAR: TWideMemoField;
    tblAccessPODE_ALTERAR: TWideMemoField;
    tblAccessPODE_APAGAR: TWideMemoField;
    tblAccessDT_CRIACAO: TDateTimeField;
    cxButton4: TcxButton;
    tblAccessGRUPO: TWideStringField;
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
    procedure tblAccessBeforeDelete(DataSet: TDataSet);
    procedure tblAccessBeforePost(DataSet: TDataSet);
    procedure tblAccessFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoAccess : boolean;
  end;

var
  frmAccess: TfrmAccess;

implementation

uses uFuncoes, uPermissoesAccess, uManAccess;

{$R *.dfm}

procedure TfrmAccess.cxButton4Click(Sender: TObject);
begin
    tblAccess.Close;
    tblAccess.Open;
end;

procedure TfrmAccess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblAccess.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmAccess.FormCreate(Sender: TObject);
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
    sPermissaoPermissaoAccess := StrToBool(sAux.Lines.Strings[6]);

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

procedure TfrmAccess.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblAccess.Close;
    tblAccess.Filtered := True;
    tblAccess.Open;
end;

procedure TfrmAccess.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmAccess.SpeedButton2Click(Sender: TObject);
begin
    if frmManAccess = nil then
    begin
        frmManAccess := TfrmManAccess.Create(Self);
        frmManAccess.Tipo := 'Criar';
        frmManAccess.ShowModal;
        FreeAndNil(frmManAccess);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManAccess);
    end;
end;

procedure TfrmAccess.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblAccess.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblAccessPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblAccessPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblAccessPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblAccessPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_274'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblAccess.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_275') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmAccess.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblAccess.IsEmpty then
    begin
        if frmManAccess = nil then
        begin
            lPode := False;
            if EncontraLista(tblAccessPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
            if EncontraLista(tblAccessPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
            if EncontraLista(tblAccessPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
            if EncontraLista(tblAccessPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManAccess := TfrmManAccess.Create(Self);
            frmManAccess.Tipo := 'Alterar';
            frmManAccess.ShowModal;
            FreeAndNil(frmManAccess);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManAccess);
        end;
    end;
end;

procedure TfrmAccess.SpeedButton7Click(Sender: TObject);
begin
    if not tblAccess.IsEmpty then
    begin
        if sPermissaoPermissaoAccess = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesAccess = nil then
        begin
            frmPermissoesAccess := TfrmPermissoesAccess.Create(Self);
            frmPermissoesAccess.ShowModal;
            FreeAndNil(frmPermissoesAccess);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesAccess);
        end;
    end;
end;

procedure TfrmAccess.tblAccessBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblAccessID_ACCESS.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_ACCESS',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmAccess.tblAccessBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
        auxAntigo := #39 + tblAccessID_ACCESS.OldValue + #39;
        auxNovo   := #39 + tblAccessID_ACCESS.Value    + #39;
    except
        lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES','ID_ACCESS',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmAccess.tblAccessFilterRecord(DataSet: TDataSet;
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

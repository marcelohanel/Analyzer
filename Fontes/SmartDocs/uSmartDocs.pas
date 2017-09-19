unit uSmartDocs;

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
  TfrmSmartDocs = class(TForm)
    dtsSmartDocs: TDataSource;
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
    tblSmartDocs: TADOTable;
    tblSmartDocsID_SMARTDOCS: TWideStringField;
    tblSmartDocsDESCRICAO: TWideMemoField;
    tblSmartDocsPODE_VISUALIZAR: TWideMemoField;
    tblSmartDocsPODE_ALTERAR: TWideMemoField;
    tblSmartDocsPODE_APAGAR: TWideMemoField;
    tblSmartDocsARQUIVO: TBlobField;
    tblSmartDocsNOME_ARQUIVO: TWideStringField;
    tblSmartDocsTIPO_ARQUIVO: TWideStringField;
    tblSmartDocsID_ANALISE: TWideStringField;
    tblSmartDocsPLANILHA: TIntegerField;
    tblSmartDocsCOMPLEMENTO_SQL: TWideMemoField;
    tblSmartDocsPLANILHA_INI: TIntegerField;
    tblSmartDocsDT_CRIACAO: TDateTimeField;
    cxButton4: TcxButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblSmartDocsBeforeDelete(DataSet: TDataSet);
    procedure tblSmartDocsBeforePost(DataSet: TDataSet);
    procedure tblSmartDocsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sTempDirUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoSmartDocs : boolean;
  end;

var
  frmSmartDocs: TfrmSmartDocs;

implementation

uses uFuncoes, uPermissoesSmartDocs, uManSmartDocs;

{$R *.dfm}

procedure TfrmSmartDocs.cxButton4Click(Sender: TObject);
begin
    tblSmartDocs.Close;
    tblSmartDocs.Open;
end;

procedure TfrmSmartDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    tblSmartDocs.First;
    while not tblSmartDocs.Eof do
    begin
        try
           DeleteFile(sTempDirUsuario + tblSmartDocsNOME_ARQUIVO.AsString);
        except
        end;
        tblSmartDocs.Next;
    end;

    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblSmartDocs.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmSmartDocs.FormCreate(Sender: TObject);
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
    sPermissaoPermissaoSmartDocs := StrToBool(sAux.Lines.Strings[6]);
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

procedure TfrmSmartDocs.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblSmartDocs.Close;
    tblSmartDocs.Filtered := True;
    tblSmartDocs.Open;
end;

procedure TfrmSmartDocs.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSmartDocs.SpeedButton2Click(Sender: TObject);
begin
   if frmManSmartDocs = nil then
    begin
        frmManSmartDocs := TfrmManSmartDocs.Create(Self);
        frmManSmartDocs.Tipo := 'Criar';
        frmManSmartDocs.ShowModal;
        FreeAndNil(frmManSmartDocs);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManSmartDocs);
    end;
end;

procedure TfrmSmartDocs.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblSmartDocs.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblSmartDocsPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblSmartDocsPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblSmartDocsPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblSmartDocsPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_136'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblSmartDocs.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_127') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmSmartDocs.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblSmartDocs.IsEmpty then
    begin
        if frmManSmartDocs = nil then
        begin
            lPode := False;
            if EncontraLista(tblSmartDocsPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
            if EncontraLista(tblSmartDocsPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
            if EncontraLista(tblSmartDocsPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
            if EncontraLista(tblSmartDocsPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManSmartDocs := TfrmManSmartDocs.Create(Self);
            frmManSmartDocs.Tipo := 'Alterar';
            frmManSmartDocs.ShowModal;
            FreeAndNil(frmManSmartDocs);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManSmartDocs);
        end;
    end;
end;

procedure TfrmSmartDocs.SpeedButton7Click(Sender: TObject);
begin
    if not tblSmartDocs.IsEmpty then
    begin
        if sPermissaoPermissaoSmartDocs = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesSmartDocs = nil then
        begin
            frmPermissoesSmartDocs := TfrmPermissoesSmartDocs.Create(Self);
            frmPermissoesSmartDocs.ShowModal;
            FreeAndNil(frmPermissoesSmartDocs);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesSmartDocs);
        end;
    end;
end;

procedure TfrmSmartDocs.tblSmartDocsBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblSmartDocsID_SMARTDOCS.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES', 'ID_SMARTDOCS',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmSmartDocs.tblSmartDocsBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblSmartDocsID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblSmartDocsID_SMARTDOCS.OldValue + #39;
       auxNovo   := #39 + tblSmartDocsID_SMARTDOCS.Value    + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not UpdateCascade(bdDados,0,'PADROES', 'ID_SMARTDOCS',auxAntigo, auxNovo) then Abort;
end;

procedure TfrmSmartDocs.tblSmartDocsFilterRecord(DataSet: TDataSet;
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

unit uCadFotografia;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  ADODB, cxButtons,

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
  TfrmCadFotografia = class(TForm)
    dtsFotografia: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    DBEdit2: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label4: TcxLabel;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblCenarios: TADOTable;
    tblCenariosID_CENARIO: TWideStringField;
    tblCenariosID_USUARIO: TWideStringField;
    tblCenariosID_ANALISE: TWideStringField;
    tblCenariosID_ABC: TWideStringField;
    tblCenariosFILTROS: TMemoField;
    tblCenariosELEMENTOS: TMemoField;
    tblCenariosVALORES: TMemoField;
    tblCenariosA: TWideStringField;
    tblCenariosB: TWideStringField;
    tblCenariosC: TWideStringField;
    tblCenariosD: TWideStringField;
    tblCenariosE: TWideStringField;
    tblCenariosFOTOGRAFIA_DATA: TWideStringField;
    tblCenariosFOTOGRAFIA_VALOR: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_FIM: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA: TWideStringField;
    tblCenariosFREQUENCIA_VALOR: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_INI: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA_BASE: TWideStringField;
    tblCenariosID_FOTOGRAFIA: TWideStringField;
    tblCenariosID_FREQUENCIA: TWideStringField;
    tblCenariosORDEM: TWideStringField;
    tblCenariosORDEM_TIPO: TWideStringField;
    tblCenariosLINHAS: TIntegerField;
    tblCenariosFILTRO_PERSONALIZADO_TEXTO: TWideMemoField;
    tblCenariosFILTRO_PERSONALIZADO_GRAFICO: TBlobField;
    tblCenariosREGISTROS: TIntegerField;
    tblCenariosFREQUENCIA_DIAS: TIntegerField;
    tblCenariosFREQUENCIA_ATUAL: TWideStringField;
    tblAnalises: TADOTable;
    tblAnalisesID_ANALISE: TWideStringField;
    tblAnalisesDESCRICAO: TMemoField;
    tblAnalisesBASE_ORIGEM: TMemoField;
    tblAnalisesVISAO_ORIGEM: TWideStringField;
    tblAnalisesVISAO_DESTINO: TWideStringField;
    tblAnalisesINCREMENTAL: TWideStringField;
    tblAnalisesPODE_VISUALIZAR: TMemoField;
    tblAnalisesPODE_ALTERAR: TMemoField;
    tblAnalisesPODE_ATUALIZAR: TMemoField;
    tblAnalisesPODE_APAGAR: TMemoField;
    tblAnalisesDT_ATUALIZACAO: TDateTimeField;
    tblAnalisesINTERNA: TWideStringField;
    tblAnalisesANALISES_IGNORADOS: TMemoField;
    tblAnalisesVALORES_IGNORADOS: TMemoField;
    tblAnalisesGRID: TWideStringField;
    tblAnalisesGRUPO: TWideStringField;
    tblAnalisesDT_CRIACAO: TDateTimeField;
    tblFotografia: TADOTable;
    tblFotografiaID_FOTOGRAFIA: TWideStringField;
    tblFotografiaID_ANALISE: TWideStringField;
    tblFotografiaDESCRICAO: TMemoField;
    tblFotografiaPODE_VISUALIZAR: TMemoField;
    tblFotografiaPODE_ALTERAR: TMemoField;
    tblFotografiaPODE_APAGAR: TMemoField;
    tblFotografiaDT_CRIACAO: TDateTimeField;
    SpeedButton6: TcxButton;
    cxButton4: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblCenariosBeforePost(DataSet: TDataSet);
    procedure tblCenariosBeforeDelete(DataSet: TDataSet);
    procedure tblCenariosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblFotografiaBeforeDelete(DataSet: TDataSet);
    procedure tblFotografiaBeforePost(DataSet: TDataSet);
    procedure tblFotografiaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure tblAnalisesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoFotografia : boolean;
    sTempDirUsuario : string;
  end;

var
  frmCadFotografia: TfrmCadFotografia;

implementation

uses uFuncoes, uPermissoesFotografia, uManFotografia;

{$R *.dfm}

procedure TfrmCadFotografia.cxButton4Click(Sender: TObject);
begin
    tblFotografia.Close;
    tblFotografia.Open;
end;

procedure TfrmCadFotografia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmCadFotografia.bdDados,frmCadFotografia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblAnalises.Close;
    tblFotografia.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmCadFotografia.FormCreate(Sender: TObject);
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

    sSkin                         := sAux.Lines.Strings[0];
    sSGBD                         := sAux.Lines.Strings[3];
    sUsuario                      := sAux.Lines.Strings[4];
    sBanco                        := sAux.Lines.Strings[5];
    sPermissaoPermissaoFotografia := StrToBool(sAux.Lines.Strings[6]);
    sTempDirUsuario               := 'C:\Analyzer\Temp\' + sUsuario + '\';

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

procedure TfrmCadFotografia.FormShow(Sender: TObject);
begin
    GeraLog(frmCadFotografia.bdDados,frmCadFotografia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblFotografia.Close;
    tblFotografia.Filtered := True;
    tblFotografia.Open;

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;
end;

procedure TfrmCadFotografia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCadFotografia.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadFotografia.tblFotografia.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmCadFotografia.tblFotografiaPODE_APAGAR.Value,'#*'                           ,',') then lPode := False else
        if EncontraLista(frmCadFotografia.tblFotografiaPODE_APAGAR.Value,'#' + frmCadFotografia.sUsuario,',') then lPode := False else
        if EncontraLista(frmCadFotografia.tblFotografiaPODE_APAGAR.Value,'*'                            ,',') then lPode := True  else
        if EncontraLista(frmCadFotografia.tblFotografiaPODE_APAGAR.Value,frmCadFotografia.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_152'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
           begin
               frmCadFotografia.tblFotografia.Delete;
           end;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_153') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmCadFotografia.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadFotografia.tblFotografia.IsEmpty = False then
    begin
        if frmManFotografia = nil then
        begin
            lPode := False;
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_VISUALIZAR.Value,'#*'                       ,',') then lPode := False else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_VISUALIZAR.Value,'#' + frmCadFotografia.sUsuario,',') then lPode := False else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_VISUALIZAR.Value,'*'                        ,',') then lPode := True  else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_VISUALIZAR.Value,frmCadFotografia.sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManFotografia := TfrmManFotografia.Create(Self);
            frmManFotografia.Tipo := 'Visualizar';
            frmManFotografia.cxButton1.Click;
            FreeAndNil(frmManFotografia);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManFotografia);
        end;
    end;
end;

procedure TfrmCadFotografia.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadFotografia.tblFotografia.IsEmpty = False then
    begin
        if frmManFotografia = nil then
        begin
            lPode := False;
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_ALTERAR.Value,'#*'                       ,',') then lPode := False else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_ALTERAR.Value,'#' + frmCadFotografia.sUsuario,',') then lPode := False else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_ALTERAR.Value,'*'                        ,',') then lPode := True  else
            if EncontraLista(frmCadFotografia.tblFotografiaPODE_ALTERAR.Value,frmCadFotografia.sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManFotografia := TfrmManFotografia.Create(Self);
            frmManFotografia.Tipo := 'Alterar';
            frmManFotografia.ShowModal;
            FreeAndNil(frmManFotografia);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManFotografia);
        end;
    end;
end;

procedure TfrmCadFotografia.SpeedButton7Click(Sender: TObject);
begin
    if frmCadFotografia.tblFotografia.IsEmpty = False then
    begin
        if frmCadFotografia.sPermissaoPermissaoFotografia = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesFotografia = nil then
        begin
            frmPermissoesFotografia := TfrmPermissoesFotografia.Create(Self);
            frmPermissoesFotografia.ShowModal;
            FreeAndNil(frmPermissoesFotografia);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesFotografia);
        end;
    end;
end;

procedure TfrmCadFotografia.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmCadFotografia.tblCenariosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblCenariosID_CENARIO.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not DeleteCascade(bdDados,0,'PADROES','ID_CENARIO',aux) then Abort;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmCadFotografia.tblCenariosBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblCenariosID_FREQUENCIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FREQUENCIA','ID_FREQUENCIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_FOTOGRAFIA.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'FOTOGRAFIA','ID_FOTOGRAFIA',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_ABC.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ABC','ID_ABC',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosID_USUARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'USUARIOS','ID_USUARIO',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblCenariosID_CENARIO.OldValue + #39;
       auxNovo   := #39 + tblCenariosID_CENARIO.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
       if not UpdateCascade(bdDados,0,'PADROES','ID_CENARIO',auxAntigo, auxNovo) then Abort;
end;

procedure TfrmCadFotografia.tblCenariosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmCadFotografia.tblFotografiaBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblFotografiaID_FOTOGRAFIA.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES', 'ID_FOTOGRAFIA',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS','ID_FOTOGRAFIA',aux) then Abort;
    end;

    GeraLog(bdDados,frmCadFotografia.sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmCadFotografia.tblFotografiaBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblFotografiaID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblFotografiaID_FOTOGRAFIA.OldValue + #39;
       auxNovo   := #39 + tblFotografiaID_FOTOGRAFIA.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES', 'ID_FOTOGRAFIA',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS','ID_FOTOGRAFIA',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmCadFotografia.tblFotografiaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,frmCadFotografia.sUsuario,',') then
       Accept := True;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

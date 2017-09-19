unit uCadABC;

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
  TfrmCadABC = class(TForm)
    dtsABC: TDataSource;
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
    bdDados: TADOConnection;
    bdArmazena: TADOConnection;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
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
    qryAtualiza: TADOQuery;
    tblABC: TADOTable;
    tblABCID_ABC: TWideStringField;
    tblABCID_ANALISE: TWideStringField;
    tblABCDESCRICAO: TMemoField;
    tblABCPODE_VISUALIZAR: TMemoField;
    tblABCPODE_ALTERAR: TMemoField;
    tblABCPODE_APAGAR: TMemoField;
    tblABCDT_CRIACAO: TDateTimeField;
    SpeedButton6: TcxButton;
    cxButton4: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblCenariosBeforeDelete(DataSet: TDataSet);
    procedure tblCenariosBeforePost(DataSet: TDataSet);
    procedure tblCenariosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblAnalisesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblABCBeforeDelete(DataSet: TDataSet);
    procedure tblABCBeforePost(DataSet: TDataSet);
    procedure tblABCFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoABC : boolean;
    sTempDirUsuario : string;
  end;

var
  frmCadABC: TfrmCadABC;

implementation

uses uFuncoes, uPermissoesABC, uManABC;

{$R *.dfm}

procedure TfrmCadABC.cxButton4Click(Sender: TObject);
begin
    tblABC.Close;
    tblABC.Open;
end;

procedure TfrmCadABC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmCadABC.bdDados,frmCadABC.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblAnalises.Close;
    tblABC.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmCadABC.FormCreate(Sender: TObject);
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
    sPermissaoPermissaoABC := StrToBool(sAux.Lines.Strings[6]);
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

procedure TfrmCadABC.FormShow(Sender: TObject);
begin
    GeraLog(frmCadABC.bdDados,frmCadABC.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblABC.Close;
    tblABC.Filtered := True;
    tblABC.Open;

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;
end;

procedure TfrmCadABC.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCadABC.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadABC.tblABC.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmCadABC.tblABCPODE_APAGAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmCadABC.tblABCPODE_APAGAR.Value,'#' + frmCadABC.sUsuario,',') then lPode := False else
        if EncontraLista(frmCadABC.tblABCPODE_APAGAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmCadABC.tblABCPODE_APAGAR.Value,frmCadABC.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_140'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              frmCadABC.tblABC.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_141') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmCadABC.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadABC.tblABC.IsEmpty = False then
    begin
        if frmManABC = nil then
        begin
            lPode := False;
            if EncontraLista(frmCadABC.tblABCPODE_VISUALIZAR.Value,'#*'                    ,',') then lPode := False else
            if EncontraLista(frmCadABC.tblABCPODE_VISUALIZAR.Value,'#' + frmCadABC.sUsuario,',') then lPode := False else
            if EncontraLista(frmCadABC.tblABCPODE_VISUALIZAR.Value,'*'                     ,',') then lPode := True  else
            if EncontraLista(frmCadABC.tblABCPODE_VISUALIZAR.Value,frmCadABC.sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManABC := TfrmManABC.Create(Self);
            frmManABC.Tipo := 'Visualizar';
            frmManABC.cxButton1.Click;
            FreeAndNil(frmManABC);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManABC);
        end;
    end;
end;

procedure TfrmCadABC.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmCadABC.tblABC.IsEmpty = False then
    begin
        if frmManABC = nil then
        begin
            lPode := False;
            if EncontraLista(frmCadABC.tblABCPODE_ALTERAR.Value,'#*'                       ,',') then lPode := False else
            if EncontraLista(frmCadABC.tblABCPODE_ALTERAR.Value,'#' + frmCadABC.sUsuario,',') then lPode := False else
            if EncontraLista(frmCadABC.tblABCPODE_ALTERAR.Value,'*'                        ,',') then lPode := True  else
            if EncontraLista(frmCadABC.tblABCPODE_ALTERAR.Value,frmCadABC.sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManABC := TfrmManABC.Create(Self);
            frmManABC.Tipo := 'Alterar';
            frmManABC.ShowModal;
            FreeAndNil(frmManABC);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManABC);
        end;
    end;
end;

procedure TfrmCadABC.SpeedButton7Click(Sender: TObject);
begin
    if frmCadABC.tblABC.IsEmpty = False then
    begin
        if frmCadABC.sPermissaoPermissaoABC = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesABC = nil then
        begin
            frmPermissoesABC := TfrmPermissoesABC.Create(Self);
            frmPermissoesABC.ShowModal;
            FreeAndNil(frmPermissoesABC);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesABC);
        end;
    end;
end;

procedure TfrmCadABC.tblABCBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblABCID_ABC.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES', 'ID_ABC',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS','ID_ABC',aux) then Abort;
    end;

    GeraLog(bdDados,frmCadABC.sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmCadABC.tblABCBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblABCID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblABCID_ABC.OldValue + #39;
       auxNovo   := #39 + tblABCID_ABC.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES', 'ID_ABC',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS','ID_ABC',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmCadABC.tblABCFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,frmCadABC.sUsuario,',') then
       Accept := True;
end;

procedure TfrmCadABC.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmCadABC.tblCenariosBeforeDelete(DataSet: TDataSet);
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

procedure TfrmCadABC.tblCenariosBeforePost(DataSet: TDataSet);
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

procedure TfrmCadABC.tblCenariosFilterRecord(DataSet: TDataSet;
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

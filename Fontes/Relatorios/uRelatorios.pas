unit uRelatorios;

interface

uses
  Variants,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ppDBPipe, StdCtrls, ppChrtUI, daADO,  ppVar, ppPrnabl,
  ppClass, ppReport, ppEndUsr, ppBands,  ppCtrls, daDataView, daQueryDataView, daDataModule,
  ExtCtrls, ppParameter, cxLookAndFeels, xhConsts, cxLocalization,
  dxSkinsForm, ADODB, cxGraphics, cxControls, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,  ppRptExp,
  ppDsgnDB, ppTxPipe, ppCTDsgn,  raCodMod,
  ppStrtch, ppSubRpt, daQuery, daQClass, daIBExpress, daDB, daDataVw,
  ppDBBDE, daDatMod, daDatMan, daDBBDE, raIDE,
  daQueryWizard, daQueryDesigner, daMetaData, ppPDFDevice,
  dxSkinXmas2008Blue, CEVersionInfo, ppDB, ppCache, ppComm, ppRelatv, ppProd,
  cxLabel, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;
type
  TfrmRelatorios = class(TForm)
    bdDados: TADOConnection;
    dxSkinController1: TdxSkinController;
    tblRelatorios: TADOTable;
    tblRelatoriosID_RELATORIO: TWideStringField;
    tblRelatoriosDESCRICAO: TMemoField;
    tblRelatoriosRELATORIO: TBlobField;
    tblRelatoriosPODE_VISUALIZAR: TMemoField;
    tblRelatoriosPODE_ALTERAR: TMemoField;
    tblRelatoriosPODE_APAGAR: TMemoField;
    tblRelatoriosDT_CRIACAO: TDateTimeField;
    dtsRelatorios: TDataSource;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppDesigner1: TppDesigner;
    pplRelatorios: TppDBPipeline;
    Memo1: TMemo;
    cxLocalizer1: TcxLocalizer;
    bdArmazena: TADOConnection;
    CEVersionInfo1: TCEVersionInfo;
    Timer1: TTimer;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Inicializa;
    procedure Timer1Timer(Sender: TObject);
    procedure tblRelatoriosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sTempDirUsuario : string;
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblRelatorios.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(1));
    except
    end;

end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
var
    sSkin : string;
begin
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    SetLanguage(2, cxLocalizer1);

    Memo1.Lines.Clear;

    sUsuario        := ParamStr(2);
    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';
    ppDesigner1.IniStorageName := sTempDirUsuario + 'RBuilder.ini';

    if FileExists(ParamStr(1)) then
       Memo1.Lines.LoadFromFile(ParamStr(1))
    else
       Application.Terminate;

    sSkin := Memo1.Lines.Strings[0]; //Entry(1,Memo1.Lines.Text,'#');

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := Memo1.Lines.Strings[1];
      bdDados.Open;

      bdArmazena.Close;
      bdArmazena.ConnectionString := Memo1.Lines.Strings[2];
      bdArmazena.Open;

      tblRelatorios.Open;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
    Self.Caption := Self.Caption;
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
    Timer1.Enabled := True;
end;

procedure TfrmRelatorios.Inicializa;
begin
    Timer1.Enabled := False;

    if ParamStr(3) = 'New' then
    begin
        ppReport1.Template.New;
        ppDesigner1.ShowModal;
    end
    else
    begin
        if tblRelatorios.Locate('ID_RELATORIO',Memo1.Lines.Strings[3],[]) then
        begin
            try
                ppReport1.Template.DatabaseSettings.Name := tblRelatoriosID_RELATORIO.AsString;
                ppReport1.Template.LoadFromDatabase;

                if ParamStr(3) = 'Report' then
                   ppReport1.PrintReport;

                if ParamStr(3) = 'Designer' then
                   ppDesigner1.ShowModal;
            except
                MessageDlg(HCLResourceStrings.FindID('sString_31'), mtInformation, [mbOK], 0);
            end;
        end;
    end;

    Close;
end;

procedure TfrmRelatorios.tblRelatoriosAfterInsert(DataSet: TDataSet);
begin
    if sUsuario <> 'admin' then
    begin
        tblRelatoriosPODE_VISUALIZAR.Value := sUsuario + ', admin';
        tblRelatoriosPODE_ALTERAR.Value    := sUsuario + ', admin';
        tblRelatoriosPODE_APAGAR.Value     := sUsuario + ', admin';
    end
    else
    begin
        tblRelatoriosPODE_VISUALIZAR.Value := sUsuario;
        tblRelatoriosPODE_ALTERAR.Value    := sUsuario;
        tblRelatoriosPODE_APAGAR.Value     := sUsuario;
    end;

end;

procedure TfrmRelatorios.Timer1Timer(Sender: TObject);
begin
    Inicializa;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

unit uLogs;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,






  cxLabel, StdCtrls, cxButtons,

  DB, cxLookAndFeels,

  cxGridDBTableView, cxGridLevel,
  cxGrid, cxGridPopupMenu,



  dxPSCore, cxCalendar,
  ExtCtrls,


  dxSkinsForm, cxLocalization, CEVersionInfo, DateUtils, cxGraphics, cxControls,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit, Menus,
  cxContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxPScxCommon, cxGridCustomPopupMenu, cxMaskEdit,
  cxDropDownEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxPScxTLLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxCore,
  cxDateUtils, ComCtrls;

type
  TfrmLogs = class(TForm)
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1LOCALIZACAO: TcxGridDBColumn;
    cxGrid1DBTableView1EVENTO: TcxGridDBColumn;
    cxGrid1DBTableView1EQUIPAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_HORA: TcxGridDBColumn;
    cxGrid1DBTableView1OBSERVACOES: TcxGridDBColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    Panel1: TPanel;
    btnPrint: TcxButton;
    SpeedButton3: TcxButton;
    cxGrid1DBTableView1APLICATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1VERSAO: TcxGridDBColumn;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryLogs: TADOQuery;
    qryLogsID_USUARIO: TWideStringField;
    qryLogsLOCALIZACAO: TWideStringField;
    qryLogsEVENTO: TWideStringField;
    qryLogsEQUIPAMENTO: TWideStringField;
    qryLogsDATA_HORA: TDateTimeField;
    qryLogsAPLICATIVO: TWideStringField;
    qryLogsOBSERVACOES: TWideMemoField;
    qryLogsVERSAO: TWideStringField;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    edtDataIni: TcxDateEdit;
    cxLabel2: TcxLabel;
    edtDataFim: TcxDateEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;
  sUsuario : string;
  sSGBD : string;
  sSkin : string;
  sBanco : string;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLogs.btnPrintClick(Sender: TObject);
begin
    dxComponentPrinter1.Preview(True,nil);
end;

procedure TfrmLogs.cxButton1Click(Sender: TObject);
var
    dAno, dMes, dDia : word;
begin
    qryLogs.Close;
    qryLogs.SQL.Clear;
    qryLogs.SQL.Add('SELECT * FROM logs');

    DecodeDate(edtDataIni.Date,dAno,dMes,dDia);

    qryLogs.SQL.Add(' WHERE  YEAR(data_hora) >= ' + #39 + IntToStr(dAno) + #39);
    qryLogs.SQL.Add('   AND MONTH(data_hora) >= ' + #39 + IntToStr(dMes) + #39);
    qryLogs.SQL.Add('   AND   DAY(data_hora) >= ' + #39 + IntToStr(dDia) + #39);

    DecodeDate(IncDay(edtDataFim.Date,1),dAno,dMes,dDia);

    qryLogs.SQL.Add('   AND  YEAR(data_hora) <= ' + #39 + IntToStr(dAno) + #39);
    qryLogs.SQL.Add('   AND MONTH(data_hora) <= ' + #39 + IntToStr(dMes) + #39);
    qryLogs.SQL.Add('   AND   DAY(data_hora) <= ' + #39 + IntToStr(dDia) + #39);

    qryLogs.Open;
end;

procedure TfrmLogs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    qryLogs.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmLogs.FormCreate(Sender: TObject);
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

    sSkin    := sAux.Lines.Strings[0];
    sSGBD    := sAux.Lines.Strings[3];
    sUsuario := sAux.Lines.Strings[4];
    sBanco   := sAux.Lines.Strings[5];

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

procedure TfrmLogs.FormShow(Sender: TObject);
var
    dAno, dMes, dDia : word;
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    edtDataFim.Date := Now;
    edtDataIni.Date := Now;

    qryLogs.Close;
    qryLogs.SQL.Clear;
    qryLogs.SQL.Add('SELECT * FROM logs');

    DecodeDate(edtDataIni.Date,dAno,dMes,dDia);

    qryLogs.SQL.Add(' WHERE  YEAR(data_hora) >= ' + #39 + IntToStr(dAno) + #39);
    qryLogs.SQL.Add('   AND MONTH(data_hora) >= ' + #39 + IntToStr(dMes) + #39);
    qryLogs.SQL.Add('   AND   DAY(data_hora) >= ' + #39 + IntToStr(dDia) + #39);

    DecodeDate(IncDay(edtDataFim.Date,1),dAno,dMes,dDia);

    qryLogs.SQL.Add('   AND  YEAR(data_hora) <= ' + #39 + IntToStr(dAno) + #39);
    qryLogs.SQL.Add('   AND MONTH(data_hora) <= ' + #39 + IntToStr(dMes) + #39);
    qryLogs.SQL.Add('   AND   DAY(data_hora) <= ' + #39 + IntToStr(dDia) + #39);

    qryLogs.Open;
end;

procedure TfrmLogs.SpeedButton3Click(Sender: TObject);
begin
    close;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

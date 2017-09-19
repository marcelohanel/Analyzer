unit uVisualizarDadosDynamics;

interface

uses
  xhConsts, cxGridExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls,
  cxButtons,

  cxMemo, cxPC,
  cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGrid,

  dxPSCore, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxTLLnk, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPScxCommon, cxTextEdit, cxClasses, cxGridCustomView,
  cxGridTableView, StdCtrls;

type
  TfrmVisualizarDadosDynamics = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    PageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Memo1: TcxMemo;
    Panel2: TPanel;
    SpeedButton2: TcxButton;
    SpeedButton1: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    SpeedButton3: TcxButton;
    SaveDialog1: TSaveDialog;
    cxButton1: TcxButton;
    SpeedButton6: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarDadosDynamics: TfrmVisualizarDadosDynamics;

implementation

uses uFuncoes, uAguarde, uDynamics;

{$R *.dfm}

procedure TfrmVisualizarDadosDynamics.cxButton1Click(Sender: TObject);
begin
    If SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmVisualizarDadosDynamics.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmDynamics.bdDados,frmDynamics.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    ADOQuery1.Close;
    Action := caFree;
end;

procedure TfrmVisualizarDadosDynamics.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmVisualizarDadosDynamics.FormShow(Sender: TObject);
begin
    try
      frmAguarde := TfrmAguarde.Create(Self);
      frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_164');
      frmAguarde.Show;
      frmAguarde.Update;

      try
          ADOQuery1.Close;
          ADOQuery1.SQL.Clear;
          ADOQuery1.SQL.Add(frmDynamics.tblDynamicsSQL.Value);
          ADOQuery1.Open;

          cxGrid1DBTableView1.DataController.CreateAllItems;
          cxGrid1DBTableView1.ApplyBestFit;
      except
      end;
    finally
      FreeAndNil(frmAguarde);
    end;

    GeraLog(frmDynamics.bdDados,frmDynamics.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmVisualizarDadosDynamics.SpeedButton2Click(Sender: TObject);
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_166');
    frmAguarde.Show;
    frmAguarde.Update;

    try
       cxGrid1DBTableView1.ClearItems;

       ADOQuery1.Close;
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Text := Memo1.Lines.Text;
       ADOQuery1.Open;

       cxGrid1DBTableView1.DataController.CreateAllItems;
       cxGrid1DBTableView1.ApplyBestFit;
    except
       on E: Exception do
       begin
           MessageDlg(HCLResourceStrings.FindID('sString_23') +#13+#10 +
                      HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
       end;
    end;

    FreeAndNil(frmAguarde);
end;

procedure TfrmVisualizarDadosDynamics.SpeedButton3Click(Sender: TObject);
begin
    dxComponentPrinter.PrintTitle := Self.Caption;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmVisualizarDadosDynamics.SpeedButton6Click(Sender: TObject);
begin
    ExportGridToHTML(frmDynamics.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmDynamics.sTempDirUsuario + 'analyzer.html',Self.Caption);
end;

procedure TfrmVisualizarDadosDynamics.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       Memo1.Lines.Text := ADOQuery1.SQL.Text;
end;

end.

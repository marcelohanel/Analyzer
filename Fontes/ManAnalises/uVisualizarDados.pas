unit uVisualizarDados;

interface

uses
  xhConsts, cxGridExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls,
  cxButtons,

  cxMemo, cxPC,
  cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGrid,
  cxGridPopupMenu,

  dxPSCore,





  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxContainer, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxPScxCommon, cxGridCustomPopupMenu, cxTextEdit,
  cxClasses, cxGridCustomView, cxGridTableView, StdCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrmVisualizarDados = class(TForm)
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
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    SpeedButton3: TcxButton;
    SaveDialog1: TSaveDialog;
    cxButton1: TcxButton;
    SpeedButton6: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarDados: TfrmVisualizarDados;

implementation

uses uFuncoes, uAnalises, uAguarde;

{$R *.dfm}

procedure TfrmVisualizarDados.cxButton1Click(Sender: TObject);
begin
    If SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmVisualizarDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    ADOQuery1.Close;
    Action := caFree;
end;

procedure TfrmVisualizarDados.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmVisualizarDados.FormShow(Sender: TObject);
begin
    try
      frmAguarde := TfrmAguarde.Create(Self);
      frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_164');
      frmAguarde.Show;
      frmAguarde.Update;

      try
          ADOQuery1.Close;
          ADOQuery1.SQL.Clear;
          ADOQuery1.SQL.Add('SELECT * FROM');

          if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
             (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
          begin
              if (frmAnalises.tblAnalisesBASE_ORIGEM.Value  = '.') and
                 (frmAnalises.tblAnalisesVISAO_ORIGEM.Value = '.') then
                  ADOQuery1.SQL.Add('[' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + ']')
              else
                  ADOQuery1.SQL.Add('[_' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + ']');
          end;

          if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
          begin
              if (frmAnalises.tblAnalisesBASE_ORIGEM.Value  = '.') and
                 (frmAnalises.tblAnalisesVISAO_ORIGEM.Value = '.') then
                  ADOQuery1.SQL.Add('`' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + '`')
              else
                  ADOQuery1.SQL.Add('`_' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + '`');
          end;

          ADOQuery1.Open;

          cxGrid1DBTableView1.DataController.CreateAllItems;
          cxGrid1DBTableView1.ApplyBestFit;

          FreeAndNil(frmAguarde);
      except
      end;
    finally
      FreeAndNil(frmAguarde);
    end;

    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmVisualizarDados.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       Memo1.Lines.Text := ADOQuery1.SQL.Text;
end;

procedure TfrmVisualizarDados.SpeedButton2Click(Sender: TObject);
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

procedure TfrmVisualizarDados.SpeedButton3Click(Sender: TObject);
begin
    dxComponentPrinter.PrintTitle := Self.Caption;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmVisualizarDados.SpeedButton6Click(Sender: TObject);
begin
    ExportGridToHTML(frmAnalises.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmAnalises.sTempDirUsuario + 'analyzer.html',Self.Caption);
end;

end.

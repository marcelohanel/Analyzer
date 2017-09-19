unit uSelecaoGraficoFrequencia;

interface

uses
  xhConsts, cxGridExportLink, cxCurrencyEdit, Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, cxButtons, DB, ADODB,
  cxStyles,
  cxDBData,
  cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxTextEdit,
  cxDropDownEdit, cxLabel,


  cxGridPopupMenu, dxPSCore,





  cxFilter, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxData, cxDataStorage,
  cxEdit, cxContainer, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, cxGridCustomPopupMenu,
  dxPScxCommon, StdCtrls, cxMaskEdit, cxClasses, cxGridCustomView,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk;

type
  TfrmSelecaoGraficoFrequencia = class(TForm)
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel5: TPanel;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    cxGridPopupMenu1: TcxGridPopupMenu;
    SaveDialog1: TSaveDialog;
    cxButton15: TcxButton;
    SpeedButton9: TcxButton;
    cxButton2: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure MontaGrafico;
    procedure MontaTela;
    procedure cxButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cTipo : integer;
  end;

var
  frmSelecaoGraficoFrequencia: TfrmSelecaoGraficoFrequencia;

implementation

uses uFuncoes, uDesigner, uMostraFrequencia;

{$R *.dfm}

procedure TfrmSelecaoGraficoFrequencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmSelecaoGraficoFrequencia.MontaGrafico;
var
    i,a,d : integer;
    aux   : string;
begin
    frmMostraFrequencia.Chart1.Series[0].Clear;
    frmMostraFrequencia.Chart1.Series[1].Clear;
    frmMostraFrequencia.Chart1.Series[2].Clear;
    frmMostraFrequencia.Chart1.Series[3].Clear;
    frmMostraFrequencia.Chart1.Series[4].Clear;
    frmMostraFrequencia.Chart1.Series[5].Clear;
    frmMostraFrequencia.Chart1.Series[6].Clear;

    a := cxGrid1DBTableView1.ItemCount - 10;
    for d := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
    begin
        aux := '';
        for i := 1 to cxGrid1DBTableView1.ItemCount - 10 do
        begin
            if aux = '' then
               aux := aux + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[i])
            else
               aux := aux + ' - ' + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[i]);
        end;

        frmMostraFrequencia.Chart1.Series[0].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 3]), -0), aux);
        frmMostraFrequencia.Chart1.Series[1].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 4]), -2), aux);
        frmMostraFrequencia.Chart1.Series[2].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 5]), -0), aux);
        frmMostraFrequencia.Chart1.Series[3].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 6]), -0), aux);
        frmMostraFrequencia.Chart1.Series[4].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 7]), -0), aux);
        frmMostraFrequencia.Chart1.Series[5].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 8]), -2), aux);
        frmMostraFrequencia.Chart1.Series[6].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 9]), -0), aux);
    end;
end;

procedure TfrmSelecaoGraficoFrequencia.SpeedButton3Click(Sender: TObject);
begin
    MontaGrafico;
    Close;
end;

procedure TfrmSelecaoGraficoFrequencia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSelecaoGraficoFrequencia.MontaTela;
var
    i,a : integer;
    S   : TMemoryStream;
begin
    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox1.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    cxGrid1DBTableView1.DataController.DataSource := frmMostraFrequencia.dtsMemData1;
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems;

    for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
        cxGrid1DBTableView1.Columns[i].Width := 150;

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].Caption := HCLResourceStrings.FindID('sString_189');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].Width   := 70;

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].Caption := HCLResourceStrings.FindID('sString_190');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].Width   := 70;

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].Caption := HCLResourceStrings.FindID('sString_191');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].GetProperties).DisplayFormat := ',0;-,0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].Caption := HCLResourceStrings.FindID('sString_192');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].Caption := HCLResourceStrings.FindID('sString_193');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].GetProperties).DisplayFormat := ',0;-,0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].Caption := HCLResourceStrings.FindID('sString_194');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].GetProperties).DisplayFormat := ',0;-,0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].Caption := HCLResourceStrings.FindID('sString_195');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].GetProperties).DisplayFormat := ',0;-,0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].Caption := HCLResourceStrings.FindID('sString_196');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].Caption := HCLResourceStrings.FindID('sString_197');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].Width   := 100;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].PropertiesClass := TcxCurrencyEditProperties;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].GetProperties).DisplayFormat := ',0;-,0';

    cxGrid1DBTableView1.ApplyBestFit();

    SpeedButton9.Enabled := False;
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;
        
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFrequencia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox1.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFrequencia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            S := TMemoryStream.Create;
            frmDesigner.tblPadroesVALOR.SaveToStream(S);
            S.Position := 0;
            cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
            S.Free;
        end;
    end;
end;

procedure TfrmSelecaoGraficoFrequencia.FormShow(Sender: TObject);
begin
    MontaTela;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmSelecaoGraficoFrequencia.SpeedButton6Click(Sender: TObject);
begin
    ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_188') + frmMostraFrequencia.Caption);
end;

procedure TfrmSelecaoGraficoFrequencia.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFrequencia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoFrequencia';
        frmDesigner.tblPadroesID_FREQUENCIA.Value := frmDesigner.cFrequencia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFrequencia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoFrequencia';
        frmDesigner.tblPadroesID_FREQUENCIA.Value := frmDesigner.cFrequencia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'cxGrid1';
        S := TMemoryStream.Create;
        cxGrid1DBTableView1.DataController.Filter.SaveToStream(S);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmSelecaoGraficoFrequencia.cxButton15Click(Sender: TObject);
begin
    if MessageDlg(HCLResourceStrings.FindID('sString_45'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        frmDesigner.qryAtualiza.Close;
        frmDesigner.qryAtualiza.SQL.Clear;
        frmDesigner.qryAtualiza.SQL.Add('DELETE FROM PADROES');
        frmDesigner.qryAtualiza.SQL.Add('WHERE ID_USUARIO = ' + #39 + frmDesigner.sUsuario + #39);
        frmDesigner.qryAtualiza.SQL.Add('AND FORMULARIO = ' + #39 + Self.Name + #39);
        frmDesigner.qryAtualiza.ExecSQL;
        frmDesigner.qryAtualiza.Close;

        frmDesigner.tblPadroes.Close;
        frmDesigner.tblPadroes.Open;

        MessageDlg(HCLResourceStrings.FindID('sString_59'), mtInformation, [mbOK], 0);
        Close;
    end;
end;

procedure TfrmSelecaoGraficoFrequencia.cxButton2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmSelecaoGraficoFrequencia.SpeedButton4Click(Sender: TObject);
begin
    dxComponentPrinter.CurrentLinkIndex := 0;
    dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_188') + frmMostraFrequencia.Caption;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmSelecaoGraficoFrequencia.ComboBox1PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

end.

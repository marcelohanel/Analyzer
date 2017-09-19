unit uSelecaoGraficoFotografia;

interface

uses
  xhConsts, cxGridExportLink, cxCurrencyEdit, Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, cxButtons, DB, ADODB,
  cxStyles, cxCustomData,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxData, cxDataStorage, cxEdit,
  cxContainer, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, cxGridCustomPopupMenu,
  dxPScxCommon, StdCtrls, cxMaskEdit, cxClasses, cxGridCustomView,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxPScxTLLnk,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxVGridLnk;

type
  TfrmSelecaoGraficoFotografia = class(TForm)
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
    SpeedButton6: TcxButton;
    cxButton2: TcxButton;
    SpeedButton9: TcxButton;
    cxButton15: TcxButton;
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
  frmSelecaoGraficoFotografia: TfrmSelecaoGraficoFotografia;

implementation

uses uFuncoes, uDesigner, uMostraFotografia;

{$R *.dfm}

procedure TfrmSelecaoGraficoFotografia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmSelecaoGraficoFotografia.MontaGrafico;
var
    i,a,d : integer;
    aux   : string;
begin
    frmMostraFotografia.Chart1.Series[00].Clear;
    frmMostraFotografia.Chart1.Series[01].Clear;
    frmMostraFotografia.Chart1.Series[02].Clear;
    frmMostraFotografia.Chart1.Series[03].Clear;
    frmMostraFotografia.Chart1.Series[04].Clear;
    frmMostraFotografia.Chart1.Series[05].Clear;
    frmMostraFotografia.Chart1.Series[06].Clear;
    frmMostraFotografia.Chart1.Series[07].Clear;
    frmMostraFotografia.Chart1.Series[08].Clear;
    frmMostraFotografia.Chart1.Series[09].Clear;
    frmMostraFotografia.Chart1.Series[10].Clear;
    frmMostraFotografia.Chart1.Series[11].Clear;

    a := cxGrid1DBTableView1.ItemCount - 13;
    for d := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
    begin
        aux := '';
        for i := 1 to cxGrid1DBTableView1.ItemCount - 13 do
        begin
            if aux = '' then
               aux := aux + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[i])
            else
               aux := aux + ' - ' + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[i]);
        end;

        frmMostraFotografia.Chart1.Series[00].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 01]), -2), aux);
        frmMostraFotografia.Chart1.Series[01].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 02]), -2), aux);
        frmMostraFotografia.Chart1.Series[02].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 03]), -2), aux);
        frmMostraFotografia.Chart1.Series[03].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 04]), -2), aux);

        frmMostraFotografia.Chart1.Series[04].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 05]), -2), aux);
        frmMostraFotografia.Chart1.Series[05].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 06]), -2), aux);
        frmMostraFotografia.Chart1.Series[06].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 07]), -2), aux);
        frmMostraFotografia.Chart1.Series[07].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 08]), -2), aux);

        frmMostraFotografia.Chart1.Series[08].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 09]), -2), aux);
        frmMostraFotografia.Chart1.Series[09].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 10]), -2), aux);
        frmMostraFotografia.Chart1.Series[10].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 11]), -2), aux);
        frmMostraFotografia.Chart1.Series[11].Add(RoundTo((cxGrid1DBTableView1.ViewData.Records[d].Values[a + 12]), -2), aux);
    end;
end;

procedure TfrmSelecaoGraficoFotografia.SpeedButton3Click(Sender: TObject);
begin
    MontaGrafico;
    Close;
end;

procedure TfrmSelecaoGraficoFotografia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSelecaoGraficoFotografia.MontaTela;
var
    i,a : integer;
    S   : TMemoryStream;
begin
    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox1.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    cxGrid1DBTableView1.DataController.DataSource := frmMostraFotografia.dtsMemData1;
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems;

    for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
        cxGrid1DBTableView1.Columns[i].Width := 150;

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].Caption         := HCLResourceStrings.FindID('sString_199');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 1].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].Caption         := HCLResourceStrings.FindID('sString_200');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 2].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].Caption         := HCLResourceStrings.FindID('sString_201');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 3].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].Caption         := HCLResourceStrings.FindID('sString_202');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 4].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].Caption         := HCLResourceStrings.FindID('sString_203');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 5].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].Caption         := HCLResourceStrings.FindID('sString_204');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 6].GetProperties).DisplayFormat := ',0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].Caption         := HCLResourceStrings.FindID('sString_205');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 7].GetProperties).DisplayFormat := ',0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].Caption         := HCLResourceStrings.FindID('sString_206');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 8].GetProperties).DisplayFormat := ',0';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].Caption         := HCLResourceStrings.FindID('sString_207');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].SortOrder       := soDescending;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 9].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 10].Caption         := HCLResourceStrings.FindID('sString_208');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 10].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 10].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 10].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 11].Caption         := HCLResourceStrings.FindID('sString_209');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 11].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 11].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 11].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 12].Caption         := HCLResourceStrings.FindID('sString_210');
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 12].PropertiesClass := TcxCurrencyEditProperties;
    cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 12].Width           := 100;
    TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.ColumnCount - 12].GetProperties).DisplayFormat := ',0.00;-,0.00';

    cxGrid1DBTableView1.ApplyBestFit();

    SpeedButton9.Enabled := False;
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;
        
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFotografia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox1.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFotografia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            S := TMemoryStream.Create;
            frmDesigner.tblPadroesVALOR.SaveToStream(S);
            S.Position := 0;
            cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
            S.Free;
        end;
    end;
end;

procedure TfrmSelecaoGraficoFotografia.FormShow(Sender: TObject);
begin
    MontaTela;
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmSelecaoGraficoFotografia.SpeedButton6Click(Sender: TObject);
begin
    ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_188') + frmMostraFotografia.Caption);
end;

procedure TfrmSelecaoGraficoFotografia.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFotografia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoFotografia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
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

procedure TfrmSelecaoGraficoFotografia.cxButton15Click(Sender: TObject);
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

procedure TfrmSelecaoGraficoFotografia.cxButton2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmSelecaoGraficoFotografia.SpeedButton4Click(Sender: TObject);
begin
    dxComponentPrinter.CurrentLinkIndex := 0;
    dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_188') + frmMostraFotografia.Caption;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmSelecaoGraficoFotografia.ComboBox1PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

end.

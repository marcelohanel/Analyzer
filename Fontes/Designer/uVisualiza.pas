unit uVisualiza;

interface

uses
  xhConsts,cxGridExportLink, Math, TeeGally, Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms, TeeStore,
  Dialogs, DB, cxStyles, cxCustomData,
  cxEdit, cxDBData,
  cxGridTableView, cxGridPopupMenu,
  ExtCtrls, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,

  dxPSCore, TeeEdiGene, EditChar, TeeBrazil, TeeThemes,
  cxCurrencyEdit, ADODB, dxmdaset, cxPC, cxButtons,
  cxLabel, cxTextEdit, cxDropDownEdit, TeeProcs, TeEngine, Chart,







  dxPrnDlg,


  cxFilter, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, dxSkinscxPCPainter, cxData, cxDataStorage,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxPScxCommon, cxGridCustomPopupMenu, cxClasses, StdCtrls,
  cxMaskEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxVGridLnk;

type
  TfrmVisualiza = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxMemData1: TdxMemData;
    SaveDialog1: TSaveDialog;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Chart1: TChart;
    Chart2: TChart;
    cxButton15: TcxButton;
    SpeedButton9: TcxButton;
    cxButton1: TcxButton;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton1: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    dxPrintDialog1: TdxPrintDialog;
    procedure SpeedButton9Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure MontaDados;
    procedure cxGrid1DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualiza: TfrmVisualiza;

implementation

uses uDesigner, uFuncoes, uAguarde, uDescricao, uSelecaoGraficoABC, uABC,
  uCriaABC;

{$R *.dfm}

procedure TfrmVisualiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    dxMemData1.Close;
    Action := caFree;
end;

procedure TfrmVisualiza.FormCreate(Sender: TObject);
begin
    TeeSetBrazil;
end;

procedure TfrmVisualiza.MontaDados;
var
    i         : integer;
    a         : integer;
    b         : integer;
    d         : integer;
    valor     : double;
    dAnterior : double;
begin
    dxMemData1.CreateFieldsFromDataSet(frmDesigner.ADOQuery1);
    dxMemData1.LoadFromDataSet(frmDesigner.ADOQuery1);
    dxMemData1.Open;
    frmDesigner.ADOQuery1.Close;

    a := 0;
    for i := 0 to frmDesigner.CheckListBox2.Items.Count - 1 do
        if frmDesigner.CheckListBox2.Items.Items[i].Checked then
           a := a + 1;

    d := 0;
    for i := 0 to frmDesigner.CheckListBox3.Items.Count - 1 do
        if frmDesigner.CheckListBox3.Items.Items[i].Checked then
           d := d + 1;

    frmAguarde.Label2.Visible                := False;
    frmAguarde.cxProgressBar1.Visible        := True;
    frmAguarde.cxProgressBar1.Properties.Max := dxMemData1.RecordCount * d;
    frmAguarde.cxProgressBar1.Position       := 0;
    frmAguarde.Update;

    // Calculo dos percentuais
    b := a + 1;
    while b <= dxMemData1.FieldCount - 2 do
    begin
        valor := 0;
        dxMemData1.First;
        while not dxMemData1.Eof do
        begin
            valor := valor + dxMemData1.Fields[b].Value;
            dxMemData1.Next;
        end;

        dxMemData1.First;
        while not dxMemData1.Eof do
        begin
            dxMemData1.Edit;
            if valor <> 0 then
               dxMemData1.Fields[b + 1].Value := RoundTo(dxMemData1.Fields[b].Value * 100 / valor, -2)
            else
               dxMemData1.Fields[b + 1].Value := 0;

            dAnterior := dAnterior + dxMemData1.Fields[b + 1].Value;

            dxMemData1.Fields[b + 3].Value := dAnterior;
            dxMemData1.Fields[b + 2].Value := retornaABC(dxMemData1.Fields[b + 3].AsFloat);
            dxMemData1.Post;

            frmAguarde.cxProgressBar1.Position := frmAguarde.cxProgressBar1.Position + 1;
            frmAguarde.Update;
            dxMemData1.Next;
        end;

        b := b + 3;
    end;

    frmAguarde.cxProgressBar1.Visible := False;
    frmAguarde.Label2.Visible         := True;
    frmAguarde.Label2.Caption         := HCLResourceStrings.FindID('sString_184');
    frmAguarde.Update;

    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems;

    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox1.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    b := 0;
    d := 0;
    for i := a + 1 to cxGrid1DBTableView1.ItemCount - 1 do
    begin
        cxGrid1DBTableView1.Items[i].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00;-,0.00';

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,10) = '_PercSoma_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_145') + Copy(cxGrid1DBTableView1.Items[i].Caption,11,length(cxGrid1DBTableView1.Items[i].Caption));
        end;
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,14) = '_PercContagem_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_148') + Copy(cxGrid1DBTableView1.Items[i].Caption,15,length(cxGrid1DBTableView1.Items[i].Caption));
        end;
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,11) = '_PercMedia_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_149') + Copy(cxGrid1DBTableView1.Items[i].Caption,12,length(cxGrid1DBTableView1.Items[i].Caption));
        end;
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,12) = '_PercMinimo_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_154') + Copy(cxGrid1DBTableView1.Items[i].Caption,13,length(cxGrid1DBTableView1.Items[i].Caption));
        end;
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,12) = '_PercMaximo_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_155') + Copy(cxGrid1DBTableView1.Items[i].Caption,13,length(cxGrid1DBTableView1.Items[i].Caption));
        end;
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,9) = '_ABCAcum_' then
        begin
            TcxCurrencyEditProperties(cxGrid1DBTableView1.Items[i].GetProperties).DisplayFormat := ',0.00 %';
            cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_360') + Copy(cxGrid1DBTableView1.Items[i].Caption,10,length(cxGrid1DBTableView1.Items[i].Caption));
        end;

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,9) = '_ABCSoma_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_162') + Copy(cxGrid1DBTableView1.Items[i].Caption,10,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,13) = '_ABCContagem_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_163') + Copy(cxGrid1DBTableView1.Items[i].Caption,14,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,10) = '_ABCMedia_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_167') + Copy(cxGrid1DBTableView1.Items[i].Caption,11,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,11) = '_ABCMinimo_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_168') + Copy(cxGrid1DBTableView1.Items[i].Caption,12,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,11) = '_ABCMaximo_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_169') + Copy(cxGrid1DBTableView1.Items[i].Caption,12,length(cxGrid1DBTableView1.Items[i].Caption));

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,6) = '_Soma_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_170') + Copy(cxGrid1DBTableView1.Items[i].Caption,7,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,10) = '_Contagem_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_171') + Copy(cxGrid1DBTableView1.Items[i].Caption,11,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,7) = '_Media_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_172') + Copy(cxGrid1DBTableView1.Items[i].Caption,8,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,8) = '_Minimo_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_173') + Copy(cxGrid1DBTableView1.Items[i].Caption,9,length(cxGrid1DBTableView1.Items[i].Caption));
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,8) = '_Maximo_' then
           cxGrid1DBTableView1.Items[i].Caption := HCLResourceStrings.FindID('sString_174') + Copy(cxGrid1DBTableView1.Items[i].Caption,9,length(cxGrid1DBTableView1.Items[i].Caption));

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,3) = HCLResourceStrings.FindID('sString_175') then
        begin
            Chart2.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
            Chart2.Series[d].Title       := '% ' + Copy(cxGrid1DBTableView1.Items[i].Caption,5,length(cxGrid1DBTableView1.Items[i].Caption));
            Chart2.Series[d].Marks.Style := smsValue;
            Chart2.Series[d].ValueFormat := '##0.00 %';
            Chart2.Series[d].Visible     := False;

            Chart2.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
            Chart2.Series[d + 1].Title       := HCLResourceStrings.FindID('sString_176') + ' ' + Copy(cxGrid1DBTableView1.Items[i].Caption,5,length(cxGrid1DBTableView1.Items[i].Caption));
            Chart2.Series[d + 1].Marks.Style := smsValue;
            Chart2.Series[d + 1].ValueFormat := '#,##0.00';
            Chart2.Series[d + 1].Visible     := False;

            d := d + 2;
        end;

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,3)  <> HCLResourceStrings.FindID('sString_175') then
        begin
            Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
            Chart1.Series[b].Title       := cxGrid1DBTableView1.Items[i].Caption;
            Chart1.Series[b].Marks.Style := smsValue;
            Chart1.Series[b].Visible     := False;

            if Copy(cxGrid1DBTableView1.Items[i].Caption,1,1) = '%' then
               Chart1.Series[b].ValueFormat := '##0.00 %'
            else
               Chart1.Series[b].ValueFormat := '#,##0.00';

            b := b + 1;
        end;
    end;
end;

procedure TfrmVisualiza.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmVisualiza.SpeedButton2Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
    begin
        ChartPreview(Self,Chart1);
        Exit;
    end;

    if cxPageControl1.ActivePageIndex = 2 then
    begin
        ChartPreview(Self,Chart2);
        Exit;
    end;

    dxComponentPrinter1.PrintTitle := HCLResourceStrings.FindID('sString_185') + frmDesigner.cAnalise;
    dxComponentPrinter1.Preview(True,nil);
end;

procedure TfrmVisualiza.SpeedButton6Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
    begin
        Chart1.SaveToMetafile(frmDesigner.sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.wmf',HCLResourceStrings.FindID('sString_185') + frmDesigner.cAnalise);
        Exit;
    end;

    if cxPageControl1.ActivePageIndex = 2 then
    begin
        Chart2.SaveToMetafile(frmDesigner.sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.wmf',HCLResourceStrings.FindID('sString_185') + frmDesigner.cAnalise);
        Exit;
    end;

    ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_185') + frmDesigner.cAnalise);
end;

procedure TfrmVisualiza.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmVisualiza';
        frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString      := ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.cABC <> '' then
        begin
            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
            frmDesigner.tblPadroesFORMULARIO.Value := 'frmVisualiza';
            frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
            frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
            frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
            frmDesigner.tblPadroesCHAVE.Value      := 'cxGrid1';
            AOptions := [gsoUseFilter, gsoUseSummary];
            S := TMemoryStream.Create;
            //cxGrid1DBTableView1.DataController.Filter.SaveToStream(S);
            cxGrid1DBTableView1.StoreToStream(S,AOptions);
            S.Position := 0;
            frmDesigner.tblPadroesVALOR.LoadFromStream(S);
            S.Free;
            frmDesigner.tblPadroes.Post;
        end
        else
        begin
            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
            frmDesigner.tblPadroesFORMULARIO.Value := 'frmVisualiza';
            frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
            frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
            frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
            frmDesigner.tblPadroesCHAVE.Value      := 'cxGrid1';
            S := TMemoryStream.Create;
            cxGrid1DBTableView1.DataController.Filter.SaveToStream(S);
            S.Position := 0;
            frmDesigner.tblPadroesVALOR.LoadFromStream(S);
            S.Free;
            frmDesigner.tblPadroes.Post;
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmVisualiza';
        frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'Chart1';
        S := TMemoryStream.Create;
        SaveChartToStream(Chart1,S,True,True);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','Chart2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmVisualiza';
        frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'Chart2';
        S := TMemoryStream.Create;
        SaveChartToStream(Chart2,S,True,True);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmVisualiza.cxGrid1DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
     if Arguments.SummaryItem.Kind <> skCount then
        ASender.Items[Arguments.SummaryItem.Index].Format := ',0.00;(,0.00)';
end;

procedure TfrmVisualiza.SpeedButton1Click(Sender: TObject);
begin
    If SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmVisualiza.ComboBox1Select(Sender: TObject);
begin
    cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
end;

procedure TfrmVisualiza.ComboBox1PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet  := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet  := nil;
   end;
end;

procedure TfrmVisualiza.FormShow(Sender: TObject);
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    Self.Caption := frmDesigner.cAnalise;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_184');
    frmAguarde.Show;
    frmAguarde.Update;

    frmDesigner.MontaSelect;
    MontaDados;

    cxButton1.Enabled    := False; // Botão de informações
    SpeedButton9.Enabled := False; // Salvar Cenário

    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;

        if frmDesigner.cABC <> '' then
        begin
            cxButton1.Enabled := True; // Botão de informações
            Self.Caption      := Self.Caption + ' - ' + frmDesigner.cABC;
            
            if frmDesigner.tblPadroes.Locate('ID_ABC;ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.cABC,frmDesigner.sUsuario,'frmVisualiza','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
                ComboBox1.Properties.OnChange(Self);
            end;

            if frmDesigner.tblPadroes.Locate('ID_ABC;ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.cABC,frmDesigner.sUsuario,'frmVisualiza','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                try
                    AOptions := [gsoUseFilter, gsoUseSummary];
                    S := TMemoryStream.Create;
                    frmDesigner.tblPadroesVALOR.SaveToStream(S);
                    S.Position := 0;
    //                cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
                    cxGrid1DBTableView1.RestoreFromStream(S,True,False,AOptions);
                    S.Free;
                except
                end;
            end;

            if frmDesigner.tblPadroes.Locate('ID_ABC;ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.cABC,frmDesigner.sUsuario,'frmVisualiza','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                LoadChartFromStream(TCustomChart(Chart1),S);
                S.Free;
            end;

            if frmDesigner.tblPadroes.Locate('ID_ABC;ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.cABC,frmDesigner.sUsuario,'frmVisualiza','Chart2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                LoadChartFromStream(TCustomChart(Chart2),S);
                S.Free;
            end;
        end
        else
        begin
            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
                ComboBox1.Properties.OnChange(Self);
            end;

            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
                S.Free;
            end;

            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                LoadChartFromStream(TCustomChart(Chart1),S);
                S.Free;
            end;

            if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmVisualiza','Chart2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
            begin
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                LoadChartFromStream(TCustomChart(Chart2),S);
                S.Free;
            end;
        end;
    end;

    if frmSelecaoGraficoABC = nil then
    begin
        frmSelecaoGraficoABC := TfrmSelecaoGraficoABC.Create(Self);
        frmSelecaoGraficoABC.MontaTela;
        frmSelecaoGraficoABC.MontaGrafico;
        FreeAndNil(frmSelecaoGraficoABC);
    end;

    if frmDesigner.ComboBox1.Text = '' then
       cxGrid1DBTableView1.ApplyBestFit();

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    FreeAndNil(frmAguarde);
end;

procedure TfrmVisualiza.cxPageControl1Change(Sender: TObject);
begin
    SpeedButton1.Enabled := False;
    SpeedButton6.Enabled := False;
    SpeedButton2.Enabled := False;
    ComboBox1.Enabled    := False;
    Label1.Enabled       := False;
    cxButton3.Enabled    := False;
    cxButton2.Enabled    := False;
    cxButton4.Enabled    := False;

    if cxPageControl1.ActivePageIndex = 0 then
    begin
        SpeedButton1.Enabled := True;
        SpeedButton6.Enabled := True;
        SpeedButton2.Enabled := True;
        ComboBox1.Enabled    := True;
        Label1.Enabled       := True;
    end;

    if cxPageControl1.ActivePageIndex = 1 then
    begin
        cxButton3.Enabled    := True;
        cxButton2.Enabled    := True;
        cxButton4.Enabled    := True;
        SpeedButton6.Enabled := True;
        SpeedButton2.Enabled := True;
    end;

    if cxPageControl1.ActivePageIndex = 2 then
    begin
        cxButton3.Enabled    := True;
        cxButton2.Enabled    := True;
        cxButton4.Enabled    := True;
        SpeedButton6.Enabled := True;
        SpeedButton2.Enabled := True;
    end;
end;

procedure TfrmVisualiza.cxButton15Click(Sender: TObject);
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

procedure TfrmVisualiza.cxButton1Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := frmDesigner.tblABCDESCRICAO.Value;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;
end;

procedure TfrmVisualiza.cxButton2Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
       ChangeAllSeriesGallery(Self, TCustomChart(Chart1));

    if cxPageControl1.ActivePageIndex = 2 then
       ChangeAllSeriesGallery(Self, TCustomChart(Chart2));
end;

procedure TfrmVisualiza.cxButton3Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
       EditChart(Self,Chart1);

    if cxPageControl1.ActivePageIndex = 2 then
       EditChart(Self,Chart2);
end;

procedure TfrmVisualiza.cxButton4Click(Sender: TObject);
begin
    if frmSelecaoGraficoABC = nil then
    begin
        frmSelecaoGraficoABC := TfrmSelecaoGraficoABC.Create(Self);
        frmSelecaoGraficoABC.ShowModal;
        FreeAndNil(frmSelecaoGraficoABC);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSelecaoGraficoABC);
    end;
end;

procedure TfrmVisualiza.SpeedButton5Click(Sender: TObject);
var
    lSair : boolean;
begin
    lSair := False;

    if frmABC = nil then
    begin
        if frmDesigner.ComboBox1.Text <> '' then
        begin
            if frmDesigner.tblCenarios.Locate('ID_CENARIO',frmDesigner.ComboBox1.Text,[]) then
            begin
                frmDesigner.vA := frmDesigner.tblCenariosA.AsInteger;
                frmDesigner.vB := frmDesigner.tblCenariosB.AsInteger;
                frmDesigner.vC := frmDesigner.tblCenariosC.AsInteger;
                frmDesigner.vD := frmDesigner.tblCenariosD.AsInteger;
                frmDesigner.vE := frmDesigner.tblCenariosE.AsInteger;
            end;
        end;

        frmABC := TfrmABC.Create(Self);
        frmABC.ShowModal;

        lSair := frmABC.lConfirma;

        FreeAndNil(frmABC);

        if frmDesigner.ComboBox1.Text <> '' then
        begin
            if frmDesigner.tblCenarios.Locate('ID_CENARIO',frmDesigner.ComboBox1.Text,[]) then
            begin
                frmDesigner.tblCenarios.Edit;
                frmDesigner.tblCenariosA.AsInteger := frmDesigner.vA;
                frmDesigner.tblCenariosB.AsInteger := frmDesigner.vB;
                frmDesigner.tblCenariosC.AsInteger := frmDesigner.vC;
                frmDesigner.tblCenariosD.AsInteger := frmDesigner.vD;
                frmDesigner.tblCenariosE.AsInteger := frmDesigner.vE;
                frmDesigner.tblCenarios.Post;
            end;
        end;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmABC);
    end;

    if lSair then
       Close;
end;

procedure TfrmVisualiza.cxButton5Click(Sender: TObject);
begin
    if frmCriaABC = nil then
    begin
        frmCriaABC := TfrmCriaABC.Create(Self);
        frmCriaABC.ShowModal;

        if frmCriaABC.lConf then
        begin
            FreeAndNil(frmCriaABC);
            Close;
        end
        else
        begin
            FreeAndNil(frmCriaABC);
        end;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCriaABC);
    end;
end;

end.


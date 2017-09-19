unit uMostraFrequencia;

interface

uses
  xhConsts, cxGridExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, dxmdaset, cxStyles,
  cxEdit,
  cxGridLevel, cxGridCustomView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridPopupMenu,
  TeeProcs,
  Chart, TeeEdiGene, EditChar, TeeBrazil,





  TeeGally,
   TeeStore,

  dxPSCore,


  cxButtons, cxLabel,
  cxDropDownEdit, cxPC,





  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxContainer, Menus, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter,
  dxPScxCommon, cxGridCustomPopupMenu, StdCtrls, cxTextEdit, cxMaskEdit,
  TeEngine, cxClasses, cxGridCustomTableView, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxVGridLnk;

type
  TfrmMostraFrequencia = class(TForm)
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    SaveDialog1: TSaveDialog;
    PageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Chart1: TChart;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxMemData1: TdxMemData;
    dtsMemData1: TDataSource;
    Panel1: TPanel;
    Label2: TcxLabel;
    ComboBox2: TcxComboBox;
    cxButton3: TcxButton;
    SpeedButton9: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton2: TcxButton;
    cxButton1: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure dxMemData1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ComboBox2PropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraFrequencia: TfrmMostraFrequencia;

implementation

uses uDesigner, uFuncoes, uDescricao, uSelecaoGraficoFrequencia,
  uCriaFrequencia;

{$R *.dfm}

procedure TfrmMostraFrequencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    dxMemData1.Close;
    Action := caFree;
end;

procedure TfrmMostraFrequencia.FormCreate(Sender: TObject);
begin
    TeeSetBrazil;
end;

procedure TfrmMostraFrequencia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmMostraFrequencia.FormShow(Sender: TObject);
var
    i : integer;
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    cxButton2.Enabled := False;

    if frmDesigner.cFrequencia <> '' then
    begin
        Self.Caption      := Self.Caption + ' - ' + frmDesigner.cFrequencia;
        cxButton2.Enabled := True;
    end;

    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox2.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    SpeedButton9.Enabled := False;

    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','ComboBox2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox2.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox2.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            try
                AOptions := [gsoUseFilter, gsoUseSummary];
                S := TMemoryStream.Create;
                frmDesigner.tblPadroesVALOR.SaveToStream(S);
                S.Position := 0;
                cxGrid1DBTableView1.RestoreFromStream(S,True,False,AOptions);
                S.Free;
            except
            end;
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            S := TMemoryStream.Create;
            frmDesigner.tblPadroesVALOR.SaveToStream(S);
            S.Position := 0;
            LoadChartFromStream(TCustomChart(Chart1),S);
            S.Free;
        end;
    end;

    if frmSelecaoGraficoFrequencia = nil then
    begin
        frmSelecaoGraficoFrequencia := TfrmSelecaoGraficoFrequencia.Create(Self);
        frmSelecaoGraficoFrequencia.MontaTela;
        frmSelecaoGraficoFrequencia.MontaGrafico;
        FreeAndNil(frmSelecaoGraficoFrequencia);
    end;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmMostraFrequencia.SpeedButton3Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
       dxComponentPrinter.CurrentLinkIndex := 0;
       dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_260') + frmMostraFrequencia.Caption;
       dxComponentPrinter.Preview(True,nil);
    end;

    if PageControl1.ActivePageIndex = 1 then
       ChartPreview(Self,Chart1);
end;

procedure TfrmMostraFrequencia.SpeedButton2Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       EditChart(Self,Chart1);
end;

procedure TfrmMostraFrequencia.SpeedButton4Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
       ChangeAllSeriesGallery(Self, TCustomChart(Chart1));
end;

procedure TfrmMostraFrequencia.SpeedButton5Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_260') + frmMostraFrequencia.Caption);
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        Chart1.SaveToMetafile(frmDesigner.sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.wmf',Chart1.Title.Text.Strings[0]);
    end;
end;

procedure TfrmMostraFrequencia.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','ComboBox2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFrequencia';
        frmDesigner.tblPadroesID_FREQUENCIA.Value := frmDesigner.cFrequencia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox2';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox2.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFrequencia';
        frmDesigner.tblPadroesID_FREQUENCIA.Value := frmDesigner.cFrequencia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'cxGrid1';
        AOptions := [gsoUseFilter, gsoUseSummary];
        S := TMemoryStream.Create;
        cxGrid1DBTableView1.StoreToStream(S,AOptions);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFrequencia','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFrequencia';
        frmDesigner.tblPadroesID_FREQUENCIA.Value := frmDesigner.cFrequencia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'Chart1';
        S := TMemoryStream.Create;
        SaveChartToStream(Chart1,S,True,True);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMostraFrequencia.dxMemData1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    dxMemData1.Filtered := True;
    dxMemData1.UpdateFilters;
end;

procedure TfrmMostraFrequencia.ComboBox2PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox2.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmMostraFrequencia.cxButton3Click(Sender: TObject);
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

procedure TfrmMostraFrequencia.cxButton1Click(Sender: TObject);
begin
    If SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmMostraFrequencia.cxButton2Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := frmDesigner.tblFrequenciaDESCRICAO.Value;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;
end;

procedure TfrmMostraFrequencia.PageControl1Change(Sender: TObject);
begin
    Label2.Enabled       := False;
    ComboBox2.Enabled    := False;
    cxButton1.Enabled    := False;
    cxButton4.Enabled    := False;
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := False;

    if PageControl1.ActivePageIndex = 0 then
    begin
        Label2.Enabled       := True;
        ComboBox2.Enabled    := True;
        SpeedButton3.Enabled := True;
        SpeedButton5.Enabled := True;
        cxButton1.Enabled    := True;
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        SpeedButton2.Enabled := True;
        SpeedButton3.Enabled := True;
        SpeedButton4.Enabled := True;
        SpeedButton5.Enabled := True;
        cxButton4.Enabled    := True;
    end;
end;

procedure TfrmMostraFrequencia.cxButton4Click(Sender: TObject);
begin
    if frmSelecaoGraficoFrequencia = nil then
    begin
        frmSelecaoGraficoFrequencia := TfrmSelecaoGraficoFrequencia.Create(Self);
        frmSelecaoGraficoFrequencia.ShowModal;
        FreeAndNil(frmSelecaoGraficoFrequencia);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSelecaoGraficoFrequencia);
    end;
end;

procedure TfrmMostraFrequencia.cxButton5Click(Sender: TObject);
begin
    if frmCriaFrequencia = nil then
    begin
        frmCriaFrequencia := TfrmCriaFrequencia.Create(Self);
        frmCriaFrequencia.ShowModal;

        if frmCriaFrequencia.lConf then
        begin
            FreeAndNil(frmCriaFrequencia);
            Close;
        end
        else
        begin
            FreeAndNil(frmCriaFrequencia);
        end;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCriaFrequencia);
    end;
end;

end.

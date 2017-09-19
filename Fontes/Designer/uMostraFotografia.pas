unit uMostraFotografia;

interface

uses
  xhConsts, cxGridExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, dxmdaset, cxStyles,
  cxEdit,
  cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridPopupMenu,
  cxVGrid, cxDBVGrid, TeeProcs,
  Chart,  TeeEdiGene, EditChar, TeeBrazil,




  TeeGally,
  TeeStore,

  dxPSCore,
  dxPScxVGridLnk, cxExportVGLink,
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
  cxDataStorage, cxDBData, cxProgressBar, cxCurrencyEdit, cxContainer, Menus,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxSkinsdxBarPainter, dxPScxCommon, cxGridCustomPopupMenu, StdCtrls,
  cxTextEdit, cxMaskEdit, TeEngine, cxInplaceContainer, cxClasses,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  dxPScxTLLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrmMostraFotografia = class(TForm)
    dxMemData1: TdxMemData;
    dtsMemData1: TDataSource;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dxMemData2: TdxMemData;
    dtsMemData2: TDataSource;
    dxMemData2tipo: TStringField;
    dxMemData2vlr_qtde: TIntegerField;
    dxMemData2vlr_perc_qtde: TFloatField;
    dxMemData2vlr_fot: TCurrencyField;
    dxMemData2vlr_com: TCurrencyField;
    dxMemData2vlr_dif: TCurrencyField;
    dxMemData2vlr_var: TFloatField;
    dxMemData2qt_fot: TIntegerField;
    dxMemData2qt_com: TIntegerField;
    dxMemData2qt_dif: TIntegerField;
    dxMemData2qt_var: TFloatField;
    dxMemData2un_fot: TCurrencyField;
    dxMemData2un_com: TCurrencyField;
    dxMemData2un_dif: TCurrencyField;
    dxMemData2un_var: TFloatField;
    dxMemData2qt_qtde: TIntegerField;
    dxMemData2qt_perc_qtde: TFloatField;
    dxMemData2un_qtde: TIntegerField;
    dxMemData2un_perc_qtde: TFloatField;
    dxMemData2vlr_perc_fot: TFloatField;
    dxMemData2vlr_perc_com: TFloatField;
    dxMemData2qt_perc_fot: TFloatField;
    dxMemData2qt_perc_com: TFloatField;
    dxMemData2un_perc_fot: TFloatField;
    dxMemData2un_perc_com: TFloatField;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    dxComponentPrinterLink2: TcxDBVerticalGridReportLink;
    SaveDialog1: TSaveDialog;
    PageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVerticalGrid1tipo: TcxDBEditorRow;
    cxDBVerticalGrid1CategoryRow1: TcxCategoryRow;
    cxDBVerticalGrid1vlr_perc_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow1: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow2: TcxDBEditorRow;
    cxDBVerticalGrid1vlr_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1vlr_fot: TcxDBEditorRow;
    cxDBVerticalGrid1vlr_com: TcxDBEditorRow;
    cxDBVerticalGrid1vlr_dif: TcxDBEditorRow;
    cxDBVerticalGrid1vlr_var: TcxDBEditorRow;
    cxDBVerticalGrid1CategoryRow2: TcxCategoryRow;
    cxDBVerticalGrid1qt_perc_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow3: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow4: TcxDBEditorRow;
    cxDBVerticalGrid1qt_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1qt_fot: TcxDBEditorRow;
    cxDBVerticalGrid1qt_com: TcxDBEditorRow;
    cxDBVerticalGrid1qt_dif: TcxDBEditorRow;
    cxDBVerticalGrid1qt_var: TcxDBEditorRow;
    cxDBVerticalGrid1CategoryRow3: TcxCategoryRow;
    cxDBVerticalGrid1un_perc_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow5: TcxDBEditorRow;
    cxDBVerticalGrid1DBEditorRow6: TcxDBEditorRow;
    cxDBVerticalGrid1un_qtde: TcxDBEditorRow;
    cxDBVerticalGrid1un_fot: TcxDBEditorRow;
    cxDBVerticalGrid1un_com: TcxDBEditorRow;
    cxDBVerticalGrid1un_dif: TcxDBEditorRow;
    cxDBVerticalGrid1un_var: TcxDBEditorRow;
    Chart1: TChart;
    Panel1: TPanel;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    Label2: TcxLabel;
    ComboBox2: TcxComboBox;
    ComboBox3: TcxComboBox;
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
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure ComboBox2PropertiesChange(Sender: TObject);
    procedure ComboBox3PropertiesChange(Sender: TObject);
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
  frmMostraFotografia: TfrmMostraFotografia;

implementation

uses uDesigner, uFuncoes, uDescricao, uSelecaoGraficoFotografia,
  uCriaFotografia;

{$R *.dfm}

procedure TfrmMostraFotografia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    dxMemData1.Close;
    dxMemData2.Close;

    Action := caFree;
end;

procedure TfrmMostraFotografia.FormCreate(Sender: TObject);
begin
    TeeSetBrazil;
end;

procedure TfrmMostraFotografia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmMostraFotografia.FormShow(Sender: TObject);
var
    i : integer;
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    cxButton2.Enabled := False;

    if frmDesigner.cFotografia <> '' then
    begin
        Self.Caption      := Self.Caption + ' - ' + frmDesigner.cFotografia;
        cxButton2.Enabled := True;
    end;

    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox2.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    for i := 0 to frmDesigner.cxStyleRepository2.StyleSheetCount - 1 do
        ComboBox3.Properties.Items.Add(frmDesigner.cxStyleRepository2.StyleSheets[i].Caption);

    SpeedButton9.Enabled := False;

    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;
        
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox1.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox2.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox2.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox3',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox3.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox3.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
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

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            S := TMemoryStream.Create;
            frmDesigner.tblPadroesVALOR.SaveToStream(S);
            S.Position := 0;
            LoadChartFromStream(TCustomChart(Chart1),S);
            S.Free;
        end;
    end;

    if frmSelecaoGraficoFotografia = nil then
    begin
        frmSelecaoGraficoFotografia := TfrmSelecaoGraficoFotografia.Create(Self);
        frmSelecaoGraficoFotografia.MontaTela;
        frmSelecaoGraficoFotografia.MontaGrafico;
        FreeAndNil(frmSelecaoGraficoFotografia);
    end;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmMostraFotografia.SpeedButton3Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
       dxComponentPrinter.CurrentLinkIndex := 0;
       dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_281') + frmMostraFotografia.Caption;
       dxComponentPrinter.Preview(True,nil);
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
       dxComponentPrinter.CurrentLinkIndex := 1;
       dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_282') + frmMostraFotografia.Caption;
       dxComponentPrinter.Preview(True,nil);
    end;

    if PageControl1.ActivePageIndex = 2 then
       ChartPreview(Self,Chart1);
end;

procedure TfrmMostraFotografia.SpeedButton2Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 2 then
       EditChart(Self,Chart1);
end;

procedure TfrmMostraFotografia.SpeedButton4Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 2 then
       ChangeAllSeriesGallery(Self, TCustomChart(Chart1));
end;

procedure TfrmMostraFotografia.SpeedButton5Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_281') + frmMostraFotografia.Caption);
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        cxExportVGToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxDBVerticalGrid1);
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_282') + frmMostraFotografia.Caption);
    end;

    if PageControl1.ActivePageIndex = 2 then
    begin
        Chart1.SaveToMetafile(frmDesigner.sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.wmf',Chart1.Title.Text.Strings[0]);
    end;
end;

procedure TfrmMostraFotografia.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox2',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox2';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox2.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox3',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox3';
        frmDesigner.tblPadroesVALOR.AsString   := ComboBox3.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
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

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','Chart1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := frmDesigner.cFotografia;
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

procedure TfrmMostraFotografia.ComboBox1PropertiesChange(Sender: TObject);
var
    i : integer;
begin
    for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        cxGrid1DBTableView1.Columns[i].Visible := True;

    if ComboBox1.Text = HCLResourceStrings.FindID('sString_176') then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;

            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;

    if ComboBox1.Text = 'Quantidade' then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;

            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;

    if ComboBox1.Text = 'Unitário' then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;

            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;

    if ComboBox1.Text = 'Valor e Quantidade' then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_uVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;

    if ComboBox1.Text = 'Valor e Unitário' then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_qVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;

    if ComboBox1.Text = 'Quantidade e Unitário' then
    begin
        for i := 1 to cxGrid1DBTableView1.ColumnCount - 1 do
        begin
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vFotografado' then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vComparado'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vDiferenca'   then cxGrid1DBTableView1.Columns[i].Visible := False;
            if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = '_vVariacao'    then cxGrid1DBTableView1.Columns[i].Visible := False;
        end;
    end;
end;

procedure TfrmMostraFotografia.ComboBox2PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox2.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmMostraFotografia.ComboBox3PropertiesChange(Sender: TObject);
begin
   try
      cxDBVerticalGrid1.Styles.StyleSheet := frmDesigner.cxStyleRepository2.StyleSheets[ComboBox3.ItemIndex];
   except
      cxDBVerticalGrid1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmMostraFotografia.cxButton3Click(Sender: TObject);
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

procedure TfrmMostraFotografia.cxButton1Click(Sender: TObject);
begin
    If SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmMostraFotografia.cxButton2Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := frmDesigner.tblFotografiaDESCRICAO.Value;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;

end;

procedure TfrmMostraFotografia.PageControl1Change(Sender: TObject);
begin
    Label1.Enabled       := False;
    Label2.Enabled       := False;
    ComboBox1.Enabled    := False;
    ComboBox2.Enabled    := False;
    ComboBox2.Visible    := True;
    ComboBox3.Visible    := False;
    cxButton1.Enabled    := False;
    cxButton4.Enabled    := False;
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := False;

    if PageControl1.ActivePageIndex = 0 then
    begin
        Label1.Enabled       := True;
        Label2.Enabled       := True;
        ComboBox1.Enabled    := True;
        ComboBox2.Enabled    := True;
        SpeedButton3.Enabled := True;
        SpeedButton5.Enabled := True;
        cxButton1.Enabled    := True;
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        SpeedButton3.Enabled := True;
        SpeedButton5.Enabled := True;
        Label2.Enabled       := True;
        ComboBox2.Visible    := False;
        ComboBox3.Visible    := True;
    end;

    if PageControl1.ActivePageIndex = 2 then
    begin
        SpeedButton2.Enabled := True;
        SpeedButton4.Enabled := True;
        SpeedButton3.Enabled := True;
        SpeedButton5.Enabled := True;
        cxButton4.Enabled    := True;
    end;
end;

procedure TfrmMostraFotografia.cxButton4Click(Sender: TObject);
begin
    if frmSelecaoGraficoFotografia = nil then
    begin
        frmSelecaoGraficoFotografia := TfrmSelecaoGraficoFotografia.Create(Self);
        frmSelecaoGraficoFotografia.ShowModal;
        FreeAndNil(frmSelecaoGraficoFotografia);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSelecaoGraficoFotografia);
    end;
end;

procedure TfrmMostraFotografia.cxButton5Click(Sender: TObject);
begin
    if frmCriaFotografia = nil then
    begin
        frmCriaFotografia := TfrmCriaFotografia.Create(Self);
        frmCriaFotografia.ShowModal;

        if frmCriaFotografia.lConf then
        begin
            FreeAndNil(frmCriaFotografia);
            Close;
        end
        else
        begin
            FreeAndNil(frmCriaFotografia);
        end;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCriaFotografia);
    end;
end;

end.

unit uSelecaoGraficoABC;

interface

uses
  xhConsts, cxGridExportLink, cxCurrencyEdit, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  TfrmSelecaoGraficoABC = class(TForm)
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
  frmSelecaoGraficoABC: TfrmSelecaoGraficoABC;

implementation

uses uFuncoes, uDesigner, uVisualiza;

{$R *.dfm}

procedure TfrmSelecaoGraficoABC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmSelecaoGraficoABC.MontaGrafico;
var
    i : integer;
    a : integer;
    b : integer;
    c : integer;
    d : integer;
    e : integer;
    aux : string;
    vA    : double;
    vB    : double;
    vC    : double;
    vD    : double;
    vE    : double;
    vA1   : double;
    vB1   : double;
    vC1   : double;
    vD1   : double;
    vE1   : double;
begin
    a := 0;
    for i := 0 to frmDesigner.CheckListBox2.Items.Count - 1 do
        if frmDesigner.CheckListBox2.Items.Items[i].Checked then
           a := a + 1;

    b := 0;
    e := 0;
    for i := a + 1 to cxGrid1DBTableView1.ItemCount - 2 do
    begin
        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,3) <> 'ABC' then
        begin
            frmVisualiza.Chart1.Series[b].Clear;
            for d := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
            begin
                aux := '';
                for c := 1 to a do
                begin
                    if c = a then
                       aux := aux + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[c])
                    else
                       aux := aux + VarToStr(cxGrid1DBTableView1.ViewData.Records[d].Values[c]) + ' - ';
                end;

                if aux = '' then
                   aux := ' ';

                frmVisualiza.Chart1.Series[b].Add(cxGrid1DBTableView1.ViewData.Records[d].Values[i],aux);
            end;

            b := b + 1;
        end;

        if Copy(cxGrid1DBTableView1.Items[i].Caption,1,3) = 'ABC' then
        begin
            frmVisualiza.Chart2.Series[e].Clear;
            frmVisualiza.Chart2.Series[e + 1].Clear;

            vA  := 0;
            vB  := 0;
            vC  := 0;
            vD  := 0;
            vE  := 0;
            vA1 := 0;
            vB1 := 0;
            vC1 := 0;
            vD1 := 0;
            vE1 := 0;

            for d := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
            begin
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'A' then vA  := vA  + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 1];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'B' then vB  := vB  + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 1];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'C' then vC  := vC  + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 1];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'D' then vD  := vD  + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 1];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'E' then vE  := vE  + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 1];

                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'A' then vA1 := vA1 + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 2];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'B' then vB1 := vB1 + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 2];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'C' then vC1 := vC1 + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 2];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'D' then vD1 := vD1 + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 2];
                if cxGrid1DBTableView1.ViewData.Records[d].Values[i] = 'E' then vE1 := vE1 + cxGrid1DBTableView1.ViewData.Records[d].Values[i - 2];
            end;

            frmVisualiza.Chart2.Series[e].Add(vA,'A');
            frmVisualiza.Chart2.Series[e].Add(vB,'B');
            frmVisualiza.Chart2.Series[e].Add(vC,'C');
            frmVisualiza.Chart2.Series[e].Add(vD,'D');
            frmVisualiza.Chart2.Series[e].Add(vE,'E');

            frmVisualiza.Chart2.Series[e + 1].Add(vA1,'A');
            frmVisualiza.Chart2.Series[e + 1].Add(vB1,'B');
            frmVisualiza.Chart2.Series[e + 1].Add(vC1,'C');
            frmVisualiza.Chart2.Series[e + 1].Add(vD1,'D');
            frmVisualiza.Chart2.Series[e + 1].Add(vE1,'E');

            e := e + 2;
        end;
    end;
end;

procedure TfrmSelecaoGraficoABC.SpeedButton3Click(Sender: TObject);
begin
    MontaGrafico;
    Close;
end;

procedure TfrmSelecaoGraficoABC.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSelecaoGraficoABC.MontaTela;
var
    i,a : integer;
    S   : TMemoryStream;
begin
    for i := 0 to frmDesigner.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox1.Properties.Items.Add(frmDesigner.cxStyleRepository1.StyleSheets[i].Caption);

    cxGrid1DBTableView1.DataController.DataSource := frmVisualiza.DataSource1;
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems;

    a := 0;
    for i := 0 to frmDesigner.CheckListBox2.Items.Count - 1 do
        if frmDesigner.CheckListBox2.Items.Items[i].Checked then
           a := a + 1;

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
    end;

    cxGrid1DBTableView1.ApplyBestFit();

    SpeedButton9.Enabled := False;
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        SpeedButton9.Enabled := True;
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoABC','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            ComboBox1.Text := frmDesigner.tblPadroesVALOR.AsString;
            ComboBox1.Properties.OnChange(Self);
        end;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoABC','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then
        begin
            S := TMemoryStream.Create;
            frmDesigner.tblPadroesVALOR.SaveToStream(S);
            S.Position := 0;
            cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
            S.Free;
        end;
    end;
end;

procedure TfrmSelecaoGraficoABC.FormShow(Sender: TObject);
begin
    MontaTela;
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmSelecaoGraficoABC.SpeedButton6Click(Sender: TObject);
begin
    ExportGridToHTML(frmDesigner.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmDesigner.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_188') + frmDesigner.cAnalise);
end;

procedure TfrmSelecaoGraficoABC.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
begin
    if frmDesigner.ComboBox1.Text <> '' then
    begin
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoABC','ComboBox1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoABC';
        frmDesigner.tblPadroesID_ABC.Value     := frmDesigner.cABC;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.ComboBox1.Text;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString      := ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmSelecaoGraficoABC','cxGrid1',frmDesigner.ComboBox1.Text,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmSelecaoGraficoABC';
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

        MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmSelecaoGraficoABC.cxButton15Click(Sender: TObject);
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

procedure TfrmSelecaoGraficoABC.cxButton2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
       ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
end;

procedure TfrmSelecaoGraficoABC.SpeedButton4Click(Sender: TObject);
begin
    dxComponentPrinter.CurrentLinkIndex := 0;
    dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_188') + frmDesigner.cAnalise;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmSelecaoGraficoABC.ComboBox1PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmDesigner.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

end.

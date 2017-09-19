unit uFrequencia;

interface

uses
  xhConsts, Math, Chart, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  cxEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  dxmdaset, cxProgressBar,
  cxCurrencyEdit,







  TeEngine, cxCalendar, cxImageComboBox,
  cxButtons, cxDropDownEdit,
  cxTextEdit, cxLabel,





  cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmFrequencia = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    ComboBox1: TcxComboBox;
    ComboBox2: TcxComboBox;
    edtFre_ini: TcxDateEdit;
    edtFre_fim: TcxDateEdit;
    edtDataBase: TcxDateEdit;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    cxLabel1: TcxLabel;
    edtDias: TcxCurrencyEdit;
    chkAtual: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MontaGrafico;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MontaDados;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDiasExit(Sender: TObject);
    procedure chkAtualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrequencia: TfrmFrequencia;

implementation

uses uDesigner, uAguarde, uFuncoes, uMostraFrequencia;

{$R *.dfm}

procedure TfrmFrequencia.chkAtualClick(Sender: TObject);
begin
    if chkAtual.Checked then
       edtDataBase.Date := Date
end;

procedure TfrmFrequencia.edtDiasExit(Sender: TObject);
begin
    if edtDias.Value <> 0 then
    begin
        if chkAtual.Checked then
        begin
            edtDataBase.Date := Date;
            edtFre_ini.Date  := Date - Round(edtDias.Value);
            edtFre_fim.Date  := Date;
        end
        else
        begin
            edtFre_ini.Date  := edtDataBase.Date - Round(edtDias.Value);
            edtFre_fim.Date  := edtDataBase.Date;
        end;
    end;
end;

procedure TfrmFrequencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmFrequencia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmFrequencia.FormCreate(Sender: TObject);
begin
    edtFre_ini.Date  := Date - 30;
    edtFre_fim.Date  := Date;
    edtDataBase.Date := Date;
    edtDias.Value    := 0;
end;

procedure TfrmFrequencia.FormShow(Sender: TObject);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmFrequencia.MontaDados;
begin
    ComboBox1.Clear;
    ComboBox2.Clear;

    ComboBox1.Properties.Items := frmDesigner.lstData.Items;
    ComboBox2.Properties.Items := frmDesigner.lstValor.Items;

    if frmDesigner.ComboBox1.Text <> '' then
    begin
        ComboBox1.Text  := frmDesigner.sFREQUENCIA_data;
        ComboBox2.Text  := frmDesigner.sFREQUENCIA_valor;
        edtDias.Value   := frmDesigner.sFREQUENCIA_dias;

        if frmDesigner.sFREQUENCIA_atual = 'S' then
           chkAtual.Checked := True
        else
           chkAtual.Checked := False;

        try    edtFre_ini.Date := StrToDate(frmDesigner.sFREQUENCIA_dt_fre_ini);
        except edtFre_ini.Date := Date; end;
        try    edtFre_fim.Date := StrToDate(frmDesigner.sFREQUENCIA_dt_fre_fim);
        except edtFre_fim.Date := Date; end;
        try    edtDataBase.Date := StrToDate(frmDesigner.sFREQUENCIA_data_base);
        except edtDataBase.Date := Date; end;
    end;

    edtDias.OnExit(Self);
end;

procedure TfrmFrequencia.SpeedButton3Click(Sender: TObject);
var
    i          : integer;
    lAchou     : boolean;
    aux        : string;
    aux1       : string;
    q1,q2,q3   : integer;
    v1, v2     : double;
    v3, v4     : double;
    v5, v6     : double;
    aItem      : TcxImageComboBoxItem;
begin
    if edtFre_ini.EditValue > edtFre_fim.EditValue then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_93'), mtInformation, [mbOK], 0);
        Exit;
    end;

    lAchou := False;
    for i := 0 to frmDesigner.lstData.Items.Count - 1 do
        if frmDesigner.lstData.Items.Strings[i] = ComboBox1.Text then
           lAchou := True;
    if not lAchou then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_91'), mtInformation, [mbOK], 0);
        Exit;
    end;

    lAchou := False;
    for i := 0 to frmDesigner.lstValor.Items.Count - 1 do
        if frmDesigner.lstValor.Items.Strings[i] = ComboBox2.Text then
           lAchou := True;
    if not lAchou then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_92'), mtInformation, [mbOK], 0);
        Exit;
    end;

    // Monta Com Base nos Dias
    if edtDias.Value <> 0 then
    begin
        if chkAtual.Checked then
        begin
            edtDataBase.Date := Date;
            edtFre_ini.Date  := Date - Round(edtDias.Value);
            edtFre_fim.Date  := Date;
        end
        else
        begin
            edtFre_ini.Date  := edtDataBase.Date - Round(edtDias.Value);
            edtFre_fim.Date  := edtDataBase.Date;
        end;
    end;

    frmDesigner.sFREQUENCIA_data       := ComboBox1.Text;
    frmDesigner.sFREQUENCIA_data_base  := DateToStr(edtDataBase.Date);
    frmDesigner.sFREQUENCIA_valor      := ComboBox2.Text;
    frmDesigner.sFREQUENCIA_dias       := Round(edtDias.Value);
    frmDesigner.sFREQUENCIA_dt_fre_ini := DateToStr(edtFre_ini.Date);
    frmDesigner.sFREQUENCIA_dt_fre_fim := DateToStr(edtFre_fim.Date);

    if chkAtual.Checked then
       frmDesigner.sFREQUENCIA_atual   := 'S'
    else
       frmDesigner.sFREQUENCIA_atual   := 'N';

    if frmDesigner.ComboBox1.Text <> '' then
       frmDesigner.SpeedButton9.OnClick(Self);

    if frmMostraFrequencia = nil then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_259');
        frmAguarde.Show;
        frmAguarde.Update;

        frmAguarde.Label2.Visible := False;
        frmAguarde.cxProgressBar1.Visible := True;
        frmAguarde.cxProgressBar1.Properties.Max := 4;
        frmAguarde.cxProgressBar1.Position := 0;
        frmAguarde.Update;

        frmMostraFrequencia := TfrmMostraFrequencia.Create(Self);

        frmDesigner.MontaSelect;
        frmMostraFrequencia.dxMemData1.CreateFieldsFromDataSet(frmDesigner.ADOQuery1);
        frmMostraFrequencia.dxMemData1.LoadFromDataSet(frmDesigner.ADOQuery1);
        frmMostraFrequencia.dxMemData1.Open;
        frmDesigner.ADOQuery1.Close;

        frmAguarde.cxProgressBar1.Position := 1;
        frmAguarde.Update;

        frmMostraFrequencia.dxMemData1.First;
        while not frmMostraFrequencia.dxMemData1.Eof do
        begin
            frmMostraFrequencia.dxMemData1.Edit;

            frmMostraFrequencia.dxMemData1.FieldByName('_diasFrequencia').Value :=
               frmMostraFrequencia.dxMemData1.FieldByName('_maxFrequencia').Value -
               frmMostraFrequencia.dxMemData1.FieldByName('_minFrequencia').Value;

            frmMostraFrequencia.dxMemData1.FieldByName('_frequenciaFrequencia').Value :=
               RoundTo((frmMostraFrequencia.dxMemData1.FieldByName('_diasFrequencia').Value /
               frmMostraFrequencia.dxMemData1.FieldByName('_countFrequencia').Value), -0);

            frmMostraFrequencia.dxMemData1.FieldByName('_individualFrequencia').Value :=
               RoundTo((frmMostraFrequencia.dxMemData1.FieldByName('_somaFrequencia').Value /
               frmMostraFrequencia.dxMemData1.FieldByName('_countFrequencia').Value), -2);

            frmMostraFrequencia.dxMemData1.FieldByName('_ressenciaFrequencia').Value :=
               RoundTo((edtDataBase.Date - frmMostraFrequencia.dxMemData1.FieldByName('_maxFrequencia').Value), -2);

            frmMostraFrequencia.dxMemData1.FieldByName('_diasAcima').Value :=
               frmMostraFrequencia.dxMemData1.FieldByName('_ressenciaFrequencia').Value -
               frmMostraFrequencia.dxMemData1.FieldByName('_frequenciaFrequencia').Value;

            frmMostraFrequencia.dxMemData1.Post;

            frmMostraFrequencia.dxMemData1.Next;
        end;
        frmAguarde.cxProgressBar1.Position := 2;
        frmAguarde.Update;

        frmMostraFrequencia.cxGrid1DBTableView1.ClearItems;
        frmMostraFrequencia.cxGrid1DBTableView1.DataController.CreateAllItems;

        for i := 0 to frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 1 do
            frmMostraFrequencia.cxGrid1DBTableView1.Columns[i].Width := 150;

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 9].Caption := HCLResourceStrings.FindID('sString_189');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 9].Width   := 70;

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 8].Caption := HCLResourceStrings.FindID('sString_190');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 8].Width   := 70;

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 7].Caption := HCLResourceStrings.FindID('sString_191');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 7].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 7].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 7].GetProperties).DisplayFormat := ',0;-,0';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 6].Caption := HCLResourceStrings.FindID('sString_192');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 6].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 6].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 6].GetProperties).DisplayFormat := ',0.00;-,0.00';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 5].Caption := HCLResourceStrings.FindID('sString_193');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 5].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 5].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 5].GetProperties).DisplayFormat := ',0;-,0';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 4].Caption := HCLResourceStrings.FindID('sString_194');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 4].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 4].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 4].GetProperties).DisplayFormat := ',0;-,0';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 3].Caption := HCLResourceStrings.FindID('sString_195');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 3].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 3].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 3].GetProperties).DisplayFormat := ',0;-,0';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 2].Caption := HCLResourceStrings.FindID('sString_196');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 2].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 2].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 2].GetProperties).DisplayFormat := ',0.00;-,0.00';

        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 1].Caption := HCLResourceStrings.FindID('sString_197');
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 1].Width   := 100;
        frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 1].PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(frmMostraFrequencia.cxGrid1DBTableView1.Columns[frmMostraFrequencia.cxGrid1DBTableView1.ColumnCount - 1].GetProperties).DisplayFormat := ',0;-,0';

        frmAguarde.cxProgressBar1.Position := 3;
        frmAguarde.Update;

        MontaGrafico;

        frmMostraFrequencia.Caption := HCLResourceStrings.FindID('sString_260') + frmDesigner.cAnalise;

        frmAguarde.cxProgressBar1.Position := 4;
        frmAguarde.Update;

        FreeAndNil(frmAguarde);
        frmMostraFrequencia.ShowModal;
        FreeAndNil(frmMostraFrequencia);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmMostraFrequencia);
    end;
end;

procedure TfrmFrequencia.MontaGrafico;
begin
    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[0].Name        := 'Ocorrencias';
    frmMostraFrequencia.Chart1.Series[0].Title       := HCLResourceStrings.FindID('sString_191');
    frmMostraFrequencia.Chart1.Series[0].ValueFormat := '###,##0';
    frmMostraFrequencia.Chart1.Series[0].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[0].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[1].Name        := 'ValorTotal';
    frmMostraFrequencia.Chart1.Series[1].Title       := HCLResourceStrings.FindID('sString_192');
    frmMostraFrequencia.Chart1.Series[1].ValueFormat := '###,##0.00';
    frmMostraFrequencia.Chart1.Series[1].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[1].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[2].Name        := 'Dias';
    frmMostraFrequencia.Chart1.Series[2].Title       := HCLResourceStrings.FindID('sString_193');
    frmMostraFrequencia.Chart1.Series[2].ValueFormat := '###,##0';
    frmMostraFrequencia.Chart1.Series[2].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[2].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[3].Name        := 'Frequencia';
    frmMostraFrequencia.Chart1.Series[3].Title       := HCLResourceStrings.FindID('sString_261');
    frmMostraFrequencia.Chart1.Series[3].ValueFormat := '###,##0';
    frmMostraFrequencia.Chart1.Series[3].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[3].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[4].Name        := 'Ressencia';
    frmMostraFrequencia.Chart1.Series[4].Title       := HCLResourceStrings.FindID('sString_262');
    frmMostraFrequencia.Chart1.Series[4].ValueFormat := '###,##0';
    frmMostraFrequencia.Chart1.Series[4].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[4].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[5].Name        := 'ValorIndividual';
    frmMostraFrequencia.Chart1.Series[5].Title       := HCLResourceStrings.FindID('sString_196');
    frmMostraFrequencia.Chart1.Series[5].ValueFormat := '###,##0.00';
    frmMostraFrequencia.Chart1.Series[5].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[5].Visible     := False;

    frmMostraFrequencia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFrequencia.Chart1.Series[6].Name        := 'DiasAcima';
    frmMostraFrequencia.Chart1.Series[6].Title       := HCLResourceStrings.FindID('sString_197');
    frmMostraFrequencia.Chart1.Series[6].ValueFormat := '###,##0';
    frmMostraFrequencia.Chart1.Series[6].Marks.Style := smsValue;
    frmMostraFrequencia.Chart1.Series[6].Visible     := False;
end;

end.


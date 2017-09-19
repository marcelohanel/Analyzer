unit uFotografar;

interface

uses
  xhConsts, Math, Chart, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxCustomData,
  cxEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  dxmdaset, cxProgressBar,
  cxCurrencyEdit,







  TeEngine, cxButtons,
  cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit;

type
  TfrmFotografar = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    ComboBox1: TcxComboBox;
    ComboBox2: TcxComboBox;
    edtFot_ini: TcxDateEdit;
    edtFot_fim: TcxDateEdit;
    edtCom_ini: TcxDateEdit;
    edtCom_fim: TcxDateEdit;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MontaDados;
    procedure Assinala(Tipo: string);
    procedure MontaGrafico;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FotografiaCriaGrid(i: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFotografar: TfrmFotografar;

implementation

uses uDesigner, uFuncoes, uMostraFotografia, uAguarde;

{$R *.dfm}

procedure TfrmFotografar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmFotografar.FormCreate(Sender: TObject);
begin
    edtFot_ini.Date := Date - 30;
    edtFot_fim.Date := Date - 30;
    edtCom_ini.Date := Date;
    edtCom_fim.Date := Date;
end;

procedure TfrmFotografar.FormShow(Sender: TObject);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmFotografar.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmFotografar.MontaDados;
begin
    ComboBox1.Clear;
    ComboBox2.Clear;

    ComboBox1.Properties.Items := frmDesigner.lstData.Items;
    ComboBox2.Properties.Items := frmDesigner.lstValor.Items;

    if frmDesigner.ComboBox1.Text <> '' then
    begin
        ComboBox1.Text  := frmDesigner.sFOTOGRAFIA_data;
        ComboBox2.Text  := frmDesigner.sFOTOGRAFIA_valor;
        try    edtFot_ini.Date := StrToDate(frmDesigner.sFOTOGRAFIA_dt_fot_ini);
        except edtFot_ini.Date := Date; end;
        try    edtFot_fim.Date := StrToDate(frmDesigner.sFOTOGRAFIA_dt_fot_fim);
        except edtFot_fim.Date := Date; end;

        try    edtCom_ini.Date := StrToDate(frmDesigner.sFOTOGRAFIA_dt_com_ini);
        except edtCom_ini.Date := Date; end;
        try    edtCom_fim.Date := StrToDate(frmDesigner.sFOTOGRAFIA_dt_com_fim);
        except edtCom_fim.Date := Date; end;
    end;
end;

procedure TfrmFotografar.Assinala(Tipo: string);
begin
    if Tipo = 'V' then
    begin
        frmMostraFotografia.dxMemData2.Edit;
        frmMostraFotografia.dxMemData2vlr_qtde.Value := frmMostraFotografia.dxMemData2vlr_qtde.Value + 1;
        frmMostraFotografia.dxMemData2vlr_fot.Value  := frmMostraFotografia.dxMemData2vlr_fot.Value + frmMostraFotografia.dxMemData1.FieldByName('_vFotografado').Value;
        frmMostraFotografia.dxMemData2vlr_com.Value  := frmMostraFotografia.dxMemData2vlr_com.Value + frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value;
        frmMostraFotografia.dxMemData2vlr_dif.Value  := frmMostraFotografia.dxMemData2vlr_fot.Value - frmMostraFotografia.dxMemData2vlr_com.Value;

        if frmMostraFotografia.dxMemData2vlr_com.Value = 0 then
           frmMostraFotografia.dxMemData2vlr_var.Value  := 0
        else
           frmMostraFotografia.dxMemData2vlr_var.Value  := RoundTo(frmMostraFotografia.dxMemData2vlr_dif.Value * 100 / frmMostraFotografia.dxMemData2vlr_com.Value, -2);

        frmMostraFotografia.dxMemData2.Post;
    end;
    if Tipo = 'Q' then
    begin
        frmMostraFotografia.dxMemData2.Edit;
        frmMostraFotografia.dxMemData2qt_qtde.Value := frmMostraFotografia.dxMemData2qt_qtde.Value + 1;
        frmMostraFotografia.dxMemData2qt_fot.Value  := frmMostraFotografia.dxMemData2qt_fot.Value + frmMostraFotografia.dxMemData1.FieldByName('_qFotografado').Value;
        frmMostraFotografia.dxMemData2qt_com.Value  := frmMostraFotografia.dxMemData2qt_com.Value + frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value;
        frmMostraFotografia.dxMemData2qt_dif.Value  := frmMostraFotografia.dxMemData2qt_fot.Value - frmMostraFotografia.dxMemData2qt_com.Value;

        if frmMostraFotografia.dxMemData2qt_com.Value = 0 then
           frmMostraFotografia.dxMemData2qt_var.Value  := 0
        else
           frmMostraFotografia.dxMemData2qt_var.Value  := RoundTo(frmMostraFotografia.dxMemData2qt_dif.Value * 100 / frmMostraFotografia.dxMemData2qt_com.Value, -2);

        frmMostraFotografia.dxMemData2.Post;
    end;
    if Tipo = 'U' then
    begin
        frmMostraFotografia.dxMemData2.Edit;
        frmMostraFotografia.dxMemData2un_qtde.Value := frmMostraFotografia.dxMemData2un_qtde.Value + 1;
        frmMostraFotografia.dxMemData2un_fot.Value  := frmMostraFotografia.dxMemData2un_fot.Value + frmMostraFotografia.dxMemData1.FieldByName('_uFotografado').Value;
        frmMostraFotografia.dxMemData2un_com.Value  := frmMostraFotografia.dxMemData2un_com.Value + frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value;
        frmMostraFotografia.dxMemData2un_dif.Value  := frmMostraFotografia.dxMemData2un_fot.Value - frmMostraFotografia.dxMemData2un_com.Value;

        if frmMostraFotografia.dxMemData2un_com.Value = 0 then
           frmMostraFotografia.dxMemData2un_var.Value  := 0
        else
           frmMostraFotografia.dxMemData2un_var.Value  := RoundTo(frmMostraFotografia.dxMemData2un_dif.Value * 100 / frmMostraFotografia.dxMemData2un_com.Value, -2);

        frmMostraFotografia.dxMemData2.Post;
    end;
end;

procedure TfrmFotografar.SpeedButton3Click(Sender: TObject);
var
    i          : integer;
    lAchou     : boolean;
    aux        : string;
    aux1       : string;
    q1,q2,q3   : integer;
    v1, v2     : double;
    v3, v4     : double;
    v5, v6     : double;
begin
    if edtFot_ini.EditValue > edtFot_fim.EditValue then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_89'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if edtCom_ini.EditValue > edtCom_fim.EditValue then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_90'), mtInformation, [mbOK], 0);
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

    frmDesigner.sFOTOGRAFIA_data       := ComboBox1.Text;
    frmDesigner.sFOTOGRAFIA_valor      := ComboBox2.Text;
    frmDesigner.sFOTOGRAFIA_dt_fot_ini := DateToStr(edtFot_ini.Date);
    frmDesigner.sFOTOGRAFIA_dt_fot_fim := DateToStr(edtFot_fim.Date);
    frmDesigner.sFOTOGRAFIA_dt_com_ini := DateToStr(edtCom_ini.Date);
    frmDesigner.sFOTOGRAFIA_dt_com_fim := DateToStr(edtCom_fim.Date);

    if frmDesigner.ComboBox1.Text <> '' then
       frmDesigner.SpeedButton9.OnClick(Self);

    if frmMostraFotografia = nil then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_242');
        frmAguarde.Show;
        frmAguarde.Update;

        frmAguarde.Label2.Visible := False;
        frmAguarde.cxProgressBar1.Visible := True;
        frmAguarde.cxProgressBar1.Properties.Max := 10;
        frmAguarde.cxProgressBar1.Position := 0;
        frmAguarde.Update;

        frmMostraFotografia := TfrmMostraFotografia.Create(Self);

        frmDesigner.lFotografiaFoto := True;
        frmDesigner.MontaSelect;

        frmMostraFotografia.dxMemData1.CreateFieldsFromDataSet(frmDesigner.ADOQuery1);
        frmMostraFotografia.dxMemData1.LoadFromDataSet(frmDesigner.ADOQuery1);
        frmMostraFotografia.dxMemData1.Open;
        frmDesigner.ADOQuery1.Close;

        frmAguarde.cxProgressBar1.Position := 1;
        frmAguarde.Update;

        frmMostraFotografia.dxMemData1.First;
        while not frmMostraFotografia.dxMemData1.Eof do
        begin
            frmMostraFotografia.dxMemData1.Edit;
            frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_vDiferenca').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value  := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_qDiferenca').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value  := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_uDiferenca').Value := 0;
            frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value  := 0;
            frmMostraFotografia.dxMemData1.Post;

            frmMostraFotografia.dxMemData1.Next;
        end;
        frmAguarde.cxProgressBar1.Position := 2;
        frmAguarde.Update;

        frmDesigner.lFotografiaFoto := False;
        frmDesigner.MontaSelect;

        frmAguarde.cxProgressBar1.Position := 3;
        frmAguarde.Update;

        frmMostraFotografia.dxMemData1.First;
        while not frmMostraFotografia.dxMemData1.Eof do
        begin
            aux := '';
            for i := 1 to frmMostraFotografia.dxMemData1.FieldCount - 13 do
                aux := aux + frmMostraFotografia.dxMemData1.Fields[i].AsString;

            frmDesigner.ADOQuery1.First;
            while not frmDesigner.ADOQuery1.Eof do
            begin
                aux1 := '';
                for i := 0 to frmDesigner.ADOQuery1.FieldCount - 13 do
                    aux1 := aux1 + frmDesigner.ADOQuery1.Fields[i].AsString;

                if aux = aux1 then
                begin
                    frmMostraFotografia.dxMemData1.Edit;
                    frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value := frmDesigner.ADOQuery1.FieldByName('_vComparado').Value;
                    frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value := frmDesigner.ADOQuery1.FieldByName('_qComparado').Value;
                    frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value := frmDesigner.ADOQuery1.FieldByName('_uComparado').Value;
                    frmMostraFotografia.dxMemData1.Post;
                    frmDesigner.ADOQuery1.Last;
                end
                else
                   frmDesigner.ADOQuery1.Next;
            end;
            frmMostraFotografia.dxMemData1.Next;
        end;
        frmDesigner.ADOQuery1.Close;

        frmAguarde.cxProgressBar1.Position := 4;
        frmAguarde.Update;

        frmMostraFotografia.dxMemData1.First;
        while not frmMostraFotografia.dxMemData1.Eof do
        begin
            frmMostraFotografia.dxMemData1.Edit;

            frmMostraFotografia.dxMemData1.FieldByName('_vDiferenca').Value := frmMostraFotografia.dxMemData1.FieldByName('_vFotografado').Value - frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value;
            if frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value = 0 then
               frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value  := 0
            else
               frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value  := RoundTo(frmMostraFotografia.dxMemData1.FieldByName('_vDiferenca').Value * 100 / frmMostraFotografia.dxMemData1.FieldByName('_vComparado').Value, -2);

            frmMostraFotografia.dxMemData1.FieldByName('_qDiferenca').Value := frmMostraFotografia.dxMemData1.FieldByName('_qFotografado').Value - frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value;
            if frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value = 0 then
               frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value  := 0
            else
               frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value  := RoundTo(frmMostraFotografia.dxMemData1.FieldByName('_qDiferenca').Value * 100 / frmMostraFotografia.dxMemData1.FieldByName('_qComparado').Value, -2);

            frmMostraFotografia.dxMemData1.FieldByName('_uDiferenca').Value := frmMostraFotografia.dxMemData1.FieldByName('_uFotografado').Value - frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value;
            if frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value = 0 then
               frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value  := 0
            else
               frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value  := RoundTo(frmMostraFotografia.dxMemData1.FieldByName('_uDiferenca').Value * 100 / frmMostraFotografia.dxMemData1.FieldByName('_uComparado').Value, -2);

            frmMostraFotografia.dxMemData1.Post;

            frmMostraFotografia.dxMemData1.Next;
        end;

        frmAguarde.cxProgressBar1.Position := 5;
        frmAguarde.Update;

        FotografiaCriaGrid(i);

        frmMostraFotografia.dxMemData2.Open;

        frmMostraFotografia.dxMemData2.Insert;
        frmMostraFotografia.dxMemData2Tipo.Value := HCLResourceStrings.FindID('sString_243');
        frmMostraFotografia.dxMemData2.Post;

        frmMostraFotografia.dxMemData2.Insert;
        frmMostraFotografia.dxMemData2Tipo.Value := HCLResourceStrings.FindID('sString_244');
        frmMostraFotografia.dxMemData2.Post;

        frmMostraFotografia.dxMemData2.Insert;
        frmMostraFotografia.dxMemData2Tipo.Value := HCLResourceStrings.FindID('sString_245');
        frmMostraFotografia.dxMemData2.Post;

        frmAguarde.cxProgressBar1.Position := 6;
        frmAguarde.Update;

        frmMostraFotografia.dxMemData1.First;
        while not frmMostraFotografia.dxMemData1.Eof do
        begin
            frmMostraFotografia.dxMemData2.Locate('Tipo',HCLResourceStrings.FindID('sString_243'),[]);

            if frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value > 0 then Assinala('V');
            if frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value > 0 then Assinala('Q');
            if frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value > 0 then Assinala('U');

            frmMostraFotografia.dxMemData2.Locate('Tipo',HCLResourceStrings.FindID('sString_244'),[]);

            if frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value < 0 then Assinala('V');
            if frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value < 0 then Assinala('Q');
            if frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value < 0 then Assinala('U');

            frmMostraFotografia.dxMemData2.Locate('Tipo',HCLResourceStrings.FindID('sString_245'),[]);

            if frmMostraFotografia.dxMemData1.FieldByName('_vVariacao').Value = 0 then Assinala('V');
            if frmMostraFotografia.dxMemData1.FieldByName('_qVariacao').Value = 0 then Assinala('Q');
            if frmMostraFotografia.dxMemData1.FieldByName('_uVariacao').Value = 0 then Assinala('U');

            frmMostraFotografia.dxMemData1.Next;
        end;

        frmAguarde.cxProgressBar1.Position := 7;
        frmAguarde.Update;

        q1 := 0;
        q2 := 0;
        q3 := 0;
        v1 := 0;
        v2 := 0;
        v3 := 0;
        v4 := 0;
        v5 := 0;
        v6 := 0;

        frmMostraFotografia.dxMemData2.First;
        while not frmMostraFotografia.dxMemData2.Eof do
        begin
            q1 := q1 + frmMostraFotografia.dxMemData2vlr_qtde.Value;
            q2 := q2 + frmMostraFotografia.dxMemData2qt_qtde.Value;
            q3 := q3 + frmMostraFotografia.dxMemData2un_qtde.Value;
            v1 := v1 + frmMostraFotografia.dxMemData2vlr_fot.Value;
            v2 := v2 + frmMostraFotografia.dxMemData2vlr_com.Value;
            v3 := v3 + frmMostraFotografia.dxMemData2qt_fot.Value;
            v4 := v4 + frmMostraFotografia.dxMemData2qt_com.Value;
            v5 := v5 + frmMostraFotografia.dxMemData2un_fot.Value;
            v6 := v6 + frmMostraFotografia.dxMemData2un_com.Value;

            frmMostraFotografia.dxMemData2.Next;
        end;

        frmAguarde.cxProgressBar1.Position := 8;
        frmAguarde.Update;

        frmMostraFotografia.dxMemData2.First;
        while not frmMostraFotografia.dxMemData2.Eof do
        begin
            frmMostraFotografia.dxMemData2.Edit;
            if q1 <> 0 then
               frmMostraFotografia.dxMemData2vlr_perc_qtde.Value := RoundTo((frmMostraFotografia.dxMemData2vlr_qtde.Value * 100 / q1), -2)
            else
               frmMostraFotografia.dxMemData2vlr_perc_qtde.Value := 0;

            if q2 <> 0 then
               frmMostraFotografia.dxMemData2qt_perc_qtde.Value  := RoundTo((frmMostraFotografia.dxMemData2qt_qtde.Value * 100 / q2), -2)
            else
               frmMostraFotografia.dxMemData2qt_perc_qtde.Value  := 0;

            if q3 <> 0 then
               frmMostraFotografia.dxMemData2un_perc_qtde.Value  := RoundTo((frmMostraFotografia.dxMemData2un_qtde.Value * 100 / q3), -2)
            else
               frmMostraFotografia.dxMemData2un_perc_qtde.Value  := 0;

            if v1 <> 0 then
               frmMostraFotografia.dxMemData2vlr_perc_fot.Value  := RoundTo((frmMostraFotografia.dxMemData2vlr_fot.Value * 100 / v1), -2)
            else
               frmMostraFotografia.dxMemData2vlr_perc_fot.Value  := 0;

            if v2 <> 0 then
               frmMostraFotografia.dxMemData2vlr_perc_com.Value  := RoundTo((frmMostraFotografia.dxMemData2vlr_com.Value * 100 / v2), -2)
            else
               frmMostraFotografia.dxMemData2vlr_perc_com.Value  := 0;

            if v3 <> 0 then
               frmMostraFotografia.dxMemData2qt_perc_fot.Value   := RoundTo((frmMostraFotografia.dxMemData2qt_fot.Value * 100 / v3), -2)
            else
               frmMostraFotografia.dxMemData2qt_perc_fot.Value   := 0;

            if v4 <> 0 then
               frmMostraFotografia.dxMemData2qt_perc_com.Value   := RoundTo((frmMostraFotografia.dxMemData2qt_com.Value * 100 / v4), -2)
            else
               frmMostraFotografia.dxMemData2qt_perc_com.Value   := 0;

            if v5 <> 0 then
               frmMostraFotografia.dxMemData2un_perc_fot.Value   := RoundTo((frmMostraFotografia.dxMemData2un_fot.Value * 100 / v5), -2)
            else
               frmMostraFotografia.dxMemData2un_perc_fot.Value   := 0;

            if v6 <> 0 then
               frmMostraFotografia.dxMemData2un_perc_com.Value   := RoundTo((frmMostraFotografia.dxMemData2un_com.Value * 100 / v6), -2)
            else
               frmMostraFotografia.dxMemData2un_perc_com.Value   := 0;

            frmMostraFotografia.dxMemData2.Post;
            frmMostraFotografia.dxMemData2.Next;
        end;
        
        frmAguarde.cxProgressBar1.Position := 9;
        frmAguarde.Update;

        MontaGrafico;

        frmMostraFotografia.Caption := HCLResourceStrings.FindID('sString_246') + frmDesigner.cAnalise;
        frmAguarde.cxProgressBar1.Position := 10;
        frmAguarde.Update;

        FreeAndNil(frmAguarde);
        frmMostraFotografia.ShowModal;
        FreeAndNil(frmMostraFotografia);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmMostraFotografia);
    end;
end;

procedure TfrmFotografar.FotografiaCriaGrid(i: Integer);
var
  Local_i: Integer;
begin
  frmMostraFotografia.cxGrid1DBTableView1.ClearItems;
  frmMostraFotografia.cxGrid1DBTableView1.DataController.CreateAllItems;
  for Local_i := 0 to frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 1 do
    frmMostraFotografia.cxGrid1DBTableView1.Columns[Local_i].Width := 150;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 1].Caption := HCLResourceStrings.FindID('sString_199');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 1].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 1].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 1].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 2].Caption := HCLResourceStrings.FindID('sString_200');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 2].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 2].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 2].GetProperties).DisplayFormat := ',0.00;-,0.00';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 3].Caption := HCLResourceStrings.FindID('sString_201');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 3].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 3].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 3].GetProperties).DisplayFormat := ',0.00;-,0.00';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 4].Caption := HCLResourceStrings.FindID('sString_202');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 4].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 4].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 4].GetProperties).DisplayFormat := ',0.00;-,0.00';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 5].Caption := HCLResourceStrings.FindID('sString_203');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 5].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 5].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 5].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 6].Caption := HCLResourceStrings.FindID('sString_204');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 6].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 6].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 6].GetProperties).DisplayFormat := ',0';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 7].Caption := HCLResourceStrings.FindID('sString_205');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 7].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 7].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 7].GetProperties).DisplayFormat := ',0';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 8].Caption := HCLResourceStrings.FindID('sString_206');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 8].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 8].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 8].GetProperties).DisplayFormat := ',0';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 9].Caption := HCLResourceStrings.FindID('sString_207');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 9].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 9].SortOrder := soDescending;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 9].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 9].GetProperties).DisplayFormat := ',0.00 %;-,0.00 %';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 10].Caption := HCLResourceStrings.FindID('sString_208');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 10].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 10].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 10].GetProperties).DisplayFormat := ',0.00;-,0.00';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 11].Caption := HCLResourceStrings.FindID('sString_209');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 11].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 11].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 11].GetProperties).DisplayFormat := ',0.00;-,0.00';
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 12].Caption := HCLResourceStrings.FindID('sString_210');
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 12].PropertiesClass := TcxCurrencyEditProperties;
  frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 12].Width := 100;
  TcxCurrencyEditProperties(frmMostraFotografia.cxGrid1DBTableView1.Columns[frmMostraFotografia.cxGrid1DBTableView1.ColumnCount - 12].GetProperties).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmFotografar.MontaGrafico;
begin
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[0].Name        := 'ValorFotografado';
    frmMostraFotografia.Chart1.Series[0].Title       := HCLResourceStrings.FindID('sString_247');
    frmMostraFotografia.Chart1.Series[0].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[0].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[0].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[1].Name        := 'ValorComparado';
    frmMostraFotografia.Chart1.Series[1].Title       := HCLResourceStrings.FindID('sString_248');
    frmMostraFotografia.Chart1.Series[1].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[1].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[1].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[2].Name        := 'ValorDiferenca';
    frmMostraFotografia.Chart1.Series[2].Title       := HCLResourceStrings.FindID('sString_249');
    frmMostraFotografia.Chart1.Series[2].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[2].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[2].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[3].Name        := 'ValorVariacao';
    frmMostraFotografia.Chart1.Series[3].Title       := HCLResourceStrings.FindID('sString_250');
    frmMostraFotografia.Chart1.Series[3].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[3].ValueFormat := '##0.00 %';
    frmMostraFotografia.Chart1.Series[3].Visible     := False;

    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[4].Name        := 'QuantidadeFotografado';
    frmMostraFotografia.Chart1.Series[4].Title       := HCLResourceStrings.FindID('sString_251');
    frmMostraFotografia.Chart1.Series[4].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[4].ValueFormat := '###,##0';
    frmMostraFotografia.Chart1.Series[4].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[5].Name        := 'QuantidadeComparado';
    frmMostraFotografia.Chart1.Series[5].Title       := HCLResourceStrings.FindID('sString_252');
    frmMostraFotografia.Chart1.Series[5].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[5].ValueFormat := '###,##0';
    frmMostraFotografia.Chart1.Series[5].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[6].Name        := 'QuantidadeDiferenca';
    frmMostraFotografia.Chart1.Series[6].Title       := HCLResourceStrings.FindID('sString_253');
    frmMostraFotografia.Chart1.Series[6].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[6].ValueFormat := '###,##0';
    frmMostraFotografia.Chart1.Series[6].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[7].Name        := 'QuantidadeVariacao';
    frmMostraFotografia.Chart1.Series[7].Title       := HCLResourceStrings.FindID('sString_254');
    frmMostraFotografia.Chart1.Series[7].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[7].ValueFormat := '##0.00 %';
    frmMostraFotografia.Chart1.Series[7].Visible     := False;

    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[8].Name        := 'Unitario_Fotografado';
    frmMostraFotografia.Chart1.Series[8].Title       := HCLResourceStrings.FindID('sString_255');
    frmMostraFotografia.Chart1.Series[8].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[8].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[8].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[9].Name        := 'Unitario_Comparado';
    frmMostraFotografia.Chart1.Series[9].Title       := HCLResourceStrings.FindID('sString_256');
    frmMostraFotografia.Chart1.Series[9].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[9].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[9].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[10].Name        := 'Unitario_Diferenca';
    frmMostraFotografia.Chart1.Series[10].Title       := HCLResourceStrings.FindID('sString_257');
    frmMostraFotografia.Chart1.Series[10].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[10].ValueFormat := '###,##0.00';
    frmMostraFotografia.Chart1.Series[10].Visible     := False;
    frmMostraFotografia.Chart1.AddSeries(TeeSeriesTypes.Items[1].SeriesClass);
    frmMostraFotografia.Chart1.Series[11].Name        := 'Unitario_Variacao';
    frmMostraFotografia.Chart1.Series[11].Title       := HCLResourceStrings.FindID('sString_258');
    frmMostraFotografia.Chart1.Series[11].Marks.Style := smsValue;
    frmMostraFotografia.Chart1.Series[11].ValueFormat := '##0.00 %';
    frmMostraFotografia.Chart1.Series[11].Visible     := False;
end;

end.


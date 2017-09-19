unit uCriaFotografia;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,

  cxGridCustomView,

  StdCtrls, cxCurrencyEdit,








  TeeStore,



  cxButtons, cxLabel, cxTextEdit,
  cxDropDownEdit, cxMemo, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmCriaFotografia = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label2: TcxLabel;
    Edit1: TcxTextEdit;
    Label5: TcxLabel;
    Memo2: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    lConf : boolean;
  end;

var
  frmCriaFotografia: TfrmCriaFotografia;

implementation

uses  uAguarde, uDesigner, uFuncoes, uMostraFotografia;

{$R *.dfm}

procedure TfrmCriaFotografia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmCriaFotografia.SpeedButton3Click(Sender: TObject);
var
    i : integer;
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_156'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_231');
    frmAguarde.Show;
    frmAguarde.Update;

    try
        frmDesigner.tblFotografia.Insert;
        frmDesigner.tblFotografiaID_FOTOGRAFIA.Value   := Edit1.Text;
        frmDesigner.tblFotografiaID_ANALISE.Value      := frmDesigner.cAnalise;
        frmDesigner.tblFotografiaDESCRICAO.Value       := Memo2.Text;

        if frmDesigner.sUsuario <> 'admin' then
        begin
            frmDesigner.tblFotografiaPODE_VISUALIZAR.Value := frmDesigner.sUsuario + ', admin';
            frmDesigner.tblFotografiaPODE_ALTERAR.Value    := frmDesigner.sUsuario + ', admin';
            frmDesigner.tblFotografiaPODE_APAGAR.Value     := frmDesigner.sUsuario + ', admin';
        end
        else
        begin
            frmDesigner.tblFotografiaPODE_VISUALIZAR.Value := frmDesigner.sUsuario;
            frmDesigner.tblFotografiaPODE_ALTERAR.Value    := frmDesigner.sUsuario;
            frmDesigner.tblFotografiaPODE_APAGAR.Value     := frmDesigner.sUsuario;
        end;

        frmDesigner.tblFotografia.Post;

        frmDesigner.tblCenarios.Insert;
        frmDesigner.tblCenariosID_CENARIO.Value := '_#FOTOGRAFIA#_' + Edit1.Text + frmDesigner.sUsuario;

        frmDesigner.ListBox4.Clear;
        for i := 0 to frmDesigner.CheckListBox2.Items.Count - 1 do
        begin
            if frmDesigner.CheckListBox2.Items.Items[i].Checked = True then
               frmDesigner.ListBox4.Items.Add(frmDesigner.CheckListBox2.Items.Items[i].Text);
        end;
        frmDesigner.tblCenariosELEMENTOS.Value := frmDesigner.ListBox4.Items.Text;

        frmDesigner.ListBox4.Clear;
        for i := 0 to frmDesigner.CheckListBox3.Items.Count - 1 do
        begin
            if frmDesigner.CheckListBox3.Items.Items[i].Checked = True then
               frmDesigner.ListBox4.Items.Add(frmDesigner.CheckListBox3.Items.Items[i].Text);
        end;
        frmDesigner.tblCenariosVALORES.Value := frmDesigner.ListBox4.Items.Text;

        frmDesigner.tblCenariosID_ANALISE.Value            := frmDesigner.cAnalise;
        frmDesigner.tblCenariosID_USUARIO.Value            := frmDesigner.sUsuario;
        frmDesigner.tblCenariosID_FOTOGRAFIA.Value         := Edit1.Text;
        frmDesigner.tblCenariosFILTROS.Value               := frmDesigner.ListBox2.Items.Text;
        frmDesigner.tblCenariosA.AsInteger                 := frmDesigner.vA;
        frmDesigner.tblCenariosB.AsInteger                 := frmDesigner.vB;
        frmDesigner.tblCenariosC.AsInteger                 := frmDesigner.vC;
        frmDesigner.tblCenariosD.AsInteger                 := frmDesigner.vD;
        frmDesigner.tblCenariosE.AsInteger                 := frmDesigner.vE;
        frmDesigner.tblCenariosFOTOGRAFIA_DATA.Value       := frmDesigner.sFOTOGRAFIA_data;
        frmDesigner.tblCenariosFOTOGRAFIA_VALOR.Value      := frmDesigner.sFOTOGRAFIA_valor;
        frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_INI.Value := frmDesigner.sFOTOGRAFIA_dt_fot_ini;
        frmDesigner.tblCenariosFOTOGRAFIA_DT_FOT_FIM.Value := frmDesigner.sFOTOGRAFIA_dt_fot_fim;
        frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_INI.Value := frmDesigner.sFOTOGRAFIA_dt_com_ini;
        frmDesigner.tblCenariosFOTOGRAFIA_DT_COM_FIM.Value := frmDesigner.sFOTOGRAFIA_dt_com_fim;
        frmDesigner.tblCenariosFREQUENCIA_DATA.Value       := frmDesigner.sFREQUENCIA_data;
        frmDesigner.tblCenariosFREQUENCIA_DATA_BASE.Value  := frmDesigner.sFREQUENCIA_data_base;
        frmDesigner.tblCenariosFREQUENCIA_VALOR.Value      := frmDesigner.sFREQUENCIA_valor;
        frmDesigner.tblCenariosFREQUENCIA_DIAS.Value       := frmDesigner.sFREQUENCIA_dias;
        frmDesigner.tblCenariosFREQUENCIA_ATUAL.Value      := frmDesigner.sFREQUENCIA_atual;
        frmDesigner.tblCenariosFREQUENCIA_DT_FRE_INI.Value := frmDesigner.sFREQUENCIA_dt_fre_ini;
        frmDesigner.tblCenariosFREQUENCIA_DT_FRE_FIM.Value := frmDesigner.sFREQUENCIA_dt_fre_fim;
        frmDesigner.tblCenariosORDEM.Value                 := frmDesigner.cbxOrdem.Text;
        if frmDesigner.rgpOrdem.ItemIndex = 0 then
           frmDesigner.tblCenariosORDEM_TIPO.Value         := 'C'
        else
           frmDesigner.tblCenariosORDEM_TIPO.Value         := 'D';

        frmDesigner.tblCenariosLINHAS.Value                := frmDesigner.edtLinha.EditValue;
        frmDesigner.tblCenariosREGISTROS.Value             := frmDesigner.edtRegistros.EditValue;
        
        frmDesigner.tblCenarios.Post;

        //Salvar Padrões
        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox1',frmDesigner.tblCenariosID_CENARIO.Value,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := Edit1.Text;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.tblCenariosID_CENARIO.Value; //Edit1.Text + frmDesigner.sUsuario;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox1';
        frmDesigner.tblPadroesVALOR.AsString   := frmMostraFotografia.ComboBox1.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox2',frmDesigner.tblCenariosID_CENARIO.Value,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := Edit1.Text;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.tblCenariosID_CENARIO.Value; //Edit1.Text + frmDesigner.sUsuario;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox2';
        frmDesigner.tblPadroesVALOR.AsString   := frmMostraFotografia.ComboBox2.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','ComboBox3',frmDesigner.tblCenariosID_CENARIO.Value,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := Edit1.Text;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.tblCenariosID_CENARIO.Value; //Edit1.Text + frmDesigner.sUsuario;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'ComboBox3';
        frmDesigner.tblPadroesVALOR.AsString   := frmMostraFotografia.ComboBox3.Text;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','cxGrid1',frmDesigner.tblCenariosID_CENARIO.Value,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := Edit1.Text;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.tblCenariosID_CENARIO.Value; //Edit1.Text + frmDesigner.sUsuario;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'cxGrid1';
        AOptions := [gsoUseFilter, gsoUseSummary];
        S := TMemoryStream.Create;
        frmMostraFotografia.cxGrid1DBTableView1.StoreToStream(S,AOptions);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;

        if frmDesigner.tblPadroes.Locate('ID_USUARIO;FORMULARIO;CHAVE;ID_CENARIO;ID_ANALISE',VarArrayOf([frmDesigner.sUsuario,'frmMostraFotografia','Chart1',frmDesigner.tblCenariosID_CENARIO.Value,frmDesigner.cAnalise]),[]) then frmDesigner.tblPadroes.Edit else frmDesigner.tblPadroes.Insert;
        frmDesigner.tblPadroesFORMULARIO.Value := 'frmMostraFotografia';
        frmDesigner.tblPadroesID_FOTOGRAFIA.Value := Edit1.Text;
        frmDesigner.tblPadroesID_CENARIO.Value := frmDesigner.tblCenariosID_CENARIO.Value; //Edit1.Text + frmDesigner.sUsuario;
        frmDesigner.tblPadroesID_ANALISE.Value := frmDesigner.cAnalise;
        frmDesigner.tblPadroesCHAVE.Value      := 'Chart1';
        S := TMemoryStream.Create;
        SaveChartToStream(frmMostraFotografia.Chart1,S,True,True);
        S.Position := 0;
        frmDesigner.tblPadroesVALOR.LoadFromStream(S);
        S.Free;
        frmDesigner.tblPadroes.Post;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_157') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
      end;
    end;

    lConf := True;
    FreeAndNil(frmAguarde);
    close;
end;

procedure TfrmCriaFotografia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCriaFotografia.FormShow(Sender: TObject);
begin
    lConf := False;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

end.

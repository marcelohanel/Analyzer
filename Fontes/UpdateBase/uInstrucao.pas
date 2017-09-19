unit uInstrucao;

interface

uses
  xhConsts, AdoConEd, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxButtons, cxContainer,







  cxTextEdit,
  cxLabel, cxCurrencyEdit, cxDropDownEdit, cxMemo, DB, ADODB,
  cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmInstrucao = class(TForm)
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtOrdem: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cbxTipo: TcxComboBox;
    cxLabel4: TcxLabel;
    mmoConexao: TcxMemo;
    cxLabel5: TcxLabel;
    mmoSQL: TcxMemo;
    cxLabel6: TcxLabel;
    mmoComando: TcxMemo;
    btnConexao: TcxButton;
    Connection: TADOConnection;
    chkAtiva: TcxCheckBox;
    cxLabel7: TcxLabel;
    mmoParametros: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConexaoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbxTipoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipo : string;
    iOrdem : integer;
  end;

var
  frmInstrucao: TfrmInstrucao;

implementation

uses uUpdateBase;

{$R *.dfm}

procedure TfrmInstrucao.btnConfirmarClick(Sender: TObject);
begin
    if edtNome.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_420'), mtInformation, [mbOK], 0);
        edtNome.SetFocus;
        Exit;
    end;

    if edtOrdem.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_421'), mtInformation, [mbOK], 0);
        edtOrdem.SetFocus;
        Exit;
    end;

    if cbxTipo.Text = 'Instrução SQL Banco de Dados' then
    begin
        if mmoConexao.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_422'), mtInformation, [mbOK], 0);
            btnConexao.SetFocus;
            Exit;
        end;

        if mmoSQL.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_423'), mtInformation, [mbOK], 0);
            mmoSQL.SetFocus;
            Exit;
        end;
    end
    else
    if cbxTipo.Text = 'Linha de Comando' then
    begin
        if mmoComando.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_427'), mtInformation, [mbOK], 0);
            mmoComando.SetFocus;
            Exit;
        end;
    end;

    with frmUpdateBase do
    begin
        if sTipo = 'Inserir' then
        begin
           cdsScript.Cancel;
           cdsScript.Insert;
        end
        else
        if sTipo = 'Alterar' then
        begin
           cdsScript.Cancel;
           cdsScript.Edit;
        end;

        if cbxTipo.Text = 'Instrução SQL Banco de Dados' then
        begin
            mmoComando.Text    := '';
            mmoParametros.Text := '';
        end
        else
        if cbxTipo.Text = 'Linha de Comando' then
        begin
            mmoConexao.Text := '';
            mmoSQL.Text     := '';
        end;

        cdsScriptNome.AsString    := edtNome.Text;
        cdsScriptOrdem.AsFloat    := edtOrdem.Value;
        cdsScriptTipo.AsString    := cbxTipo.Text;
        cdsScriptConexao.AsString := mmoConexao.Text;
        cdsScriptSQL.AsString     := mmoSQL.Text;
        cdsScriptComando.AsString := mmoComando.Text;
        cdsScriptAux_1.AsString   := mmoParametros.Text;
        cdsScriptAtiva.Value      := chkAtiva.Checked;

        cdsScript.Post;
    end;

    Close;
end;

procedure TfrmInstrucao.cbxTipoPropertiesChange(Sender: TObject);
begin
    mmoSQL.Enabled        := False;
    mmoConexao.Enabled    := False;
    mmoComando.Enabled    := False;
    mmoParametros.Enabled := False;
    btnConexao.Enabled    := False;

    if cbxTipo.Text = 'Instrução SQL Banco de Dados' then
    begin
        mmoSQL.Enabled     := True;
        mmoConexao.Enabled := True;
        btnConexao.Enabled := True;
    end
    else
    if cbxTipo.Text = 'Linha de Comando' then
    begin
        mmoComando.Enabled    := True;
        mmoParametros.Enabled := True;
    end;
end;

procedure TfrmInstrucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmInstrucao.FormShow(Sender: TObject);
begin
    if sTipo = 'Inserir' then
    begin
        mmoComando.Enabled    := False;
        mmoParametros.Enabled := False;
        mmoSQL.Enabled        := True;

        edtNome.Text       := '';
        edtOrdem.Value     := iOrdem;
        cbxTipo.Text       := 'Instrução SQL Banco de Dados';
        mmoConexao.Text    := '';
        mmoSQL.Text        := '';
        mmoComando.Text    := '';
        mmoParametros.Text := '';
        chkAtiva.Checked   := True;
    end
    else
    if sTipo = 'Alterar' then
    begin
        mmoComando.Enabled    := False;
        mmoParametros.Enabled := False;
        mmoSQL.Enabled        := False;
        mmoConexao.Enabled    := False;
        btnConexao.Enabled    := False;

        with frmUpdateBase do
        begin
            edtNome.Text       := cdsScriptNome.AsString;
            edtOrdem.Value     := cdsScriptOrdem.AsFloat;
            cbxTipo.Text       := cdsScriptTipo.AsString;
            mmoConexao.Text    := cdsScriptConexao.AsString;
            mmoSQL.Text        := cdsScriptSQL.AsString;
            mmoComando.Text    := cdsScriptComando.AsString;
            mmoParametros.Text := cdsScriptAux_1.AsString;
            chkAtiva.Checked   := cdsScriptAtiva.Value;
        end;

        if cbxTipo.Text = 'Instrução SQL Banco de Dados' then
        begin
            mmoSQL.Enabled     := True;
            mmoConexao.Enabled := True;
            btnConexao.Enabled := True;
        end
        else
        if cbxTipo.Text = 'Linha de Comando' then
        begin
            mmoComando.Enabled    := True;
            mmoParametros.Enabled := True;
        end;
    end;

    edtNome.SetFocus;
end;

procedure TfrmInstrucao.btnCancelarClick(Sender: TObject);
begin
    frmUpdateBase.cdsScript.Cancel;
    Close;
end;

procedure TfrmInstrucao.btnConexaoClick(Sender: TObject);
begin
   Connection.Close;
   Connection.ConnectionString := mmoConexao.Text;

   if EditConnectionString(Connection) then
      mmoConexao.Text := Connection.ConnectionString;
end;

end.




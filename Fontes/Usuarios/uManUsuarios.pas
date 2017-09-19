unit uManUsuarios;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdoConEd, DB, ADODB,
  cxButtons, cxMemo,
  cxTextEdit, cxCheckBox, cxLabel, cxGroupBox, cxPC,
  cxDropDownEdit, cxShellComboBox,





  cxImage,
  cxHyperLinkEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, ComCtrls, ShlObj,
  cxShellCommon, cxMaskEdit, StdCtrls, cxCurrencyEdit,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu;

type
  TfrmManUsuarios = class(TForm)
    Connection: TADOConnection;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Edit1: TcxTextEdit;
    Edit2: TcxTextEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    SpeedButton2: TcxButton;
    Label11: TcxLabel;
    Label12: TcxLabel;
    Label3: TcxLabel;
    cxLabel1: TcxLabel;
    cxCaminho: TcxShellComboBox;
    cxLabel2: TcxLabel;
    cxCaminhoAtualiza: TcxShellComboBox;
    cxLabel3: TcxLabel;
    cbxBanco: TcxComboBox;
    Edit3: TcxTextEdit;
    Edit4: TcxTextEdit;
    Memo1: TcxMemo;
    GroupBox1: TcxGroupBox;
    CheckBox8: TcxCheckBox;
    cxAtualizaOnLine: TcxCheckBox;
    CheckBox1: TcxCheckBox;
    CheckBox5: TcxCheckBox;
    CheckBox2: TcxCheckBox;
    CheckBox3: TcxCheckBox;
    CheckBox4: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    chkDynamics: TcxCheckBox;
    chkPermdynamics: TcxCheckBox;
    chkABC: TcxCheckBox;
    chkABCPerm: TcxCheckBox;
    chkCubo: TcxCheckBox;
    chkCuboPermissao: TcxCheckBox;
    chkFotografia: TcxCheckBox;
    chkFotografiaPermissao: TcxCheckBox;
    chkFrequencia: TcxCheckBox;
    chkFrequenciaPermissao: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxImage1: TcxImage;
    cxCheckBoxAccess: TcxCheckBox;
    cxCheckBoxPermissaoAccess: TcxCheckBox;
    chkReporting: TcxCheckBox;
    cxLabel4: TcxLabel;
    edtReporting: TcxHyperLinkEdit;
    cxCheckBoxVisio: TcxCheckBox;
    cxCheckBoxPermissaoVisio: TcxCheckBox;
    cxCheckBoxParametros: TcxCheckBox;
    cxTabSheet3: TcxTabSheet;
    cxLabel5: TcxLabel;
    edtEndereco: TcxHyperLinkEdit;
    cxLabel6: TcxLabel;
    edtUserName: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtSenhaMail: TcxTextEdit;
    cxButton1: TcxButton;
    cxCheckBoxGeo: TcxCheckBox;
    cxCheckBoxPermissaoGeo: TcxCheckBox;
    chkLogs: TcxCheckBox;
    chkLog: TcxCheckBox;
    chkWebBI: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxImage1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cTipo : string;
  end;

var
  frmManUsuarios: TfrmManUsuarios;

implementation

uses uFuncoes, uUsuarios;

{$R *.dfm}

procedure TfrmManUsuarios.cxButton1Click(Sender: TObject);
begin
    frmUsuarios.tblParametros.Open;
    frmUsuarios.tblParametros.First;

    enviaEmail(edtUserName.Text,
               edtEndereco.Text,
               'Assunto',
               'Mensagem',
               edtUserName.Text,
               edtSenhaMail.Text,
               frmUsuarios.tblParametrosSERVIDOR_MAIL.AsString,
               frmUsuarios.tblParametrosPORTA_MAIL.AsInteger);

    frmUsuarios.tblParametros.Close;
end;

procedure TfrmManUsuarios.cxImage1DblClick(Sender: TObject);
begin
    cxImage1.LoadFromFile;
end;

procedure TfrmManUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmUsuarios.bdDados,frmUsuarios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManUsuarios.SpeedButton1Click(Sender: TObject);
begin
    frmUsuarios.tblUsuarios.Cancel;
    close;
end;

procedure TfrmManUsuarios.FormShow(Sender: TObject);
begin
    cxPageControl1.ActivePageIndex := 0;

    if cTipo = 'Alterar' then
    begin
        Edit1.Enabled          := False;
        Edit1.Text             := frmUsuarios.tblUsuariosID_USUARIO.Value;
        Edit2.Text             := frmUsuarios.tblUsuariosNOME.Value;
        Edit3.Text             := frmUsuarios.tblUsuariosSENHA.Value;
        Edit4.Text             := '';
        Memo1.Lines.Text       := frmUsuarios.tblUsuariosBASE_DADOS.Value;
        cxCaminho.Path         := frmUsuarios.tblUsuariosSCHEDULER_CAMINHO.Value;
        cxCaminhoAtualiza.Path := frmUsuarios.tblUsuariosLOCAL_ATUALIZACOES.Value;
        cbxBanco.Text          := frmUsuarios.tblUsuariosSGBD.Value;
        edtReporting.Text      := frmUsuarios.tblUsuariosLINK_REPORT.Value;
        edtEndereco.Text       := frmUsuarios.tblUsuariosMAIL.Value;
        edtUserName.Text       := frmUsuarios.tblUsuariosUSER_MAIL.Value;
        edtSenhaMail.Text      := frmUsuarios.tblUsuariosSENHA_MAIL.Value;

        try
           frmUsuarios.tblUsuariosIMAGEM.SaveToFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
           cxImage1.Picture.LoadFromFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
           DeleteFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
        except
        end;

        if frmUsuarios.tblUsuariosGERA_LOG.Value = 'S' then
           chkLog.Checked := True
        else
           chkLog.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_SCORED.Value = 'S' then
           cxCheckBox1.Checked := True
        else
           cxCheckBox1.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_ABC.Value = 'S' then
           chkABC.Checked := True
        else
           chkABC.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_CUBO.Value = 'S' then
           chkCubo.Checked := True
        else
           chkCubo.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_FOTOGRAFIA.Value = 'S' then
           chkFotografia.Checked := True
        else
           chkFotografia.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_FREQUENCIA.Value = 'S' then
           chkFrequencia.Checked := True
        else
           chkFrequencia.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_SMARTDOCS.Value = 'S' then
           cxCheckBox3.Checked := True
        else
           cxCheckBox3.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_DYNAMICS.Value = 'S' then
           chkDynamics.Checked := True
        else
           chkDynamics.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_ACCESS.Value = 'S' then
           cxCheckBoxAccess.Checked := True
        else
           cxCheckBoxAccess.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_VISIO.Value = 'S' then
           cxCheckBoxVisio.Checked := True
        else
           cxCheckBoxVisio.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_GEO_ANALISE.Value = 'S' then
           cxCheckBoxGeo.Checked := True
        else
           cxCheckBoxGeo.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PARAMETROS.Value = 'S' then
           cxCheckBoxParametros.Checked := True
        else
           cxCheckBoxParametros.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_LOGS.Value = 'S' then
           chkLogs.Checked := True
        else
           chkLogs.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_WEBBI.Value = 'S' then
           chkWebBI.Checked := True
        else
           chkWebBI.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_REPORT.Value = 'S' then
           chkReporting.Checked := True
        else
           chkReporting.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_USUARIOS.Value = 'S' then
           CheckBox1.Checked := True
        else
           CheckBox1.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_VISOES.Value = 'S' then
           CheckBox2.Checked := True
        else
           CheckBox2.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_RELATORIOS.Value = 'S' then
           CheckBox5.Checked := True
        else
           CheckBox5.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_ABC.Value = 'S' then
           chkABCPerm.Checked := True
        else
           chkABCPerm.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_SMARTDOCS.Value = 'S' then
           cxCheckBox4.Checked := True
        else
           cxCheckBox4.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_CUBO.Value = 'S' then
           chkCuboPermissao.Checked := True
        else
           chkCuboPermissao.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA.Value = 'S' then
           chkFotografiaPermissao.Checked := True
        else
           chkFotografiaPermissao.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_FREQUENCIA.Value = 'S' then
           chkFrequenciaPermissao.Checked := True
        else
           chkFrequenciaPermissao.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_DYNAMICS.Value = 'S' then
           chkPermdynamics.Checked := True
        else
           chkPermdynamics.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_ANALISES.Value = 'S' then
           CheckBox3.Checked := True
        else
           CheckBox3.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_SCORED.Value = 'S' then
           cxCheckBox2.Checked := True
        else
           cxCheckBox2.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_RELATORIOS.Value = 'S' then
           CheckBox4.Checked := True
        else
           CheckBox4.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_ACCESS.Value = 'S' then
           cxCheckBoxPermissaoAccess.Checked := True
        else
           cxCheckBoxPermissaoAccess.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_VISIO.Value = 'S' then
           cxCheckBoxPermissaoVisio.Checked := True
        else
           cxCheckBoxPermissaoVisio.Checked := False;

        if frmUsuarios.tblUsuariosACESSA_PERMISSOES_GEO_ANALISE.Value = 'S' then
           cxCheckBoxPermissaoGeo.Checked := True
        else
           cxCheckBoxPermissaoGeo.Checked := False;

        if frmUsuarios.tblUsuariosBASE_DADOS_PEDE_SENHA.Value = 'S' then
           CheckBox8.Checked := True
        else
           CheckBox8.Checked := False;

        if frmUsuarios.tblUsuariosATUALIZA_ONLINE.Value = 'S' then
           cxAtualizaOnLine.Checked := True
        else
           cxAtualizaOnLine.Checked := False;
    end;

    GeraLog(frmUsuarios.bdDados,frmUsuarios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManUsuarios.SpeedButton3Click(Sender: TObject);
var
    iCodUsuario : integer;
    Query : TADOQuery;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_46'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if Edit2.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_60'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if Edit3.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_61'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cTipo = 'Criar' then
    begin
        if Edit4.Text <> Edit3.Text then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_62'), mtInformation, [mbOK], 0);
            Exit;
        end;
    end;

    if cTipo = 'Alterar' then
       frmUsuarios.tblUsuarios.Edit;

    if cTipo = 'Criar' then
    begin
       frmUsuarios.tblUsuarios.Insert;
       frmUsuarios.tblUsuariosID_USUARIO.Value      := Edit1.Text;

       Query                := TADOQuery.Create(Application);
       Query.Connection     := frmUsuarios.bdDados;
       Query.CursorLocation := clUseServer;

       iCodUsuario := 1;

       Query.Close;
       Query.SQL.Clear;
       Query.SQL.Add('SELECT MAX(COD_USUARIO) FROM USUARIOS');
       Query.Open;
       Query.First;

       if not Query.IsEmpty then
          iCodUsuario := Query.Fields[0].AsInteger + 1;

       Query.Close;
       Query.Free;

       frmUsuarios.tblUsuariosCOD_USUARIO.AsInteger := iCodUsuario;
    end;

    frmUsuarios.tblUsuariosNOME.Value               := Edit2.Text;
    frmUsuarios.tblUsuariosSENHA.Value              := Edit3.Text;
    frmUsuarios.tblUsuariosBASE_DADOS.Value         := Memo1.Lines.Text;
    frmUsuarios.tblUsuariosSCHEDULER_CAMINHO.Value  := cxCaminho.Path;
    frmUsuarios.tblUsuariosLOCAL_ATUALIZACOES.Value := cxCaminhoAtualiza.Path;
    frmUsuarios.tblUsuariosSGBD.Value               := cbxBanco.Text;
    frmUsuarios.tblUsuariosLINK_REPORT.Value        := edtReporting.Text;
    frmUsuarios.tblUsuariosMAIL.Value               := edtEndereco.Text;
    frmUsuarios.tblUsuariosUSER_MAIL.Value          := edtUserName.Text;
    frmUsuarios.tblUsuariosSENHA_MAIL.Value         := edtSenhaMail.Text;

    try
       cxImage1.Picture.SaveToFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
       frmUsuarios.tblUsuariosIMAGEM.LoadFromFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
       DeleteFile(frmUsuarios.sTempDirUsuario + Edit1.Text + '.bmp');
    except
    end;

    if CheckBox1.Checked then
       frmUsuarios.tblUsuariosACESSA_USUARIOS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_USUARIOS.Value := 'N';

    if chkABC.Checked then
       frmUsuarios.tblUsuariosACESSA_ABC.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_ABC.Value := 'N';

    if chkCubo.Checked then
       frmUsuarios.tblUsuariosACESSA_CUBO.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_CUBO.Value := 'N';

    if chkFotografia.Checked then
       frmUsuarios.tblUsuariosACESSA_FOTOGRAFIA.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_FOTOGRAFIA.Value := 'N';

    if cxCheckBox3.Checked then
       frmUsuarios.tblUsuariosACESSA_SMARTDOCS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_SMARTDOCS.Value := 'N';

    if chkFrequencia.Checked then
       frmUsuarios.tblUsuariosACESSA_FREQUENCIA.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_FREQUENCIA.Value := 'N';

    if chkDynamics.Checked then
       frmUsuarios.tblUsuariosACESSA_DYNAMICS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_DYNAMICS.Value := 'N';

    if cxCheckBox1.Checked then
       frmUsuarios.tblUsuariosACESSA_SCORED.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_SCORED.Value := 'N';

    if cxCheckBoxAccess.Checked then
       frmUsuarios.tblUsuariosACESSA_ACCESS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_ACCESS.Value := 'N';

    if cxCheckBoxVisio.Checked then
       frmUsuarios.tblUsuariosACESSA_VISIO.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_VISIO.Value := 'N';

    if cxCheckBoxGeo.Checked then
       frmUsuarios.tblUsuariosACESSA_GEO_ANALISE.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_GEO_ANALISE.Value := 'N';

    if cxCheckBoxParametros.Checked then
       frmUsuarios.tblUsuariosACESSA_PARAMETROS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PARAMETROS.Value := 'N';

    if chkLogs.Checked then
       frmUsuarios.tblUsuariosACESSA_LOGS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_LOGS.Value := 'N';

    if chkWebBI.Checked then
       frmUsuarios.tblUsuariosACESSA_WEBBI.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_WEBBI.Value := 'N';

    if chkLog.Checked then
       frmUsuarios.tblUsuariosGERA_LOG.Value := 'S'
    else
       frmUsuarios.tblUsuariosGERA_LOG.Value := 'N';

    if chkReporting.Checked then
       frmUsuarios.tblUsuariosACESSA_REPORT.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_REPORT.Value := 'N';

    if cxCheckBoxPermissaoAccess.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ACCESS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ACCESS.Value := 'N';

    if cxCheckBoxPermissaoVisio.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_VISIO.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_VISIO.Value := 'N';

    if cxCheckBoxPermissaoGeo.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_GEO_ANALISE.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_GEO_ANALISE.Value := 'N';

    if CheckBox2.Checked then
       frmUsuarios.tblUsuariosACESSA_VISOES.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_VISOES.Value := 'N';

    if CheckBox5.Checked then
       frmUsuarios.tblUsuariosACESSA_RELATORIOS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_RELATORIOS.Value := 'N';

    if chkABCPerm.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ABC.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ABC.Value := 'N';

    if chkCuboPermissao.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_CUBO.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_CUBO.Value := 'N';

    if cxCheckBox4.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_SMARTDOCS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_SMARTDOCS.Value := 'N';

    if chkFotografiaPermissao.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA.Value := 'N';

    if chkFrequenciaPermissao.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_FREQUENCIA.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_FREQUENCIA.Value := 'N';

    if chkPermdynamics.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_DYNAMICS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_DYNAMICS.Value := 'N';

    if CheckBox3.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ANALISES.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_ANALISES.Value := 'N';

    if cxCheckBox2.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_SCORED.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_SCORED.Value := 'N';

    if CheckBox4.Checked then
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_RELATORIOS.Value := 'S'
    else
       frmUsuarios.tblUsuariosACESSA_PERMISSOES_RELATORIOS.Value := 'N';

    if CheckBox8.Checked then
       frmUsuarios.tblUsuariosBASE_DADOS_PEDE_SENHA.Value := 'S'
    else
       frmUsuarios.tblUsuariosBASE_DADOS_PEDE_SENHA.Value := 'N';

    if cxAtualizaOnLine.Checked then
       frmUsuarios.tblUsuariosATUALIZA_ONLINE.Value := 'S'
    else
       frmUsuarios.tblUsuariosATUALIZA_ONLINE.Value := 'N';

    if cTipo = 'Alterar' then
    begin
        if Edit1.Text = frmUsuarios.sUsuario then
        begin
            try
              frmUsuarios.bdArmazena.Close;

              if frmUsuarios.tblUsuariosBASE_DADOS.Value <> '' then
                 frmUsuarios.bdArmazena.ConnectionString := frmUsuarios.tblUsuariosBASE_DADOS.Value
              else
                 frmUsuarios.bdArmazena.ConnectionString := frmUsuarios.bdDados.ConnectionString;

              if frmUsuarios.tblUsuariosBASE_DADOS_PEDE_SENHA.Value = 'S' then
                 frmUsuarios.bdArmazena.LoginPrompt := True
              else
                 frmUsuarios.bdArmazena.LoginPrompt := False;

              frmUsuarios.bdArmazena.Open;
            except
              on E: Exception do
              begin
                  MessageDlg(HCLResourceStrings.FindID('sString_9') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                  frmUsuarios.tblUsuarios.Cancel;
                  Application.Terminate;
              end;
            end;
        end;
    end;

    frmUsuarios.tblUsuarios.Post;

    Close;
end;

procedure TfrmManUsuarios.SpeedButton2Click(Sender: TObject);
begin
   Connection.Close;
   Connection.ConnectionString := Memo1.Text;

   if EditConnectionString(Connection) then
      Memo1.Text := Connection.ConnectionString;
end;

end.

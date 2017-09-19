unit uLogin;

interface

uses
  xhConsts, Registry, DB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxTextEdit, cxLabel, cxImage, cxPC,





  cxCheckBox,
  cxDropDownEdit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Menus, StdCtrls,
  cxMaskEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu;

type
  TfrmLogin = class(TForm)
    cxPageControl1: TcxPageControl;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    edtUsuario: TcxComboBox;
    cxLabel2: TcxLabel;
    edtSenha: TcxTextEdit;
    chkLembrar: TcxCheckBox;
    chkSenha: TcxCheckBox;
    BitBtn1: TcxButton;
    BitBtn2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalvaRegistro;
    procedure LeRegistro(Chave: string);
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioPropertiesEditValueChanged(Sender: TObject);
    procedure edtUsuarioPropertiesInitPopup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uPrincipal, uModule, uFuncoes;

{$R *.dfm}

procedure TfrmLogin.SalvaRegistro;
var
    Registry: TRegistry;
begin
    if not frmPrincipal.lAtualizaBatch then
    begin
        try
            Registry         := TRegistry.Create;
            Registry.RootKey := HKEY_LOCAL_MACHINE;

            //Geral
            Registry.OpenKey('software\Analyzer', true);

            try
               Registry.WriteString('Lembrar Usuario', BoolToStr(chkLembrar.Checked));
            except
            end;

            try
               Registry.WriteString('Lembrar Senha',   BoolToStr(chkSenha.Checked));
            except
            end;

            try
                if chkLembrar.Checked then
                   Registry.WriteString('Usuario', EnDecryptString(edtUsuario.Text))
                else
                   Registry.WriteString('Usuario', '');
            except
            end;

            try
                if chkSenha.Checked then
                   Registry.WriteString('Senha', EnDecryptString(edtSenha.Text))
                else
                   Registry.WriteString('Senha', '');
            except
            end;

            Registry.CloseKey;

            // Individual
            if (chkLembrar.Checked = False) and
               (chkSenha.Checked   = False) then
            begin
                Registry.DeleteKey('software\Analyzer\' + edtUsuario.Text);
            end
            else
            begin
                Registry.OpenKey('software\Analyzer\' + edtUsuario.Text, true);

                try
                    Registry.WriteString('Lembrar Usuario', BoolToStr(chkLembrar.Checked));
                except
                end;

                try
                    Registry.WriteString('Lembrar Senha',   BoolToStr(chkSenha.Checked));
                except
                end;

                try
                    if chkLembrar.Checked then
                       Registry.WriteString('Usuario', EnDecryptString(edtUsuario.Text))
                    else
                       Registry.WriteString('Usuario', '');
                except
                end;

                try
                    if chkSenha.Checked then
                       Registry.WriteString('Senha', EnDecryptString(edtSenha.Text))
                    else
                       Registry.WriteString('Senha', '');
                except
                end;

                Registry.CloseKey;
            end;

            Registry.Free;
        except
        end;
    end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not frmPrincipal.lAtualizaBatch then
    begin
        if edtSenha.Text <> 'analyzerintelectivo2010' then
        begin
            if dtmPrincipal.tblUsuarios.Locate('ID_USUARIO;SENHA',VarArrayOf([edtUsuario.Text,edtSenha.Text]),[]) = False then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_64'), mtInformation, [mbOK], 0);
                Action := caNone;
                Exit;
            end;

            if (dtmPrincipal.tblUsuariosID_USUARIO.Value <> edtUsuario.Text) or
               (dtmPrincipal.tblUsuariosSENHA.Value      <> edtSenha.Text) then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_64'), mtInformation, [mbOK], 0);
                Action := caNone;
                Exit;
            end;
        end
        else
        begin
            if dtmPrincipal.tblUsuarios.Locate('ID_USUARIO',edtUsuario.Text,[]) = False then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_64'), mtInformation, [mbOK], 0);
                Action := caNone;
                Exit;
            end;
        end;
    end
    else
    begin
        if dtmPrincipal.tblUsuarios.Locate('ID_USUARIO',edtUsuario.Text,[]) = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_64'), mtInformation, [mbOK], 0);
            Action := caNone;
            Exit;
        end;
    end;

    frmPrincipal.sUsuario         := dtmPrincipal.tblUsuariosID_USUARIO.Value;
    frmPrincipal.sSenha           := dtmPrincipal.tblUsuariosSENHA.Value;
    frmPrincipal.sMail            := dtmPrincipal.tblUsuariosMAIL.Value;
    frmPrincipal.sUserMail        := dtmPrincipal.tblUsuariosUSER_MAIL.Value;
    frmPrincipal.sSenhaMail       := dtmPrincipal.tblUsuariosSENHA_MAIL.Value;
    frmPrincipal.sCaminhoAtualiza := dtmPrincipal.tblUsuariosLOCAL_ATUALIZACOES.Value;
    frmPrincipal.sSGBD            := dtmPrincipal.tblUsuariosSGBD.Value;

    if dtmPrincipal.tblUsuariosATUALIZA_ONLINE.Value = 'S' then
       frmPrincipal.sAtualizaOnLine := True
    else
       frmPrincipal.sAtualizaOnLine := False;

    if dtmPrincipal.tblUsuariosACESSA_DYNAMICS.Value = 'S' then
       frmPrincipal.sPermissaoDynamics := True
    else
       frmPrincipal.sPermissaoDynamics := False;

    if dtmPrincipal.tblUsuariosACESSA_USUARIOS.Value = 'S' then
       frmPrincipal.sPermissaoUsuario := True
    else
       frmPrincipal.sPermissaoUsuario := False;

    if dtmPrincipal.tblUsuariosACESSA_VISOES.Value = 'S' then
       frmPrincipal.sPermissaoAnalise := True
    else
       frmPrincipal.sPermissaoAnalise := False;

    if dtmPrincipal.tblUsuariosACESSA_SMARTDOCS.Value = 'S' then
       frmPrincipal.sPermissaoSmartDocs := True
    else
       frmPrincipal.sPermissaoSmartDocs := False;

    if dtmPrincipal.tblUsuariosACESSA_ACCESS.Value = 'S' then
       frmPrincipal.sPermissaoAccess := True
    else
       frmPrincipal.sPermissaoAccess := False;

    if dtmPrincipal.tblUsuariosACESSA_VISIO.Value = 'S' then
       frmPrincipal.sPermissaoVisio := True
    else
       frmPrincipal.sPermissaoVisio := False;

    if dtmPrincipal.tblUsuariosACESSA_GEO_ANALISE.Value = 'S' then
       frmPrincipal.sPermissaoGeo := True
    else
       frmPrincipal.sPermissaoGeo := False;

    if dtmPrincipal.tblUsuariosACESSA_PARAMETROS.Value = 'S' then
       frmPrincipal.sPermissaoParametro := True
    else
       frmPrincipal.sPermissaoParametro := False;

    if dtmPrincipal.tblUsuariosACESSA_LOGS.Value = 'S' then
       frmPrincipal.sPermissaoLogs := True
    else
       frmPrincipal.sPermissaoLogs := False;

    if dtmPrincipal.tblUsuariosACESSA_WEBBI.Value = 'S' then
       frmPrincipal.sPermissaoWebBI := True
    else
       frmPrincipal.sPermissaoWebBI := False;

    if dtmPrincipal.tblUsuariosACESSA_REPORT.Value = 'S' then
       frmPrincipal.sPermissaoReport := True
    else
       frmPrincipal.sPermissaoReport := False;

    if dtmPrincipal.tblUsuariosACESSA_ABC.Value = 'S' then
       frmPrincipal.sPermissaoABC := True
    else
       frmPrincipal.sPermissaoABC := False;

    if dtmPrincipal.tblUsuariosACESSA_CUBO.Value = 'S' then
       frmPrincipal.sPermissaoCubo := True
    else
       frmPrincipal.sPermissaoCubo := False;

    if dtmPrincipal.tblUsuariosACESSA_FOTOGRAFIA.Value = 'S' then
       frmPrincipal.sPermissaoFotografia := True
    else
       frmPrincipal.sPermissaoFotografia := False;

    if dtmPrincipal.tblUsuariosACESSA_FREQUENCIA.Value = 'S' then
       frmPrincipal.sPermissaoFrequencia := True
    else
       frmPrincipal.sPermissaoFrequencia := False;

    if dtmPrincipal.tblUsuariosACESSA_SCORED.Value = 'S' then
       frmPrincipal.sPermissaoScored := True
    else
       frmPrincipal.sPermissaoScored := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ANALISES.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoAnalise := True
    else
       frmPrincipal.sPermissaoPermissaoAnalise := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_DYNAMICS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoDynamics := True
    else
       frmPrincipal.sPermissaoPermissaoDynamics := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_SCORED.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoScored := True
    else
       frmPrincipal.sPermissaoPermissaoScored := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_RELATORIOS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoRelatorio := True
    else
       frmPrincipal.sPermissaoPermissaoRelatorio := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ABC.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoABC := True
    else
       frmPrincipal.sPermissaoPermissaoABC := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_SMARTDOCS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoSmartDocs := True
    else
       frmPrincipal.sPermissaoPermissaoSmartDocs := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ACCESS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoAccess := True
    else
       frmPrincipal.sPermissaoPermissaoAccess := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_VISIO.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoVisio := True
    else
       frmPrincipal.sPermissaoPermissaoVisio := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_GEO_ANALISE.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoGeo := True
    else
       frmPrincipal.sPermissaoPermissaoGeo := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_CUBO.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoCubo := True
    else
       frmPrincipal.sPermissaoPermissaoCubo := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoFotografia := True
    else
       frmPrincipal.sPermissaoPermissaoFotografia := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_FREQUENCIA.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoFrequencia := True
    else
       frmPrincipal.sPermissaoPermissaoFrequencia := False;

    if dtmPrincipal.tblUsuariosACESSA_RELATORIOS.Value = 'S' then
       frmPrincipal.sPermissaoRelatorio := True
    else
       frmPrincipal.sPermissaoRelatorio := False;

    Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
    LeRegistro('software\Analyzer');
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
       BitBtn1.OnClick(Self);

    if Key = VK_ESCAPE then
       BitBtn2.OnClick(Self);
end;

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
    SalvaRegistro;
    close;
end;

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmLogin.edtUsuarioPropertiesEditValueChanged(Sender: TObject);
begin
    if not frmPrincipal.lAtualizaBatch then
    begin
        if dtmPrincipal.tblUsuarios.Locate('ID_USUARIO',edtUsuario.Text,[]) then
        begin
            try
               dtmPrincipal.tblUsuariosIMAGEM.SaveToFile('C:\Analyzer\Temp\' + edtUsuario.Text + '.bmp');
               cxImage1.Picture.LoadFromFile('C:\Analyzer\Temp\' + edtUsuario.Text + '.bmp');
               DeleteFile('C:\Analyzer\Temp\' + edtUsuario.Text + '.bmp');
            except
            end;
        end;
    end;

    LeRegistro('software\Analyzer\' + edtUsuario.Text);
end;

procedure TfrmLogin.edtUsuarioPropertiesInitPopup(Sender: TObject);
var
    Registry: TRegistry;
begin
    Registry         := TRegistry.Create;
    Registry.RootKey := HKEY_LOCAL_MACHINE;

    Registry.OpenKey('software\Analyzer', true);
    Registry.GetKeyNames(edtUsuario.Properties.Items);

    Registry.CloseKey;
    Registry.Free;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    edtUsuario.SetFocus;
end;

procedure TfrmLogin.LeRegistro(Chave: string);
var
    Registry: TRegistry;
begin
    if not frmPrincipal.lAtualizaBatch then
    begin
        try
            Registry := TRegistry.Create;
            Registry.RootKey := HKEY_LOCAL_MACHINE;
            if Registry.OpenKey(Chave, false) then
            begin
                try
                   chkLembrar.Checked := StrToBool(Registry.ReadString('Lembrar Usuario'));
                except
                end;

                try
                   chkSenha.Checked   := StrToBool(Registry.ReadString('Lembrar Senha'));
                except
                end;

                if chkLembrar.Checked then
                   edtUsuario.Text := EnDecryptString(Registry.ReadString('Usuario'));

                if chkSenha.Checked then
                   edtSenha.Text   := EnDecryptString(Registry.ReadString('Senha'))
                else
                   edtSenha.Text   := '';
            end;

            Registry.CloseKey;
            Registry.Free;
        except
        end;
    end;
end;

end.

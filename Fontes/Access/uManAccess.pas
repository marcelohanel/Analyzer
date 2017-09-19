unit uManAccess;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,
  cxButtons, cxTextEdit,
  cxEdit, cxMemo, cxLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, StdCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmManAccess = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    mnoDescricao: TcxMemo;
    edtNome: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    OpenDialog1: TOpenDialog;
    cxLabel1: TcxLabel;
    edtArquivo: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtMacro: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel3: TcxLabel;
    edtGrupo: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
  end;

var
  frmManAccess: TfrmManAccess;

implementation

uses uFuncoes, uAccess;

{$R *.dfm}

procedure TfrmManAccess.cxButton1Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
       edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmManAccess.cxButton2Click(Sender: TObject);
begin
    edtArquivo.Text := '';
end;

procedure TfrmManAccess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmAccess.bdDados,frmAccess.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManAccess.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManAccess.FormShow(Sender: TObject);
begin
    mnoDescricao.Clear;

    if Tipo = 'Alterar' then
    begin
        edtNome.Enabled   := False;
        edtNome.Text      := frmAccess.tblAccessID_ACCESS.Value;
        edtGrupo.Text      := frmAccess.tblAccessGRUPO.Value;
        mnoDescricao.Text := frmAccess.tblAccessDESCRICAO.Value;
        edtArquivo.Text   := frmAccess.tblAccessARQUIVO.AsString;
        edtMacro.Text     := frmAccess.tblAccessMACRO.AsString;
    end;

    GeraLog(frmAccess.bdDados,frmAccess.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManAccess.SpeedButton3Click(Sender: TObject);
begin
    if edtNome.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_276'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if edtArquivo.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_279'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if not FileExists(edtArquivo.Text) then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_279'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if edtMacro.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_283'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Alterar' then
       frmAccess.tblAccess.Edit;

    if Tipo = 'Criar' then
       frmAccess.tblAccess.Insert;

    frmAccess.tblAccessID_ACCESS.Value := edtNome.Text;
    frmAccess.tblAccessGRUPO.Value     := edtGrupo.Text;
    frmAccess.tblAccessDESCRICAO.Value := mnoDescricao.Text;
    frmAccess.tblAccessARQUIVO.Value   := edtArquivo.Text;
    frmAccess.tblAccessMACRO.Value     := edtMacro.Text;

    if Tipo = 'Criar' then
    begin
        if frmAccess.sUsuario <> 'admin' then
        begin
            frmAccess.tblAccessPODE_VISUALIZAR.Value := frmAccess.sUsuario + ', admin';
            frmAccess.tblAccessPODE_ALTERAR.Value    := frmAccess.sUsuario + ', admin';
            frmAccess.tblAccessPODE_APAGAR.Value     := frmAccess.sUsuario + ', admin';
        end
        else
        begin
            frmAccess.tblAccessPODE_VISUALIZAR.Value := frmAccess.sUsuario;
            frmAccess.tblAccessPODE_ALTERAR.Value    := frmAccess.sUsuario;
            frmAccess.tblAccessPODE_APAGAR.Value     := frmAccess.sUsuario;
        end;
    end;

    frmAccess.tblAccess.Post;

    Close;
end;

end.

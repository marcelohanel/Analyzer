unit uManVisio;

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
  TfrmManVisio = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    mnoDescricao: TcxMemo;
    edtNome: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    OpenDialog1: TOpenDialog;
    cxLabel1: TcxLabel;
    edtArquivo: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel2: TcxLabel;
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
  frmManVisio: TfrmManVisio;

implementation

uses uFuncoes, uVisio;

{$R *.dfm}

procedure TfrmManVisio.cxButton1Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
       edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmManVisio.cxButton2Click(Sender: TObject);
begin
    edtArquivo.Text := '';
end;

procedure TfrmManVisio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmVisio.bdDados,frmVisio.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManVisio.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManVisio.FormShow(Sender: TObject);
begin
    mnoDescricao.Clear;

    if Tipo = 'Alterar' then
    begin
        edtNome.Enabled   := False;
        edtNome.Text      := frmVisio.tblVisioID_VISIO.Value;
        edtGrupo.Text     := frmVisio.tblVisioGRUPO.Value;
        mnoDescricao.Text := frmVisio.tblVisioDESCRICAO.Value;
        edtArquivo.Text   := frmVisio.tblVisioARQUIVO.AsString;
    end;

    GeraLog(frmVisio.bdDados,frmVisio.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManVisio.SpeedButton3Click(Sender: TObject);
begin
    if edtNome.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_303'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if edtArquivo.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_304'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if not FileExists(edtArquivo.Text) then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_304'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Alterar' then
       frmVisio.tblVisio.Edit;

    if Tipo = 'Criar' then
       frmVisio.tblVisio.Insert;

    frmVisio.tblVisioID_VISIO.Value  := edtNome.Text;
    frmVisio.tblVisioGRUPO.Value     := edtGrupo.Text;
    frmVisio.tblVisioDESCRICAO.Value := mnoDescricao.Text;
    frmVisio.tblVisioARQUIVO.Value   := edtArquivo.Text;

    if Tipo = 'Criar' then
    begin
        if frmVisio.sUsuario <> 'admin' then
        begin
            frmVisio.tblVisioPODE_VISUALIZAR.Value := frmVisio.sUsuario + ', admin';
            frmVisio.tblVisioPODE_ALTERAR.Value    := frmVisio.sUsuario + ', admin';
            frmVisio.tblVisioPODE_APAGAR.Value     := frmVisio.sUsuario + ', admin';
        end
        else
        begin
            frmVisio.tblVisioPODE_VISUALIZAR.Value := frmVisio.sUsuario;
            frmVisio.tblVisioPODE_ALTERAR.Value    := frmVisio.sUsuario;
            frmVisio.tblVisioPODE_APAGAR.Value     := frmVisio.sUsuario;
        end;
    end;

    frmVisio.tblVisio.Post;

    Close;
end;

end.

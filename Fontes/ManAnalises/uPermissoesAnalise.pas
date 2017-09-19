unit uPermissoesAnalise;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxTextEdit, cxMemo, cxLabel, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls;

type
  TfrmPermissoesAnalise = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Memo1: TcxMemo;
    Memo3: TcxMemo;
    Memo4: TcxMemo;
    Memo5: TcxMemo;
    Label1: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Label6: TcxLabel;
    Label7: TcxLabel;
    Label8: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermissoesAnalise: TfrmPermissoesAnalise;

implementation

uses uFuncoes, uAnalises;

{$R *.dfm}

procedure TfrmPermissoesAnalise.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmPermissoesAnalise.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPermissoesAnalise.FormShow(Sender: TObject);
begin
    Memo1.Lines.Clear;
    Memo3.Lines.Clear;
    Memo4.Lines.Clear;
    Memo5.Lines.Clear;

    Memo1.Lines.Text := frmAnalises.tblAnalisesPODE_VISUALIZAR.Value;
    Memo3.Lines.Text := frmAnalises.tblAnalisesPODE_ALTERAR.Value;
    Memo4.Lines.Text := frmAnalises.tblAnalisesPODE_APAGAR.Value;
    Memo5.Lines.Text := frmAnalises.tblAnalisesPODE_ATUALIZAR.Value;

    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmPermissoesAnalise.SpeedButton3Click(Sender: TObject);
begin
    if (Memo1.Text = '') or (Memo3.Text = '') or
       (Memo4.Text = '') or (Memo5.Text = '') then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_88'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAnalises.tblAnalises.Edit;
    frmAnalises.tblAnalisesPODE_VISUALIZAR.Value := Memo1.Lines.Text;
    frmAnalises.tblAnalisesPODE_ALTERAR.Value    := Memo3.Lines.Text;
    frmAnalises.tblAnalisesPODE_APAGAR.Value     := Memo4.Lines.Text;
    frmAnalises.tblAnalisesPODE_ATUALIZAR.Value  := Memo5.Lines.Text;
    frmAnalises.tblAnalises.Post;
    Close;
end;

end.

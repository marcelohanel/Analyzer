unit uSubstituir;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxTextEdit, cxLabel, cxContainer,
  cxDropDownEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
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
  TfrmSubstituir = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cbxItem: TcxComboBox;
    cxLabel1: TcxLabel;
    edtDe: TcxTextEdit;
    edtPara: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    lConf : boolean;
  end;

var
  frmSubstituir: TfrmSubstituir;

implementation

uses uFuncoes, uScoredCard;

{$R *.dfm}

procedure TfrmSubstituir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmSubstituir.FormShow(Sender: TObject);
begin
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    lConf := False;
    cbxItem.SetFocus;
end;

procedure TfrmSubstituir.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSubstituir.SpeedButton3Click(Sender: TObject);
begin
    if edtDe.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_198'), mtInformation, [mbOK], 0);
        exit;
    end;

    if edtPara.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_222'), mtInformation, [mbOK], 0);
        exit;
    end;

    lConf := True;
    close;
end;

end.

unit uManRelatorios;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,
  cxButtons, cxTextEdit,
  cxMemo, cxLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, StdCtrls;

type
  TfrmManRelatorios = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    Memo2: TcxMemo;
    Edit1: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    cxLabel1: TcxLabel;
    edtGrupo: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManRelatorios: TfrmManRelatorios;

implementation

uses uRelatorios, uFuncoes;

{$R *.dfm}

procedure TfrmManRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmRelatorios.bdDados,frmRelatorios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManRelatorios.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManRelatorios.FormShow(Sender: TObject);
begin
    Edit1.Enabled  := False;
    Edit1.Text     := frmRelatorios.tblRelatoriosID_RELATORIO.Value;
    edtGrupo.Text  := frmRelatorios.tblRelatoriosGRUPO.Value;
    Memo2.Text     := frmRelatorios.tblRelatoriosDESCRICAO.Value;

    GeraLog(frmRelatorios.bdDados,frmRelatorios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManRelatorios.SpeedButton2Click(Sender: TObject);
begin
    frmRelatorios.ChamaReport(frmRelatorios.tblRelatoriosID_RELATORIO.AsString, 'Designer');
end;

procedure TfrmManRelatorios.SpeedButton3Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_68'), mtWarning, [mbOK], 0);
        Exit;
    end;

    frmRelatorios.tblRelatorios.Close;
    frmRelatorios.tblRelatorios.Open;

    frmRelatorios.tblRelatorios.Locate('ID_RELATORIO',Edit1.Text,[]);

    frmRelatorios.tblRelatorios.Edit;

    frmRelatorios.tblRelatoriosID_RELATORIO.Value := Edit1.Text;
    frmRelatorios.tblRelatoriosGRUPO.Value        := edtGrupo.Text;
    frmRelatorios.tblRelatoriosDESCRICAO.Value    := Memo2.Text;

    frmRelatorios.tblRelatorios.Post;

    Close;
end;

end.

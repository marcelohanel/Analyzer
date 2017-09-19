unit uAtualiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  cxProgressBar, cxLabel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmAtualiza = class(TForm)
    Panel1: TPanel;
    lblTarefa: TcxLabel;
    lblMensagem: TcxLabel;
    Label1: TcxLabel;
    pbGeral: TcxProgressBar;
    pbTarefa: TcxProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualiza: TfrmAtualiza;

implementation



{$R *.dfm}

procedure TfrmAtualiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action         := caFree;
end;

procedure TfrmAtualiza.Timer1Timer(Sender: TObject);
begin
    close;
end;

procedure TfrmAtualiza.FormDestroy(Sender: TObject);
begin
    Screen.Cursor := crDefault;
end;

procedure TfrmAtualiza.FormCreate(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
end;

end.

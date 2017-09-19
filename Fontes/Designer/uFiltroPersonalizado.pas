unit uFiltroPersonalizado;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxFilterControl, cxDBFilterControl,
  cxDropDownEdit, cxEdit, cxLabel, ExtCtrls, DB, ADODB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxContainer,
  cxTextEdit, cxMaskEdit, StdCtrls;

type
  TfrmFiltroPersonalizado = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxDBFilterControl1: TcxDBFilterControl;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalvaFiltro;
  private
    { Private declarations }
  public
    { Public declarations }
    sCubo : string;
  end;

var
  frmFiltroPersonalizado: TfrmFiltroPersonalizado;

implementation

uses uDesigner, uFuncoes;

{$R *.dfm}

procedure TfrmFiltroPersonalizado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmFiltroPersonalizado.FormShow(Sender: TObject);
begin
    frmDesigner.lCancelaFiltroPersonalizado := False;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmFiltroPersonalizado.SpeedButton1Click(Sender: TObject);
begin
    frmDesigner.lCancelaFiltroPersonalizado := True;

    close;
end;

procedure TfrmFiltroPersonalizado.SalvaFiltro;
begin
    frmDesigner.sStream.Free;
    frmDesigner.sStream := TMemoryStream.Create;
    cxDBFilterControl1.SaveToStream(frmDesigner.sStream);
    frmDesigner.cFiltroPersonalizado := cxDBFilterControl1.FilterText;
    frmDesigner.lCancFiltroPersonalizado := False;
end;

procedure TfrmFiltroPersonalizado.SpeedButton3Click(Sender: TObject);
begin
    SalvaFiltro;
    close;
end;

end.

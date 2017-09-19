unit uDefinirGrupo;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,





  cxTextEdit, cxDropDownEdit,
  cxLabel, cxButtons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmDefinirGrupo = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxLabel2: TcxLabel;
    edtValor: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefinirGrupo: TfrmDefinirGrupo;

implementation

uses uFuncoes, uGeoAnalises;

{$R *.dfm}

procedure TfrmDefinirGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmGeoAnalises.bdDados,frmGeoAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmDefinirGrupo.FormShow(Sender: TObject);
begin
    GeraLog(frmGeoAnalises.bdDados,frmGeoAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    edtValor.Text := frmGeoAnalises.tblGeoAnalisesGRUPO.AsString;
    edtValor.SetFocus;
end;

procedure TfrmDefinirGrupo.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmDefinirGrupo.SpeedButton3Click(Sender: TObject);
var
    Query : TADOQuery;
begin
    try
        Query                := TADOQuery.Create(Application);
        Query.Connection     := frmGeoAnalises.bdDados;
        Query.CursorLocation := clUseServer;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('UPDATE GEO_ANALISES');
        Query.SQL.Add('SET GRUPO = ' + #39 + edtValor.Text + #39);
        Query.SQL.Add('WHERE ID_GEO = ' + #39 + frmGeoAnalises.tblGeoAnalisesID_GEO.AsString + #39);
        Query.ExecSQL;

        Query.Close;
        Query.Free;
    except
    end;

    close;
end;

end.

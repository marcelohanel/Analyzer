unit uABC;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxLabel,
  cxTrackBar, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls;

type
  TfrmABC = class(TForm)
    cxTrackA: TcxTrackBar;
    cxLabel2: TcxLabel;
    cxTrackB: TcxTrackBar;
    cxLabel3: TcxLabel;
    cxTrackC: TcxTrackBar;
    cxLabel4: TcxLabel;
    cxTrackD: TcxTrackBar;
    cxLabel5: TcxLabel;
    cxTrackE: TcxTrackBar;
    cxLabel1: TcxLabel;
    cxLabelA: TcxLabel;
    cxLabelB: TcxLabel;
    cxLabelC: TcxLabel;
    cxLabelD: TcxLabel;
    cxLabelE: TcxLabel;
    SpeedButton3: TcxButton;
    cxButton1: TcxButton;
    cxSoma: TcxLabel;
    cxLabel7: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxTrackAPropertiesChange(Sender: TObject);
    procedure cxTrackBPropertiesChange(Sender: TObject);
    procedure cxTrackCPropertiesChange(Sender: TObject);
    procedure cxTrackDPropertiesChange(Sender: TObject);
    procedure cxTrackEPropertiesChange(Sender: TObject);
    procedure Soma;
  private
    { Private declarations }
  public
    { Public declarations }
    lConfirma : boolean;
  end;

var
  frmABC: TfrmABC;

implementation

uses uDesigner, uFuncoes;

{$R *.dfm}

procedure TfrmABC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmABC.FormShow(Sender: TObject);
begin
    cxTrackA.Position := frmDesigner.vA;
    cxTrackB.Position := frmDesigner.vB;
    cxTrackC.Position := frmDesigner.vC;
    cxTrackD.Position := frmDesigner.vD;
    cxTrackE.Position := frmDesigner.vE;

    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmABC.cxButton1Click(Sender: TObject);
begin
    lConfirma := False;
    close;
end;

procedure TfrmABC.SpeedButton3Click(Sender: TObject);
var
    iSoma : integer;
    sAux : string;
    sAux1 : string;
begin
    if cxTrackE.Position >= cxTrackD.Position then
    begin
        sAux := HCLResourceStrings.FindID('sString_50');
        sAux1 := HCLResourceStrings.FindID('sString_22');

        MessageBox(0, pchar(sAux + 'D'), pchar(sAux1), MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    if cxTrackD.Position >= cxTrackC.Position then
    begin
        sAux := HCLResourceStrings.FindID('sString_50');
        sAux1 := HCLResourceStrings.FindID('sString_22');

        MessageBox(0, pchar(sAux + 'C'), pchar(sAux1), MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    if cxTrackC.Position >= cxTrackB.Position then
    begin
        sAux := HCLResourceStrings.FindID('sString_50');
        sAux1 := HCLResourceStrings.FindID('sString_22');

        MessageBox(0, pchar(sAux + 'B'), pchar(sAux1), MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    if cxTrackB.Position >= cxTrackA.Position then
    begin
        sAux := HCLResourceStrings.FindID('sString_50');
        sAux1 := HCLResourceStrings.FindID('sString_22');

        MessageBox(0, pchar(sAux + 'A'), pchar(sAux1), MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    iSoma := cxTrackA.Position +
             cxTrackB.Position +
             cxTrackC.Position +
             cxTrackD.Position +
             cxTrackE.Position;

    if iSoma <> 100 then
    begin
        MessageDlg(pchar(HCLResourceStrings.FindID('sString_359')), mtWarning, [mbOK], 0);
        Exit;
    end;

    frmDesigner.vA := cxTrackA.Position;
    frmDesigner.vB := cxTrackB.Position;
    frmDesigner.vC := cxTrackC.Position;
    frmDesigner.vD := cxTrackD.Position;
    frmDesigner.vE := cxTrackE.Position;

    lConfirma := True;
    close;
end;

procedure TfrmABC.cxTrackAPropertiesChange(Sender: TObject);
begin
    cxLabelA.Caption := IntToStr(cxTrackA.Position);
    Soma;
end;

procedure TfrmABC.cxTrackBPropertiesChange(Sender: TObject);
begin
    cxLabelB.Caption := IntToStr(cxTrackB.Position);
    Soma;
end;

procedure TfrmABC.cxTrackCPropertiesChange(Sender: TObject);
begin
    cxLabelC.Caption := IntToStr(cxTrackC.Position);
    Soma;
end;

procedure TfrmABC.cxTrackDPropertiesChange(Sender: TObject);
begin
    cxLabelD.Caption := IntToStr(cxTrackD.Position);
    Soma;
end;

procedure TfrmABC.cxTrackEPropertiesChange(Sender: TObject);
begin
    cxLabelE.Caption := IntToStr(cxTrackE.Position);
    Soma;
end;

procedure TfrmABC.Soma;
var
   iSoma : integer;
begin
    iSoma := cxTrackA.Position +
             cxTrackB.Position +
             cxTrackC.Position +
             cxTrackD.Position +
             cxTrackE.Position;

    cxSoma.Caption := IntToStr(iSoma);
end;

end.

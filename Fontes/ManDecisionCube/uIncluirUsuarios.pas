unit uIncluirUsuarios;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,







  cxCheckListBox, DB, ADODB, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxContainer, cxEdit, StdCtrls;

type
  TfrmIncluirUsuarios = class(TForm)
    cxButton1: TcxButton;
    ADOQuery1: TADOQuery;
    ADOQuery1ID_USUARIO: TWideStringField;
    chkUsuarios: TcxCheckListBox;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirUsuarios: TfrmIncluirUsuarios;

implementation

uses uFuncoes, uDecisionCube, uSQLCompletoUsuario;

{$R *.dfm}

procedure TfrmIncluirUsuarios.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmIncluirUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ADOQuery1.Close;

    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmIncluirUsuarios.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    frmSQLCompletoUsuario.ADOQuery1.DisableControls;

    chkUsuarios.Clear;
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        lPode := True;

        frmSQLCompletoUsuario.ADOQuery1.First;
        while not frmSQLCompletoUsuario.ADOQuery1.Eof do
        begin
            if frmSQLCompletoUsuario.ADOQuery1ID_USUARIO.Text = ADOQuery1.Fields[0].AsString then
            begin
                lPode := False;
                frmSQLCompletoUsuario.ADOQuery1.Last;
            end
            else
               frmSQLCompletoUsuario.ADOQuery1.Next;
        end;

        if lPode then
           chkUsuarios.AddItem(ADOQuery1.Fields[0].AsString);

        ADOQuery1.Next;
    end;

    frmSQLCompletoUsuario.ADOQuery1.EnableControls;
end;

end.

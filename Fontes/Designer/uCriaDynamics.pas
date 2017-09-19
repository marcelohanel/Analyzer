unit uCriaDynamics;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxTextEdit,
  cxLabel, ADODB, DB, cxButtons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmCriaDynamics = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label2: TcxLabel;
    Edit1: TcxTextEdit;
    Label5: TcxLabel;
    Memo2: TcxMemo;
    tblDynamics: TADOTable;
    tblDynamicsID_DYNAMICS: TWideStringField;
    tblDynamicsID_ANALISE: TWideStringField;
    tblDynamicsDESCRICAO: TMemoField;
    tblDynamicsPODE_VISUALIZAR: TMemoField;
    tblDynamicsPODE_ALTERAR: TMemoField;
    tblDynamicsPODE_APAGAR: TMemoField;
    tblDynamicsSQL: TMemoField;
    tblDynamicsPEDE_FILTRO: TWideStringField;
    tblDynamicsDT_CRIACAO: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQL : string;
  end;

var
  frmCriaDynamics: TfrmCriaDynamics;

implementation

uses uDesigner, uAguarde, uFuncoes;

{$R *.dfm}

procedure TfrmCriaDynamics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmCriaDynamics.SpeedButton3Click(Sender: TObject);
var
    analise   : string;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_132'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_231');
    frmAguarde.Show;
    frmAguarde.Update;

    analise := frmDesigner.tblAnalisesID_ANALISE.AsString;

    try
        tblDynamics.Open;
        tblDynamics.Insert;
        tblDynamicsID_DYNAMICS.Value     := Edit1.Text;
        tblDynamicsID_ANALISE.Value      := analise;
        tblDynamicsDESCRICAO.Value       := Memo2.Text;
        tblDynamicsSQL.Value             := SQL;

        if frmDesigner.sUsuario <> 'admin' then
        begin
            tblDynamicsPODE_VISUALIZAR.Value := frmDesigner.sUsuario + ', admin';
            tblDynamicsPODE_ALTERAR.Value    := frmDesigner.sUsuario + ', admin';
            tblDynamicsPODE_APAGAR.Value     := frmDesigner.sUsuario + ', admin';
        end
        else
        begin
            tblDynamicsPODE_VISUALIZAR.Value := frmDesigner.sUsuario;
            tblDynamicsPODE_ALTERAR.Value    := frmDesigner.sUsuario;
            tblDynamicsPODE_APAGAR.Value     := frmDesigner.sUsuario;
        end;

        tblDynamics.Post;
        tblDynamics.Close;

    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_133') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
      end;
    end;

    FreeAndNil(frmAguarde);
    close;
end;

procedure TfrmCriaDynamics.FormShow(Sender: TObject);
begin
    GeraLog(frmDesigner.bdDados,frmDesigner.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmCriaDynamics.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

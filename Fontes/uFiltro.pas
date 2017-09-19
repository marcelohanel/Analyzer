unit uFiltro;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, DB, ADODB,
  cxFilterControl, cxDBFilterControl,








  cxDropDownEdit, cxLabel, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, StdCtrls;

type
  TfrmFiltro = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxDBFilterControl1: TcxDBFilterControl;
    qryFiltro: TADOQuery;
    Panel1: TPanel;
    Label2: TcxLabel;
    ComboBox1: TcxComboBox;
    SpeedButton9: TcxButton;
    ADOQuery1: TADOQuery;
    SpeedButton10: TcxButton;
    tblCenariosDynamics: TADOTable;
    tblCenariosDynamicsID_CENARIO_DYNAMICS: TWideStringField;
    tblCenariosDynamicsID_DYNAMICS: TWideStringField;
    tblCenariosDynamicsID_USUARIO: TWideStringField;
    tblCenariosDynamicsVALOR: TBlobField;
    tblCenariosDynamicsFILTRO: TWideMemoField;
    tblCenariosDynamicsFILTRO_COMPONENTE: TBlobField;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1PropertiesInitPopup(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure tblCenariosDynamicsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    lCancela : boolean;
    sDynamics : string;
  end;

var
  frmFiltro: TfrmFiltro;

implementation

uses uModule, uFuncoes, uPrincipal;

{$R *.dfm}

procedure TfrmFiltro.ComboBox1PropertiesChange(Sender: TObject);
var
    S : TMemoryStream;
begin
    tblCenariosDynamics.Open;

    if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,sDynamics,frmPrincipal.sUsuario]),[]) then
    begin
        S := TMemoryStream.Create;
        try
          tblCenariosDynamicsFILTRO_COMPONENTE.SaveToStream(S);
          S.Position := 0;
          cxDBFilterControl1.LoadFromStream(S);
        except
        end;
        S.Free;
    end;

    tblCenariosDynamics.Close;
end;

procedure TfrmFiltro.ComboBox1PropertiesInitPopup(Sender: TObject);
var
    aux : string;
begin
    aux := ComboBox1.Text;

    ComboBox1.Properties.Items.Clear;
    ComboBox1.Clear;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT ID_CENARIO_DYNAMICS, ID_DYNAMICS, ID_USUARIO FROM CENARIOS_DYNAMICS');
    ADOQuery1.SQL.Add('WHERE ID_USUARIO  = ' + #39 + frmPrincipal.sUsuario + #39);
    ADOQuery1.SQL.Add('  AND ID_DYNAMICS = ' + #39 + sDynamics + #39);
    ADOQuery1.SQL.Add('ORDER BY ID_CENARIO_DYNAMICS');
    ADOQuery1.Open;

    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        ComboBox1.Properties.Items.Add(ADOQuery1.Fields[0].AsString);

        ADOQuery1.Next;
    end;

    ADOQuery1.Close;
    ComboBox1.Text := aux;
end;

procedure TfrmFiltro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(dtmPrincipal.bdDados,frmPrincipal.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmFiltro.FormShow(Sender: TObject);
begin
    lCancela := False;

    if sDynamics <> '' then
    begin
        ComboBox1.Enabled     := True;
        SpeedButton9.Enabled  := True;
        SpeedButton10.Enabled := True;
    end;

    GeraLog(dtmPrincipal.bdDados,frmPrincipal.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmFiltro.SpeedButton10Click(Sender: TObject);
begin
    if ComboBox1.Text = '' then
       exit;

    tblCenariosDynamics.Open;

    if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,sDynamics,frmPrincipal.sUsuario]),[]) then
    begin
       tblCenariosDynamics.Edit;
       tblCenariosDynamicsFILTRO_COMPONENTE.Clear;
       tblCenariosDynamicsFILTRO.Clear;
       tblCenariosDynamics.Post;
    end;

    tblCenariosDynamics.Close;
end;

procedure TfrmFiltro.SpeedButton1Click(Sender: TObject);
begin
    lCancela := True;
    close;
end;

procedure TfrmFiltro.SpeedButton3Click(Sender: TObject);
begin
    lCancela := False;
    close;
end;

procedure TfrmFiltro.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
begin
    if ComboBox1.Text = '' then
       exit;

    tblCenariosDynamics.Open;

    if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,sDynamics,frmPrincipal.sUsuario]),[]) then
       tblCenariosDynamics.Edit
    else
       tblCenariosDynamics.Insert;

    S := TMemoryStream.Create;
    cxDBFilterControl1.SaveToStream(S);
    S.Position := 0;
    tblCenariosDynamicsFILTRO_COMPONENTE.LoadFromStream(S);
    tblCenariosDynamicsFILTRO.Value := cxDBFilterControl1.FilterText;
    S.Free;

    tblCenariosDynamics.Post;
    tblCenariosDynamics.Close;
end;

procedure TfrmFiltro.tblCenariosDynamicsBeforePost(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblCenariosDynamicsID_DYNAMICS.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(dtmPrincipal.bdDados,0,'DYNAMICS','ID_DYNAMICS',aux) then abort;

    lPode := True;
    try
       aux := #39 + tblCenariosDynamicsID_USUARIO.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(dtmPrincipal.bdDados,0,'USUARIOS','ID_USUARIO',aux) then abort;
end;

end.

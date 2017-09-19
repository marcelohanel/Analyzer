unit uFiltrar;

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
  cxTextEdit, cxMaskEdit, StdCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmFiltrar = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxDBFilterControl1: TcxDBFilterControl;
    Panel1: TPanel;
    Label2: TcxLabel;
    ComboBox1: TcxComboBox;
    SpeedButton9: TcxButton;
    SpeedButton10: TcxButton;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1PropertiesInitPopup(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure CarregaCenarios;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltrar: TfrmFiltrar;

implementation

uses uDecisionCube;

{$R *.dfm}

procedure TfrmFiltrar.ComboBox1PropertiesChange(Sender: TObject);
var
    S : TMemoryStream;
begin
    if ComboBox1.Text <> '' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT VALOR FROM CENARIOS_DECISION');
        ADOQuery1.SQL.Add('WHERE ID_USUARIO  = ' + #39 + frmDecisionCube.sUsuario  + #39);
        ADOQuery1.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.sDecicion + #39);
        ADOQuery1.SQL.Add('  AND CENARIO     = ' + #39 + ComboBox1.Text + #39);
        ADOQuery1.Open;
        if not ADOQuery1.IsEmpty then
        begin
            S := TMemoryStream.Create;
            TBlobField(ADOQuery1.FieldByName('VALOR')).SaveToStream(S);
            S.Position := 0;
            try
               cxDBFilterControl1.LoadFromStream(S);
            except
            end;
        end;
        ADOQuery1.Close;
    end;
end;

procedure TfrmFiltrar.CarregaCenarios;
var
    aux : string;
begin
    aux := ComboBox1.Text;

    ComboBox1.Properties.Items.Clear;
    ComboBox1.Clear;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT CENARIO FROM CENARIOS_DECISION');
    ADOQuery1.SQL.Add('WHERE ID_USUARIO  = ' + #39 + frmDecisionCube.sUsuario  + #39);
    ADOQuery1.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.sDecicion + #39);
    ADOQuery1.SQL.Add('ORDER BY CENARIO');
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

procedure TfrmFiltrar.ComboBox1PropertiesInitPopup(Sender: TObject);
begin
    CarregaCenarios;
end;

procedure TfrmFiltrar.FormShow(Sender: TObject);
begin
    cxDBFilterControl1.DataSet := frmDecisionCube.ADOQuery1;

    if frmDecisionCube.sDecicion <> '' then
    begin
        ComboBox1.Enabled     := True;
        SpeedButton9.Enabled  := True;
        SpeedButton10.Enabled := True;
    end;
end;

procedure TfrmFiltrar.SpeedButton10Click(Sender: TObject);
begin
    if ComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_38'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if MessageDlg(HCLResourceStrings.FindID('sString_39'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('DELETE FROM CENARIOS_DECISION');
        ADOQuery1.SQL.Add('WHERE ID_DECISION = ' + #39 + frmDecisionCube.sDecicion + #39);
        ADOQuery1.SQL.Add('  AND ID_USUARIO  = ' + #39 + frmDecisionCube.sUsuario + #39);
        ADOQuery1.SQL.Add('  AND CENARIO     = ' + #39 + ComboBox1.Text + #39);
        ADOQuery1.ExecSQL;

        cxDBFilterControl1.Clear;
        ComboBox1.Text := '';
    end;
end;

procedure TfrmFiltrar.SpeedButton9Click(Sender: TObject);
var
    aux : string;
    S   : TMemoryStream;
begin
    S := TMemoryStream.Create;
    cxDBFilterControl1.SaveToStream(S);

    if ComboBox1.Text = '' then
    begin
        aux := InputBox(HCLResourceStrings.FindID('sString_32'),HCLResourceStrings.FindID('sString_34'),'');

        if aux = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_35'), mtInformation, [mbOK], 0);
            Exit;
        end;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT ID_DECISION, ID_USUARIO, CENARIO, VALOR FROM CENARIOS_DECISION');
        ADOQuery1.SQL.Add('WHERE ID_DECISION = ' + #39 + frmDecisionCube.sDecicion + #39);
        ADOQuery1.SQL.Add('  AND ID_USUARIO  = ' + #39 + frmDecisionCube.sUsuario + #39);
        ADOQuery1.SQL.Add('  AND CENARIO     = ' + #39 + aux + #39);
        ADOQuery1.Open;
        if not ADOQuery1.IsEmpty then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_36'), mtInformation, [mbOK], 0);
            Exit;
        end;

        ADOQuery1.Insert;
        ADOQuery1.FieldByName('CENARIO').Value := aux;
    end
    else
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT ID_DECISION, ID_USUARIO, CENARIO, VALOR FROM CENARIOS_DECISION');
        ADOQuery1.SQL.Add('WHERE ID_DECISION = ' + #39 + frmDecisionCube.sDecicion + #39);
        ADOQuery1.SQL.Add('  AND ID_USUARIO  = ' + #39 + frmDecisionCube.sUsuario + #39);
        ADOQuery1.SQL.Add('  AND CENARIO     = ' + #39 + ComboBox1.Text + #39);
        ADOQuery1.Open;
        if not ADOQuery1.IsEmpty then
           ADOQuery1.Edit
        else
           ADOQuery1.Insert;

        ADOQuery1.FieldByName('CENARIO').Value := ComboBox1.Text;
    end;

    ADOQuery1.FieldByName('ID_DECISION').Value := frmDecisionCube.sDecicion;
    ADOQuery1.FieldByName('ID_USUARIO').Value  := frmDecisionCube.sUsuario;

    //S.Position := 0;

    TBlobField(ADOQuery1.FieldByName('VALOR')).LoadFromStream(S);
    ADOQuery1.Post;

    S.Free;

    ComboBox1.Properties.Items.Add(ADOQuery1.FieldByName('CENARIO').AsString);
    ComboBox1.Text := ADOQuery1.FieldByName('CENARIO').AsString;
end;

end.

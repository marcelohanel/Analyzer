unit uAnotacoes;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxEdit, cxMemo, cxLabel,
  cxDropDownEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, cxTextEdit, StdCtrls;

type
  TfrmAnotacoes = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxMemo1: TcxMemo;
    cxComboBox2: TcxComboBox;
    cxLabel2: TcxLabel;
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipo : string;
    lConf : boolean;
  end;

var
  frmAnotacoes: TfrmAnotacoes;

implementation

uses uMostraScored, uFuncoes;

{$R *.dfm}

procedure TfrmAnotacoes.cxComboBox2PropertiesChange(Sender: TObject);
var
    aux  : string;
    aux1 : string;
  auxIni: string;
  auxFim: string;
begin
    aux := '01/' + cxComboBox2.Text;

    if (Copy(aux,4,2) = '01') or
       (Copy(aux,4,2) = '03') or
       (Copy(aux,4,2) = '05') or
       (Copy(aux,4,2) = '07') or
       (Copy(aux,4,2) = '08') or
       (Copy(aux,4,2) = '10') or
       (Copy(aux,4,2) = '12') then
        aux1 := '31/' + Copy(aux,4,7);

    if (Copy(aux,4,2) = '02') then
        aux1 := '28/' + Copy(aux,4,7);

    if (Copy(aux,4,2) = '04') or
       (Copy(aux,4,2) = '06') or
       (Copy(aux,4,2) = '09') or
       (Copy(aux,4,2) = '11') then
        aux1 := '30/' + Copy(aux,4,7);


    frmMostraScored.ADOQuery1.Close;
    frmMostraScored.ADOQuery1.SQL.Clear;

    if (frmMostraScored.sSGBD = 'Microsoft Access 2007') or
       (frmMostraScored.sSGBD = 'Microsoft Access 2010') then
    begin
        frmMostraScored.ADOQuery1.SQL.Add('SELECT TOP 1 [_Data_], [_Anotacao_] FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        frmMostraScored.ADOQuery1.SQL.Add('WHERE [_Data_]  >= CVDATE(' + #39 + aux  + #39 + ')');
        frmMostraScored.ADOQuery1.SQL.Add('AND   [_Data_]  <= CVDATE(' + #39 + aux1 + #39 + ')');
        frmMostraScored.ADOQuery1.SQL.Add('AND   [_Titulo_] = ' + #39 + frmMostraScored.cxTreeList1.AbsoluteItems[frmMostraScored.iIndex].Values[0] + #39);
        frmMostraScored.ADOQuery1.SQL.Add('ORDER BY [_Data_]');
    end;

    if (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        frmMostraScored.ADOQuery1.SQL.Add('SELECT TOP 1 [_Data_], [_Anotacao_] FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        frmMostraScored.ADOQuery1.SQL.Add('WHERE [_Data_]  >= CONVERT(DATETIME,' + #39 + aux  + #39 + ',103)');
        frmMostraScored.ADOQuery1.SQL.Add('AND   [_Data_]  <= CONVERT(DATETIME,' + #39 + aux1 + #39 + ',103)');
        frmMostraScored.ADOQuery1.SQL.Add('AND   [_Titulo_] = ' + #39 + frmMostraScored.cxTreeList1.AbsoluteItems[frmMostraScored.iIndex].Values[0] + #39);
        frmMostraScored.ADOQuery1.SQL.Add('ORDER BY [_Data_]');
    end;

    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
    begin
        auxIni := #39 + NumEntry(3, aux, '/')  + '-' + NumEntry(2, aux, '/')  + '-' + NumEntry(1, aux, '/')  + #39;
        auxFim := #39 + NumEntry(3, aux1, '/') + '-' + NumEntry(2, aux1, '/') + '-' + NumEntry(1, aux1, '/') + #39;

        frmMostraScored.ADOQuery1.SQL.Add('SELECT _Data_, _Anotacao_ FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
        frmMostraScored.ADOQuery1.SQL.Add('WHERE _Data_ >= CAST(' + auxIni + ' AS DATE)');
        frmMostraScored.ADOQuery1.SQL.Add('AND   _Data_ <= CAST(' + auxFim + ' AS DATE)');
        frmMostraScored.ADOQuery1.SQL.Add('AND   _Titulo_ = ' + #39 + frmMostraScored.cxTreeList1.AbsoluteItems[frmMostraScored.iIndex].Values[0] + #39);
        frmMostraScored.ADOQuery1.SQL.Add('ORDER BY _Data_');
        frmMostraScored.ADOQuery1.SQL.Add('LIMIT 0,1');
    end;

    frmMostraScored.ADOQuery1.Open;
    frmMostraScored.ADOQuery1.First;

    cxMemo1.Enabled := True;
    cxMemo1.Clear;
    if frmMostraScored.ADOQuery1.IsEmpty = False then
       cxMemo1.Lines.Text := frmMostraScored.ADOQuery1.Fields[1].AsString
    else
       cxMemo1.Enabled := False;

    frmMostraScored.ADOQuery1.Close;
end;

procedure TfrmAnotacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmAnotacoes.FormShow(Sender: TObject);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmAnotacoes.SpeedButton3Click(Sender: TObject);
begin
    lConf := True;
    close;
end;

procedure TfrmAnotacoes.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

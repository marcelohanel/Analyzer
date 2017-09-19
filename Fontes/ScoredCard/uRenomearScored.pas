unit uRenomearScored;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxButtons, ValEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  Grids, StdCtrls;

type
  TfrmRenomearScored = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    ValueListEditor1: TValueListEditor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRenomearScored: TfrmRenomearScored;

implementation

uses uMostraScored, cxTL, uFuncoes;

{$R *.dfm}

procedure TfrmRenomearScored.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmRenomearScored.FormShow(Sender: TObject);
var
    i : integer;
    sAux : string;
begin
    for i := 0 to 13 do
    begin
        sAux := LePadraoString(frmMostraScored.bdDados,
                          'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                          frmMostraScored.sUsuario,
                          'frmRenomearScored',
                          'campo' + frmMostraScored.cxTreeList1.Columns[i].Caption.Text);

        ValueListEditor1.InsertRow(frmMostraScored.cxTreeList1.Columns[i].Caption.Text,sAux,True);
    end;

    sAux := LePadraoString(frmMostraScored.bdDados,
                      'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                      frmMostraScored.sUsuario,
                      'frmRenomearScored',
                      'campo' + frmMostraScored.cxTreeList1.Columns[18].Caption.Text);

    ValueListEditor1.InsertRow(frmMostraScored.cxTreeList1.Columns[18].Caption.Text,sAux,True);


    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmRenomearScored.SpeedButton3Click(Sender: TObject);
var
    i : integer;
begin
    frmMostraScored.qryAtualiza.Close;
    frmMostraScored.qryAtualiza.SQL.Clear;
    frmMostraScored.qryAtualiza.SQL.Add('DELETE PADROES');
    frmMostraScored.qryAtualiza.SQL.Add('WHERE ID_SCORED  = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39);
    frmMostraScored.qryAtualiza.SQL.Add('AND   FORMULARIO = ' + #39 + 'frmRenomearScored' + #39);

  if (frmMostraScored.sSGBD = 'Microsoft Access 2007') or
     (frmMostraScored.sSGBD = 'Microsoft Access 2010') then
      frmMostraScored.qryAtualiza.SQL.Add('AND   CHAVE ALike ' + #39 + 'campo%' + #39);

  if (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
     frmMostraScored.qryAtualiza.SQL.Add('AND   CHAVE Like ' + #39 + 'campo%' + #39);

    frmMostraScored.qryAtualiza.ExecSQL;
    frmMostraScored.qryAtualiza.Close;

    for i := 1 to ValueListEditor1.RowCount - 1 do
    begin
        SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                     frmMostraScored.sUsuario,
                                     'frmRenomearScored',
                                     'campo' + ValueListEditor1.Keys[i],
                                     ValueListEditor1.Values[ValueListEditor1.Cells[0,i]]);
    end;

    close;
end;

procedure TfrmRenomearScored.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

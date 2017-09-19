unit uCopiarPadroesCubo;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxTextEdit, cxDropDownEdit, cxEdit,
  cxLabel, cxButtons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmCopiarPadroesCubo = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxLabel1: TcxLabel;
    cbxUsuario: TcxComboBox;
    cxLabel2: TcxLabel;
    edtUsuario: TcxTextEdit;
    cbxCenario: TcxComboBox;
    cxLabel3: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CopiaCenario;
    procedure CopiaPadrao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopiarPadroesCubo: TfrmCopiarPadroesCubo;

implementation

uses uFuncoes, uDecisionCube;

{$R *.dfm}

procedure TfrmCopiarPadroesCubo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmCopiarPadroesCubo.FormShow(Sender: TObject);
var
    Query : TADOQuery;
    Query1 : TADOQuery;
    i : integer;
    lPode : boolean;
begin
    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    cbxUsuario.Clear;
    cbxCenario.Clear;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmDecisionCube.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := frmDecisionCube.bdDados;
    Query1.CursorLocation := clUseServer;

    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT PODE_VISUALIZAR FROM DECISION');
    Query1.SQL.Add('WHERE ID_DECISION = ' + #39 + frmDecisionCube.tblDecisionID_DECISION.AsString + #39);
    Query1.Open;
    Query1.First;

    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT ID_USUARIO FROM USUARIOS');
        Query.Open;
        Query.First;
        while not Query.Eof do
        begin
            lPode := False;
            if EncontraLista(Query1.FieldByName('PODE_VISUALIZAR').Value,'#*'                          ,',') then lPode := False else
            if EncontraLista(Query1.FieldByName('PODE_VISUALIZAR').Value,'#' + Query.Fields[0].AsString,',') then lPode := False else
            if EncontraLista(Query1.FieldByName('PODE_VISUALIZAR').Value,'*'                           ,',') then lPode := True  else
            if EncontraLista(Query1.FieldByName('PODE_VISUALIZAR').Value,Query.Fields[0].AsString      ,',') then lPode := True;

            if lPode then
               if Query.Fields[0].AsString <> edtUsuario.Text then
                  cbxUsuario.Properties.Items.Add(Query.Fields[0].AsString);

            Query.Next;
        end;

        Query.Close;
    except
    end;

    for i := 0 to frmDecisionCube.HierCubeGrid1.PivotStates.Count - 1 do
        cbxCenario.Properties.Items.Add(frmDecisionCube.HierCubeGrid1.GridInfo.PivotStates.Names.Items[i]);

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;
end;

procedure TfrmCopiarPadroesCubo.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCopiarPadroesCubo.CopiaCenario;
var
    Query  : TADOQuery;
    aux : string;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmDecisionCube.bdDados;
    Query.CursorLocation := clUseServer;

    try
        aux := 'CP_' + cbxCenario.Text + cbxUsuario.Text + frmDecisionCube.tblDecisionID_DECISION.AsString;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM TASK');
        Query.SQL.Add('WHERE CHAVE = ' + #39 + aux + #39);
        Query.ExecSQL;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT * FROM TASK');
        Query.SQL.Add('WHERE CHAVE = ' + #39 + '-1-' + #39);
        Query.Open;

        aux := frmDecisionCube.HierCubeGrid1.CurrentPivotStateName;

        frmDecisionCube.HierCubeGrid1.CurrentPivotStateName := cbxCenario.Text;
        frmDecisionCube.HierCubeGrid1.CurrentPivotState.WriteFile(frmDecisionCube.sTempDirUsuario + 'SaveCenario.txt');
        frmDecisionCube.HierCubeGrid1.CurrentPivotStateName := aux;

        Query.Insert;
        Query.FieldByName('CHAVE').Value      := 'CP_' + cbxCenario.Text + cbxUsuario.Text + frmDecisionCube.tblDecisionID_DECISION.AsString;
        Query.FieldByName('ID_USUARIO').Value := cbxUsuario.Text;
        Query.FieldByName('FORMULARIO').Value := Self.Name;
        Query.FieldByName('INSTRUCAO').Value  := 'CopiaCenario' + frmDecisionCube.tblDecisionID_DECISION.AsString;
        Query.FieldByName('VALOR').Value      := cbxCenario.Text;
        TBlobField(Query.FieldByName('CAMPO')).LoadFromFile(frmDecisionCube.sTempDirUsuario + 'SaveCenario.txt');
        Query.Post;

        DeleteFile(frmDecisionCube.sTempDirUsuario + 'SaveCenario.txt');
    except
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmCopiarPadroesCubo.CopiaPadrao;
var
    Query  : TADOQuery;
    Query1 : TADOQuery;
    i : integer;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmDecisionCube.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := frmDecisionCube.bdDados;
    Query1.CursorLocation := clUseServer;

    // DECISION_USUARIO
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM DECISION_USUARIO');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    // CENARIOS_CUBO
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM CENARIOS_DECISION');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    try
       Query.Close;
       Query.SQL.Clear;
       Query.SQL.Add('DELETE FROM CENARIOS_DECISION');
       Query.SQL.Add('WHERE ID_USUARIO  = ' + #39 + cbxUsuario.Text + #39);
       Query.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.tblDecisionID_DECISION.AsString + #39);
       Query.ExecSQL;
    except
    end;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM CENARIOS_DECISION');
    Query.SQL.Add('WHERE ID_USUARIO  = ' + #39 + edtUsuario.Text + #39);
    Query.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.tblDecisionID_DECISION.AsString + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                begin
                    Query1.Fields[i].Value := cbxUsuario.Text;
                end
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    // PADROES
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM PADROES');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    try
       Query.Close;
       Query.SQL.Clear;
       Query.SQL.Add('DELETE FROM PADROES');
       Query.SQL.Add('WHERE ID_USUARIO  = ' + #39 + cbxUsuario.Text + #39);
       Query.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.tblDecisionID_DECISION.AsString + #39);
       Query.ExecSQL;
    except
    end;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM PADROES');
    Query.SQL.Add('WHERE ID_USUARIO  = ' + #39 + edtUsuario.Text + #39);
    Query.SQL.Add('  AND ID_DECISION = ' + #39 + frmDecisionCube.tblDecisionID_DECISION.AsString + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                   Query1.Fields[i].Value := cbxUsuario.Text
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value;
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;
end;

procedure TfrmCopiarPadroesCubo.SpeedButton3Click(Sender: TObject);
begin
    if cbxUsuario.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_272'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cbxCenario.Text <> '' then
       CopiaCenario
    else
       CopiaPadrao;


    close;
end;

end.

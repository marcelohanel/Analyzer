unit uSQLCompletoUsuario;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,








  DB, cxTextEdit, cxDBEdit,
  cxLabel, cxGridLevel,
  cxGridDBTableView, cxGrid, ADODB, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxContainer, cxMemo, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, StdCtrls;

type
  TfrmSQLCompletoUsuario = class(TForm)
    cxButton1: TcxButton;
    grd1: TcxGrid;
    grd1DBTableView1: TcxGridDBTableView;
    grd1Level1: TcxGridLevel;
    Label4: TcxLabel;
    DBMemo2: TcxDBMemo;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1ID_DECISION: TWideStringField;
    ADOQuery1ID_USUARIO: TWideStringField;
    ADOQuery1SQL_COMPLETO: TWideMemoField;
    grd1DBTableView1ID_USUARIO: TcxGridDBColumn;
    SpeedButton2: TcxButton;
    SpeedButton4: TcxButton;
    ADOQuery2: TADOQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideMemoField1: TWideMemoField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQLCompletoUsuario: TfrmSQLCompletoUsuario;

implementation

uses uDecisionCube, uFuncoes, uManDecision, uIncluirUsuarios;

{$R *.dfm}

procedure TfrmSQLCompletoUsuario.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmSQLCompletoUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    try
       ADOQuery1.Post;
    except
    end;

    ADOQuery1.Close;

    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmSQLCompletoUsuario.FormShow(Sender: TObject);
begin
    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    ADOQuery1.Open;
end;

procedure TfrmSQLCompletoUsuario.SpeedButton2Click(Sender: TObject);
var
    i : integer;
begin
    if frmIncluirUsuarios = nil then
    begin
        frmIncluirUsuarios := TfrmIncluirUsuarios.Create(Self);
        frmIncluirUsuarios.ShowModal;

        for i := 0 to frmIncluirUsuarios.chkUsuarios.Items.Count - 1 do
        begin
            if frmIncluirUsuarios.chkUsuarios.Items.Items[i].Checked then
            begin
                try
                  ADOQuery1.Post;
                except
                end;

                try
                  ADOQuery1.Insert;
                  ADOQuery1ID_DECISION.Value  := frmManDecision.edtNome.Text;
                  ADOQuery1ID_USUARIO.Value   := frmIncluirUsuarios.chkUsuarios.Items.Items[i].Text;
                  ADOQuery1SQL_COMPLETO.Value := frmManDecision.edtSQLCompleto.Text;
                  ADOQUery1.Post;
                except
                  ADOQUery1.Cancel;
                end;
            end;
        end;

        FreeAndNil(frmIncluirUsuarios);

        ADOQuery1.Close;
        ADOQuery1.Open;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmIncluirUsuarios);
    end;
end;

procedure TfrmSQLCompletoUsuario.SpeedButton4Click(Sender: TObject);
begin
    if not ADOQuery1.IsEmpty then
    begin
        if MessageDlg(HCLResourceStrings.FindID('sString_115'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
        begin
            try
               ADOQuery2.Close;
               ADOQuery2.SQL.Clear;
               ADOQuery2.SQL.Add('DELETE FROM DECISION_USUARIO');
               ADOQuery2.SQL.Add('WHERE ID_DECISION = ' + #39 + ADOQuery1.FieldByName('ID_DECISION').AsString + #39);
               ADOQuery2.SQL.Add('  AND  ID_USUARIO = ' + #39 + ADOQuery1.FieldByName('ID_USUARIO').AsString + #39);
               ADOQuery2.ExecSQL;
               ADOQuery2.Close;

               ADOQuery1.Close;
               ADOQuery1.Open;
            except
            end;
        end;
    end;
end;

end.


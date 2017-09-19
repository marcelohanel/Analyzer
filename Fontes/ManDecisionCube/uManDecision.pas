unit uManDecision;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, cxButtons, cxTextEdit, cxEdit, cxMemo, cxLabel, cxPC, cxCurrencyEdit,
  cxCheckListBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, StdCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu;

type
  TfrmManDecision = class(TForm)
    SpeedButton3: TcxButton;
    edtNome: TcxTextEdit;
    Label2: TcxLabel;
    pgcPrincipal: TcxPageControl;
    tabDescricao: TcxTabSheet;
    mnoDescricao: TcxMemo;
    SpeedButton1: TcxButton;
    cxTabSheet1: TcxTabSheet;
    cxLabel8: TcxLabel;
    edtSQLCompleto: TcxMemo;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxButton1: TcxButton;
    chkDimensao: TcxCheckListBox;
    chkSumario: TcxCheckListBox;
    cxButton2: TcxButton;
    cxLabel12: TcxLabel;
    edtGrupo: TcxTextEdit;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure MontaCampos;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
  end;

var
  frmManDecision: TfrmManDecision;

implementation

uses uFuncoes, uDecisionCube, uSQLCompletoUsuario;

{$R *.dfm}

procedure TfrmManDecision.cxButton1Click(Sender: TObject);
begin
    try
        frmDecisionCube.bdArmazena.Open;
        frmDecisionCube.bdArmazena.Close;
        MessageDlg(HCLResourceStrings.FindID('sString_367'), mtInformation, [mbOK], 0);
    except
       on E: Exception do
       begin
           MessageDlg(E.Message, mtError, [mbOK], 0);
       end;
    end;
end;

procedure TfrmManDecision.cxButton2Click(Sender: TObject);
begin
    if frmSQLCompletoUsuario = nil then
    begin
        frmSQLCompletoUsuario := TfrmSQLCompletoUsuario.Create(Self);

        frmSQLCompletoUsuario.ADOQuery1.Close;
        frmSQLCompletoUsuario.ADOQuery1.SQL.Add('WHERE ID_DECISION = ' + #39 + edtNome.Text + #39);
        frmSQLCompletoUsuario.ADOQuery1.SQL.Add('ORDER BY ID_USUARIO');

        frmSQLCompletoUsuario.ShowModal;
        FreeAndNil(frmSQLCompletoUsuario);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSQLCompletoUsuario);
    end;
end;

procedure TfrmManDecision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManDecision.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManDecision.FormShow(Sender: TObject);
begin
    pgcPrincipal.ActivePageIndex := 0;

    mnoDescricao.Clear;
    cxButton2.Enabled := False;

    if Tipo = 'Alterar' then
    begin
        edtNome.Enabled     := False;
        edtNome.Text        := frmDecisionCube.tblDecisionID_DECISION.Value;
        edtGrupo.Text       := frmDecisionCube.tblDecisionGRUPO.Value;
        mnoDescricao.Text   := frmDecisionCube.tblDecisionDESCRICAO.Value;
        edtSQLCompleto.Text := frmDecisionCube.tblDecisionSQL_COMPLETO.AsString;

        MontaCampos;

        cxButton2.Enabled := True;
    end;

    GeraLog(frmDecisionCube.bdDados,frmDecisionCube.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManDecision.MontaCampos;
var
    i,a : integer;
begin
    if chkDimensao.Items.Count > 0 then
       exit;

    try
        frmDecisionCube.bdArmazena.Open;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmDecisionCube.sSGBD = 'Microsoft Access 2007') or
           (frmDecisionCube.sSGBD = 'Microsoft Access 2010') or
           (frmDecisionCube.sSGBD = 'Microsoft SQL Server 2000') or
           (frmDecisionCube.sSGBD = 'Microsoft SQL Server 2005') or
           (frmDecisionCube.sSGBD = 'Microsoft SQL Server 2008') or
           (frmDecisionCube.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmDecisionCube.sSGBD = 'Microsoft SQL Server 2012') then
        begin
            ADOQuery1.SQL.Add('SELECT TOP 1 ' + Copy(edtSQLCompleto.Text,7,length(edtSQLCompleto.Text)));
        end
        else
        if frmDecisionCube.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add(edtSQLCompleto.Text + ' LIMIT 1');
        end;

        ADOQuery1.Open;

        chkDimensao.Clear;
        chkSumario.Clear;
        for i := 0 to ADOQuery1.FieldCount - 1 do
        begin
            chkDimensao.AddItem(ADOQuery1.Fields[i].FieldName);
            chkSumario.AddItem(ADOQuery1.Fields[i].FieldName);
        end;
        ADOQuery1.Close;

        if Tipo = 'Alterar' then
        begin
            for i := 1 to 50 do
            begin
                for a := 0 to chkDimensao.Items.Count - 1 do
                begin
                    if chkDimensao.Items.Items[a].Text = frmDecisionCube.tblDecision.FieldByName('CAMPO_DIMENSAO_' + IntToStr(i)).AsString then
                       chkDimensao.Items.Items[a].Checked := True;
                end;
            end;

            for i := 1 to 50 do
            begin
                for a := 0 to chkSumario.Items.Count - 1 do
                begin
                    if chkSumario.Items.Items[a].Text = frmDecisionCube.tblDecision.FieldByName('CAMPO_SUMARIO_' + IntToStr(i)).AsString then
                       chkSumario.Items.Items[a].Checked := True;
                end;
            end;
        end;
    except
    end;

    ADOQuery1.Close;
    frmDecisionCube.bdArmazena.Close;
end;

procedure TfrmManDecision.pgcPrincipalChange(Sender: TObject);
begin
    if Tipo = 'Criar' then
    begin
       if pgcPrincipal.ActivePageIndex = 2 then
           MontaCampos
       else
       if pgcPrincipal.ActivePageIndex = 3 then
           MontaCampos;
    end;
end;

procedure TfrmManDecision.SpeedButton3Click(Sender: TObject);
var
  i,a : Integer;
begin
    if edtNome.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_364'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Alterar' then
       frmDecisionCube.tblDecision.Edit;

    if Tipo = 'Criar' then
       frmDecisionCube.tblDecision.Insert;

    frmDecisionCube.tblDecisionID_DECISION.Value         := edtNome.Text;
    frmDecisionCube.tblDecisionGRUPO.Value               := edtGrupo.Text;
    frmDecisionCube.tblDecisionDESCRICAO.Value           := mnoDescricao.Text;
    frmDecisionCube.tblDecisionSQL_COMPLETO.AsString     := edtSQLCompleto.Text;

    for i := 1 to 50 do
        frmDecisionCube.tblDecision.FieldByName('CAMPO_DIMENSAO_' + IntToStr(i)).Clear;

    for i := 1 to 50 do
        frmDecisionCube.tblDecision.FieldByName('CAMPO_SUMARIO_' + IntToStr(i)).Clear;

    i := 1;
    for a := 0 to chkDimensao.Items.Count - 1 do
    begin
        if chkDimensao.Items.Items[a].Checked then
        begin
            if i < 50 then
            begin
                frmDecisionCube.tblDecision.FieldByName('CAMPO_DIMENSAO_' + IntToStr(i)).Value := chkDimensao.Items.Items[a].Text;
                i := i + 1;
            end;
        end;
    end;

    i := 1;
    for a := 0 to chkSumario.Items.Count - 1 do
    begin
        if chkSumario.Items.Items[a].Checked then
        begin
            if i < 50 then
            begin
                frmDecisionCube.tblDecision.FieldByName('CAMPO_SUMARIO_' + IntToStr(i)).Value := chkSumario.Items.Items[a].Text;
                i := i + 1;
            end;
        end;
    end;

    if Tipo = 'Criar' then
    begin
        if frmDecisionCube.sUsuario <> 'admin' then
        begin
            frmDecisionCube.tblDecisionPODE_VISUALIZAR.Value := frmDecisionCube.sUsuario + ', admin';
            frmDecisionCube.tblDecisionPODE_ALTERAR.Value    := frmDecisionCube.sUsuario + ', admin';
            frmDecisionCube.tblDecisionPODE_APAGAR.Value     := frmDecisionCube.sUsuario + ', admin';
        end
        else
        begin
            frmDecisionCube.tblDecisionPODE_VISUALIZAR.Value := frmDecisionCube.sUsuario;
            frmDecisionCube.tblDecisionPODE_ALTERAR.Value    := frmDecisionCube.sUsuario;
            frmDecisionCube.tblDecisionPODE_APAGAR.Value     := frmDecisionCube.sUsuario;
        end;
    end;

    frmDecisionCube.tblDecision.Post;

    Close;
end;

end.

unit uManScored;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls,
  cxPC,
  cxButtons, cxMemo, cxTextEdit,
  cxDropDownEdit, cxLabel, cxCheckBox,
  cxTL,
  cxCalendar,





  cxRadioGroup, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxStyles, cxTLdxBarBuiltInMenu, cxGroupBox, cxMaskEdit, cxInplaceContainer,
  StdCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  ComCtrls, dxCore, cxDateUtils;

type
  TfrmManScored = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label2: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxButton4: TcxButton;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    ADOQuery1: TADOQuery;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxTabSheet3: TcxTabSheet;
    cxLabel1: TcxLabel;
    edtMovto: TcxDateEdit;
    Edit1: TcxTextEdit;
    Memo2: TcxMemo;
    CheckBox1: TcxCheckBox;
    cxSituacao: TcxCheckBox;
    rgpExcluir: TcxRadioGroup;
    ADOQuery2: TADOQuery;
    cxButton7: TcxButton;
    SpeedButton5: TcxButton;
    cxLabel2: TcxLabel;
    edtGrupo: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxTreeList1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure CriaNodo(Nodo, Pai: TcxTreeListNode; Diferenciador : string; Estrutura: boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Atualiza;
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
    lSalva : Boolean;
    lConf  : boolean;
  end;

var
  frmManScored: TfrmManScored;

implementation

uses uScoredCard, uAguarde, uFuncoes, uSubstituir, uScoredCardMan;

{$R *.dfm}

procedure TfrmManScored.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManScored.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManScored.FormShow(Sender: TObject);
var
    S: TMemoryStream;
begin
     lSalva := False;
     
     cxButton1.Enabled   := False;
     cxButton2.Enabled   := False;
     cxButton3.Enabled   := False;
     cxButton4.Enabled   := False;

    if Tipo = 'Alterar' then
    begin
        Edit1.Enabled       := False;
        CheckBox1.Enabled   := True;

        cxButton1.Enabled   := True;
        cxButton2.Enabled   := True;
        cxButton3.Enabled   := True;
        cxButton4.Enabled   := True;

        Edit1.Text         := frmScoredCard.tblScoredCardID_SCORED.Value;
        edtGrupo.Text      := frmScoredCard.tblScoredCardGRUPO.Value;
        Memo2.Text         := frmScoredCard.tblScoredCardDESCRICAO.Value;
        edtMovto.EditValue := frmScoredCard.tblScoredCardDT_MOVTO.AsString;

        if frmScoredCard.tblScoredCardINCREMENTAL.Value = 'S' then
           CheckBox1.Checked := True
        else
           CheckBox1.Checked := False;

        if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'D' then
           rgpExcluir.ItemIndex := 0
        else
        if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'S' then
           rgpExcluir.ItemIndex := 1
        else
        if frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value = 'M' then
           rgpExcluir.ItemIndex := 2
        else
           rgpExcluir.ItemIndex := 3;

        if frmScoredCard.tblScoredCardATUALIZA_SITUACAO_ANTERIOR.Value = 'S' then
           cxSituacao.Checked := True
        else
           cxSituacao.Checked := False;

        S := TMemoryStream.Create;
        frmScoredCard.tblScoredCardVALOR.SaveToStream(S);
        S.Position := 0;
        cxTreeList1.LoadFromStream(S);
        S.Free;
    end;

    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManScored.SpeedButton3Click(Sender: TObject);
var
    S: TMemoryStream;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_113'), mtWarning, [mbOK], 0);
        Exit;
    end;

    frmAguarde           := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_265');
    frmAguarde.Show;
    frmAguarde.Update;

    if Tipo = 'Criar' then
    begin
        frmScoredCard.tblScoredCard.Insert;
        frmScoredCard.tblScoredCardDT_ATUALIZACAO.Value := Date;
    end;

    if Tipo = 'Alterar' then
       frmScoredCard.tblScoredCard.Edit;

    frmScoredCard.tblScoredCardID_SCORED.Value   := Edit1.Text;
    frmScoredCard.tblScoredCardGRUPO.Value       := edtGrupo.Text;
    frmScoredCard.tblScoredCardDESCRICAO.Value   := Memo2.Lines.Text;
    frmScoredCard.tblScoredCardDT_MOVTO.AsString := edtMovto.EditValue;

    if CheckBox1.Checked then
       frmScoredCard.tblScoredCardINCREMENTAL.Value := 'S'
    else
       frmScoredCard.tblScoredCardINCREMENTAL.Value := 'N';

    if rgpExcluir.ItemIndex = 0 then
       frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value := 'D'
    else
    if rgpExcluir.ItemIndex = 1 then
       frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value := 'S'
    else
    if rgpExcluir.ItemIndex = 2 then
       frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value := 'M'
    else
       frmScoredCard.tblScoredCardEXCLUIR_MOVTO.Value := 'T';

    if cxSituacao.Checked then
       frmScoredCard.tblScoredCardATUALIZA_SITUACAO_ANTERIOR.Value := 'S'
    else
       frmScoredCard.tblScoredCardATUALIZA_SITUACAO_ANTERIOR.Value := 'N';

    S := TMemoryStream.Create;
    cxTreeList1.SaveToStream(S);
    S.Position := 0;
    frmScoredCard.tblScoredCardVALOR.LoadFromStream(S);
    S.Free;

    if Tipo = 'Criar' then
    begin
        if frmScoredCard.sUsuario <> 'admin' then
        begin
            frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value  := frmScoredCard.sUsuario + ', admin';
            frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value := frmScoredCard.sUsuario + ', admin';
            frmScoredCard.tblScoredCardPODE_ALTERAR.Value    := frmScoredCard.sUsuario + ', admin';
            frmScoredCard.tblScoredCardPODE_APAGAR.Value     := frmScoredCard.sUsuario + ', admin';
        end
        else
        begin
            frmScoredCard.tblScoredCardPODE_ATUALIZAR.Value  := frmScoredCard.sUsuario;
            frmScoredCard.tblScoredCardPODE_VISUALIZAR.Value := frmScoredCard.sUsuario;
            frmScoredCard.tblScoredCardPODE_ALTERAR.Value    := frmScoredCard.sUsuario;
            frmScoredCard.tblScoredCardPODE_APAGAR.Value     := frmScoredCard.sUsuario;
        end;
    end;

    frmScoredCard.tblScoredCard.Post;

    frmScoredCard.qryAtualiza.Close;

    FreeAndNil(frmAguarde);

    Close;
end;

procedure TfrmManScored.Atualiza;
var
    Query : TADOQuery;
    lPode : boolean;
    i : integer;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT TITULO FROM SCORED_CARD_FILTRO');
    Query.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            lPode := True;
            for i := 0 to cxTreeList1.AbsoluteCount - 1 do
            begin
                if cxTreeList1.AbsoluteItems[i].Values[0] = Query.Fields[0].AsString then
                   lPode := False;
            end;

            if lPode then
            begin
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Add('DELETE FROM SCORED_CARD_FILTRO');
                ADOQuery1.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                ADOQuery1.SQL.Add('AND TITULO = ' + #39 + Query.Fields[0].AsString + #39);
                ADOQuery1.ExecSQL;
                ADOQuery1.Close;
            end;
        except
        end;

        Query.Next;
    end;

    frmScoredCard.ADOQuery1.Close;
    frmScoredCard.ADOQuery1.SQL.Clear;

    if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
       (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        frmScoredCard.ADOQuery1.SQL.Add('SELECT [_Titulo_]');
        frmScoredCard.ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
        frmScoredCard.ADOQuery1.SQL.Add('GROUP BY [_Titulo_]');
    end;

    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
    begin
        frmScoredCard.ADOQuery1.SQL.Add('SELECT _Titulo_');
        frmScoredCard.ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
        frmScoredCard.ADOQuery1.SQL.Add('GROUP BY `_Titulo_`');
    end;

    frmScoredCard.ADOQuery1.Open;
    frmScoredCard.ADOQuery1.First;
    while not frmScoredCard.ADOQuery1.Eof do
    begin
        try
            lPode := True;
            for i := 0 to cxTreeList1.AbsoluteCount - 1 do
            begin
                if cxTreeList1.AbsoluteItems[i].Values[0] = frmScoredCard.ADOQuery1.Fields[0].AsString then
                   lPode := False;
            end;

            if lPode then
            begin
                frmScoredCard.ADOQuery2.Close;
                frmScoredCard.ADOQuery2.SQL.Clear;

                if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
                   (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
                begin
                    frmScoredCard.ADOQuery2.SQL.Add('DELETE FROM');
                    frmScoredCard.ADOQuery2.SQL.Add('[_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                    frmScoredCard.ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + frmScoredCard.ADOQuery1.Fields[0].AsString + #39);
                end;

                if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                begin
                    frmScoredCard.ADOQuery2.SQL.Add('DELETE FROM');
                    frmScoredCard.ADOQuery2.SQL.Add('FROM `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                    frmScoredCard.ADOQuery2.SQL.Add('WHERE `_Titulo_` = ' + #39 + frmScoredCard.ADOQuery1.Fields[0].AsString + #39);
                end;

                frmScoredCard.ADOQuery2.ExecSQL;
                frmScoredCard.ADOQuery2.Close;
            end;
        except
        end;

        frmScoredCard.ADOQuery1.Next;
    end;

    frmScoredCard.ADOQuery1.Close;
    frmScoredCard.ADOQuery2.Close;

    Query.Close;
    Query.Free;
end;

procedure TfrmManScored.SpeedButton5Click(Sender: TObject);
begin
    if MessageDlg(HCLResourceStrings.FindID('sString_440'), mtConfirmation, [mbYes,mbNo], 0) = mrNo then
       exit;

    Atualiza;

    MessageDlg(HCLResourceStrings.FindID('sString_439'), mtInformation, [mbOK], 0);
end;

procedure TfrmManScored.cxButton1Click(Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    if frmScoredCardMan = nil then
    begin
        lSalva := True;

        frmScoredCardMan := TfrmScoredCardMan.Create(Self);
        frmScoredCardMan.Tipo := 'Criar';
        frmScoredCardMan.ShowModal;

        if lConf then
        begin
            with cxTreeList1.Add do
            begin
                Values[0] := frmScoredCardMan.titulo;
                Values[1] := frmScoredCardMan.analise;
                Values[2] := frmScoredCardMan.campo;
                Values[3] := frmScoredCardMan.minimo;
                Values[4] := frmScoredCardMan.maximo;
                Values[5] := frmScoredCardMan.despesas;
            end;

            if frmScoredCardMan.titulo <> '' then
            begin
                Query.Close;
                Query.SQL.Clear;
                Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
                Query.SQL.Add(' WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                Query.SQL.Add('   AND    TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
                Query.Open;
                Query.First;
                if Query.IsEmpty then
                   Query.Insert
                else
                   Query.Edit;

                Query.FieldByName('ID_ANALISE').Value           := frmScoredCardMan.analise;
                Query.FieldByName('ID_SCORED').Value            := frmScoredCard.tblScoredCardID_SCORED.Value;
                Query.FieldByName('TITULO').Value               := frmScoredCardMan.titulo;
                Query.FieldByName('ANALISE_MINIMO').Value       := frmScoredCardMan.analiseMinimo;
                Query.FieldByName('CAMPO_MINIMO').Value         := frmScoredCardMan.campoMinimo;
                Query.FieldByName('ANALISE_MAXIMO').Value       := frmScoredCardMan.analiseMaximo;
                Query.FieldByName('CAMPO_MAXIMO').Value         := frmScoredCardMan.campoMaximo;
                Query.FieldByName('CAMPO_DT_MOVTO').Value       := frmScoredCardMan.dt_movto;
                Query.FieldByName('PERC_AJUSTE').AsFloat        := frmScoredCardMan.ajuste;
                Query.FieldByName('PERC_AJUSTE_MAXIMO').AsFloat := frmScoredCardMan.ajusteMaximo;
                Query.FieldByName('PODE_VISUALIZAR').AsString   := frmScoredCardMan.podeVisualizar;
                Query.FieldByName('MAIL_AVISO').AsString        := frmScoredCardMan.mailAviso;
                Query.FieldByName('AVISA_RED').AsString         := frmScoredCardMan.redAviso;
                Query.FieldByName('AVISA_YELLOW').AsString      := frmScoredCardMan.yellowAviso;
                Query.FieldByName('AVISA_GREEN').AsString       := frmScoredCardMan.greenAviso;

                if frmScoredCardMan.chkAcumulaAnalise.Checked then
                   Query.FieldByName('ACUMULA_ANALISE').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_ANALISE').Value := 'N';

                if frmScoredCardMan.chkAcumulaMinimo.Checked then
                   Query.FieldByName('ACUMULA_MINIMO').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_MINIMO').Value := 'N';

                if frmScoredCardMan.chkAcumulaMaximo.Checked then
                   Query.FieldByName('ACUMULA_MAXIMO').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_MAXIMO').Value := 'N';

                if frmScoredCardMan.lFiltroMinimo then
                   Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'S'
                else
                   Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'N';

                if frmScoredCardMan.lFiltroMaximo then
                   Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'S'
                else
                   Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'N';

                if (Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value = 'S') and
                   (Query.FieldByName('ANALISE_MINIMO').Value <> '') then
                begin
                    Query.FieldByName('GRAFICO_MINIMO').Value := Query.FieldByName('GRAFICO').Value;
                    Query.FieldByName('TEXTO_MINIMO').Value   := Query.FieldByName('TEXTO').Value;
                end;

                if (Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value = 'S') and
                   (Query.FieldByName('ANALISE_MAXIMO').Value <> '') then
                begin
                    Query.FieldByName('GRAFICO_MAXIMO').Value := Query.FieldByName('GRAFICO').Value;
                    Query.FieldByName('TEXTO_MAXIMO').Value   := Query.FieldByName('TEXTO').Value;
                end;

                Query.Post;
            end;
        end;

        FreeAndNil(frmScoredCardMan);

        if lSalva then
           SpeedButton3.OnClick(Self);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmScoredCardMan);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmManScored.cxButton2Click(Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    if cxTreeList1.FocusedNode <> nil then
    begin
        if frmScoredCardMan = nil then
        begin
            lSalva := True;

            frmScoredCardMan := TfrmScoredCardMan.Create(Self);
            frmScoredCardMan.Tipo := 'Criar';
            frmScoredCardMan.ShowModal;

            if lConf then
            begin
                with cxTreeList1.FocusedNode.AddChild do
                begin
                    Values[0] := frmScoredCardMan.titulo;
                    Values[1] := frmScoredCardMan.analise;
                    Values[2] := frmScoredCardMan.campo;
                    Values[3] := frmScoredCardMan.minimo;
                    Values[4] := frmScoredCardMan.maximo;
                    Values[5] := frmScoredCardMan.despesas;
                end;

                if frmScoredCardMan.titulo <> '' then
                begin
                    Query.Close;
                    Query.SQL.Clear;
                    Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
                    Query.SQL.Add(' WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                    Query.SQL.Add('   AND    TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
                    Query.Open;
                    Query.First;
                    if Query.IsEmpty then
                       Query.Insert
                    else
                       Query.Edit;

                    Query.FieldByName('ID_ANALISE').Value           := frmScoredCardMan.analise;
                    Query.FieldByName('ID_SCORED').Value            := frmScoredCard.tblScoredCardID_SCORED.Value;
                    Query.FieldByName('TITULO').Value               := frmScoredCardMan.titulo;
                    Query.FieldByName('ANALISE_MINIMO').Value       := frmScoredCardMan.analiseMinimo;
                    Query.FieldByName('CAMPO_MINIMO').Value         := frmScoredCardMan.campoMinimo;
                    Query.FieldByName('ANALISE_MAXIMO').Value       := frmScoredCardMan.analiseMaximo;
                    Query.FieldByName('CAMPO_MAXIMO').Value         := frmScoredCardMan.campoMaximo;
                    Query.FieldByName('CAMPO_DT_MOVTO').Value       := frmScoredCardMan.dt_movto;
                    Query.FieldByName('PERC_AJUSTE').AsFloat        := frmScoredCardMan.ajuste;
                    Query.FieldByName('PERC_AJUSTE_MAXIMO').AsFloat := frmScoredCardMan.ajusteMaximo;
                    Query.FieldByName('PODE_VISUALIZAR').AsString   := frmScoredCardMan.podeVisualizar;
                    Query.FieldByName('MAIL_AVISO').AsString        := frmScoredCardMan.mailAviso;
                    Query.FieldByName('AVISA_RED').AsString         := frmScoredCardMan.redAviso;
                    Query.FieldByName('AVISA_YELLOW').AsString      := frmScoredCardMan.yellowAviso;
                    Query.FieldByName('AVISA_GREEN').AsString       := frmScoredCardMan.greenAviso;

                    if frmScoredCardMan.chkAcumulaAnalise.Checked then
                       Query.FieldByName('ACUMULA_ANALISE').Value := 'S'
                    else
                       Query.FieldByName('ACUMULA_ANALISE').Value := 'N';

                    if frmScoredCardMan.chkAcumulaMinimo.Checked then
                       Query.FieldByName('ACUMULA_MINIMO').Value := 'S'
                    else
                       Query.FieldByName('ACUMULA_MINIMO').Value := 'N';

                    if frmScoredCardMan.chkAcumulaMaximo.Checked then
                       Query.FieldByName('ACUMULA_MAXIMO').Value := 'S'
                    else
                       Query.FieldByName('ACUMULA_MAXIMO').Value := 'N';

                    if frmScoredCardMan.lFiltroMinimo then
                       Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'S'
                    else
                       Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'N';

                    if frmScoredCardMan.lFiltroMaximo then
                       Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'S'
                    else
                       Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'N';

                    if (Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value = 'S') and
                       (Query.FieldByName('ANALISE_MINIMO').Value <> '') then
                    begin
                        Query.FieldByName('GRAFICO_MINIMO').Value := Query.FieldByName('GRAFICO').Value;
                        Query.FieldByName('TEXTO_MINIMO').Value   := Query.FieldByName('TEXTO').Value;
                    end;

                    if (Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value = 'S') and
                       (Query.FieldByName('ANALISE_MAXIMO').Value <> '') then
                    begin
                        Query.FieldByName('GRAFICO_MAXIMO').Value := Query.FieldByName('GRAFICO').Value;
                        Query.FieldByName('TEXTO_MAXIMO').Value   := Query.FieldByName('TEXTO').Value;
                    end;

                    Query.Post;
                end;
            end;

            FreeAndNil(frmScoredCardMan);

            if lSalva then
               SpeedButton3.OnClick(Self);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmScoredCardMan);
        end;
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmManScored.cxButton3Click(Sender: TObject);
begin
    if cxTreeList1.FocusedNode = nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_114'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if MessageDlg(HCLResourceStrings.FindID('sString_115'), mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
        frmScoredCard.qryAtualiza.Close;
        frmScoredCard.qryAtualiza.SQL.Clear;
        frmScoredCard.qryAtualiza.SQL.Add('DELETE FROM SCORED_CARD_FILTRO');
        frmScoredCard.qryAtualiza.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
        frmScoredCard.qryAtualiza.SQL.Add('AND TITULO = ' + #39 + cxTreeList1.FocusedNode.Values[0] + #39);
        frmScoredCard.qryAtualiza.ExecSQL;

        cxTreeList1.FocusedNode.Delete;

        Atualiza;
   end;
end;

procedure TfrmManScored.cxButton4Click(Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    if cxTreeList1.FocusedNode = nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_116'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmScoredCardMan = nil then
    begin
        frmScoredCardMan := TfrmScoredCardMan.Create(Self);

        frmScoredCardMan.titulo   := cxTreeList1cxTreeListColumn1.Value;
        frmScoredCardMan.analise  := cxTreeList1cxTreeListColumn2.Value;
        frmScoredCardMan.campo    := cxTreeList1cxTreeListColumn3.Value;
        frmScoredCardMan.minimo   := cxTreeList1cxTreeListColumn4.Value;
        frmScoredCardMan.maximo   := cxTreeList1cxTreeListColumn5.Value;
        frmScoredCardMan.despesas := cxTreeList1cxTreeListColumn6.Value;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
        Query.SQL.Add(' WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
        Query.SQL.Add('   AND    TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
        Query.Open;
        Query.First;
        if not Query.IsEmpty then
        begin
            if not Query.FieldByName('ANALISE_MINIMO').IsNull then
               frmScoredCardMan.analiseMinimo     := Query.FieldByName('ANALISE_MINIMO').Value;

            if not Query.FieldByName('CAMPO_MINIMO').IsNull then
               frmScoredCardMan.campoMinimo       := Query.FieldByName('CAMPO_MINIMO').Value;

            if not Query.FieldByName('ANALISE_MAXIMO').IsNull then
               frmScoredCardMan.analiseMaximo     := Query.FieldByName('ANALISE_MAXIMO').Value;

            if not Query.FieldByName('CAMPO_MAXIMO').IsNull then
               frmScoredCardMan.campoMaximo       := Query.FieldByName('CAMPO_MAXIMO').Value;

            if not Query.FieldByName('CAMPO_DT_MOVTO').IsNull then
               frmScoredCardMan.dt_movto          := Query.FieldByName('CAMPO_DT_MOVTO').Value;

            if not Query.FieldByName('PERC_AJUSTE').IsNull then
               frmScoredCardMan.ajuste            := Query.FieldByName('PERC_AJUSTE').Value;

            if not Query.FieldByName('PERC_AJUSTE_MAXIMO').IsNull then
               frmScoredCardMan.ajusteMaximo      := Query.FieldByName('PERC_AJUSTE_MAXIMO').Value;

            if not Query.FieldByName('PODE_VISUALIZAR').IsNull then
               frmScoredCardMan.podeVisualizar    := Query.FieldByName('PODE_VISUALIZAR').Value;

            if not Query.FieldByName('MAIL_AVISO').IsNull then
               frmScoredCardMan.mailAviso         := Query.FieldByName('MAIL_AVISO').Value;

            if not Query.FieldByName('AVISA_RED').IsNull then
               frmScoredCardMan.redAviso          := Query.FieldByName('AVISA_RED').Value;

            if not Query.FieldByName('AVISA_YELLOW').IsNull then
               frmScoredCardMan.yellowAviso       := Query.FieldByName('AVISA_YELLOW').Value;

            if not Query.FieldByName('AVISA_GREEN').IsNull then
               frmScoredCardMan.greenAviso        := Query.FieldByName('AVISA_GREEN').Value;

            if not Query.FieldByName('ACUMULA_ANALISE').IsNull then
            begin
               if Query.FieldByName('ACUMULA_ANALISE').Value = 'S' then
                  frmScoredCardMan.chkAcumulaAnalise.Checked := True
               else
                  frmScoredCardMan.chkAcumulaAnalise.Checked := False;
            end;

            if not Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').IsNull then
            begin
               if Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value = 'S' then
                  frmScoredCardMan.lFiltroMinimo := True
               else
                  frmScoredCardMan.lFiltroMinimo := False;
            end;

            if not Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').IsNull then
            begin
               if Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value = 'S' then
                  frmScoredCardMan.lFiltroMaximo := True
               else
                  frmScoredCardMan.lFiltroMaximo := False;
            end;

            if not Query.FieldByName('ACUMULA_MINIMO').IsNull then
            begin
               if Query.FieldByName('ACUMULA_MINIMO').Value = 'S' then
                  frmScoredCardMan.chkAcumulaMinimo.Checked := True
               else
                  frmScoredCardMan.chkAcumulaMinimo.Checked := False;
            end;

            if not Query.FieldByName('ACUMULA_MAXIMO').IsNull then
            begin
               if Query.FieldByName('ACUMULA_MAXIMO').Value = 'S' then
                  frmScoredCardMan.chkAcumulaMaximo.Checked := True
               else
                  frmScoredCardMan.chkAcumulaMaximo.Checked := False;
            end;
        end;

        frmScoredCardMan.Tipo := 'Alterar';
        frmScoredCardMan.ShowModal;

        if lConf then
        begin
            cxTreeList1cxTreeListColumn1.Value := frmScoredCardMan.titulo;
            cxTreeList1cxTreeListColumn2.Value := frmScoredCardMan.analise;
            cxTreeList1cxTreeListColumn3.Value := frmScoredCardMan.campo;
            cxTreeList1cxTreeListColumn4.Value := frmScoredCardMan.minimo;
            cxTreeList1cxTreeListColumn5.Value := frmScoredCardMan.maximo;
            cxTreeList1cxTreeListColumn6.Value := frmScoredCardMan.despesas;

            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
            Query.SQL.Add(' WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
            Query.SQL.Add('   AND    TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
            Query.Open;
            Query.First;
            if Query.IsEmpty then
               Query.Insert
            else
               Query.Edit;

            if frmScoredCardMan.titulo <> '' then
            begin
                Query.FieldByName('TITULO').Value               := frmScoredCardMan.titulo;
                Query.FieldByName('PODE_VISUALIZAR').AsString   := frmScoredCardMan.podeVisualizar;
                Query.FieldByName('ID_ANALISE').Value           := frmScoredCardMan.analise;
                Query.FieldByName('ID_SCORED').Value            := frmScoredCard.tblScoredCardID_SCORED.Value;
                Query.FieldByName('ANALISE_MINIMO').Value       := frmScoredCardMan.analiseMinimo;
                Query.FieldByName('CAMPO_MINIMO').Value         := frmScoredCardMan.campoMinimo;
                Query.FieldByName('ANALISE_MAXIMO').Value       := frmScoredCardMan.analiseMaximo;
                Query.FieldByName('CAMPO_MAXIMO').Value         := frmScoredCardMan.campoMaximo;
                Query.FieldByName('CAMPO_DT_MOVTO').Value       := frmScoredCardMan.dt_movto;
                Query.FieldByName('PERC_AJUSTE').AsFloat        := frmScoredCardMan.ajuste;
                Query.FieldByName('PERC_AJUSTE_MAXIMO').AsFloat := frmScoredCardMan.ajusteMaximo;
                Query.FieldByName('MAIL_AVISO').AsString        := frmScoredCardMan.mailAviso;
                Query.FieldByName('AVISA_RED').AsString         := frmScoredCardMan.redAviso;
                Query.FieldByName('AVISA_YELLOW').AsString      := frmScoredCardMan.yellowAviso;
                Query.FieldByName('AVISA_GREEN').AsString       := frmScoredCardMan.greenAviso;

                if frmScoredCardMan.chkAcumulaAnalise.Checked then
                   Query.FieldByName('ACUMULA_ANALISE').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_ANALISE').Value := 'N';

                if frmScoredCardMan.chkAcumulaMinimo.Checked then
                   Query.FieldByName('ACUMULA_MINIMO').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_MINIMO').Value := 'N';

                if frmScoredCardMan.chkAcumulaMaximo.Checked then
                   Query.FieldByName('ACUMULA_MAXIMO').Value := 'S'
                else
                   Query.FieldByName('ACUMULA_MAXIMO').Value := 'N';

                if frmScoredCardMan.lFiltroMinimo then
                   Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'S'
                else
                   Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value := 'N';

                if frmScoredCardMan.lFiltroMaximo then
                   Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'S'
                else
                   Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value := 'N';

                if (Query.FieldByName('FILTRO_MINIMO_PRINCIPAL').Value = 'S') and
                   (Query.FieldByName('ANALISE_MINIMO').Value <> '') then
                begin
                    Query.FieldByName('GRAFICO_MINIMO').Value := Query.FieldByName('GRAFICO').Value;
                    Query.FieldByName('TEXTO_MINIMO').Value   := Query.FieldByName('TEXTO').Value;
                end;

                if (Query.FieldByName('FILTRO_MAXIMO_PRINCIPAL').Value = 'S') and
                   (Query.FieldByName('ANALISE_MAXIMO').Value <> '') then
                begin
                    Query.FieldByName('GRAFICO_MAXIMO').Value := Query.FieldByName('GRAFICO').Value;
                    Query.FieldByName('TEXTO_MAXIMO').Value   := Query.FieldByName('TEXTO').Value;
                end;

                Query.Post;
            end;
        end;

        FreeAndNil(frmScoredCardMan);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmScoredCardMan);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmManScored.cxButton5Click(Sender: TObject);
var
    sAux : string;
begin
    if cxTreeList1.FocusedNode = nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_111'), mtInformation, [mbOK], 0);
        Exit;
    end;

    InputQuery(HCLResourceStrings.FindID('sString_437'),HCLResourceStrings.FindID('sString_438'),sAux);
    if sAux = '' then
       sAux := 'Cópia ';

    CriaNodo(cxTreeList1.FocusedNode, cxTreeList1.FocusedNode.Parent, sAux, False);
end;

procedure TfrmManScored.cxButton6Click(Sender: TObject);
var
    i : integer;
    a : integer;
begin
    if frmSubstituir = nil then
    begin
        frmSubstituir := TfrmSubstituir.Create(Self);
        frmSubstituir.ShowModal;

        if frmSubstituir.lConf then
        begin
            a := 2;
            if frmSubstituir.cbxItem.Text = 'Campo Foco' then a := 2;

            for i := 0 to cxTreeList1.AbsoluteCount - 1 do
                if frmSubstituir.edtDe.Text = cxTreeList1.AbsoluteItems[i].Values[a] then
                   cxTreeList1.AbsoluteItems[i].Values[a] := frmSubstituir.edtPara.Text;
        end;

        FreeAndNil(frmSubstituir);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmSubstituir);
    end;
end;

procedure TfrmManScored.CriaNodo(Nodo, Pai: TcxTreeListNode; Diferenciador : string; Estrutura: boolean);
var
    NodoDestino : TcxTreeListNode;
    i : integer;
    Query : TADOQuery;
    Query1 : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := frmScoredCard.bdDados;
    Query1.CursorLocation := clUseServer;

    try
        NodoDestino := Pai.AddChild;

        NodoDestino.Values[0] := Diferenciador + Nodo.Values[0];
        NodoDestino.Values[1] := Nodo.Values[1];
        NodoDestino.Values[2] := Nodo.Values[2];
        NodoDestino.Values[3] := Nodo.Values[3];
        NodoDestino.Values[4] := Nodo.Values[4];
        NodoDestino.Values[5] := Nodo.Values[5];

        Query.Close;
        Query.SQL.Clear;

        Query.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
        Query.SQL.Add(' WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
        Query.SQL.Add('   AND    TITULO = ' + #39 + Nodo.Values[0] + #39);
        Query.Open;
        Query.First;

        if not Query.IsEmpty then
        begin
            Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.Add('SELECT * FROM SCORED_CARD_FILTRO');
            Query1.SQL.Add(' WHERE ID_SCORED = ' + #39 + #39);
            Query1.Open;
            if Query1.IsEmpty then
               Query1.Insert
            else
               Query1.Edit;

            for i := 0 to Query.FieldCount - 1 do
                Query1.Fields[i].Value := Query.Fields[i].Value;

            Query1.FieldByName('TITULO').AsString := NodoDestino.Values[0];

            Query1.Post;
            Query1.Close;
        end;

        Query.Close;

        if Estrutura then
           for i := 0 to Nodo.Count - 1 do
               CriaNodo(Nodo.Items[i],NodoDestino,Diferenciador, True);
    except
        NodoDestino.Delete;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;
end;

procedure TfrmManScored.cxButton7Click(Sender: TObject);
var
    sAux : string;
begin
    if cxTreeList1.FocusedNode = nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_111'), mtInformation, [mbOK], 0);
        Exit;
    end;

    InputQuery(HCLResourceStrings.FindID('sString_437'),HCLResourceStrings.FindID('sString_438'),sAux);
    if sAux = '' then
       sAux := 'Cópia ';

    CriaNodo(cxTreeList1.FocusedNode, cxTreeList1.FocusedNode.Parent, sAux, True);
end;

procedure TfrmManScored.cxTreeList1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := cxTreeList1.HitTest.HitAtNode;
end;

procedure TfrmManScored.Edit1Exit(Sender: TObject);
begin
    Edit1.Text := StringReplace(Edit1.Text,' ','',[rfReplaceAll]);
end;

end.

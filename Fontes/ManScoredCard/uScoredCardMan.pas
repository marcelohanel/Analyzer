unit uScoredCardMan;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, cxTextEdit,
  cxDropDownEdit, cxLabel,
  cxCalc, cxCheckBox,
  cxCurrencyEdit,






  cxMemo, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls, cxMaskEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmScoredCardMan = class(TForm)
    Label1: TcxLabel;
    ca: TcxComboBox;
    Label4: TcxLabel;
    cv: TcxComboBox;
    Label2: TcxLabel;
    Edit1: TcxTextEdit;
    SpeedButton3: TcxButton;
    cxCalcEdit1: TcxCalcEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCalcEdit2: TcxCalcEdit;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    cxAnaliseMinimo: TcxComboBox;
    cxLabel4: TcxLabel;
    cxCampoMinimo: TcxComboBox;
    SpeedButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel5: TcxLabel;
    cxAnaliseMaximo: TcxComboBox;
    cxCampoMaximo: TcxComboBox;
    cxButton3: TcxButton;
    cxLabel6: TcxLabel;
    edtPercAjuste: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    edtPercAjusteMaximo: TcxCurrencyEdit;
    SpeedButton7: TcxButton;
    cxLabel9: TcxLabel;
    cxDtMovto: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    chkAcumulaAnalise: TcxCheckBox;
    chkAcumulaMinimo: TcxCheckBox;
    chkAcumulaMaximo: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxMail: TcxMemo;
    cxRed: TcxCheckBox;
    cxYellow: TcxCheckBox;
    cxGreen: TcxCheckBox;
    chkFiltroPrincipalMinimo: TcxCheckBox;
    chkFiltroPrincipalMaximo: TcxCheckBox;
    procedure cxDtMovtoPropertiesInitPopup(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure caPropertiesChange(Sender: TObject);
    procedure cvPropertiesInitPopup(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxAnaliseMinimoPropertiesChange(Sender: TObject);
    procedure cxCampoMinimoPropertiesInitPopup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxAnaliseMaximoPropertiesChange(Sender: TObject);
    procedure cxCampoMaximoPropertiesInitPopup(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure Inicializa;
    procedure chkFiltroPrincipalMinimoClick(Sender: TObject);
    procedure chkFiltroPrincipalMaximoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    titulo   : string;
    analise  : string;
    campo    : string;
    dt_movto : string;
    minimo   : double;
    maximo   : double;
    despesas : boolean;
    Tipo     : string;
    analiseMinimo  : string;
    campoMinimo    : string;
    analiseMaximo  : string;
    campoMaximo    : string;
    ajuste         : double;
    ajusteMaximo   : double;
    podeVisualizar : string;
    mailAviso      : string;
    redAviso       : string;
    yellowAviso    : string;
    greenAviso     : string;
    lFiltroMinimo  : boolean;
    lFiltroMaximo  : boolean;
  end;

var
  frmScoredCardMan: TfrmScoredCardMan;

implementation

uses uManScored, uScoredCard, uFuncoes, uFiltraScoredCard,
  uPermissoesItemScored;

{$R *.dfm}

procedure TfrmScoredCardMan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmScoredCardMan.SpeedButton3Click(Sender: TObject);
var
    i     : integer;
    lTem  : boolean;
    lPode : boolean;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_117'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if ca.Text = '' then
    begin
        cv.Text              := '';
        cxDtMovto.Text       := '';
        cxAnaliseMinimo.Text := '';
        cxCampoMinimo.Text   := '';
        cxAnaliseMaximo.Text := '';
        cxCampoMaximo.Text   := '';
        cxCalcEdit1.Value    := 0;
        cxCalcEdit2.Value    := 0;
        cxMail.Text          := '';
        cxRed.Checked        := False;
        cxYellow.Checked     := False;
        cxGreen.Checked      := False;
        lFiltroMinimo        := False;
        lFiltroMaximo        := False;
    end;

    if cxAnaliseMinimo.Text = '' then
       cxCampoMinimo.Text   := '';

    if cxAnaliseMaximo.Text = '' then
       cxCampoMaximo.Text   := '';

    if ca.Text <> '' then
    begin
        if cv.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_120'), mtInformation, [mbOK], 0);
            Exit;
        end;
    end;

    if cxAnaliseMinimo.Text <> '' then
    begin
        if cxCampoMinimo.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_122'), mtInformation, [mbOK], 0);
            Exit;
        end;
    end;

    if cxAnaliseMaximo.Text <> '' then
    begin
        if cxCampoMaximo.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_123'), mtInformation, [mbOK], 0);
            Exit;
        end;
    end;

    if Tipo = 'Criar' then
    begin
        lTem := False;
        for i := 0 to frmManScored.cxTreeList1.AbsoluteCount - 1 do
            if VarToStr(frmManScored.cxTreeList1.AbsoluteItems[i].Values[0]) = Edit1.Text then
               lTem := True;

        if lTem then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_124'), mtInformation, [mbOK], 0);
            Exit;
        end;
    end;

    if (Tipo     = 'Alterar')  and
       (titulo  <> Edit1.Text) then
    begin
        if MessageDlg(HCLResourceStrings.FindID('sString_125') +#13+#10 + HCLResourceStrings.FindID('sString_125_1'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            lPode := True;
            try
                frmScoredCard.qryAtualiza.Close;
                frmScoredCard.qryAtualiza.SQL.Clear;
                frmScoredCard.qryAtualiza.SQL.Add('UPDATE SCORED_CARD_FILTRO');
                frmScoredCard.qryAtualiza.SQL.Add('SET TITULO = ' + #39 + Edit1.Text + #39);
                frmScoredCard.qryAtualiza.SQL.Add('WHERE TITULO = ' + #39 + titulo + #39);
                frmScoredCard.qryAtualiza.SQL.Add('AND ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
                frmScoredCard.qryAtualiza.ExecSQL;
                frmScoredCard.qryAtualiza.Close;

                titulo := Edit1.Text;
            except
                lPode := False;
            end;

            if lPode then
            begin
                try
                    //Dia
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
                        frmScoredCard.ADOQuery2.SQL.Add('UPDATE [_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + ']');
                        frmScoredCard.ADOQuery2.SQL.Add('SET [_Titulo_] = ' + #39 + Edit1.Text + #39);
                        frmScoredCard.ADOQuery2.SQL.Add('WHERE [_Titulo_] = ' + #39 + titulo + #39);
                    end;

                    if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
                    begin
                        frmScoredCard.ADOQuery2.SQL.Add('UPDATE `_ScoredCard_' + uppercase(frmScoredCard.tblScoredCardID_SCORED.Value) + '`');
                        frmScoredCard.ADOQuery2.SQL.Add('SET _Titulo_ = ' + #39 + Edit1.Text + #39);
                        frmScoredCard.ADOQuery2.SQL.Add('WHERE _Titulo_ = ' + #39 + titulo + #39);
                    end;

                    frmScoredCard.ADOQuery2.ExecSQL;
                    frmScoredCard.ADOQuery2.Close;
                except
                end;
            end;
        end;
    end
    else
       titulo := Edit1.Text;

    frmManScored.lConf := True;
    analise            := ca.Text;
    campo              := cv.Text;
    dt_movto           := cxDtMovto.Text;
    minimo             := cxCalcEdit1.Value;
    maximo             := cxCalcEdit2.Value;
    despesas           := cxCheckBox1.Checked;
    analiseMinimo      := cxAnaliseMinimo.Text;
    campoMinimo        := cxCampoMinimo.Text;
    analiseMaximo      := cxAnaliseMaximo.Text;
    campoMaximo        := cxCampoMaximo.Text;
    ajuste             := edtPercAjuste.Value;
    ajusteMaximo       := edtPercAjusteMaximo.Value;
    mailAviso          := cxMail.Text;
    lFiltroMinimo      := chkFiltroPrincipalMinimo.Checked;
    lFiltroMaximo      := chkFiltroPrincipalMaximo.Checked;

    if cxRed.Checked then
       redAviso := 'S'
    else
       redAviso := 'N';

    if cxYellow.Checked then
       yellowAviso := 'S'
    else
       yellowAviso := 'N';

    if cxGreen.Checked then
       greenAviso := 'S'
    else
       greenAviso := 'N';

    close;
end;

procedure TfrmScoredCardMan.SpeedButton7Click(Sender: TObject);
begin
    if frmPermissoesItemScored = nil then
    begin
        frmPermissoesItemScored := TfrmPermissoesItemScored.Create(Self);
        frmPermissoesItemScored.ShowModal;
        FreeAndNil(frmPermissoesItemScored);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmPermissoesItemScored);
    end;
end;

procedure TfrmScoredCardMan.Inicializa;
var
    lPode : boolean;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    if Tipo <> 'Alterar' then
    begin
        cxButton1.Enabled := False;
        cxButton2.Enabled := False;
        cxButton3.Enabled := False;
    end;

    frmManScored.lConf := False;

    ca.Properties.Items.Clear;
    cxAnaliseMinimo.Properties.Items.Clear;
    cxAnaliseMaximo.Properties.Items.Clear;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE, PODE_VISUALIZAR FROM ANALISES');
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        lPode := False;

        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#*'          ,',')               then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#' + frmScoredCard.sUsuario,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'*'           ,',')               then lPode := True  else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,frmScoredCard.sUsuario      ,',') then lPode := True;

        if lPode then
        begin
            ca.Properties.Items.Add(Query.FieldByName('ID_ANALISE').Value);
            cxAnaliseMinimo.Properties.Items.Add(Query.FieldByName('ID_ANALISE').Value);
            cxAnaliseMaximo.Properties.Items.Add(Query.FieldByName('ID_ANALISE').Value);
        end;

        Query.Next;
    end;

    Edit1.Text                       := titulo;
    ca.Text                          := analise;
    cv.Properties.Items.Add(campo);
    cv.Text                          := campo;
    cxDtMovto.Properties.Items.Add(dt_movto);
    cxDtMovto.Text                   := dt_movto;
    cxCalcEdit1.Value                := minimo;
    cxCalcEdit2.Value                := maximo;
    cxCheckBox1.Checked              := despesas;
    cxMail.Text                      := mailAviso;
    chkFiltroPrincipalMinimo.Checked := lFiltroMinimo;
    chkFiltroPrincipalMaximo.Checked := lFiltroMaximo;

    if redAviso = 'S' then
       cxRed.Checked := True
    else
       cxRed.Checked := False;

    if yellowAviso = 'S' then
       cxYellow.Checked := True
    else
       cxYellow.Checked := False;

    if greenAviso = 'S' then
       cxGreen.Checked := True
    else
       cxGreen.Checked := False;

       {
    if (cxCalcEdit1.Value = 0) and
       (cxCalcEdit2.Value = 0) then
        cxCalcEdit2.Value := 1;    }

    cxAnaliseMinimo.Text    := analiseMinimo;
    cxCampoMinimo.Properties.Items.Add(campoMinimo);
    cxCampoMinimo.Text      := campoMinimo;

    cxAnaliseMaximo.Text    := analiseMaximo;
    cxCampoMaximo.Properties.Items.Add(campoMaximo);
    cxCampoMaximo.Text      := campoMaximo;

    edtPercAjuste.Value       := ajuste;
    edtPercAjusteMaximo.Value := ajusteMaximo;

    {
    if edtPercAjuste.Value = 0 then
       edtPercAjuste.Value := 1;

    if edtPercAjusteMaximo.Value = 0 then
       edtPercAjusteMaximo.Value := 101;  }

    if podeVisualizar = '' then
       podeVisualizar := '*';

    Query.Close;
    Query.Free;
end;

procedure TfrmScoredCardMan.FormShow(Sender: TObject);
begin
    Inicializa;
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmScoredCardMan.caPropertiesChange(Sender: TObject);
begin
    cv.Properties.Items.Clear;
    cxDtMovto.Properties.Items.Clear;
end;

procedure TfrmScoredCardMan.chkFiltroPrincipalMaximoClick(Sender: TObject);
begin
    cxButton3.Enabled := True;

    if chkFiltroPrincipalMaximo.Checked then
       cxButton3.Enabled := False;
end;

procedure TfrmScoredCardMan.chkFiltroPrincipalMinimoClick(Sender: TObject);
begin
    cxButton2.Enabled := True;

    if chkFiltroPrincipalMinimo.Checked then
       cxButton2.Enabled := False;
end;

procedure TfrmScoredCardMan.cvPropertiesInitPopup(Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE, VISAO_ORIGEM, BASE_ORIGEM, VISAO_DESTINO FROM ANALISES');
    Query.SQL.Add('WHERE ID_ANALISE = ' + #39 + ca.Text + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
    begin
        if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
           (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
            frmScoredCard.bdArmazena.GetFieldNames(Query.FieldByName('VISAO_DESTINO').Value,cv.Properties.Items)
        else
            frmScoredCard.bdArmazena.GetFieldNames('_' + Query.FieldByName('VISAO_DESTINO').Value,cv.Properties.Items);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmScoredCardMan.cxButton1Click(Sender: TObject);
begin
    if ca.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_126'), mtInformation, [mbOK], 0);
        exit;
    end;

    if frmFiltraScoredCard = nil then
    begin
        frmFiltraScoredCard := TfrmFiltraScoredCard.Create(Self);
        frmFiltraScoredCard.cTipo := '0';
        frmFiltraScoredCard.cAnalise := ca.Text;
        frmFiltraScoredCard.ShowModal;
        FreeAndNil(frmFiltraScoredCard);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmScoredCardMan.cxAnaliseMinimoPropertiesChange(
  Sender: TObject);
begin
    cxCampoMinimo.Properties.Items.Clear;
    cxCampoMinimo.Text := '';
end;

procedure TfrmScoredCardMan.cxCampoMinimoPropertiesInitPopup(
  Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE, VISAO_ORIGEM, BASE_ORIGEM, VISAO_DESTINO FROM ANALISES');
    Query.SQL.Add('WHERE ID_ANALISE = ' + #39 + cxAnaliseMinimo.Text + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
    begin
        if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
           (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
            frmScoredCard.bdArmazena.GetFieldNames(Query.FieldByName('VISAO_DESTINO').Value,cxCampoMinimo.Properties.Items)
        else
            frmScoredCard.bdArmazena.GetFieldNames('_' + Query.FieldByName('VISAO_DESTINO').Value,cxCampoMinimo.Properties.Items);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmScoredCardMan.cxDtMovtoPropertiesInitPopup(Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE, VISAO_ORIGEM, BASE_ORIGEM, VISAO_DESTINO FROM ANALISES');
    Query.SQL.Add('WHERE ID_ANALISE = ' + #39 + ca.Text + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
    begin
        if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
           (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
            frmScoredCard.bdArmazena.GetFieldNames(Query.FieldByName('VISAO_DESTINO').Value,cxDtMovto.Properties.Items)
        else
            frmScoredCard.bdArmazena.GetFieldNames('_' + Query.FieldByName('VISAO_DESTINO').Value,cxDtMovto.Properties.Items);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmScoredCardMan.SpeedButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmScoredCardMan.cxButton2Click(Sender: TObject);
begin
    if cxAnaliseMinimo.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_126'), mtInformation, [mbOK], 0);
        exit;
    end;

    if frmFiltraScoredCard = nil then
    begin
        frmFiltraScoredCard := TfrmFiltraScoredCard.Create(Self);
        frmFiltraScoredCard.cTipo := '1';
        frmFiltraScoredCard.cAnalise := cxAnaliseMinimo.Text;
        frmFiltraScoredCard.ShowModal;
        FreeAndNil(frmFiltraScoredCard);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmScoredCardMan.cxAnaliseMaximoPropertiesChange(
  Sender: TObject);
begin
    cxCampoMaximo.Properties.Items.Clear;
    cxCampoMaximo.Text := '';
end;

procedure TfrmScoredCardMan.cxCampoMaximoPropertiesInitPopup(
  Sender: TObject);
var
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE, VISAO_ORIGEM, BASE_ORIGEM, VISAO_DESTINO FROM ANALISES');
    Query.SQL.Add('WHERE ID_ANALISE = ' + #39 + cxAnaliseMaximo.Text + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
    begin
        if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
           (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
            frmScoredCard.bdArmazena.GetFieldNames(Query.FieldByName('VISAO_DESTINO').Value,cxCampoMaximo.Properties.Items)
        else
            frmScoredCard.bdArmazena.GetFieldNames('_' + Query.FieldByName('VISAO_DESTINO').Value,cxCampoMaximo.Properties.Items);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmScoredCardMan.cxButton3Click(Sender: TObject);
begin
    if cxAnaliseMaximo.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_126'), mtInformation, [mbOK], 0);
        exit;
    end;

    if frmFiltraScoredCard = nil then
    begin
        frmFiltraScoredCard := TfrmFiltraScoredCard.Create(Self);
        frmFiltraScoredCard.cTipo := '2';
        frmFiltraScoredCard.cAnalise := cxAnaliseMaximo.Text;
        frmFiltraScoredCard.ShowModal;
        FreeAndNil(frmFiltraScoredCard);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
    end;
end;

end.

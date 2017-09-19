unit uAnalises;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  cxButtons,

  cxDBEdit,
  cxGridLevel,
  cxGridDBTableView, cxGrid,
  cxLabel,









  cxLookAndFeels, ADODB, dxSkinsForm,
  cxLocalization, CEVersionInfo, cxGraphics, cxLookAndFeelPainters, Menus,
  cxControls, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxContainer, cxCheckBox, cxTextEdit, cxMemo,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmAnalises = class(TForm)
    dtsAnalises: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton7: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBMemo1: TcxDBMemo;
    DBMemo2: TcxDBMemo;
    DBEdit1: TcxDBTextEdit;
    DBEdit2: TcxDBTextEdit;
    DBEdit3: TcxDBTextEdit;
    DBCheckBox1: TcxDBCheckBox;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxButton3: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblAnalises: TADOTable;
    tblAnalisesID_ANALISE: TWideStringField;
    tblAnalisesDESCRICAO: TMemoField;
    tblAnalisesBASE_ORIGEM: TMemoField;
    tblAnalisesVISAO_ORIGEM: TWideStringField;
    tblAnalisesVISAO_DESTINO: TWideStringField;
    tblAnalisesINCREMENTAL: TWideStringField;
    tblAnalisesPODE_VISUALIZAR: TMemoField;
    tblAnalisesPODE_ALTERAR: TMemoField;
    tblAnalisesPODE_ATUALIZAR: TMemoField;
    tblAnalisesPODE_APAGAR: TMemoField;
    tblAnalisesDT_ATUALIZACAO: TDateTimeField;
    tblAnalisesINTERNA: TWideStringField;
    tblAnalisesANALISES_IGNORADOS: TMemoField;
    tblAnalisesVALORES_IGNORADOS: TMemoField;
    tblAnalisesGRID: TWideStringField;
    tblAnalisesGRUPO: TWideStringField;
    tblAnalisesDT_CRIACAO: TDateTimeField;
    qryAux: TADOQuery;
    procedure cxButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(
      Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblAnalisesBeforeDelete(DataSet: TDataSet);
    procedure tblAnalisesBeforePost(DataSet: TDataSet);
    procedure tblAnalisesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoAnalise : boolean;
    lAtualizaBatch : boolean;
    sAnalise : string;
    sAtualiza : string;
    sTempDirUsuario : string;
  end;

var
  frmAnalises: TfrmAnalises;

implementation

uses uFuncoes, uOndeSeUsa, uElementosAnalise, uPermissoesAnalise,
  uVisualizarDados, uWizardAnalise, uAtualiza;

{$R *.dfm}

procedure TfrmAnalises.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblAnalises.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmAnalises.FormCreate(Sender: TObject);
var
    sAux : TMemo;
begin
    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_417'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    SetLanguage(2, cxLocalizer1);

    if FileExists(ParamStr(2)) then
    begin
        sAux := TMemo.Create(Application);
        sAux.Parent := Self;
        sAux.ScrollBars := ssBoth;

        sAux.Lines.LoadFromFile(ParamStr(2));
    end
    else
       Application.Terminate;

    sSkin                      := sAux.Lines.Strings[0];
    sSGBD                      := sAux.Lines.Strings[3];
    sUsuario                   := sAux.Lines.Strings[4];
    sBanco                     := sAux.Lines.Strings[5];
    sPermissaoPermissaoAnalise := StrToBool(sAux.Lines.Strings[6]);
    lAtualizaBatch             := StrToBool(sAux.Lines.Strings[7]);
    sAtualiza                  := sAux.Lines.Strings[8];
    sAnalise                   := sAux.Lines.Strings[9];
    sTempDirUsuario            := 'C:\Analyzer\Temp\' + sUsuario + '\';

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := sAux.Lines.Strings[1];

      bdArmazena.Close;
      bdArmazena.ConnectionString := sAux.Lines.Strings[2];
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    FreeAndNil(sAux);

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;
end;

procedure TfrmAnalises.FormShow(Sender: TObject);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;

    if sAtualiza = 'SIM' then
    begin
        if tblAnalises.Locate('ID_ANALISE',VarToStr(sAnalise),[]) then
        begin
           SpeedButton5.OnClick(Self);
           Application.Terminate;
        end;
    end;
end;

procedure TfrmAnalises.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmAnalises.SpeedButton2Click(Sender: TObject);
begin
    if frmWizardAnalise = nil then
    begin
        frmWizardAnalise := TfrmWizardAnalise.Create(Self);
        frmWizardAnalise.Tipo := 'Criar';
        frmWizardAnalise.ShowModal;
        FreeAndNil(frmWizardAnalise);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmWizardAnalise);
    end;
end;

procedure TfrmAnalises.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmAnalises.tblAnalisesPODE_APAGAR.Value,'#*'                      ,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_APAGAR.Value,'#' + frmAnalises.sUsuario,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_APAGAR.Value,'*'                       ,',') then lPode := True  else
        if EncontraLista(frmAnalises.tblAnalisesPODE_APAGAR.Value,frmAnalises.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_51'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              frmAnalises.tblAnalises.Delete;
        except
        end;
    end;
end;

procedure TfrmAnalises.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'#' + frmAnalises.sUsuario,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,frmAnalises.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmWizardAnalise = nil then
        begin
            frmWizardAnalise := TfrmWizardAnalise.Create(Self);
            frmWizardAnalise.Tipo := 'Alterar';
            frmWizardAnalise.ShowModal;
            FreeAndNil(frmWizardAnalise);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmWizardAnalise);
        end;
    end;
end;

procedure TfrmAnalises.SpeedButton5Click(Sender: TObject);
var
    lPode : boolean;
    lPassa : boolean;
    iTime  : TTime;
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmAnalises.tblAnalisesPODE_ATUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ATUALIZAR.Value,'#' + frmAnalises.sUsuario,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ATUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ATUALIZAR.Value,frmAnalises.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            if not frmAnalises.lAtualizaBatch then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end
            else
               Application.Terminate;
        end;

        if (frmAnalises.tblAnalisesBASE_ORIGEM.Value  = '.') and
           (frmAnalises.tblAnalisesVISAO_ORIGEM.Value = '.') then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_53'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmWizardAnalise = nil then
        begin
           frmWizardAnalise := TfrmWizardAnalise.Create(Self);

           if not frmAnalises.lAtualizaBatch then
           begin
               if MessageDlg(HCLResourceStrings.FindID('sString_54'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  lPassa := True
               else
                  lPassa := False;
           end
           else
              lPassa := True;

           if lPassa then
           begin
               try
                   iTime := Time;

                   frmAtualiza := TfrmAtualiza.Create(Self);
                   frmAtualiza.lblMensagem.Caption := HCLResourceStrings.FindID('sString_55') + frmAnalises.tblAnalisesID_ANALISE.Value;
                   frmAtualiza.pbGeral.Properties.Max := 3;
                   frmAtualiza.Show;
                   frmAtualiza.lblTarefa.Caption := HCLResourceStrings.FindID('sString_56');
                   frmAtualiza.Update;

                   frmWizardAnalise.AtualizaBaseDados;

                   if not frmWizardAnalise.lErro then
                   begin
                       frmAnalises.tblAnalises.Edit;
                       frmAnalises.tblAnalisesDT_ATUALIZACAO.Value    := Date;
                       frmAnalises.tblAnalises.Post;

                       frmAtualiza.pbGeral.Position := 3;
                       frmAtualiza.Update;

                       iTime := Time - iTime;

                       if not frmAnalises.lAtualizaBatch then
                          MessageDlg(HCLResourceStrings.FindID('sString_57') + TimeToStr(iTime), mtInformation, [mbOK], 0);
                   end;
               except
                  on E: Exception do
                  begin
                      if not frmAnalises.lAtualizaBatch then
                         MessageDlg(HCLResourceStrings.FindID('sString_330') +#13+#10+
                                    HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
                  end;
               end;

               FreeAndNil(frmAtualiza);
           end;

           FreeAndNil(frmWizardAnalise);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmWizardAnalise);
        end;
    end;
end;

procedure TfrmAnalises.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmAnalises.tblAnalisesPODE_VISUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_VISUALIZAR.Value,'#' + frmAnalises.sUsuario,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_VISUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmAnalises.tblAnalisesPODE_VISUALIZAR.Value,frmAnalises.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmVisualizarDados = nil then
        begin
            frmVisualizarDados := TfrmVisualizarDados.Create(Self);
            frmVisualizarDados.Caption := frmAnalises.tblAnalisesID_ANALISE.AsString;
            frmVisualizarDados.ShowModal;
            FreeAndNil(frmVisualizarDados);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmVisualizarDados);
        end;
    end;
end;

procedure TfrmAnalises.SpeedButton7Click(Sender: TObject);
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        if frmAnalises.sPermissaoPermissaoAnalise = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesAnalise = nil then
        begin
            frmPermissoesAnalise := TfrmPermissoesAnalise.Create(Self);
            frmPermissoesAnalise.ShowModal;
            FreeAndNil(frmPermissoesAnalise);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesAnalise);
        end;
    end;
end;

procedure TfrmAnalises.tblAnalisesBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblAnalisesID_ANALISE.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteRestrict(bdDados,0,'SCORED_CARD_FILTRO','ANALISE_MINIMO',  aux) then Abort;
        if not DeleteRestrict(bdDados,0,'SCORED_CARD_FILTRO','ANALISE_MAXIMO',  aux) then Abort;
        if not DeleteRestrict(bdDados,0,'SCORED_CARD_FILTRO','ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'FREQUENCIA',        'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'FOTOGRAFIA',        'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'CUBO',              'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'ABC',               'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'DYNAMICS',          'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'CENARIOS',          'ID_ANALISE',      aux) then Abort;
        if not DeleteRestrict(bdDados,0,'SMARTDOCS',         'ID_ANALISE',      aux) then Abort;

        if not DeleteCascade(bdDados,0,'PADROES','ID_ANALISE',aux) then Abort;
    end;

    if not ((tblAnalisesGRID.Value        <> 'S')  and
            (tblAnalisesBASE_ORIGEM.Value  = '.')  and
            (tblAnalisesVISAO_ORIGEM.Value = '.')) then
    begin
        try
            qryAux.Close;
            qryAux.SQL.Clear;

            if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
               (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
            begin
                if tblAnalisesGRID.Value = 'S' then
                   qryAux.SQL.Add('DROP TABLE [' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + ']')
                else
                   qryAux.SQL.Add('DROP TABLE [_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + ']');
            end;

            if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
            begin
                if tblAnalisesGRID.Value = 'S' then
                   qryAux.SQL.Add('DROP TABLE `' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '`')
                else
                   qryAux.SQL.Add('DROP TABLE `_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '`');
            end;

            qryAux.ExecSQL;
            qryAux.Close;
        except
        end;
    end;

    GeraLog(bdDados,frmAnalises.sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmAnalises.tblAnalisesBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       auxAntigo := #39 + tblAnalisesID_ANALISE.OldValue + #39;
       auxNovo   := #39 + tblAnalisesID_ANALISE.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'SCORED_CARD_FILTRO','ANALISE_MINIMO',  auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'SCORED_CARD_FILTRO','ANALISE_MAXIMO',  auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'SCORED_CARD_FILTRO','ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'FREQUENCIA',        'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'FOTOGRAFIA',        'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'ABC',               'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CUBO',              'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'DYNAMICS',          'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS',          'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'PADROES',           'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'SMARTDOCS',         'ID_ANALISE',      auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmAnalises.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,frmAnalises.sUsuario,',') then
       Accept := True;
end;

procedure TfrmAnalises.cxButton1Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmAnalises.tblAnalises.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'#' + frmAnalises.sUsuario,',') then lPode := False else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmAnalises.tblAnalisesPODE_ALTERAR.Value,frmAnalises.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmElementosAnalise = nil then
        begin
            frmElementosAnalise := TfrmElementosAnalise.Create(Self);
            frmElementosAnalise.ShowModal;
            FreeAndNil(frmElementosAnalise);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmElementosAnalise);
        end;
    end;
end;

procedure TfrmAnalises.cxButton3Click(Sender: TObject);
begin
    if frmOndeSeUsa = nil then
    begin
        frmOndeSeUsa := TfrmOndeSeUsa.Create(Self);
        frmOndeSeUsa.ShowModal;
        FreeAndNil(frmOndeSeUsa);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmOndeSeUsa);
    end;
end;

procedure TfrmAnalises.cxGrid1DBTableView1DataControllerFilterChanged(
  Sender: TObject);
begin
   // cxGrid1DBTableView1.DataController.MoveBy(0);
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

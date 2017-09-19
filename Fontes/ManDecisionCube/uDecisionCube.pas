unit uDecisionCube;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  cxButtons,

  cxDBEdit, cxGridLevel,
  cxGridDBTableView,
  cxGrid, cxLabel,









  cxLookAndFeels,
  dxSkinsForm, cxLocalization, CEVersionInfo, cxGraphics, cxLookAndFeelPainters,
  Menus, cxControls, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer, cxMemo,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmDecisionCube = class(TForm)
    dtsDecisionMySQL: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    grd1: TcxGrid;
    grd1DBTableView1: TcxGridDBTableView;
    grd1DBTableView1DBColumn1: TcxGridDBColumn;
    grd1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    Label1: TcxLabel;
    Label4: TcxLabel;
    SpeedButton2: TcxButton;
    tblDecision: TADOTable;
    tblDecisionID_DECISION: TWideStringField;
    tblDecisionDESCRICAO: TWideMemoField;
    tblDecisionPODE_VISUALIZAR: TWideMemoField;
    tblDecisionPODE_ALTERAR: TWideMemoField;
    tblDecisionPODE_APAGAR: TWideMemoField;
    tblDecisionDT_CRIACAO: TDateTimeField;
    tblDecisionSQL_COMPLETO: TWideMemoField;
    tblDecisionCAMPO_DIMENSAO_1: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_2: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_3: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_4: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_5: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_6: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_7: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_8: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_9: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_10: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_11: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_12: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_13: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_14: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_15: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_16: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_17: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_18: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_19: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_20: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_21: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_22: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_23: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_24: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_25: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_26: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_27: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_28: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_29: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_30: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_31: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_32: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_33: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_34: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_35: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_36: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_37: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_38: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_39: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_40: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_41: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_42: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_43: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_44: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_45: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_46: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_47: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_48: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_49: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_50: TWideStringField;
    tblDecisionCAMPO_SUMARIO_1: TWideStringField;
    tblDecisionCAMPO_SUMARIO_2: TWideStringField;
    tblDecisionCAMPO_SUMARIO_3: TWideStringField;
    tblDecisionCAMPO_SUMARIO_4: TWideStringField;
    tblDecisionCAMPO_SUMARIO_5: TWideStringField;
    tblDecisionCAMPO_SUMARIO_6: TWideStringField;
    tblDecisionCAMPO_SUMARIO_7: TWideStringField;
    tblDecisionCAMPO_SUMARIO_8: TWideStringField;
    tblDecisionCAMPO_SUMARIO_9: TWideStringField;
    tblDecisionCAMPO_SUMARIO_10: TWideStringField;
    tblDecisionCAMPO_SUMARIO_11: TWideStringField;
    tblDecisionCAMPO_SUMARIO_12: TWideStringField;
    tblDecisionCAMPO_SUMARIO_13: TWideStringField;
    tblDecisionCAMPO_SUMARIO_14: TWideStringField;
    tblDecisionCAMPO_SUMARIO_15: TWideStringField;
    tblDecisionCAMPO_SUMARIO_16: TWideStringField;
    tblDecisionCAMPO_SUMARIO_17: TWideStringField;
    tblDecisionCAMPO_SUMARIO_18: TWideStringField;
    tblDecisionCAMPO_SUMARIO_19: TWideStringField;
    tblDecisionCAMPO_SUMARIO_20: TWideStringField;
    tblDecisionLIMITE_REGISTROS: TIntegerField;
    tblDecisionCAMPO_SUMARIO_21: TWideStringField;
    tblDecisionCAMPO_SUMARIO_22: TWideStringField;
    tblDecisionCAMPO_SUMARIO_23: TWideStringField;
    tblDecisionCAMPO_SUMARIO_24: TWideStringField;
    tblDecisionCAMPO_SUMARIO_25: TWideStringField;
    tblDecisionCAMPO_SUMARIO_26: TWideStringField;
    tblDecisionCAMPO_SUMARIO_27: TWideStringField;
    tblDecisionCAMPO_SUMARIO_28: TWideStringField;
    tblDecisionCAMPO_SUMARIO_29: TWideStringField;
    tblDecisionCAMPO_SUMARIO_30: TWideStringField;
    tblDecisionCAMPO_SUMARIO_31: TWideStringField;
    tblDecisionCAMPO_SUMARIO_32: TWideStringField;
    tblDecisionCAMPO_SUMARIO_33: TWideStringField;
    tblDecisionCAMPO_SUMARIO_34: TWideStringField;
    tblDecisionCAMPO_SUMARIO_35: TWideStringField;
    tblDecisionCAMPO_SUMARIO_36: TWideStringField;
    tblDecisionCAMPO_SUMARIO_37: TWideStringField;
    tblDecisionCAMPO_SUMARIO_38: TWideStringField;
    tblDecisionCAMPO_SUMARIO_39: TWideStringField;
    tblDecisionCAMPO_SUMARIO_40: TWideStringField;
    tblDecisionCAMPO_SUMARIO_41: TWideStringField;
    tblDecisionCAMPO_SUMARIO_42: TWideStringField;
    tblDecisionCAMPO_SUMARIO_43: TWideStringField;
    tblDecisionCAMPO_SUMARIO_44: TWideStringField;
    tblDecisionCAMPO_SUMARIO_45: TWideStringField;
    tblDecisionCAMPO_SUMARIO_46: TWideStringField;
    tblDecisionCAMPO_SUMARIO_47: TWideStringField;
    tblDecisionCAMPO_SUMARIO_48: TWideStringField;
    tblDecisionCAMPO_SUMARIO_49: TWideStringField;
    tblDecisionCAMPO_SUMARIO_50: TWideStringField;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    cxButton4: TcxButton;
    tblDecisionGRUPO: TWideStringField;
    grd1DBTableView1Column1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblDecisionBeforeDelete(DataSet: TDataSet);
    procedure tblDecisionBeforePost(DataSet: TDataSet);
    procedure tblDecisionFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoDecision : boolean;
  end;

var
  frmDecisionCube: TfrmDecisionCube;

implementation

uses uFuncoes, uManDecision, uPermissoesDecision;


{$R *.dfm}

procedure TfrmDecisionCube.cxButton4Click(Sender: TObject);
begin
    tblDecision.Close;
    tblDecision.Open;
end;

procedure TfrmDecisionCube.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblDecision.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmDecisionCube.FormCreate(Sender: TObject);
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

    sSkin                       := sAux.Lines.Strings[0];
    sSGBD                       := sAux.Lines.Strings[3];
    sUsuario                    := sAux.Lines.Strings[4];
    sBanco                      := sAux.Lines.Strings[5];
    sPermissaoPermissaoDecision := StrToBool(sAux.Lines.Strings[6]);

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

procedure TfrmDecisionCube.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblDecision.Close;
    tblDecision.Filtered := True;
    tblDecision.Open;
end;

procedure TfrmDecisionCube.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmDecisionCube.SpeedButton2Click(Sender: TObject);
begin
    if frmManDecision = nil then
    begin
        frmManDecision := TfrmManDecision.Create(Self);
        frmManDecision.Tipo := 'Criar';
        frmManDecision.ShowModal;
        FreeAndNil(frmManDecision);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManDecision);
    end;
end;

procedure TfrmDecisionCube.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblDecision.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(tblDecisionPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblDecisionPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblDecisionPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblDecisionPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_361'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblDecision.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_362') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmDecisionCube.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if not tblDecision.IsEmpty then
    begin
        if frmManDecision = nil then
        begin
            lPode := False;
            if EncontraLista(tblDecisionPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
            if EncontraLista(tblDecisionPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
            if EncontraLista(tblDecisionPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
            if EncontraLista(tblDecisionPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManDecision := TfrmManDecision.Create(Self);
            frmManDecision.Tipo := 'Alterar';
            frmManDecision.ShowModal;
            FreeAndNil(frmManDecision);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManDecision);
        end;
    end;
end;

procedure TfrmDecisionCube.SpeedButton7Click(Sender: TObject);
begin
    if not tblDecision.IsEmpty then
    begin
        if sPermissaoPermissaoDecision = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesDecision = nil then
        begin
            frmPermissoesDecision := TfrmPermissoesDecision.Create(Self);
            frmPermissoesDecision.ShowModal;
            FreeAndNil(frmPermissoesDecision);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesDecision);
        end;
    end;
end;

procedure TfrmDecisionCube.tblDecisionBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblDecisionID_DECISION.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES',          'ID_DECISION',aux) then Abort;
        if not DeleteCascade(bdDados,0,'DECISION_USUARIO', 'ID_DECISION',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS_DECISION','ID_DECISION',aux) then Abort;
    end;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmDecisionCube.tblDecisionBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
        auxAntigo := #39 + tblDecisionID_DECISION.OldValue + #39;
        auxNovo   := #39 + tblDecisionID_DECISION.Value    + #39;
    except
        lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES',          'ID_DECISION',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'DECISION_USUARIO', 'ID_DECISION',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS_DECISION','ID_DECISION',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmDecisionCube.tblDecisionFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

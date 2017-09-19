unit uDynamics;

interface

uses
  xhConsts,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  ADODB, cxButtons,

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
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer, cxCheckBox,
  cxMemo, cxTextEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmDynamics = class(TForm)
    dtsDynamics: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton7: TcxButton;
    SpeedButton6: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    DBEdit2: TcxDBTextEdit;
    DBMemo2: TcxDBMemo;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label4: TcxLabel;
    cxLabel1: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxDBCheckBox1: TcxDBCheckBox;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblDynamics: TADOTable;
    tblDynamicsID_DYNAMICS: TWideStringField;
    tblDynamicsID_ANALISE: TWideStringField;
    tblDynamicsDESCRICAO: TMemoField;
    tblDynamicsPODE_VISUALIZAR: TMemoField;
    tblDynamicsPODE_ALTERAR: TMemoField;
    tblDynamicsPODE_APAGAR: TMemoField;
    tblDynamicsPEDE_FILTRO: TWideStringField;
    tblDynamicsDT_CRIACAO: TDateTimeField;
    tblDynamicsSQL: TWideMemoField;
    cxButton4: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblDynamicsBeforeDelete(DataSet: TDataSet);
    procedure tblDynamicsBeforePost(DataSet: TDataSet);
    procedure tblDynamicsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sPermissaoPermissaoDynamics : boolean;
    sTempDirUsuario : string;
  end;

var
  frmDynamics: TfrmDynamics;

implementation

uses uFuncoes, uPermissoesDynamics, uVisualizarDadosDynamics, uManDynamics;

{$R *.dfm}

procedure TfrmDynamics.cxButton4Click(Sender: TObject);
begin
    tblDynamics.Close;
    tblDynamics.Open;
end;

procedure TfrmDynamics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblDynamics.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmDynamics.FormCreate(Sender: TObject);
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
    sPermissaoPermissaoDynamics := StrToBool(sAux.Lines.Strings[6]);
    sTempDirUsuario             := 'C:\Analyzer\Temp\' + sUsuario + '\';

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

procedure TfrmDynamics.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblDynamics.Close;
    tblDynamics.Filtered := True;
    tblDynamics.Open;
end;

procedure TfrmDynamics.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmDynamics.SpeedButton4Click(Sender: TObject);
var
    lPode : boolean;
begin
    if tblDynamics.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(tblDynamicsPODE_APAGAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblDynamicsPODE_APAGAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblDynamicsPODE_APAGAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblDynamicsPODE_APAGAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_134'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblDynamics.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_135') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmDynamics.SpeedButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if tblDynamics.IsEmpty = False then
    begin
        if frmManDynamics = nil then
        begin
            lPode := False;
            if EncontraLista(tblDynamicsPODE_ALTERAR.Value,'#*'          ,',') then lPode := False else
            if EncontraLista(tblDynamicsPODE_ALTERAR.Value,'#' + sUsuario,',') then lPode := False else
            if EncontraLista(tblDynamicsPODE_ALTERAR.Value,'*'           ,',') then lPode := True  else
            if EncontraLista(tblDynamicsPODE_ALTERAR.Value,sUsuario      ,',') then lPode := True;

            if not lPode then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
                exit;
            end;

            frmManDynamics := TfrmManDynamics.Create(Self);
            frmManDynamics.Tipo := 'Alterar';
            frmManDynamics.ShowModal;
            FreeAndNil(frmManDynamics);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManDynamics);
        end;
    end;
end;

procedure TfrmDynamics.SpeedButton7Click(Sender: TObject);
begin
    if tblDynamics.IsEmpty = False then
    begin
        if sPermissaoPermissaoDynamics = False then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmPermissoesDynamics = nil then
        begin
            frmPermissoesDynamics := TfrmPermissoesDynamics.Create(Self);
            frmPermissoesDynamics.ShowModal;
            FreeAndNil(frmPermissoesDynamics);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmPermissoesDynamics);
        end;
    end;
end;

procedure TfrmDynamics.tblDynamicsBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblDynamicsID_DYNAMICS.AsString + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteCascade(bdDados,0,'PADROES',          'ID_DYNAMICS',aux) then Abort;
        if not DeleteCascade(bdDados,0,'CENARIOS_DYNAMICS','ID_DYNAMICS',aux) then Abort;
    end;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmDynamics.tblDynamicsBeforePost(DataSet: TDataSet);
var
    aux, auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       aux := #39 + tblDynamicsID_ANALISE.Value + #39;
    except
       lPode := False;
    end;
    if lPode then
       if not Integridade(bdDados,0,'ANALISES','ID_ANALISE',aux) then abort;

    lPode := True;
    try
       auxAntigo := #39 + tblDynamicsID_DYNAMICS.OldValue + #39;
       auxNovo   := #39 + tblDynamicsID_DYNAMICS.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados,0,'PADROES',          'ID_DYNAMICS',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados,0,'CENARIOS_DYNAMICS','ID_DYNAMICS',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmDynamics.tblDynamicsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,sUsuario,',') then
       Accept := True;
end;

procedure TfrmDynamics.SpeedButton6Click(Sender: TObject);
var
    lPode : boolean;
begin
    if tblDynamics.IsEmpty = False then
    begin
        lPode := False;
        if EncontraLista(tblDynamicsPODE_VISUALIZAR.Value,'#*'          ,',') then lPode := False else
        if EncontraLista(tblDynamicsPODE_VISUALIZAR.Value,'#' + sUsuario,',') then lPode := False else
        if EncontraLista(tblDynamicsPODE_VISUALIZAR.Value,'*'           ,',') then lPode := True  else
        if EncontraLista(tblDynamicsPODE_VISUALIZAR.Value,sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if frmVisualizarDadosDynamics = nil then
        begin
            frmVisualizarDadosDynamics := TfrmVisualizarDadosDynamics.Create(Self);
            frmVisualizarDadosDynamics.ShowModal;
            FreeAndNil(frmVisualizarDadosDynamics);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmVisualizarDadosDynamics);
        end;
    end;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

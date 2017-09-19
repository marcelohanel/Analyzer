unit uUsuarios;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls,
  cxButtons,
  cxDBEdit,
  cxTextEdit, cxGridLevel,
  cxGridDBTableView,
  cxGrid, cxLabel,









  ADODB, cxLookAndFeels,
  dxSkinsForm, cxLocalization,
  CEVersionInfo, cxGraphics, cxLookAndFeelPainters, Menus, cxControls, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxContainer, cxImage, cxMemo,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxCheckBox;

type
  TfrmUsuarios = class(TForm)
    DataSource1: TDataSource;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton4: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DBEdit1: TcxDBTextEdit;
    Label1: TcxLabel;
    Label3: TcxLabel;
    DBMemo1: TcxDBMemo;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBImage1: TcxDBImage;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    bdArmazena: TADOConnection;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    tblUsuarios: TADOTable;
    tblUsuariosID_USUARIO: TWideStringField;
    tblUsuariosNOME: TWideStringField;
    tblUsuariosSENHA: TWideStringField;
    tblUsuariosACESSA_USUARIOS: TWideStringField;
    tblUsuariosACESSA_VISOES: TWideStringField;
    tblUsuariosACESSA_RELATORIOS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ANALISES: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_RELATORIOS: TWideStringField;
    tblUsuariosBASE_DADOS: TMemoField;
    tblUsuariosBASE_DADOS_PEDE_SENHA: TWideStringField;
    tblUsuariosACESSA_SCORED: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_SCORED: TWideStringField;
    tblUsuariosACESSA_DYNAMICS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_DYNAMICS: TWideStringField;
    tblUsuariosACESSA_ABC: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ABC: TWideStringField;
    tblUsuariosACESSA_CUBO: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_CUBO: TWideStringField;
    tblUsuariosACESSA_FOTOGRAFIA: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA: TWideStringField;
    tblUsuariosACESSA_FREQUENCIA: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_FREQUENCIA: TWideStringField;
    tblUsuariosSCHEDULER_CAMINHO: TWideStringField;
    tblUsuariosACESSA_SMARTDOCS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_SMARTDOCS: TWideStringField;
    tblUsuariosSESSAO: TStringField;
    tblUsuariosLOGADO: TStringField;
    tblUsuariosLOCAL_ATUALIZACOES: TWideStringField;
    tblUsuariosATUALIZA_ONLINE: TWideStringField;
    tblUsuariosSGBD: TWideStringField;
    tblUsuariosSKIN: TWideStringField;
    tblUsuariosIMAGEM: TBlobField;
    tblUsuariosACESSA_ACCESS: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_ACCESS: TWideStringField;
    tblUsuariosACESSA_REPORT: TWideStringField;
    tblUsuariosLINK_REPORT: TWideStringField;
    tblUsuariosACESSA_VISIO: TWideStringField;
    tblUsuariosACESSA_PARAMETROS: TWideStringField;
    tblUsuariosMAIL: TWideStringField;
    tblUsuariosSENHA_MAIL: TWideStringField;
    tblUsuariosUSER_MAIL: TWideStringField;
    tblUsuariosACESSA_GEO_ANALISE: TWideStringField;
    tblUsuariosACESSA_PERMISSOES_GEO_ANALISE: TWideStringField;
    tblUsuariosACESSA_LOGS: TWideStringField;
    tblUsuariosGERA_LOG: TWideStringField;
    tblLogin: TADOTable;
    tblLoginSESSAO: TWideStringField;
    tblLoginID_USUARIO: TWideStringField;
    tblLoginDATA: TDateTimeField;
    tblLoginHORA: TDateTimeField;
    tblParametros: TADOTable;
    tblParametrosVERSAO_BASE: TIntegerField;
    tblParametrosSERVIDOR_MAIL: TWideStringField;
    tblParametrosPORTA_MAIL: TIntegerField;
    tblUsuariosACESSA_PERMISSOES_VISIO: TWideStringField;
    cxButton4: TcxButton;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    tblUsuariosCOD_USUARIO: TIntegerField;
    tblUsuariosACESSA_WEBBI: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblUsuariosCalcFields(DataSet: TDataSet);
    procedure tblUsuariosBeforeDelete(DataSet: TDataSet);
    procedure tblUsuariosBeforePost(DataSet: TDataSet);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsuario : string;
    sSGBD : string;
    sSkin : string;
    sBanco : string;
    sTempDirUsuario : string;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses uFuncoes, uCopiarPadroes, uManUsuarios;

{$R *.dfm}

procedure TfrmUsuarios.cxButton2Click(Sender: TObject);
begin
    if not tblUsuarios.IsEmpty then
    begin
        if frmCopiarPadroes = nil then
        begin
            frmCopiarPadroes := TfrmCopiarPadroes.Create(Self);

            frmCopiarPadroes.edtUsuario.Text := tblUsuariosID_USUARIO.AsString;

            frmCopiarPadroes.ShowModal;
            FreeAndNil(frmCopiarPadroes);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmCopiarPadroes);
        end;
    end;
end;

procedure TfrmUsuarios.cxButton3Click(Sender: TObject);
begin
    if not tblUsuarios.IsEmpty then
    begin
        if MessageDlg(HCLResourceStrings.FindID('sString_373'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
        begin
            qryAtualiza.Close;
            qryAtualiza.SQL.Clear;
            qryAtualiza.SQL.Add('DELETE FROM LOGS');
            qryAtualiza.SQL.Add('WHERE ID_USUARIO = ' + #39 + tblUsuariosID_USUARIO.Value + #39);
            qryAtualiza.ExecSQL;
            qryAtualiza.Close;

            MessageDlg(HCLResourceStrings.FindID('sString_59'), mtInformation, [mbOK], 0);
        end;
    end;
end;

procedure TfrmUsuarios.cxButton4Click(Sender: TObject);
begin
    tblUsuarios.Close;
    tblUsuarios.Open;
end;

procedure TfrmUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblUsuarios.Close;
    tblLogin.Close;

    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
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

    sSkin    := sAux.Lines.Strings[0];
    sSGBD    := sAux.Lines.Strings[3];
    sUsuario := sAux.Lines.Strings[4];
    sBanco   := sAux.Lines.Strings[5];

    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

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

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblLogin.Open;
    tblUsuarios.Open;
end;

procedure TfrmUsuarios.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmUsuarios.SpeedButton2Click(Sender: TObject);
begin
    if frmManUsuarios = nil then
    begin
        frmManUsuarios := TfrmManUsuarios.Create(Self);
        frmManUsuarios.cTipo := 'Criar';
        frmManUsuarios.ShowModal;
        FreeAndNil(frmManUsuarios);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmManUsuarios);
    end;
end;

procedure TfrmUsuarios.SpeedButton3Click(Sender: TObject);
var
    cUsuario : string;
begin
    if not tblUsuarios.IsEmpty then
    begin
        if frmManUsuarios = nil then
        begin
            cUsuario := tblUsuariosID_USUARIO.AsString;

            frmManUsuarios := TfrmManUsuarios.Create(Self);
            frmManUsuarios.cTipo := 'Alterar';
            frmManUsuarios.ShowModal;
            FreeAndNil(frmManUsuarios);

            tblUsuarios.Close;
            tblUsuarios.Open;
            tblUsuarios.Locate('ID_USUARIO', cUsuario, []);
        end
        else
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
            FreeAndNil(frmManUsuarios);
        end;
    end;
end;

procedure TfrmUsuarios.SpeedButton4Click(Sender: TObject);
begin
    if not tblUsuarios.IsEmpty then
    begin
        if tblUsuariosID_USUARIO.Value = sUsuario then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_41'), mtInformation, [mbOK], 0);
            Exit;
        end;

        try
           if MessageDlg(HCLResourceStrings.FindID('sString_42'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              tblUsuarios.Delete;
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_44') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
           end;
        end;
    end;
end;

procedure TfrmUsuarios.tblUsuariosBeforeDelete(DataSet: TDataSet);
var
    aux : string;
    lPode : boolean;
    aux1 : string;
begin
    if tblUsuariosID_USUARIO.Value = sUsuario then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_41'), mtInformation, [mbOK], 0);
        Abort;
    end;

    lPode := True;
    try
       aux := #39 + tblUsuariosID_USUARIO.AsString + #39;
    except
       lPode := False;
    end;

    lPode := True;
    try
       aux1 := tblUsuariosCOD_USUARIO.AsString;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not DeleteRestrict(bdDados,0,'EXCEL_TITULO_ASSINATURAS','COD_USUARIO', aux1) then Abort;

        if not DeleteCascade(bdDados, 0,'PADROES',          'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'CENARIOS',         'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'CENARIOS_DYNAMICS','ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'LOGIN',            'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'LOGS',             'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'DECISION_USUARIO', 'ID_USUARIO',aux) then Abort;
        if not DeleteCascade(bdDados, 0,'CENARIOS_DECISION','ID_USUARIO',aux) then Abort;
    end;

    GeraLog(bdDados,sUsuario,DataSet.Name,HCLResourceStrings.FindID('sString_358'),'Chave: ' + aux);
end;

procedure TfrmUsuarios.tblUsuariosBeforePost(DataSet: TDataSet);
var
    auxAntigo, auxNovo : string;
    lPode : boolean;
begin
    lPode := True;
    try
       auxAntigo := #39 + tblUsuariosID_USUARIO.OldValue + #39;
       auxNovo   := #39 + tblUsuariosID_USUARIO.Value    + #39;
    except
       lPode := False;
    end;

    if lPode then
    begin
        if not UpdateCascade(bdDados, 0,'LOGIN',            'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'LOGS',             'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'PADROES',          'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'CENARIOS_CUBO',    'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'CENARIOS',         'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'CENARIOS_DYNAMICS','ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'DECISION_USUARIO', 'ID_USUARIO',auxAntigo, auxNovo) then Abort;
        if not UpdateCascade(bdDados, 0,'CENARIOS_DECISION','ID_USUARIO',auxAntigo, auxNovo) then Abort;
    end;
end;

procedure TfrmUsuarios.tblUsuariosCalcFields(DataSet: TDataSet);
begin
    if tblUsuariosSESSAO.Value <> '' then
       tblUsuariosLOGADO.Value := 'Sim'
    else
       tblUsuariosLOGADO.Value := '';
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

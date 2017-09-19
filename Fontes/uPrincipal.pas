unit uPrincipal;

interface

uses
  ShellApi, Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, FileCtrl,
  cxButtons,
  ExtCtrls,




  cxLookAndFeels, xhConsts,
  cxLocalization, Menus,
  dxLayoutLookAndFeels, dxBar, dxSkinsForm, ADODB, cxTL,
  ActnList, ImgList, dxLayoutControl, cxPC,
  CEVersionInfo, cxCustomData,








  cxGroupBox,
  cxDropDownEdit, cxGraphics, cxControls, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxTextEdit, cxTLdxBarBuiltInMenu, cxContainer,
  cxEdit, dxSkinsdxBarPainter, cxMaskEdit, cxInplaceContainer, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  DBClient, cxBlobEdit, cxImageComboBox, cxDBTL, cxTLData, cxMemo,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu;

function GetAtualizaModulo(Atualiza, Modulo: string): string;

type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    Memo1: TMemo;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    ImageList2: TImageList;
    dxSkinController1: TdxSkinController;
    cxPageControl2: TcxPageControl;
    cxTabSheet16: TcxTabSheet;
    cxTabSheet17: TcxTabSheet;
    cxButton1: TcxButton;
    dxBarButton1: TcxButton;
    dxBarButton2: TcxButton;
    dxBarLargeButton7: TcxButton;
    dxBarLargeButton8: TcxButton;
    dxBarLargeButton11: TcxButton;
    dxBarLargeButton12: TcxButton;
    dxBarLargeButton9: TcxButton;
    dxBarLargeButton14: TcxButton;
    dxBarLargeButton15: TcxButton;
    dxBarLargeButton21: TcxButton;
    dxBarLargeButton13: TcxButton;
    dxBarLargeButton10: TcxButton;
    dxBarLargeButton16: TcxButton;
    dxBarLargeButton18: TcxButton;
    dxBarLargeButton17: TcxButton;
    dxBarLargeButton19: TcxButton;
    dxBarLargeButton6: TcxButton;
    dxBarLargeButton20: TcxButton;
    btnLogs: TcxButton;
    dxBarLargeButton5: TcxButton;
    dxBarLargeButton4: TcxButton;
    dxBarLargeButton2: TcxButton;
    dxBarLargeButton23: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cbxSkin: TcxComboBox;
    cxGridMenuDBTableView1: TcxGridDBTableView;
    cxGridMenuLevel1: TcxGridLevel;
    cxGridMenu: TcxGrid;
    cdsMenu: TClientDataSet;
    cdsMenuferramenta: TStringField;
    cdsMenuid_ferramenta: TStringField;
    cdsMenudescricao: TMemoField;
    dtsMenu: TDataSource;
    cxGridMenuDBTableView1ferramenta: TcxGridDBColumn;
    cxGridMenuDBTableView1id_ferramenta: TcxGridDBColumn;
    cxGridMenuDBTableView1descricao: TcxGridDBColumn;
    cxButton2: TcxButton;
    cxGridMenuDBTableView1cor: TcxGridDBColumn;
    cdsMenucor: TStringField;
    cdsMenugrupo: TStringField;
    cxGridMenuDBTableView1grupo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    dxBarLargeButton22: TcxButton;
    procedure ChamaDesigner(Analise: string);
    procedure ChamaReport(Report, Tipo: string);
    procedure ChamaAccess(Access: string);
    procedure ChamaVisio(Visio: string);
    procedure ChamaSmartDocs(SmartDocs: string);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChamaABC(ABC: string);
    procedure ChamaGeo(Geo: string);
    procedure ChamaDecisionCube(Decision: string);
    procedure ChamaFotografia(Fotografia: string);
    procedure ChamaFrequencia(Frequencia: string);
    procedure ChamaScored(Scored: string);
    procedure AtualizaAnalise;
    procedure AtualizaScored;
    procedure VerificaSessao(Tipo: integer);
    procedure ChamaDynamics(Dynamics: string);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure VerificaAtualizacoes(Tipo: Integer);
    procedure MontaSkin;
    procedure LeChave;
    procedure LeUsuario;
    procedure SalvaEncerra;
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
    procedure dxBarLargeButton21Click(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton16Click(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton17Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure dxBarLargeButton20Click(Sender: TObject);
    procedure btnLogsClick(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton23Click(Sender: TObject);
    procedure cbxSkinPropertiesChange(Sender: TObject);
    procedure MontaMenuPrincipal;
    procedure CriaEntradaMenu(Tipo: string; Query: TADOQuery);
    procedure SalvaGridMenu;
    procedure RestoreGridMenu;
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridMenuDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridMenuDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    lCancFiltroPersonalizado           : Boolean;
    lAtualizaBatch                     : boolean;
    sUsuario                           : string;
    sMail                              : string;
    sUserMail                          : string;
    sSenhaMail                         : string;
    sSenha                             : string;
    sSessao                            : string;
    sBanco                             : string;
    sCaminhoAtualiza                   : string;
    sSGBD                              : string;
    sAtualizaOnLine                    : Boolean;
    sMaxUsuario                        : integer;
    sPermissaoParametro                : Boolean;
    sPermissaoLogs                     : Boolean;
    sPermissaoWebBI                    : Boolean;
    sPermissaoAnalise                  : Boolean;
    sPermissaoSmartDocs                : Boolean;
    sPermissaoAccess                   : Boolean;
    sPermissaoVisio                    : Boolean;
    sPermissaoGeo                      : Boolean;
    sPermissaoReport                   : Boolean;
    sPermissaoUsuario                  : Boolean;
    sPermissaoRelatorio                : Boolean;
    sPermissaoScored                   : Boolean;
    sPermissaoDynamics                 : Boolean;
    sPermissaoABC                      : Boolean;
    sPermissaoCubo                     : Boolean;
    sPermissaoFotografia               : Boolean;
    sPermissaoFrequencia               : Boolean;
    sPermissaoPermissaoAnalise         : Boolean;
    sPermissaoPermissaoSmartDocs       : Boolean;
    sPermissaoPermissaoAccess          : Boolean;
    sPermissaoPermissaoVisio           : Boolean;
    sPermissaoPermissaoGeo             : Boolean;
    sPermissaoPermissaoRelatorio       : Boolean;
    sPermissaoPermissaoScored          : Boolean;
    sPermissaoPermissaoDynamics        : Boolean;
    sPermissaoPermissaoABC             : Boolean;
    sPermissaoPermissaoCubo            : Boolean;
    sPermissaoPermissaoFotografia      : Boolean;
    sPermissaoPermissaoFrequencia      : Boolean;
    sVersao                            : string;
    sConexao                           : string;
    sSenhaBancoDados                   : string;
    cABC                               : string;
    cCubo                              : string;
    cFotografia                        : string;
    cFrequencia                        : string;
    dValidade                          : string;
    cAlteraDesigner                    : boolean;
    sUsuarioChave                      : string;
    sBotao                             : string;
    lBotaoCustomiza                    : boolean;
    sTempDirUsuario                    : string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uModule, uAguarde, uLogin,
  uFuncoes, uFiltro, uExcel;

{$R *.dfm}

procedure TfrmPrincipal.AtualizaAnalise;
var
    comando : TStrings;
begin
    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoAnalise));
    comando.Add(BoolToStr(lAtualizaBatch));
    comando.Add('SIM');
    comando.Add(ParamStr(3));
    comando.SaveToFile(sTempDirUsuario + 'comandosanalise.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManAnalises.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosanalise.txt"'),SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.AtualizaScored;
var
    comando : TStrings;
begin
    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoScored));
    comando.Add(BoolToStr(lAtualizaBatch));
    comando.Add(sMail);
    comando.Add(sUserMail);
    comando.Add(sSenhaMail);
    comando.Add('True');
    comando.Add(ParamStr(3));

    comando.SaveToFile(sTempDirUsuario + 'comandosscored.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManScoredCard.exe'),
                pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosscored.txt"'),SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.btnLogsClick(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoLogs = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.SaveToFile(sTempDirUsuario + 'comandoslogs.txt');
    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pLogs.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandoslogs.txt"'),
                 nil, sw_shownormal);

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.cbxSkinPropertiesChange(Sender: TObject);
begin
    if cbxSkin.Text <> 'Nenhum' then
    begin
       dxSkinController1.SkinName := cbxSkin.Text;
       dxSkinController1.UseSkins := True;
    end
    else
    begin
       dxSkinController1.UseSkins := False;
       dxSkinController1.SkinName := cbxSkin.Text;
    end;
end;

procedure TfrmPrincipal.LeChave;
var
    f : textfile;
    aux1  : string;
    aux3  : string;
    aux4  : string;
    aux5  : string;
    aux6  : string;
    aux7  : string;
    aux8  : string;
    aux10 : string;
    aux11 : string;
    aux12 : string;
    aux13 : string;
    aux14 : string;
    aux15 : string;
    aux16 : string;
    aux17 : string;
    aux18 : string;
    aux19 : string;
    aux20 : string;
    aux21 : string;
    aux22 : string;
    aux23 : string;
    aux24 : string;
    aux25 : string;
    aux26 : string;
    aux27 : string;
    aux28 : string;
    aux29 : string;
    aux30 : string;
    aux31 : string;
    aux32 : string;
    aux33 : string;
    aux34 : string;
    aux35 : string;
    aux36 : string;
    aux37 : string;
    aux38 : string;
    aux39 : string;
    aux40 : string;
    aux41 : string;
    aux42 : string;
    i : integer;
begin
    try
        if not FileExists(ExtractFilePath(Application.ExeName) + 'Chave.sec') then
        begin
           if (MessageDlg(HCLResourceStrings.FindID('sString_1')  + #13+#10 +
                          HCLResourceStrings.FindID('sMessage')   + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        AssignFile(f,ExtractFilePath(Application.ExeName) + 'Chave.sec');
        Reset(f);
        ReadLn(f,aux1);  // Arquivo
        ReadLn(f,sUsuarioChave);  // Usuário:
        ReadLn(f,aux3);  // Código:
        ReadLn(f,aux4);  // Versão:
        ReadLn(f,aux18); // Data de Validade;
        ReadLn(f,aux19); // Validar Informações de Hardware;
        ReadLn(f,aux6);  // Módulo de Análises
        ReadLn(f,aux7);  // Módulo de Relatórios
        ReadLn(f,aux8);  // Módulo de SmartDocs
        ReadLn(f,aux10); // Módulo de Scored Cards
        ReadLn(f,aux11); // Módulo de Dynamics
        ReadLn(f,aux13); // Módulo de Análise ABC
        ReadLn(f,aux15); // Módulo de Análise Cubo
        ReadLn(f,aux16); // Módulo de Análise Fotográfica
        ReadLn(f,aux17); // Módulo de Análise Frequencia
        ReadLn(f,aux14); // Módulo de Scheduler
        ReadLn(f,aux20); // Módulo de Access
        ReadLn(f,aux22); // Módulo de Reporting Services
        ReadLn(f,aux23); // Módulo de Visio
        ReadLn(f,aux24); // Módulo de GeoAnalises
        ReadLn(f,aux25); // RETIRADO Módulo de Decision MySQL
        ReadLn(f,aux26); // Módulo de WebBI

        ReadLn(f,aux27); // Módulo Reserva
        ReadLn(f,aux28); // Módulo Reserva
        ReadLn(f,aux29); // Módulo Reserva
        ReadLn(f,aux30); // Módulo Reserva
        ReadLn(f,aux31); // Módulo Reserva
        ReadLn(f,aux32); // Módulo Reserva
        ReadLn(f,aux33); // Módulo Reserva
        ReadLn(f,aux34); // Módulo Reserva
        ReadLn(f,aux35); // Módulo Reserva
        ReadLn(f,aux36); // Módulo Reserva
        ReadLn(f,aux37); // Módulo Reserva
        ReadLn(f,aux38); // Módulo Reserva
        ReadLn(f,aux39); // Módulo Reserva
        ReadLn(f,aux40); // Módulo Reserva
        ReadLn(f,aux41); // Módulo Reserva
        ReadLn(f,aux42); // Módulo Reserva

        ReadLn(f,aux5);  // Tamanho:
        ReadLn(f,aux12); // Senha Banco Dados:
        ReadLn(f,aux21); // Número de Usuários

        aux1  := EnDecryptString(aux1);
        sUsuarioChave := EnDecryptString(sUsuarioChave);
        aux3  := EnDecryptString(aux3);
        aux4  := EnDecryptString(aux4);
        aux5  := EnDecryptString(aux5);
        aux6  := EnDecryptString(aux6);
        aux7  := EnDecryptString(aux7);
        aux8  := EnDecryptString(aux8);
        aux10 := EnDecryptString(aux10);
        aux11 := EnDecryptString(aux11);
        aux12 := EnDecryptString(aux12);
        aux13 := EnDecryptString(aux13);
        aux14 := EnDecryptString(aux14);
        aux15 := EnDecryptString(aux15);
        aux16 := EnDecryptString(aux16);
        aux17 := EnDecryptString(aux17);
        aux18 := EnDecryptString(aux18);
        aux19 := EnDecryptString(aux19);
        aux20 := EnDecryptString(aux20);
        aux21 := EnDecryptString(aux21);
        aux22 := EnDecryptString(aux22);
        aux23 := EnDecryptString(aux23);
        aux24 := EnDecryptString(aux24);
        aux25 := EnDecryptString(aux25);
        aux26 := EnDecryptString(aux26);
        aux27 := EnDecryptString(aux27);
        aux28 := EnDecryptString(aux28);
        aux29 := EnDecryptString(aux29);
        aux30 := EnDecryptString(aux30);
        aux31 := EnDecryptString(aux31);
        aux32 := EnDecryptString(aux32);
        aux33 := EnDecryptString(aux33);
        aux34 := EnDecryptString(aux34);
        aux35 := EnDecryptString(aux35);
        aux36 := EnDecryptString(aux36);
        aux37 := EnDecryptString(aux37);
        aux38 := EnDecryptString(aux38);
        aux39 := EnDecryptString(aux39);
        aux40 := EnDecryptString(aux40);
        aux41 := EnDecryptString(aux41);
        aux42 := EnDecryptString(aux42);

        if (aux27 <> 'Módulo Reserva: NÃO') or
           (aux28 <> 'Módulo Reserva: NÃO') or
           (aux29 <> 'Módulo Reserva: NÃO') or
           (aux30 <> 'Módulo Reserva: NÃO') or
           (aux31 <> 'Módulo Reserva: NÃO') or
           (aux32 <> 'Módulo Reserva: NÃO') or
           (aux33 <> 'Módulo Reserva: NÃO') or
           (aux34 <> 'Módulo Reserva: NÃO') or
           (aux35 <> 'Módulo Reserva: NÃO') or
           (aux36 <> 'Módulo Reserva: NÃO') or
           (aux37 <> 'Módulo Reserva: NÃO') or
           (aux38 <> 'Módulo Reserva: NÃO') or
           (aux39 <> 'Módulo Reserva: NÃO') or
           (aux40 <> 'Módulo Reserva: NÃO') or
           (aux41 <> 'Módulo Reserva: NÃO') or
           (aux41 <> 'Módulo Reserva: NÃO') then
        begin
           if (MessageDlg(HCLResourceStrings.FindID('sString_3') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        dValidade := Copy(aux18,10,10);

        try
           sMaxUsuario := StrToInt(aux21);
        except
           if (MessageDlg(HCLResourceStrings.FindID('sString_3') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        try
           StrToDate(Copy(aux18,10,10));
        except
           if (MessageDlg(HCLResourceStrings.FindID('sString_3') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        if StrToDate(Copy(aux18,10,10)) < Date then
        begin
           if (MessageDlg(HCLResourceStrings.FindID('sString_4') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        if not (aux19 = 'Validar Informações de Hardware: NÃO') then
        begin
            if copy(aux3,8,length(aux3)) <> SerialNum('C') then
            begin
               if (MessageDlg(HCLResourceStrings.FindID('sString_4') + #13+#10 +
                              HCLResourceStrings.FindID('sMessage') + #13+#10 +
                              HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                              HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                              HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                   dxBarLargeButton4.OnClick(Self);

               Application.Terminate;
            end;
        end;

        if copy(aux4,8,length(aux4)) <> sVersao then
        begin
           if (MessageDlg(HCLResourceStrings.FindID('sString_6') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;

        i := Length(aux1) + Length(sUsuarioChave) + Length(aux3) + Length(aux4);
        if copy(aux5,9,length(aux5)) <> IntToStr(i - 30) then
        begin
           if (MessageDlg(HCLResourceStrings.FindID('sString_3') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                          HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               dxBarLargeButton4.OnClick(Self);

           Application.Terminate;
        end;
    except
        MessageDlg(HCLResourceStrings.FindID('sString_8') +#13+#10 +
                   HCLResourceStrings.FindID('sString_371'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    sSenhaBancoDados := aux12;

    if aux6 <> 'Módulo de Análises: SIM' then
       dxBarLargeButton8.Enabled := False;

    if aux7 <> 'Módulo de Relatórios: SIM' then
       dxBarLargeButton14.Enabled := False;

    if aux8 <> 'Módulo de SmartDocs: SIM' then
       dxBarLargeButton16.Enabled := False;

    if aux10 <> 'Módulo de Scored Cards: SIM' then
       dxBarLargeButton15.Enabled := False;

    if aux11 <> 'Módulo de Dynamics: SIM' then
       dxBarLargeButton13.Enabled := False;

    if aux13 <> 'Módulo de Análise ABC: SIM' then
       dxBarLargeButton9.Enabled := False;

    if aux14 <> 'Módulo de Scheduler: SIM' then
       dxBarLargeButton7.Enabled := False;

    if aux15 <> 'Módulo de Análise Cubo: SIM' then
       dxBarLargeButton10.Enabled := False;

    if aux16 <> 'Módulo de Análise Fotográfica: SIM' then
       dxBarLargeButton11.Enabled := False;

    if aux17 <> 'Módulo de Análise Freqüência: SIM' then
       dxBarLargeButton12.Enabled := False;

    if aux20 <> 'Módulo de Access: SIM' then
       dxBarLargeButton17.Enabled := False;

    if aux22 <> 'Módulo de Reporting: SIM' then
       dxBarLargeButton18.Enabled := False;

    if aux23 <> 'Módulo de Visio: SIM' then
       dxBarLargeButton19.Enabled := False;

    if aux24 <> 'Módulo de GeoAnalises: SIM' then
       dxBarLargeButton21.Enabled := False;

    if aux26 <> 'Módulo de WebBI: SIM' then
       dxBarLargeButton22.Enabled := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    cAlteraDesigner := False;
    cABC            := '';
    cCubo           := '';
    cFotografia     := '';
    cFrequencia     := '';

    sVersao  := '2010';

    LeChave;

    dtmPrincipal := TdtmPrincipal.Create(Self);
    dtmPrincipal.InicializaBanco;
    dtmPrincipal.CriaBaseDados;

    dtmPrincipal.tblUsuarios.Open;

    lAtualizaBatch := False;
    if ParamStr(1) = '/UPDATE' then
    begin
        lAtualizaBatch := True;

        frmLogin := TfrmLogin.Create(Self);
        frmLogin.edtUsuario.Text := 'admin';
        frmLogin.BitBtn1.OnClick(Self);
        FreeAndNil(frmLogin);
    end;

    if not lAtualizaBatch then
    begin
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.ShowModal;
        FreeAndNil(frmLogin);
    end;

    LeUsuario;

    if not DirectoryExists('C:\Analyzer\Temp\' + sUsuario) then
       ForceDirectories('C:\Analyzer\Temp\' + sUsuario);

    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    if lAtualizaBatch then
    begin
        if ParamStr(2) = '/ANALISE' then
           AtualizaAnalise;

        if ParamStr(2) = '/SCORED' then
           AtualizaScored;

        Application.Terminate;
    end;

    cdsMenu.CreateDataSet;

    MontaMenuPrincipal;
    RestoreGridMenu;

    if sAtualizaOnLine then
       VerificaAtualizacoes(0);

    GeraLog(dtmPrincipal.bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmPrincipal.LeUsuario;
begin
    sSessao := IntToStr(Random(99999));
    sSessao := sSessao + IntToStr(Random(99999));
    sSessao := sSessao + IntToStr(Random(99999));
    sSessao := sSessao + IntToStr(Random(99999));
    sSessao := sSessao + IntToStr(Random(99999));

    VerificaSessao(3);
    VerificaSessao(0);

    try
      dtmPrincipal.bdArmazena.Close;

      if dtmPrincipal.tblUsuariosBASE_DADOS.Value <> '' then
         dtmPrincipal.bdArmazena.ConnectionString := dtmPrincipal.tblUsuariosBASE_DADOS.Value
      else
         dtmPrincipal.bdArmazena.ConnectionString := dtmPrincipal.bdDados.ConnectionString;

      if dtmPrincipal.tblUsuariosBASE_DADOS_PEDE_SENHA.Value = 'S' then
         dtmPrincipal.bdArmazena.LoginPrompt := True
      else
         dtmPrincipal.bdArmazena.LoginPrompt := False;

      dtmPrincipal.bdArmazena.Open;
    except
      on E: Exception do
      begin
          if not lAtualizaBatch then
             MessageDlg(HCLResourceStrings.FindID('sString_9') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    cxPageControl2.ActivePageIndex := 0;

    MontaSkin;

    Timer1.Enabled := True;

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion + ' - ' + HCLResourceStrings.FindID('sString_11') + copy(sUsuarioChave,9,length(sUsuarioChave)) + HCLResourceStrings.FindID('sString_12') + sUsuario;
end;

function GetAtualizaModulo(Atualiza, Modulo: string): string;
var
    sVersaoOrigem, sVersaoDestino: string;
    sArquivoOrigem, sArquivoDestino : string;
    sAux : string;
begin
    Result          := '';
    sAux            := '';
    sArquivoOrigem  := frmPrincipal.sCaminhoAtualiza + '\' + Modulo;
    sArquivoDestino := ExtractFilePath(Application.ExeName) + Modulo;

    if FileExists(sArquivoOrigem)  and
       FileExists(sArquivoDestino) then
    begin
        sVersaoOrigem  := FormatDateTime('dd/mm/yyyy hh:mm:ss', FileDateToDateTime(FileAge(sArquivoOrigem)));
        sVersaoDestino := FormatDateTime('dd/mm/yyyy hh:mm:ss', FileDateToDateTime(FileAge(sArquivoDestino)));

        if StrToDateTime(sVersaoOrigem) > StrToDateTime(sVersaoDestino) then
           sAux := Modulo;
    end;

    if not FileExists(sArquivoDestino) then
       sAux := Modulo;

    if sAux <> '' then
    begin
        if Atualiza = '' then
           Result := sAux
        else
           Result := Atualiza + '#' + sAux;
    end;
end;

procedure TfrmPrincipal.VerificaAtualizacoes(Tipo: Integer);
var
    sAux : string;
begin
    sAux := '';

    sAux := GetAtualizaModulo(sAux, 'pAnalyzer.exe');
    sAux := GetAtualizaModulo(sAux, 'pDynamics.exe');
    sAux := GetAtualizaModulo(sAux, 'pScheduler.exe');
    sAux := GetAtualizaModulo(sAux, 'pCubo.exe');
    sAux := GetAtualizaModulo(sAux, 'pDecisionCube.exe');
    sAux := GetAtualizaModulo(sAux, 'pGeoAnalises.exe');
    sAux := GetAtualizaModulo(sAux, 'pRelatorios.exe');
    sAux := GetAtualizaModulo(sAux, 'pScoredCard.exe');
    sAux := GetAtualizaModulo(sAux, 'pAccess.exe');
    sAux := GetAtualizaModulo(sAux, 'pDesigner.exe');
    sAux := GetAtualizaModulo(sAux, 'pLogs.exe');
    sAux := GetAtualizaModulo(sAux, 'pManABC.exe');
    sAux := GetAtualizaModulo(sAux, 'pManAnalises.exe');
    sAux := GetAtualizaModulo(sAux, 'pManDecisionCube.exe');
    sAux := GetAtualizaModulo(sAux, 'pManDynamics.exe');
    sAux := GetAtualizaModulo(sAux, 'pManFotografia.exe');
    sAux := GetAtualizaModulo(sAux, 'pManFrequencia.exe');
    sAux := GetAtualizaModulo(sAux, 'pManGeoAnalises.exe');
    sAux := GetAtualizaModulo(sAux, 'pManRelatorios.exe');
    sAux := GetAtualizaModulo(sAux, 'pManScoredCard.exe');
    sAux := GetAtualizaModulo(sAux, 'pParametros.exe');
    sAux := GetAtualizaModulo(sAux, 'pSmartDocs.exe');
    sAux := GetAtualizaModulo(sAux, 'pSobre.exe');
    sAux := GetAtualizaModulo(sAux, 'pUpdateBase.exe');
    sAux := GetAtualizaModulo(sAux, 'pUsuarios.exe');
    sAux := GetAtualizaModulo(sAux, 'pVisio.exe');
    sAux := GetAtualizaModulo(sAux, 'pWebBI.exe');
    sAux := GetAtualizaModulo(sAux, 'pConsoleWebBI.exe');

    if sAux <> '' then
    begin
        if (MessageDlg(HCLResourceStrings.FindID('sString_277'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            VerificaSessao(1);
            ShellExecute(handle,
                         'open',
                         pchar(ExtractFilePath(Application.ExeName) + 'pAtualiza.exe'),
                         pchar('kc4570mh "' +
                         sAux + '" "' +
                         sCaminhoAtualiza + '" "' +
                         dxSkinController1.SkinName + '"'),
                         nil, sw_shownormal);
            Application.Terminate;
        end;
    end
    else
    begin
        if Tipo = 1 then
           MessageDlg(HCLResourceStrings.FindID('sString_278'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.VerificaSessao(Tipo: integer);
begin
    dtmPrincipal.tblLogin.Open;

    if Tipo = 0 then
    begin
        if dtmPrincipal.tblLogin.RecordCount >= sMaxUsuario then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_104') +#13+#10 + HCLResourceStrings.FindID('sString_104_1'), mtInformation, [mbOK], 0);
            Application.Terminate;
        end
        else
        begin
            if sUsuario <> '' then
            begin
                dtmPrincipal.tblLogin.Insert;
                dtmPrincipal.tblLoginSESSAO.Value     := sSessao;
                dtmPrincipal.tblLoginID_USUARIO.Value := sUsuario;
                dtmPrincipal.tblLoginDATA.Value       := Date;
                dtmPrincipal.tblLoginHORA.Value       := Time;
                dtmPrincipal.tblLogin.Post;
            end;
        end;
    end;

    if Tipo = 1 then
    begin
        if sUsuario <> '' then
           if dtmPrincipal.tblLogin.Locate('SESSAO;ID_USUARIO',VarArrayOf([sSessao,sUsuario]),[]) then
              dtmPrincipal.tblLogin.Delete;
    end;

    if Tipo = 2 then
    begin
        if sUsuario <> '' then
        begin
            if dtmPrincipal.tblLogin.Locate('SESSAO;ID_USUARIO',VarArrayOf([sSessao,sUsuario]),[]) then
            begin
                dtmPrincipal.tblLogin.Edit;
                dtmPrincipal.tblLoginDATA.Value := Date;
                dtmPrincipal.tblLoginHORA.Value := Time;
                dtmPrincipal.tblLogin.Post;
            end;
        end;
    end;

    if Tipo = 3 then
    begin
        dtmPrincipal.tblLogin.First;
        while not dtmPrincipal.tblLogin.Eof do
        begin
            if dtmPrincipal.tblLoginDATA.Value <> Date then
               dtmPrincipal.tblLogin.Delete
            else
               dtmPrincipal.tblLogin.Next;
        end;
    end;

    dtmPrincipal.tblLogin.Close;
end;

procedure TfrmPrincipal.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPrincipal.cxButton2Click(Sender: TObject);
var
    Query : TADOQuery;
    sAux : string;
begin
    if (MessageDlg(HCLResourceStrings.FindID('sString_434'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
        GeraLog(dtmPrincipal.bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_436'),Self.Caption);

        sAux := GeraSenhaHex(8,true,false,true);

        Query                := TADOQuery.Create(Application);
        Query.Connection     := dtmPrincipal.bdDados;
        Query.CursorLocation := clUseServer;

        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('UPDATE USUARIOS');
        Query.SQL.Add('SET SENHA = ' + #39 + sAux + #39);
        Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + sUsuario + #39);
        Query.ExecSQL;

        Query.Close;
        Query.Free;

        MessageDlg(HCLResourceStrings.FindID('sString_435') +#13+#10 +#13+#10 +
                   sAux, mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmPrincipal.cxGridMenuDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    if cdsMenuferramenta.AsString = 'Análises' then
       ChamaDesigner(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Fotografias' then
       ChamaFotografia(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'ABC' then
       ChamaABC(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Scored Cards' then
       ChamaScored(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Decision Cube' then
       ChamaDecisionCube(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'SmartDocs' then
       ChamaSmartDocs(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Access' then
       ChamaAccess(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Dynamics' then
       ChamaDynamics(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Freqüências' then
       ChamaFrequencia(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Relatórios' then
       ChamaReport(cdsMenuid_ferramenta.AsString, 'Report')
    else
    if cdsMenuferramenta.AsString = 'GeoAnalises' then
       ChamaGeo(cdsMenuid_ferramenta.AsString)
    else
    if cdsMenuferramenta.AsString = 'Visio' then
       ChamaVisio(cdsMenuid_ferramenta.AsString);
end;

procedure TfrmPrincipal.cxGridMenuDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.Canvas.Brush.Color := TColor(AViewInfo.GridRecord.Values[cxGridMenuDBTableView1cor.Index]);
    ACanvas.Canvas.Font.Color  := clBlack;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    F : TextFile;
begin
    if MessageDlg(HCLResourceStrings.FindID('sString_13'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        GeraLog(dtmPrincipal.bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

        SalvaGridMenu;
        SalvaEncerra;

        if sUsuario = 'admin' then
        begin
            AssignFile(F,'C:\Analyzer\Temp\Skin.ini');
            Rewrite(F);
            Writeln(F,cbxSkin.Text);
            CloseFile(F);
        end;

        cdsMenu.Close;
        dtmPrincipal.tblUsuarios.Close;
        dtmPrincipal.bdArmazena.Close;

        FreeAndNil(dtmPrincipal);
        Action := caFree;
    end
    else
       Action := caNone;
end;

procedure TfrmPrincipal.ChamaDesigner(Analise: string);
var
    comando : TStrings;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ANALISE FROM ANALISES');
    Query.SQL.Add('WHERE ID_ANALISE = ' + #39 + Analise + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
        frmAguarde.Show;
        frmAguarde.Update;

        comando := TStringList.Create;

        comando.Clear;
        comando.Add(dxSkinController1.SkinName);
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
        comando.Add(sSGBD);
        comando.Add(sUsuario);
        comando.Add(sBanco);
        comando.Add('Visualizar');
        comando.Add(''); // Cubo
        comando.Add(''); // Pede Filtro
        comando.Add(Query.FieldByName('ID_ANALISE').AsString);
        comando.Add(''); // Fotografia
        comando.Add(''); // Frequencia
        comando.Add(''); // ABC
        comando.SaveToFile(sTempDirUsuario + 'comandosdesigner.txt');
        comando.Free;

        ShellExecute(handle,'open',
                     pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                     pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdesigner.txt"'),
                     nil, sw_shownormal);

        Sleep(5000);
        FreeAndNil(frmAguarde);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.ChamaDynamics(Dynamics: string);
var
    Query : TADOQuery;
    Query1 : TADOQuery;
    comando : TStrings;
    sSQL : string;
    lAbre : boolean;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := dtmPrincipal.bdArmazena;
    Query1.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_DYNAMICS, SQL, PEDE_FILTRO FROM DYNAMICS');
    Query.SQL.Add('WHERE ID_DYNAMICS = ' + #39 + Dynamics + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        lAbre := True;

        sSQL := Query.FieldByName('SQL').Value;

        if Query.FieldByName('PEDE_FILTRO').AsString = 'S' then
        begin
            if frmFiltro = nil then
            begin
                frmFiltro := TfrmFiltro.Create(Self);

                frmFiltro.sDynamics := Query.FieldByName('ID_DYNAMICS').AsString;
                frmFiltro.Caption   := Query.FieldByName('ID_DYNAMICS').AsString;

                frmFiltro.qryFiltro.Close;
                frmFiltro.qryFiltro.SQL.Clear;
                frmFiltro.qryFiltro.SQL.Add(Query.FieldByName('SQL').Value);
                frmFiltro.qryFiltro.Open;

                frmFiltro.ShowModal;

                if not frmFiltro.lCancela then
                begin
                   if frmFiltro.cxDBFilterControl1.FilterText <> '' then
                      sSQL := sSQL + ' WHERE ' + frmFiltro.cxDBFilterControl1.FilterText;
                end
                else
                   lAbre := False;

                frmFiltro.qryFiltro.Close;

                FreeAndNil(frmFiltro);
            end
            else
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
                FreeAndNil(frmFiltro);
            end;
        end;

        if lAbre then
        begin
            comando := TStringList.Create;

            comando.Clear;
            comando.Add(Dynamics);
            comando.SaveToFile(sTempDirUsuario + 'analise.txt');

            comando.Clear;
            comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
            comando.SaveToFile(sTempDirUsuario + 'connection.txt');

            comando.Clear;
            comando.Add(dtmPrincipal.bdDados.ConnectionString);
            comando.SaveToFile(sTempDirUsuario + 'conexao.txt');

            try
                Query1.Close;
                Query1.SQL.Clear;
                Query1.SQL.Add(sSQL);
                Query1.Open;
                Query1.Close;

                comando.Clear;
                comando.Add(sSQL);
                comando.SaveToFile(sTempDirUsuario + 'command.txt');
                comando.Free;

                ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pDynamics.exe'),pchar('kc457012 "' + sUsuario + '" "' + dxSkinController1.SkinName + '"'), nil, sw_shownormal);

                Sleep(5000);
            except
                MessageDlg(HCLResourceStrings.FindID('sString_16'), mtInformation, [mbOK], 0);
            end;
        end;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;

    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaAccess(Access: string);
var
    Query : TADOQuery;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ARQUIVO, MACRO FROM access');
    Query.SQL.Add('WHERE ID_ACCESS = ' + #39 + Access + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
       ShellExecute(handle,'open', pchar(Query.Fields[0].AsString),pchar('/runtime /x "' + Query.Fields[1].AsString + '"'), nil, sw_shownormal);

    Query.Close;
    Query.Free;

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaVisio(Visio: string);
var
    Query : TADOQuery;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ARQUIVO FROM visio');
    Query.SQL.Add('WHERE ID_VISIO = ' + #39 + Visio + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
       ShellExecute(handle,'open', pchar(Query.Fields[0].AsString), nil, nil, sw_shownormal);

    Query.Close;
    Query.Free;

    Sleep(3000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaGeo(Geo: string);
var
    Query : TADOQuery;
    lPode : boolean;
    sCon, sPas, sPode : string;
    comando : TStrings;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_GEO, PODE_ALTERAR FROM geo_analises');
    Query.SQL.Add('WHERE ID_GEO = ' + #39 + Geo + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        sPode := 'Nao';
        lPode := False;

        if EncontraLista(Query.FieldByName('PODE_ALTERAR').Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_ALTERAR').Value,'#' + frmPrincipal.sUsuario,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_ALTERAR').Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(Query.FieldByName('PODE_ALTERAR').Value,frmPrincipal.sUsuario      ,',') then lPode := True;

        if lPode then
           sPode := 'Sim';

        sPas := '"kc4570mh"';
        sCon := sTempDirUsuario + 'conexaogeo.txt';

        comando := TStringList.Create;
        comando.Clear;
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.SaveToFile(sCon);
        comando.Free;

        ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pGeoAnalises.exe'),pchar(sPas + ' "' + frmPrincipal.dxSkinController1.SkinName + '" "' + sCon + '" "' + frmPrincipal.sUsuario + '" "/Abrir" "' + Query.FieldByName('ID_GEO').AsString + '" "' + sPode + '"'), nil, sw_shownormal);
    end;

    Query.Close;
    Query.Free;

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaDecisionCube(Decision: string);
var
    Query : TADOQuery;
    sDecision, sCon, sPas : string;
    comando : TStrings;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_415');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_DECISION FROM DECISION');
    Query.SQL.Add('WHERE ID_DECISION = ' + #39 + Decision + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        comando := TStringList.Create;

        sCon := sTempDirUsuario + 'conexaodms.txt';
        comando.Clear;
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
        comando.Add(sSGBD);
        comando.SaveToFile(sCon);
        comando.Free;

        sPas      := '"kc4570mh"';
        sCon      := '"' + sCon + '"';
        sDecision := '"' + Query.FieldByName('ID_DECISION').AsString + '"';

        ShellExecute(handle,'open',
                     pchar(ExtractFilePath(Application.ExeName) + 'pDecisionCube.exe'),
                     pchar(sPas + ' ' +
                           sDecision + ' ' +
                           sCon + ' "' +
                           sUsuario + '" "' +
                           dxSkinController1.SkinName + '"'), nil, sw_shownormal);
    end;

    Query.Close;
    Query.Free;

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaABC(ABC: string);
var
    comando : TStrings;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_ABC, ID_ANALISE FROM ABC');
    Query.SQL.Add('WHERE ID_ABC = ' + #39 + ABC + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
        frmAguarde.Show;
        frmAguarde.Update;

        comando := TStringList.Create;

        comando.Clear;
        comando.Add(dxSkinController1.SkinName);
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
        comando.Add(sSGBD);
        comando.Add(sUsuario);
        comando.Add(sBanco);
        comando.Add('VisualizarABC');
        comando.Add(''); // Cubo
        comando.Add(''); // Pede Filtro
        comando.Add(Query.FieldByName('ID_ANALISE').AsString);
        comando.Add(''); // Fotografia
        comando.Add(''); // Frequencia
        comando.Add(Query.FieldByName('ID_ABC').AsString); // ABC
        comando.SaveToFile(sTempDirUsuario + 'comandosdesigner.txt');
        comando.Free;

        ShellExecute(handle,'open',
                     pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                     pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdesigner.txt"'),
                     nil, sw_shownormal);

        Sleep(5000);
        FreeAndNil(frmAguarde);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.ChamaFotografia(Fotografia: string);
var
    comando : TStrings;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_FOTOGRAFIA, ID_ANALISE FROM FOTOGRAFIA');
    Query.SQL.Add('WHERE ID_FOTOGRAFIA = ' + #39 + Fotografia + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
        frmAguarde.Show;
        frmAguarde.Update;

        comando := TStringList.Create;

        comando.Clear;
        comando.Add(dxSkinController1.SkinName);
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
        comando.Add(sSGBD);
        comando.Add(sUsuario);
        comando.Add(sBanco);
        comando.Add('VisualizarFotografia');
        comando.Add(''); // Cubo
        comando.Add(''); // Pede Filtro
        comando.Add(Query.FieldByName('ID_ANALISE').AsString);
        comando.Add(Query.FieldByName('ID_FOTOGRAFIA').AsString); // Fotografia
        comando.Add(''); // Frequencia
        comando.Add(''); // ABC
        comando.SaveToFile(sTempDirUsuario + 'comandosdesigner.txt');
        comando.Free;

        ShellExecute(handle,'open',
                     pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                     pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdesigner.txt"'),
                     nil, sw_shownormal);

        Sleep(5000);
        FreeAndNil(frmAguarde);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.ChamaFrequencia(Frequencia: string);
var
    comando : TStrings;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_FREQUENCIA, ID_ANALISE FROM FREQUENCIA');
    Query.SQL.Add('WHERE ID_FREQUENCIA = ' + #39 + Frequencia + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
        frmAguarde.Show;
        frmAguarde.Update;

        comando := TStringList.Create;

        comando.Clear;
        comando.Add(dxSkinController1.SkinName);
        comando.Add(dtmPrincipal.bdDados.ConnectionString);
        comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
        comando.Add(sSGBD);
        comando.Add(sUsuario);
        comando.Add(sBanco);
        comando.Add('VisualizarFrequencia');
        comando.Add(''); // Cubo
        comando.Add(''); // Pede Filtro
        comando.Add(Query.FieldByName('ID_ANALISE').AsString);
        comando.Add(''); // Fotografia
        comando.Add(Query.FieldByName('ID_FREQUENCIA').AsString); // Frequencia
        comando.Add(''); // ABC
        comando.SaveToFile(sTempDirUsuario + 'comandosdesigner.txt');
        comando.Free;

        ShellExecute(handle,'open',
                     pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                     pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdesigner.txt"'),
                     nil, sw_shownormal);

        Sleep(5000);
        FreeAndNil(frmAguarde);
    end;

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.ChamaScored(Scored: string);
var
    Query : TADOQuery;
    Query1 : TADOQuery;
    s_skin: string;
    s_connection: string;
    s_armazena: string;
    s_scored: string;
    comando : TStrings;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := dtmPrincipal.bdArmazena;
    Query1.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_SCORED FROM SCORED_CARD');
    Query.SQL.Add('WHERE ID_SCORED = ' + #39 + Scored + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        try
            Query1.Close;
            Query1.SQL.Clear;

            if (frmPrincipal.sSGBD = 'Microsoft Access 2007') or
               (frmPrincipal.sSGBD = 'Microsoft Access 2010') or
               (frmPrincipal.sSGBD = 'Microsoft SQL Server 2000') or
               (frmPrincipal.sSGBD = 'Microsoft SQL Server 2005') or
               (frmPrincipal.sSGBD = 'Microsoft SQL Server 2008') or
               (frmPrincipal.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmPrincipal.sSGBD = 'Microsoft SQL Server 2012') then
               Query1.SQL.Add('SELECT TOP 1 * FROM [_ScoredCard_' + uppercase(Query.FieldByName('ID_SCORED').Value) + ']')
            else
            if frmPrincipal.sSGBD = 'Sun MySQL 5.x' then
            begin
                Query1.SQL.Add('SELECT * FROM `_ScoredCard_' + uppercase(Query.FieldByName('ID_SCORED').Value) + '`');
                Query1.SQL.Add('LIMIT 0,1');
            end;

            Query1.Open;
            Query1.Close;

            s_skin       := dxSkinController1.SkinName;
            s_connection := dtmPrincipal.bdDados.ConnectionString;
            s_armazena   := dtmPrincipal.bdArmazena.ConnectionString;
            s_scored     := Scored;

            comando := TStringList.Create;

            comando.Clear;
            comando.Add(s_skin);
            comando.Add(s_connection);
            comando.Add(s_armazena);
            comando.Add(s_scored);
            comando.Add(sSGBD);
            comando.SaveToFile(sTempDirUsuario + 'comandoscored.txt');

            comando.Free;

            ShellExecute(handle,'open',
                         pchar(ExtractFilePath(Application.ExeName) + 'pScoredCard.exe'),
                         pchar('"' + sTempDirUsuario + 'comandoscored.txt"' + ' "' + frmPrincipal.sUsuario + '"'),
                         nil, sw_shownormal);
        except
            MessageDlg(HCLResourceStrings.FindID('sString_29'), mtInformation, [mbOK], 0);
        end;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;

    Sleep(3000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaReport(Report, Tipo: string);
var
  s_skin: string;
  s_connection: string;
  s_armazena: string;
  s_relatorio: string;
  comando : TStrings;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    s_skin       := dxSkinController1.SkinName;
    s_connection := dtmPrincipal.bdDados.ConnectionString;
    s_armazena   := dtmPrincipal.bdArmazena.ConnectionString;
    s_relatorio  := Report;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(s_skin);
    comando.Add(s_connection);
    comando.Add(s_armazena);
    comando.Add(s_relatorio);
    comando.SaveToFile(sTempDirUsuario + 'comandorelatorio.txt');

    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pRelatorios.exe'),
                 pchar('"' + sTempDirUsuario + 'comandorelatorio.txt"' + ' "' + frmPrincipal.sUsuario + '" "' + Tipo + '"'),
                 nil, sw_shownormal);

    Sleep(3000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.ChamaSmartDocs(SmartDocs: string);
var
    Query : TADOQuery;
    Query1 : TADOQuery;
    Query2 : TADOQuery;
    lPode : boolean;
    oXls : TXls;
    i,a,b : integer;
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_269');
    frmAguarde.Show;
    frmAguarde.Update;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := dtmPrincipal.bdDados;
    Query1.CursorLocation := clUseServer;

    Query2                := TADOQuery.Create(Application);
    Query2.Connection     := dtmPrincipal.bdArmazena;
    Query2.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM smartdocs');
    Query.SQL.Add('WHERE ID_SMARTDOCS = ' + #39 + SmartDocs + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        lPode := False;
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#' + frmPrincipal.sUsuario,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,frmPrincipal.sUsuario      ,',') then lPode := True;

        if not lPode then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
            exit;
        end;

        if Query.FieldByName('ARQUIVO').IsNull then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_186'), mtInformation, [mbOK], 0);
            Exit;
        end;

        if Query.FieldByName('TIPO_ARQUIVO').Value = '0' then // Excel
        begin
            if Query.FieldByName('ID_ANALISE').Value = '' then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_267'), mtInformation, [mbOK], 0);
                Exit;
            end;

            if Query.FieldByName('PLANILHA').Value <= 0 then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_268'), mtInformation, [mbOK], 0);
                Exit;
            end;

            if Query.FieldByName('PLANILHA_INI').Value <= 0 then
            begin
                MessageDlg(HCLResourceStrings.FindID('sString_270'), mtInformation, [mbOK], 0);
                Exit;
            end;

            Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.Add('SELECT * FROM analises');
            Query1.SQL.Add('WHERE ID_ANALISE = ' + #39 + Query.FieldByName('ID_ANALISE').AsString + #39);
            Query1.Open;
            Query1.First;
            if not Query1.IsEmpty then
            begin
                try
                    Query2.Close;
                    Query2.SQL.Clear;

                    if (frmPrincipal.sSGBD = 'Microsoft Access 2007')        or
                       (frmPrincipal.sSGBD = 'Microsoft Access 2010')        or
                       (frmPrincipal.sSGBD = 'Microsoft SQL Server 2000')    or
                       (frmPrincipal.sSGBD = 'Microsoft SQL Server 2005')    or
                       (frmPrincipal.sSGBD = 'Microsoft SQL Server 2008')    or
                       (frmPrincipal.sSGBD = 'Microsoft SQL Server 2008 R2') or
                       (frmPrincipal.sSGBD = 'Microsoft SQL Server 2012')    then
                    begin
                        if (Query1.FieldByName('BASE_ORIGEM').Value  = '.') and
                           (Query1.FieldByName('VISAO_ORIGEM').Value = '.') then
                            Query2.SQL.Add('SELECT * FROM ' + '[' + Query1.FieldByName('VISAO_DESTINO').Value + ']')
                        else
                            Query2.SQL.Add('SELECT * FROM ' + '[_' + Query1.FieldByName('VISAO_DESTINO').Value + ']');
                    end;

                    if frmPrincipal.sSGBD = 'Sun MySQL 5.x' then
                    begin
                        if (Query1.FieldByName('BASE_ORIGEM').Value  = '.') and
                           (Query1.FieldByName('VISAO_ORIGEM').Value = '.') then
                            Query2.SQL.Add('SELECT * FROM ' + '`' + Query1.FieldByName('VISAO_DESTINO').Value + '`')
                        else
                            Query2.SQL.Add('SELECT * FROM ' + '`_' + Query1.FieldByName('VISAO_DESTINO').Value + '`');
                    end;

                    if Query.FieldByName('COMPLEMENTO_SQL').Value <> '' then
                       Query2.SQL.Add(Query.FieldByName('COMPLEMENTO_SQL').Value);

                    Query2.Open;
                except
                    MessageDlg(HCLResourceStrings.FindID('sString_14'), mtInformation, [mbOK], 0);
                    FreeAndNil(frmAguarde);
                    Exit;
                end;

                DeleteFile(sTempDirUsuario + Query.FieldByName('NOME_ARQUIVO').AsString);
                TBlobField(Query.FieldByName('ARQUIVO')).SaveToFile(sTempDirUsuario + Query.FieldByName('NOME_ARQUIVO').AsString);

                b := Query.FieldByName('PLANILHA').Value;

                oXls := TXls.Create();
                oXls.AbrirXLS(sTempDirUsuario + Query.FieldByName('NOME_ARQUIVO').AsString);

                for i := 0 to Query2.FieldCount - 1 do
                    oXls.GravarCelularXLS(b,oXls.PegaLetraColuna(i + 1) + '1',Query2.Fields[i].FieldName);

                a := 2;

                Query2.First;
                while not Query2.Eof do
                begin
                    for i := 0 to Query2.FieldCount - 1 do
                        oXls.GravarCelularXLS(b,oXls.PegaLetraColuna(i + 1) + IntToStr(a),Query2.Fields[i].Value);

                    Query2.Next;
                    a := a + 1;
                end;

                Query2.Close;
                oXls.VisualizarXLS(Query.FieldByName('PLANILHA_INI').Value);
            end;
        end;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;

    Query2.Close;
    Query2.Free;

    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
    iVer : integer;
    aux : string;
    F   : TextFile;
begin
    lBotaoCustomiza := False;

    SetLanguage(2, cxLocalizer1);

    if not DirectoryExists('C:\Analyzer') then
       ForceDirectories('C:\Analyzer');

    if not DirectoryExists('C:\Analyzer\Temp') then
       ForceDirectories('C:\Analyzer\Temp');

    ShortDateFormat := 'dd/mm/yyyy';

    try
        Memo1.Lines.Clear;
        Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Conexao.txt');

        sConexao := tbGetLongStr(Memo1.Lines.Text,'#');
        sBanco   := tbGetShortStr(Memo1.Lines.Text,'#');
    except
        MessageDlg(HCLResourceStrings.FindID('sString_40'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    if (sBanco <> 'SQLServer') then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_40'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    iVer := StrToInt(CEVersionInfo1.MajorVersion + CEVersionInfo1.MinorVersion);

    aux := 'Nenhum';
    if FileExists('C:\Analyzer\Temp\Skin.ini') then
    begin
        AssignFile(F,'C:\Analyzer\Temp\Skin.ini');
        Reset(F);
        Readln(F,aux);
        CloseFile(F);
    end;

    if aux <> 'Nenhum' then
    begin
        dxSkinController1.SkinName := aux;
        dxSkinController1.UseSkins := True;
    end;
end;

procedure TfrmPrincipal.dxBarButton1Click(Sender: TObject);
var
    comando : TStrings;
begin
    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.SaveToFile(sTempDirUsuario + 'comandossobre.txt');
    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pSobre.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandossobre.txt"'),
                 nil, sw_shownormal);
end;

procedure TfrmPrincipal.dxBarButton2Click(Sender: TObject);
var
    buffer: String;
begin
    buffer := 'Manual.htm';
    ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.dxBarLargeButton10Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoCubo = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoCubo));
    comando.SaveToFile(sTempDirUsuario + 'comandosdecision.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManDecisionCube.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdecision.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton11Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoFotografia = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoFotografia));
    comando.SaveToFile(sTempDirUsuario + 'comandosfoto.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManFotografia.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosfoto.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton12Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoFrequencia = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoFrequencia));
    comando.SaveToFile(sTempDirUsuario + 'comandosfreq.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManFrequencia.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosfreq.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton13Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoDynamics = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoDynamics));
    comando.SaveToFile(sTempDirUsuario + 'comandosdynamics.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManDynamics.exe'),
                pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosdynamics.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton14Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoRelatorio = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoRelatorio));
    comando.SaveToFile(sTempDirUsuario + 'comandosrelatorio.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManRelatorios.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosrelatorio.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton15Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoScored = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoScored));
    comando.Add(BoolToStr(lAtualizaBatch));
    comando.Add(sMail);
    comando.Add(sUserMail);
    comando.Add(sSenhaMail);
    comando.Add('False');
    comando.Add('');

    comando.SaveToFile(sTempDirUsuario + 'comandosscored.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManScoredCard.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosscored.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton16Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoSmartDocs = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoSmartDocs));
    comando.SaveToFile(sTempDirUsuario + 'comandossmart.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pSmartDocs.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandossmart.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton17Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoAccess = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;


    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoAccess));
    comando.SaveToFile(sTempDirUsuario + 'comandosaccess.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pAccess.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosaccess.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton18Click(Sender: TObject);
var
    Query : TADOQuery;
begin
    if sPermissaoReport = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := dtmPrincipal.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT LINK_REPORT FROM usuarios');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + sUsuario + #39);
    Query.Open;
    Query.First;

    if not Query.IsEmpty then
    begin
        if not (Query.FieldByName('LINK_REPORT').AsString <> '') then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_286'), mtInformation, [mbOK], 0);
            exit;
        end;
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_339'), mtInformation, [mbOK], 0);
        exit;
    end;

    ShellExecute(0, Nil, pchar(Query.FieldByName('LINK_REPORT').AsString), Nil, Nil, 0);

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.dxBarLargeButton19Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoVisio = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoVisio));
    comando.SaveToFile(sTempDirUsuario + 'comandosvisio.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pVisio.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosvisio.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton20Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoParametro = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.SaveToFile(sTempDirUsuario + 'comandosparam.txt');
    comando.Free;

    ShellExecute(handle,'open',
                 pchar(ExtractFilePath(Application.ExeName) + 'pParametros.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosparam.txt"'),
                 nil, sw_shownormal);

    Sleep(1000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton21Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoGeo = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoGeo));
    comando.SaveToFile(sTempDirUsuario + 'comandosgeo.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManGeoAnalises.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosgeo.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton22Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoWebBI = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    GeraLog(dtmPrincipal.bdDados,sUsuario,'frmWebBI',HCLResourceStrings.FindID('sString_355'),'WebBI');
    ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pWebBI.exe'), pchar('"kc4570mh"' + ' "' + sUsuario + '" "' + sSenha + '"'), nil, sw_shownormal);

    Sleep(1000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton23Click(Sender: TObject);
begin
    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pUpdateBase.exe'),pchar('"' + dxSkinController1.SkinName + '"'), nil, sw_shownormal);

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton2Click(Sender: TObject);
begin
    SalvaGridMenu;
    SalvaEncerra;

    frmLogin := TfrmLogin.Create(Self);
    frmLogin.ShowModal;
    FreeAndNil(frmLogin);

    LeUsuario;
    MontaMenuPrincipal;
    RestoreGridMenu;
end;

procedure TfrmPrincipal.SalvaGridMenu;
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    try
        AOptions := [gsoUseFilter, gsoUseSummary];

        S := TMemoryStream.Create;
        cxGridMenuDBTableView1.StoreToStream(S,AOptions);
        S.Position := 0;
        SalvaPadraoStream_1(dtmPrincipal.bdDados,frmPrincipal.sUsuario,'frmPrincipal',cxGridMenuDBTableView1.Name,S);
        S.Free;
    except
    end;
end;

procedure TfrmPrincipal.RestoreGridMenu;
var
    S : TMemoryStream;
    AOptions: TcxGridStorageOptions;
begin
    try
        AOptions := [gsoUseFilter, gsoUseSummary];

        S := TMemoryStream.Create;
        LePadraoStream(dtmPrincipal.bdDados,'',frmPrincipal.sUsuario,'frmPrincipal', cxGridMenuDBTableView1.Name,S);
        S.Position := 0;
        cxGridMenuDBTableView1.RestoreFromStream(S,True,False,AOptions);
        S.Free;
    except
    end;
end;

procedure TfrmPrincipal.SalvaEncerra;
begin
   if dtmPrincipal.tblUsuarios.Locate('ID_USUARIO', sUsuario, []) then
   begin
       dtmPrincipal.tblUsuarios.Edit;
       dtmPrincipal.tblUsuariosSKIN.Value := cbxSkin.Text;
       dtmPrincipal.tblUsuarios.Post;
   end;

   VerificaSessao(1);
end;

procedure TfrmPrincipal.dxBarLargeButton4Click(Sender: TObject);
var
    F : TextFile;
    unidade : string;
    aux : string;
    ClickedOK: Boolean;
begin
    if (MessageBox(0, pchar(HCLResourceStrings.FindID('sString_2') +#13+#10 + HCLResourceStrings.FindID('sString_369')), pchar(HCLResourceStrings.FindID('sString_22')), MB_ICONQUESTION or MB_YESNO) = idYes) then
    begin
        ClickedOK := InputQuery(HCLResourceStrings.FindID('sString_20'),HCLResourceStrings.FindID('sString_20'),aux);

        if not ClickedOK then
           exit;

        if aux = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_24'), mtInformation, [mbOK], 0);
            Exit;
        end;

        unidade := 'C';
        AssignFile(F,'C:\Analyzer\Codigo.sec');
        Rewrite(F);
        WriteLn(F,EnDecryptString(SerialNum(unidade)));
        WriteLn(F,EnDecryptString(aux));
        WriteLn(F,EnDecryptString(sVersao));
        CloseFile(F);
        ShowMessage(HCLResourceStrings.FindID('sString_33'));
    end;
end;

procedure TfrmPrincipal.dxBarLargeButton5Click(Sender: TObject);
begin
    VerificaAtualizacoes(1);
end;

procedure TfrmPrincipal.dxBarLargeButton6Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoUsuario = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.SaveToFile(sTempDirUsuario + 'comandosuser.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pUsuarios.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosuser.txt"'),SW_SHOWNORMAL);

    dtmPrincipal.tblUsuarios.Close;
    dtmPrincipal.tblUsuarios.Open;
    dtmPrincipal.tblUsuarios.Locate('ID_USUARIO',sUsuario,[]);

    frmPrincipal.sMail            := dtmPrincipal.tblUsuariosMAIL.Value;
    frmPrincipal.sUserMail        := dtmPrincipal.tblUsuariosUSER_MAIL.Value;
    frmPrincipal.sSenhaMail       := dtmPrincipal.tblUsuariosSENHA_MAIL.Value;
    frmPrincipal.sCaminhoAtualiza := dtmPrincipal.tblUsuariosLOCAL_ATUALIZACOES.Value;
    frmPrincipal.sSGBD            := dtmPrincipal.tblUsuariosSGBD.Value;

    if dtmPrincipal.tblUsuariosACESSA_USUARIOS.Value = 'S' then
       frmPrincipal.sPermissaoUsuario := True
    else
       frmPrincipal.sPermissaoUsuario := False;

    if dtmPrincipal.tblUsuariosACESSA_VISOES.Value = 'S' then
       frmPrincipal.sPermissaoAnalise := True
    else
       frmPrincipal.sPermissaoAnalise := False;

    if dtmPrincipal.tblUsuariosACESSA_SMARTDOCS.Value = 'S' then
       frmPrincipal.sPermissaoSmartDocs := True
    else
       frmPrincipal.sPermissaoSmartDocs := False;

    if dtmPrincipal.tblUsuariosACESSA_ACCESS.Value = 'S' then
       frmPrincipal.sPermissaoAccess := True
    else
       frmPrincipal.sPermissaoAccess := False;

    if dtmPrincipal.tblUsuariosACESSA_VISIO.Value = 'S' then
       frmPrincipal.sPermissaoVisio := True
    else
       frmPrincipal.sPermissaoVisio := False;

    if dtmPrincipal.tblUsuariosACESSA_GEO_ANALISE.Value = 'S' then
       frmPrincipal.sPermissaoGeo := True
    else
       frmPrincipal.sPermissaoGeo := False;

    if dtmPrincipal.tblUsuariosACESSA_PARAMETROS.Value = 'S' then
       frmPrincipal.sPermissaoParametro := True
    else
       frmPrincipal.sPermissaoParametro := False;

    if dtmPrincipal.tblUsuariosACESSA_LOGS.Value = 'S' then
       frmPrincipal.sPermissaoLogs := True
    else
       frmPrincipal.sPermissaoLogs := False;

    if dtmPrincipal.tblUsuariosACESSA_WEBBI.Value = 'S' then
       frmPrincipal.sPermissaoWebBI := True
    else
       frmPrincipal.sPermissaoWebBI := False;

    if dtmPrincipal.tblUsuariosACESSA_REPORT.Value = 'S' then
       frmPrincipal.sPermissaoReport := True
    else
       frmPrincipal.sPermissaoReport := False;

    if dtmPrincipal.tblUsuariosACESSA_ABC.Value = 'S' then
       frmPrincipal.sPermissaoABC := True
    else
       frmPrincipal.sPermissaoABC := False;

    if dtmPrincipal.tblUsuariosACESSA_CUBO.Value = 'S' then
       frmPrincipal.sPermissaoCubo := True
    else
       frmPrincipal.sPermissaoCubo := False;

    if dtmPrincipal.tblUsuariosACESSA_FOTOGRAFIA.Value = 'S' then
       frmPrincipal.sPermissaoFotografia := True
    else
       frmPrincipal.sPermissaoFotografia := False;

    if dtmPrincipal.tblUsuariosACESSA_FREQUENCIA.Value = 'S' then
       frmPrincipal.sPermissaoFrequencia := True
    else
       frmPrincipal.sPermissaoFrequencia := False;

    if dtmPrincipal.tblUsuariosACESSA_SCORED.Value = 'S' then
       frmPrincipal.sPermissaoScored := True
    else
       frmPrincipal.sPermissaoScored := False;

    if dtmPrincipal.tblUsuariosACESSA_RELATORIOS.Value = 'S' then
       frmPrincipal.sPermissaoRelatorio := True
    else
       frmPrincipal.sPermissaoRelatorio := False;

    if dtmPrincipal.tblUsuariosACESSA_DYNAMICS.Value = 'S' then
       frmPrincipal.sPermissaoDynamics := True
    else
       frmPrincipal.sPermissaoDynamics := False;

    if dtmPrincipal.tblUsuariosATUALIZA_ONLINE.Value = 'S' then
       frmPrincipal.sAtualizaOnLine := True
    else
       frmPrincipal.sAtualizaOnLine := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ANALISES.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoAnalise := True
    else
       frmPrincipal.sPermissaoPermissaoAnalise := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_SCORED.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoScored := True
    else
       frmPrincipal.sPermissaoPermissaoScored := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_DYNAMICS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoDynamics := True
    else
       frmPrincipal.sPermissaoPermissaoDynamics := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ABC.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoABC := True
    else
       frmPrincipal.sPermissaoPermissaoABC := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_SMARTDOCS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoSmartDocs := True
    else
       frmPrincipal.sPermissaoPermissaoSmartDocs := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_ACCESS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoAccess := True
    else
       frmPrincipal.sPermissaoPermissaoAccess := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_VISIO.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoVisio := True
    else
       frmPrincipal.sPermissaoPermissaoVisio := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_GEO_ANALISE.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoGeo := True
    else
       frmPrincipal.sPermissaoPermissaoGeo := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_CUBO.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoCubo := True
    else
       frmPrincipal.sPermissaoPermissaoCubo := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_FOTOGRAFIA.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoFotografia := True
    else
       frmPrincipal.sPermissaoPermissaoFotografia := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_FREQUENCIA.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoFrequencia := True
    else
       frmPrincipal.sPermissaoPermissaoFrequencia := False;

    if dtmPrincipal.tblUsuariosACESSA_PERMISSOES_RELATORIOS.Value = 'S' then
       frmPrincipal.sPermissaoPermissaoRelatorio := True
    else
       frmPrincipal.sPermissaoPermissaoRelatorio := False;

    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton7Click(Sender: TObject);
begin
    if not dtmPrincipal.tblUsuarios.Locate('ID_USUARIO',sUsuario,[]) then
       Exit;

    if dtmPrincipal.tblUsuariosSCHEDULER_CAMINHO.AsString = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_43'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    GeraLog(dtmPrincipal.bdDados,sUsuario,'frmScheduler',HCLResourceStrings.FindID('sString_355'),'Scheduler');
    ShellExecute(handle,'open', pchar(ExtractFilePath(Application.ExeName) + 'pScheduler.exe'),pchar('"' + dtmPrincipal.tblUsuariosSCHEDULER_CAMINHO.AsString + '"' + ' "' + sUsuario + '" "' + dxSkinController1.SkinName + '"'), nil, sw_shownormal);

    Sleep(5000);
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton8Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoAnalise = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoAnalise));
    comando.Add(BoolToStr(lAtualizaBatch));
    comando.Add('NAO');
    comando.Add('');
    comando.SaveToFile(sTempDirUsuario + 'comandosanalise.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManAnalises.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosanalise.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.dxBarLargeButton9Click(Sender: TObject);
var
    comando : TStrings;
begin
    if sPermissaoABC = False then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_37'), mtInformation, [mbOK], 0);
        exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(dxSkinController1.SkinName);
    comando.Add(dtmPrincipal.bdDados.ConnectionString);
    comando.Add(dtmPrincipal.bdArmazena.ConnectionString);
    comando.Add(sSGBD);
    comando.Add(sUsuario);
    comando.Add(sBanco);
    comando.Add(BoolToStr(sPermissaoPermissaoABC));
    comando.SaveToFile(sTempDirUsuario + 'comandosabc.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pManABC.exe'),
                 pchar('"kc4570mh" "' + sTempDirUsuario + 'comandosabc.txt"'),SW_SHOWNORMAL);

    MontaMenuPrincipal;
    FreeAndNil(frmAguarde);
end;

procedure TfrmPrincipal.MontaSkin;
begin
  cbxSkin.Properties.Items.Clear;
  cbxSkin.Properties.Items.Add('Blue');
  cbxSkin.Properties.Items.Add('Black');
  cbxSkin.Properties.Items.Add('Silver');
  cbxSkin.Properties.Items.Add('Blueprint');
  cbxSkin.Properties.Items.Add('Seven');
  cbxSkin.Properties.Items.Add('SevenClassic');
  cbxSkin.Properties.Items.Add('Sharp');
  cbxSkin.Properties.Items.Add('SharpPlus');
  cbxSkin.Properties.Items.Add('UserSkin');
  cbxSkin.Properties.Items.Add('Stardust');
  cbxSkin.Properties.Items.Add('Valentine');
  cbxSkin.Properties.Items.Add('Xmas2008Blue');
  cbxSkin.Properties.Items.Add('DevExpressDarkStyle');
  cbxSkin.Properties.Items.Add('DevExpressStyle');
  cbxSkin.Properties.Items.Add('Foggy');
  cbxSkin.Properties.Items.Add('Silver');
  cbxSkin.Properties.Items.Add('Caramel');
  cbxSkin.Properties.Items.Add('HighContrast');
  cbxSkin.Properties.Items.Add('Coffee');
  cbxSkin.Properties.Items.Add('Pumpkin');
  cbxSkin.Properties.Items.Add('Darkroom');
  cbxSkin.Properties.Items.Add('DarkSide');
  cbxSkin.Properties.Items.Add('GlassOceans');
  cbxSkin.Properties.Items.Add('iMaginary');
  cbxSkin.Properties.Items.Add('Lilian');
  cbxSkin.Properties.Items.Add('McSkin');
  cbxSkin.Properties.Items.Add('LiquidSky');
  cbxSkin.Properties.Items.Add('LondonLiquidSky');
  cbxSkin.Properties.Items.Add('MoneyTwins');
  cbxSkin.Properties.Items.Add('Office2007Black');
  cbxSkin.Properties.Items.Add('Office2007Blue');
  cbxSkin.Properties.Items.Add('Office2007Green');
  cbxSkin.Properties.Items.Add('Office2007Pink');
  cbxSkin.Properties.Items.Add('Office2007Silver');
  cbxSkin.Properties.Items.Add('Office2010Black');
  cbxSkin.Properties.Items.Add('Office2010Blue');
  cbxSkin.Properties.Items.Add('Office2010Silver');
  cbxSkin.Properties.Items.Add('Summer2008');
  cbxSkin.Properties.Items.Add('Springtime');
  cbxSkin.Properties.Items.Add('TheAsphaltWorld');
  cbxSkin.Properties.Items.Add('VS2010');
  cbxSkin.Properties.Items.Add('Whiteprint');
  cbxSkin.Properties.Items.Add('Nenhum');

  if dtmPrincipal.tblUsuariosSKIN.Value <> '' then
     cbxSkin.Text := dtmPrincipal.tblUsuariosSKIN.Value
  else
     cbxSkin.Text := 'Nenhum';
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    VerificaSessao(2);

    if StrToDate(dValidade) < Date then
    begin
       Timer1.Enabled := False;

       if (MessageDlg(HCLResourceStrings.FindID('sString_4') + #13+#10 +
                      HCLResourceStrings.FindID('sMessage') + #13+#10 +
                      HCLResourceStrings.FindID('sMessage_1') + #13+#10 +
                      HCLResourceStrings.FindID('sMessage_2') + #13+#10 +
                      HCLResourceStrings.FindID('sMessage_3'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
           dxBarLargeButton4.OnClick(Self);

       Application.Terminate;
    end;
end;

procedure TfrmPrincipal.CriaEntradaMenu(Tipo: string; Query: TADOQuery);
var
    lPode  : boolean;
begin
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        lPode := False;

        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'#' + frmPrincipal.sUsuario,',') then lPode := False else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(Query.FieldByName('PODE_VISUALIZAR').Value,frmPrincipal.sUsuario      ,',') then lPode := True;

        if lPode then
        begin
            cdsMenu.Insert;
            cdsMenuferramenta.Value    := Tipo;
            cdsMenuid_ferramenta.Value := Query.Fields[0].AsString;
            cdsMenudescricao.Value     := Query.Fields[1].AsString;

            if Query.FieldByName('GRUPO').AsString <> '-1' then
               cdsMenugrupo.Value := Query.FieldByName('GRUPO').AsString
            else
               cdsMenugrupo.Value := '';

            cdsMenucor.AsExtended      := clWhite;
            cdsMenu.Post;
        end;

        Query.Next;
    end;
    Query.Close;
end;

procedure TfrmPrincipal.MontaMenuPrincipal;
var
    Query : TADOQuery;
    sFerramenta, sID: string;
    cFerramenta : string;
    cCor : array [1..2] of TColor;
    i : integer;
begin
    try
        sFerramenta := cdsMenuferramenta.AsString;
        sID := cdsMenuid_ferramenta.AsString;

        cdsMenu.DisableControls;

        cdsMenu.First;
        while not cdsMenu.Eof do
            cdsMenu.Delete;

        Query                := TADOQuery.Create(Application);
        Query.Connection     := dtmPrincipal.bdDados;
        Query.CursorLocation := clUseServer;

        if dxBarLargeButton8.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT ID_ANALISE, DESCRICAO, PODE_VISUALIZAR, GRUPO FROM ANALISES');
            Query.SQL.Add('WHERE INTERNA = ' + #39 + 'N' + #39);
            CriaEntradaMenu('Análises',Query);
        end;

        if dxBarLargeButton11.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT FOTOGRAFIA.ID_FOTOGRAFIA, FOTOGRAFIA.DESCRICAO, FOTOGRAFIA.PODE_VISUALIZAR, ANALISES.GRUPO FROM FOTOGRAFIA, ANALISES');
            Query.SQL.Add('WHERE ANALISES.ID_ANALISE = FOTOGRAFIA.ID_ANALISE');
            CriaEntradaMenu('Fotografias',Query);
        end;

        if dxBarLargeButton12.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT FREQUENCIA.ID_FREQUENCIA, FREQUENCIA.DESCRICAO, FREQUENCIA.PODE_VISUALIZAR, ANALISES.GRUPO FROM FREQUENCIA, ANALISES');
            Query.SQL.Add('WHERE ANALISES.ID_ANALISE = FREQUENCIA.ID_ANALISE');
            CriaEntradaMenu('Freqüências',Query);
        end;

        if dxBarLargeButton9.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT ABC.ID_ABC, ABC.DESCRICAO, ABC.PODE_VISUALIZAR, ANALISES.GRUPO FROM ABC, ANALISES');
            Query.SQL.Add('WHERE ANALISES.ID_ANALISE = ABC.ID_ANALISE');
            CriaEntradaMenu('ABC',Query);
        end;

        if dxBarLargeButton15.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT SCORED_CARD.ID_SCORED, SCORED_CARD.DESCRICAO, SCORED_CARD.PODE_VISUALIZAR, SCORED_CARD.GRUPO FROM SCORED_CARD');
            CriaEntradaMenu('Scored Cards',Query);
        end;

        if dxBarLargeButton10.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT DECISION.ID_DECISION, DECISION.DESCRICAO, DECISION.PODE_VISUALIZAR, DECISION.GRUPO FROM DECISION');
            CriaEntradaMenu('Decision Cube',Query);
        end;

        if dxBarLargeButton16.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT SMARTDOCS.ID_SMARTDOCS, SMARTDOCS.DESCRICAO, SMARTDOCS.PODE_VISUALIZAR, ANALISES.GRUPO FROM SMARTDOCS, ANALISES');
            Query.SQL.Add('WHERE ANALISES.ID_ANALISE = SMARTDOCS.ID_ANALISE');
            CriaEntradaMenu('SmartDocs',Query);
        end;

        if dxBarLargeButton17.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT ACCESS.ID_ACCESS, ACCESS.DESCRICAO, ACCESS.PODE_VISUALIZAR, ACCESS.GRUPO FROM ACCESS');
            CriaEntradaMenu('Access',Query);
        end;

        if dxBarLargeButton13.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT DYNAMICS.ID_DYNAMICS, DYNAMICS.DESCRICAO, DYNAMICS.PODE_VISUALIZAR, ANALISES.GRUPO FROM DYNAMICS, ANALISES');
            Query.SQL.Add('WHERE ANALISES.ID_ANALISE = DYNAMICS.ID_ANALISE');
            CriaEntradaMenu('Dynamics',Query);
        end;

        if dxBarLargeButton14.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT RELATORIOS.ID_RELATORIO, RELATORIOS.DESCRICAO, RELATORIOS.PODE_VISUALIZAR, RELATORIOS.GRUPO FROM RELATORIOS');
            CriaEntradaMenu('Relatórios',Query);
        end;

        if dxBarLargeButton21.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT GEO_ANALISES.ID_GEO, GEO_ANALISES.DESCRICAO, GEO_ANALISES.PODE_VISUALIZAR, GEO_ANALISES.GRUPO FROM GEO_ANALISES');
            CriaEntradaMenu('GeoAnalises',Query);
        end;

        if dxBarLargeButton19.Enabled then
        begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT VISIO.ID_VISIO, VISIO.DESCRICAO, VISIO.PODE_VISUALIZAR, VISIO.GRUPO FROM VISIO');
            CriaEntradaMenu('Visio',Query);
        end;

        Query.Close;
        Query.Free;

        cFerramenta := '';
        i := 0;
//        cCor[1] := $00AEFFD7;
//        cCor[2] := $00EAFFF4;

        cCor[1] := $00F2F2F2;
        cCor[2] := $00DFDFDF;

        cdsMenu.First;
        while not cdsMenu.Eof do
        begin
            if cFerramenta <> cdsMenuferramenta.AsString then
            begin
                cFerramenta := cdsMenuferramenta.AsString;
                i := i + 1;;

                if i > 2 then
                   i := 1;
            end;

            cdsMenu.edit;
            cdsMenucor.AsExtended := cCor[i];
            cdsMenu.Post;

            cdsMenu.Next;
        end;

        cdsMenu.EnableControls;

        cdsMenu.Locate('ferramenta;id_ferramenta',VarArrayOf([sFerramenta,sID]),[]);
    except
    end;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

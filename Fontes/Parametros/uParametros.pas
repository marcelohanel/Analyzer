unit uParametros;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,






  cxLabel, StdCtrls, cxButtons,

  cxDBEdit, DB,
  cxLookAndFeels,
  CEVersionInfo, cxLocalization, dxSkinsForm, cxGraphics, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox;

type
  TfrmParametros = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxLabel2: TcxLabel;
    DataSource1: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    dxSkinController1: TdxSkinController;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    bdDados: TADOConnection;
    bdArmazena: TADOConnection;
    tblParametros: TADOTable;
    tblParametrosVERSAO_BASE: TIntegerField;
    tblParametrosSERVIDOR_MAIL: TWideStringField;
    tblParametrosPORTA_MAIL: TIntegerField;
    tblParametrosDT_LIMITE_ATUALIZACAO: TDateTimeField;
    tblParametrosMAIL_ASSUNTO: TWideStringField;
    tblParametrosMAIL_MENSAGEM: TWideStringField;
    tblParametrosCOD_PARAMETRO: TIntegerField;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel7: TcxLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    tblParametrosUTILIZAR_SSL: TBooleanField;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;
  sUsuario : string;
  sSGBD : string;
  sSkin : string;
  sBanco : string;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    tblParametros.Cancel;

    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    tblParametros.Close;
    bdDados.Close;
    bdArmazena.Close;

    try
      DeleteFile(ParamStr(2));
    except
    end;
end;

procedure TfrmParametros.FormCreate(Sender: TObject);
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

procedure TfrmParametros.FormShow(Sender: TObject);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    tblParametros.Open;
    tblParametros.First;
    tblParametros.Edit;

    if tblParametrosDT_LIMITE_ATUALIZACAO.IsNull then
       tblParametrosDT_LIMITE_ATUALIZACAO.AsString := '31/12/2999';
end;

procedure TfrmParametros.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmParametros.SpeedButton3Click(Sender: TObject);
begin
    tblParametros.Post;
    close;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

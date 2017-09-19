unit uUpdateBase;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeels,
  cxButtons,







  dxSkinsForm, cxLocalization, CEVersionInfo, DB, DBClient,
  cxLabel, cxMemo, ADODB, cxGraphics, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, StdCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmUpdateBase = class(TForm)
    btnScript: TcxButton;
    CEVersionInfo1: TCEVersionInfo;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    cxButton2: TcxButton;
    cdsScript: TClientDataSet;
    cdsScriptTipo: TStringField;
    cdsScriptSQL: TMemoField;
    cdsScriptConexao: TMemoField;
    cdsScriptNome: TStringField;
    cdsScriptOrdem: TIntegerField;
    cdsScriptComando: TMemoField;
    btnCriar: TcxButton;
    btnAbrir: TcxButton;
    cxLabel1: TcxLabel;
    lblArquivo: TcxLabel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    btnExecutar: TcxButton;
    mmoLog: TcxMemo;
    cdsScriptAtiva: TBooleanField;
    cdsScriptAux_1: TMemoField;
    cdsScriptAux_2: TMemoField;
    cdsScriptAux_3: TMemoField;
    cdsScriptAux_4: TMemoField;
    cdsScriptAux_5: TMemoField;
    bdBase: TADOConnection;
    qryAtualiza: TADOQuery;
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnScriptClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure Atualizar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateBase: TfrmUpdateBase;

implementation

uses uFuncoes, uScripts;

{$R *.dfm}

procedure TfrmUpdateBase.btnAbrirClick(Sender: TObject);
begin
    if OpenDialog1.Execute then
    begin
       lblArquivo.Caption := OpenDialog1.FileName;

       if FileExists(lblArquivo.Caption) then
       begin
           try
               cdsScript.Close;
               cdsScript.CreateDataSet;
               cdsScript.LoadFromFile(lblArquivo.Caption);

               btnScript.Enabled   := True;
               btnExecutar.Enabled := True;
           except
             on E: Exception do
             begin
                 cdsScript.Close;
                 lblArquivo.Caption  := '';
                 btnScript.Enabled   := False;
                 btnExecutar.Enabled := False;

                 MessageDlg(E.Message, mtError, [mbOK], 0);
             end;
           end;
       end;
    end;
end;

procedure TfrmUpdateBase.btnCriarClick(Sender: TObject);
begin
    if SaveDialog1.Execute then
    begin
       lblArquivo.Caption := SaveDialog1.FileName;

       cdsScript.Close;
       cdsScript.CreateDataSet;

       btnScript.Enabled   := True;
       btnExecutar.Enabled := True;
    end;
end;

procedure TfrmUpdateBase.Atualizar;
var
    sXML : string;
    sEXT : string;
    sLOG : string;
    lErro : boolean;
begin
    if not FileExists(lblArquivo.Caption) then
       exit;

    lErro := False;

    mmoLog.Lines.Clear;
    mmoLog.Lines.Add('Início da Atualização - ' + DateTimeToStr(Now));

    try
        cdsScript.Close;
        cdsScript.CreateDataSet;
        cdsScript.LoadFromFile(lblArquivo.Caption);
        cdsScript.IndexFieldNames := 'Ordem';
    except
      on E: Exception do
      begin
          lErro := True;
          cdsScript.Close;
          mmoLog.Lines.Add('');
          mmoLog.Lines.Add('*** ERRO: ' + E.Message + ' - ' + DateTimeToStr(Now));
      end;
    end;

    if not lErro then
    begin
        cdsScript.First;
        while not cdsScript.Eof do
        begin
            if cdsScriptAtiva.Value then
            begin
                mmoLog.Lines.Add('');
                mmoLog.Lines.Add('Início da Instrução ' + cdsScriptNome.AsString + ' - ' + DateTimeToStr(Now));

                if cdsScriptTipo.Value = 'Instrução SQL Banco de Dados' then
                begin
                    try
                       bdBase.Close;
                       bdBase.ConnectionString := cdsScriptConexao.AsString;
                       bdBase.Open;

                       qryAtualiza.Connection := bdBase;
                       qryAtualiza.SQL.Clear;
                       qryAtualiza.SQL.Text := cdsScriptSQL.Value;
                       qryAtualiza.ExecSQL;
                       qryAtualiza.Close;
                    except
                      on E: Exception do
                      begin
                         lErro := True;
                         mmoLog.Lines.Add('*** ERRO: ' + E.Message + ' - ' + DateTimeToStr(Now));
                      end;
                    end;

                    bdBase.Close;
                end
                else
                if cdsScriptTipo.Value = 'Linha de Comando' then
                begin
                    try
                       ExecAndWait(cdsScriptComando.Value,cdsScriptAux_1.Value,SW_HIDE);
                    except
                      on E: Exception do
                      begin
                         lErro := True;
                         mmoLog.Lines.Add('*** ERRO: ' + E.Message + ' - ' + DateTimeToStr(Now));
                      end;
                    end;
                end;

                mmoLog.Lines.Add('Final da Instrução ' + cdsScriptNome.AsString + ' - ' + DateTimeToStr(Now));
            end;

            if lErro then
               cdsScript.Last
            else
               cdsScript.Next;
        end;
    end;

    sXML := ExtractFileName(lblArquivo.Caption);
    sEXT := ExtractFileExt(lblArquivo.Caption);
    sLOG := Copy(sXML,1,Length(sXML) - Length(sEXT));
    sLOG := 'C:\Analyzer\Temp\' + sLOG + '_' + FormatDateTime('ddmmyyyyHHMMSS',Now) + '.log';

    mmoLog.Lines.Add('');
    mmoLog.Lines.Add('Final da Atualização - ' + DateTimeToStr(Now));

    if lErro then
    begin
        mmoLog.Lines.Add('');
        mmoLog.Lines.Add('*** A Atualização apresentou erros ***');
    end;

    mmoLog.Lines.SaveToFile(sLOG);
end;

procedure TfrmUpdateBase.btnExecutarClick(Sender: TObject);
begin
    Atualizar;

    MessageDlg(HCLResourceStrings.FindID('sString_426'), mtInformation, [mbOK], 0);
end;

procedure TfrmUpdateBase.btnScriptClick(Sender: TObject);
begin
    if frmScripts <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmScripts := TfrmScripts.Create(Self);
    frmScripts.ShowModal;
    FreeAndNil(frmScripts);

    cdsScript.MergeChangeLog;

    if lblArquivo.Caption <> '' then
       cdsScript.SaveToFile(lblArquivo.Caption, dfXMLUTF8);
end;

procedure TfrmUpdateBase.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmUpdateBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    cdsScript.Close;
    Action := caFree;
end;

procedure TfrmUpdateBase.FormCreate(Sender: TObject);
begin
    SetLanguage(2, cxLocalizer1);
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;
end;

procedure TfrmUpdateBase.FormShow(Sender: TObject);
begin
    if FileExists(ParamStr(1)) then
    begin
        lblArquivo.Caption := ParamStr(1);
        Atualizar;
        Application.Terminate;
    end;

    dxSkinController1.SkinName := ParamStr(1);
    if ParamStr(1) <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    lblArquivo.Caption := '';
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

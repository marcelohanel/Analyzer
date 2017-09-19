unit uDynamics;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,   dxPSCore, dxPSContainerLnk, cxButtons,
  ExtCtrls, OleCtrls, OWC11_TLB, cxTextEdit,
  cxDropDownEdit, cxEdit, cxLabel,





  cxLookAndFeels, dxSkinsForm,





  cxLocalization,



  CEVersionInfo, cxGraphics, cxControls, cxLookAndFeelPainters, cxContainer,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxSkinscxPCPainter,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter,
  StdCtrls, cxMaskEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxPScxTLLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrmDynamics = class(TForm)
    bdDados: TADOConnection;
    Panel1: TPanel;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxCustomContainerReportLink;
    Panel3: TPanel;
    ChartSpace1: TChartSpace;
    ADOQuery1: TADOQuery;
    Label2: TcxLabel;
    ComboBox1: TcxComboBox;
    SpeedButton9: TcxButton;
    SpeedButton10: TcxButton;
    tblCenariosDynamics: TADOTable;
    tblCenariosDynamicsID_CENARIO_DYNAMICS: TWideStringField;
    tblCenariosDynamicsID_DYNAMICS: TWideStringField;
    tblCenariosDynamicsID_USUARIO: TWideStringField;
    tblCenariosDynamicsVALOR: TBlobField;
    dxSkinController1: TdxSkinController;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton1: TcxButton;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConnectionString : string;
    CommandText : string;
    Usuario : string;
    Analise : string;
    dados   : string;
    sTempDirUsuario : string;
  end;

var
  frmDynamics: TfrmDynamics;

implementation

uses uDescricao, uFuncoes, uCopiarPadroesDynamics;

{$R *.dfm}

procedure TfrmDynamics.ComboBox1PropertiesChange(Sender: TObject);
var
    aux, aux1 : string;
begin
    tblCenariosDynamics.Open;

    if ComboBox1.Text <> '' then
    begin
        if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,Analise,Usuario]),[]) then
        begin
            aux := tblCenariosDynamicsVALOR.AsString;
            aux1 := LocalizaEntre('x:ConnectionString','/x:ConnectionString',aux);
            aux1 := Copy(aux1,5,length(aux1) - 7);
            aux := ReplaceStr(aux,aux1,ConnectionString);

            ChartSpace1.XMLData := aux; //tblCenariosDynamicsVALOR.AsString;

            aux1 := LocalizaEntre('x:CommandText','/x:CommandText',ChartSpace1.XMLData);
            aux1 := Copy(aux1,5,length(aux1) - 7);
            aux := ReplaceStr(aux,aux1,CommandText);

            ChartSpace1.XMLData := aux; //tblCenariosDynamicsVALOR.AsString;
        end;
    end;

    tblCenariosDynamics.Close;
end;

procedure TfrmDynamics.ComboBox1PropertiesInitPopup(Sender: TObject);
var
    aux : string;
begin
    aux := ComboBox1.Text;

    ComboBox1.Properties.Items.Clear;
    ComboBox1.Clear;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT ID_CENARIO_DYNAMICS, VALOR FROM CENARIOS_DYNAMICS');
    ADOQuery1.SQL.Add('WHERE ID_USUARIO  = ' + #39 + Usuario + #39);
    ADOQuery1.SQL.Add('AND   ID_DYNAMICS = ' + #39 + Analise + #39);
    ADOQuery1.SQL.Add('ORDER BY ID_CENARIO_DYNAMICS');
    ADOQuery1.Open;

    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        ComboBox1.Properties.Items.Add(ADOQuery1.Fields[0].AsString);
        ADOQuery1.Next;
    end;

    ADOQuery1.Close;
    ComboBox1.Text := aux;
end;
procedure TfrmDynamics.cxButton1Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        try
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT ID_DYNAMICS, DESCRICAO FROM DYNAMICS');
            ADOQuery1.SQL.Add('WHERE ID_DYNAMICS = ' + #39 + Analise + #39);
            ADOQuery1.Open;
        except
        end;

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := ADOQuery1.Fields[1].AsString;
        ADOQuery1.Close;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;

end;

procedure TfrmDynamics.cxButton4Click(Sender: TObject);
begin
    if frmCopiarPadroesDynamics = nil then
    begin
        frmCopiarPadroesDynamics := TfrmCopiarPadroesDynamics.Create(Self);

        frmCopiarPadroesDynamics.edtUsuario.Text := Usuario;

        frmCopiarPadroesDynamics.ShowModal;
        FreeAndNil(frmCopiarPadroesDynamics);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCopiarPadroesDynamics);
    end;
end;

procedure TfrmDynamics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(bdDados,Usuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    bdDados.Close;
    Action := caFree;
end;

procedure TfrmDynamics.FormShow(Sender: TObject);
begin
    try
      bdDados.Close;
      bdDados.ConnectionString := dados;
      bdDados.Open;

      ChartSpace1.ConnectionString := ConnectionString;
      ChartSpace1.CommandText := CommandText;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    GeraLog(bdDados,Usuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmDynamics.FormCreate(Sender: TObject);
var
    comando : TStrings;
begin
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    SetLanguage(2,cxLocalizer1);

    try
        if ParamStr(1) = '' then
           Application.Terminate;

        if ParamStr(2) = '' then
           Application.Terminate;

        if ParamStr(1) <> 'kc457012' then
           Application.Terminate;

        Usuario         := ParamStr(2);
        sTempDirUsuario := 'C:\Analyzer\Temp\' + Usuario + '\';

        if not FileExists(sTempDirUsuario + 'analise.txt') then
           Application.Terminate;

        if not FileExists(sTempDirUsuario + 'connection.txt') then
           Application.Terminate;

        if not FileExists(sTempDirUsuario + 'command.txt') then
           Application.Terminate;

        if not FileExists(sTempDirUsuario + 'Conexao.txt') then
           Application.Terminate;

        comando := TStringList.Create;

        comando.Clear;
        comando.LoadFromFile(sTempDirUsuario + 'Conexao.txt');
        dados := comando.Text;

        comando.Clear;
        comando.LoadFromFile(sTempDirUsuario + 'analise.txt');
        Analise := comando.Strings[0];

        comando.Clear;
        comando.LoadFromFile(sTempDirUsuario + 'connection.txt');
        ConnectionString := comando.Text;

        comando.Clear;
        comando.LoadFromFile(sTempDirUsuario + 'command.txt');
        CommandText := comando.Text;

        comando.free;

        DeleteFile(sTempDirUsuario + 'analise.txt');
        DeleteFile(sTempDirUsuario + 'connection.txt');
        DeleteFile(sTempDirUsuario + 'command.txt');
        DeleteFile(sTempDirUsuario + 'conexao.txt');
    except
        MessageDlg(HCLResourceStrings.FindID('sString_337'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    dxSkinController1.SkinName := ParamStr(3);
    if ParamStr(3) <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    Self.Caption := Self.Caption + ' - ' + Analise;
end;

procedure TfrmDynamics.SpeedButton10Click(Sender: TObject);
var
    i : integer;
begin
    tblCenariosDynamics.Open;

    if ComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_38'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if ComboBox1.Text <> '' then
    begin
        if MessageDlg(HCLResourceStrings.FindID('sString_39'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
        begin
            if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,Analise,Usuario]),[]) then
            begin
                tblCenariosDynamics.Delete;
                ComboBox1.Text := '';
            end;
        end;
    end;

    tblCenariosDynamics.Close;
end;

procedure TfrmDynamics.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmDynamics.SpeedButton4Click(Sender: TObject);
var
    lDisplay : Boolean;
begin
    lDisplay                   := ChartSpace1.DisplayToolbar;
    ChartSpace1.DisplayToolbar := False;

    dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_338') + Analise;
    dxComponentPrinter.Preview(True,nil);

    ChartSpace1.DisplayToolbar := lDisplay;
end;

procedure TfrmDynamics.SpeedButton9Click(Sender: TObject);
var
    aux : string;
    i : integer;
begin
    tblCenariosDynamics.Open;

    if ComboBox1.Text = '' then
    begin
        aux := InputBox(HCLResourceStrings.FindID('sString_32'),HCLResourceStrings.FindID('sString_34'),'');

        if aux = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_35'), mtInformation, [mbOK], 0);
            Exit;
        end;

        if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([aux,Analise,Usuario]),[]) then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_36'), mtInformation, [mbOK], 0);
            Exit;
        end;

        tblCenariosDynamics.Insert;
        tblCenariosDynamicsID_CENARIO_DYNAMICS.Value := aux;
    end
    else
    begin
        if tblCenariosDynamics.Locate('ID_CENARIO_DYNAMICS;ID_DYNAMICS;ID_USUARIO',VarArrayOf([ComboBox1.Text,Analise,Usuario]),[]) then
           tblCenariosDynamics.Edit
        else
           tblCenariosDynamics.Insert;

        tblCenariosDynamicsID_CENARIO_DYNAMICS.Value := ComboBox1.Text;
    end;

    tblCenariosDynamicsID_USUARIO.Value  := Usuario;
    tblCenariosDynamicsID_DYNAMICS.Value := Analise;
    tblCenariosDynamicsVALOR.AsString    := ChartSpace1.XMLData;

    tblCenariosDynamics.Post;

    ComboBox1.Text := tblCenariosDynamicsID_CENARIO_DYNAMICS.Value;

    tblCenariosDynamics.Close;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.


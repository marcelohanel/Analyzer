unit uInfoLocalizacao;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,







  cxImage, cxTextEdit, cxContainer, cxLabel,
  Xmlxform, DB, DBClient, cxProgressBar, cxGroupBox, ADODB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, xmldom, Provider,
  dxGDIPlusClasses, StdCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

function ValidaEstado(Estado: string): boolean;
function NomeEstado(Estado: string): string;
function NomeRegiao(Estado: string): string;

type
  TfrmInfoLocalizacao = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    edtXML: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtXTR: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxImage1: TcxImage;
    OpenDialog1: TOpenDialog;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    OpenDialog2: TOpenDialog;
    cdsFolder: TClientDataSet;
    XMLTransformProvider1: TXMLTransformProvider;
    cdsFoldername: TStringField;
    cdsFolderopen: TStringField;
    cdsFolderPlacemark: TDataSetField;
    cdsLocalizacao: TClientDataSet;
    cxGroupBox1: TcxGroupBox;
    pgrGeral: TcxProgressBar;
    lblAtividade: TcxLabel;
    pgrIndividual: TcxProgressBar;
    cdsLocalizacaoname: TStringField;
    cdsLocalizacaodescription: TStringField;
    cdsLocalizacaostyleUrl: TStringField;
    cdsLocalizacaocoordinates: TStringField;
    ADOQuery1: TADOQuery;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure Atualiza;
    procedure FormCreate(Sender: TObject);
  private
    procedure InsertAccess(sEstado, sCidade, sLatitude, sLongitude: string);
    procedure InsertSQLServer(sEstado, sCidade, sLatitude, sLongitude: string);
    { Private declarations }
  public
    { Public declarations }
    lOK : boolean;
  end;

var
  frmInfoLocalizacao: TfrmInfoLocalizacao;
  lErro : boolean;

implementation

uses uPrincipal, uArqGeoAnalises, uFuncoes;

{$R *.dfm}

function NomeRegiao(Estado: string): string;
begin
    Result := '';
    if Estado = 'AC' then
       Result := 'Norte'
    else
    if Estado = 'AL' then
       Result := 'Nordeste'
    else
    if Estado = 'AP' then
       Result := 'Norte'
    else
    if Estado = 'AM' then
       Result := 'Norte'
    else
    if Estado = 'BA' then
       Result := 'Nordeste'
    else
    if Estado = 'CE' then
       Result := 'Nordeste'
    else
    if Estado = 'DF' then
       Result := 'Centro Oeste'
    else
    if Estado = 'ES' then
       Result := 'Sudeste'
    else
    if Estado = 'GO' then
       Result := 'Centro Oeste'
    else
    if Estado = 'MA' then
       Result := 'Nordeste'
    else
    if Estado = 'MT' then
       Result := 'Centro Oeste'
    else
    if Estado = 'MS' then
       Result := 'Centro Oeste'
    else
    if Estado = 'MG' then
       Result := 'Sudeste'
    else
    if Estado = 'PA' then
       Result := 'Norte'
    else
    if Estado = 'PB' then
       Result := 'Nordeste'
    else
    if Estado = 'PR' then
       Result := 'Sul'
    else
    if Estado = 'PE' then
       Result := 'Nordeste'
    else
    if Estado = 'PI' then
       Result := 'Nordeste'
    else
    if Estado = 'RJ' then
       Result := 'Sudeste'
    else
    if Estado = 'RN' then
       Result := 'Nordeste'
    else
    if Estado = 'RS' then
       Result := 'Sul'
    else
    if Estado = 'RO' then
       Result := 'Norte'
    else
    if Estado = 'RR' then
       Result := 'Norte'
    else
    if Estado = 'SC' then
       Result := 'Sul'
    else
    if Estado = 'SP' then
       Result := 'Sudeste'
    else
    if Estado = 'SE' then
       Result := 'Nordeste'
    else
    if Estado = 'TO' then
       Result := 'Norte';
end;

function NomeEstado(Estado: string): string;
begin
    Result := '';
    if Estado = 'AC' then
       Result := 'Acre'
    else
    if Estado = 'AL' then
       Result := 'Alagoas'
    else
    if Estado = 'AP' then
       Result := 'Amapa'
    else
    if Estado = 'AM' then
       Result := 'Amazonas'
    else
    if Estado = 'BA' then
       Result := 'Bahia'
    else
    if Estado = 'CE' then
       Result := 'Ceara'
    else
    if Estado = 'DF' then
       Result := 'Distrito Federal'
    else
    if Estado = 'ES' then
       Result := 'Espirito Santo'
    else
    if Estado = 'GO' then
       Result := 'Goias'
    else
    if Estado = 'MA' then
       Result := 'Maranhao'
    else
    if Estado = 'MT' then
       Result := 'Mato Grosso'
    else
    if Estado = 'MS' then
       Result := 'Mato Grosso do Sul'
    else
    if Estado = 'MG' then
       Result := 'Minas Gerais'
    else
    if Estado = 'PA' then
       Result := 'Para'
    else
    if Estado = 'PB' then
       Result := 'Paraiba'
    else
    if Estado = 'PR' then
       Result := 'Parana'
    else
    if Estado = 'PE' then
       Result := 'Pernambuco'
    else
    if Estado = 'PI' then
       Result := 'Piaui'
    else
    if Estado = 'RJ' then
       Result := 'Rio de Janeiro'
    else
    if Estado = 'RN' then
       Result := 'Rio Grande do Norte'
    else
    if Estado = 'RS' then
       Result := 'Rio Grande do Sul'
    else
    if Estado = 'RO' then
       Result := 'Rondonia'
    else
    if Estado = 'RR' then
       Result := 'Roraima'
    else
    if Estado = 'SC' then
       Result := 'Santa Catarina'
    else
    if Estado = 'SP' then
       Result := 'Sao Paulo'
    else
    if Estado = 'SE' then
       Result := 'Sergipe'
    else
    if Estado = 'TO' then
       Result := 'Tocantins';
end;

function ValidaEstado(Estado: string): boolean;
begin
    Result := True;

    if (Estado <> 'AC') and
       (Estado <> 'AL') and
       (Estado <> 'AP') and
       (Estado <> 'AM') and
       (Estado <> 'BA') and
       (Estado <> 'CE') and
       (Estado <> 'DF') and
       (Estado <> 'ES') and
       (Estado <> 'GO') and
       (Estado <> 'MA') and
       (Estado <> 'MT') and
       (Estado <> 'MS') and
       (Estado <> 'MG') and
       (Estado <> 'PA') and
       (Estado <> 'PB') and
       (Estado <> 'PR') and
       (Estado <> 'PE') and
       (Estado <> 'PI') and
       (Estado <> 'RJ') and
       (Estado <> 'RN') and
       (Estado <> 'RS') and
       (Estado <> 'RO') and
       (Estado <> 'RR') and
       (Estado <> 'SC') and
       (Estado <> 'SP') and
       (Estado <> 'SE') and
       (Estado <> 'TO') then
       Result := False;

end;

procedure TfrmInfoLocalizacao.Atualiza;
var
    sCidade    : string;
    sEstado    : string;
    sLatitude  : string;
    sLongitude : string;
begin
    lErro := false;

    pgrGeral.Properties.Max := 4;
    pgrGeral.Position := 0;
    pgrGeral.Update;

    pgrGeral.Position := pgrGeral.Position + 1;
    pgrGeral.Update;

    XMLTransformProvider1.TransformRead.TransformationFile := edtXTR.Text;
    XMLTransformProvider1.XMLDataFile                      := edtXML.Text;

    cdsFolder.Open;
    cdsFolder.First;

    pgrGeral.Position := pgrGeral.Position + 1;
    pgrGeral.Update;

    if frmArqGeoAnalises = nil then
    begin
        frmArqGeoAnalises := TfrmArqGeoAnalises.Create(Self);
        frmArqGeoAnalises.CriaBaseDados;
        FreeAndNil(frmArqGeoAnalises);
    end;

    pgrGeral.Position := pgrGeral.Position + 1;
    pgrGeral.Update;

    while not cdsFolder.Eof do
    begin
        pgrIndividual.Properties.Max := cdsLocalizacao.RecordCount;
        pgrIndividual.Position := 0;
        pgrIndividual.Update;

        cdsLocalizacao.First;
        while not cdsLocalizacao.Eof do
        begin
            pgrIndividual.Position := pgrIndividual.Position + 1;
            pgrIndividual.Update;

            lblAtividade.Caption := cdsFoldername.AsString + ': ' + cdsLocalizacaoname.AsString;
            lblAtividade.Update;

            sCidade := Entry(1,cdsLocalizacaoname.AsString,'/');
            sEstado := Entry(2,cdsLocalizacaoname.AsString,'/');
            sCidade := RemoveAcento(sCidade);
            sEstado := RemoveAcento(sEstado);

            sLatitude   := Entry(1,cdsLocalizacaocoordinates.AsString,',');
            sLongitude  := Entry(2,cdsLocalizacaocoordinates.AsString,',');
            sLatitude   := StringReplace(sLatitude,'.',',',[rfReplaceAll]);
            sLongitude  := StringReplace(sLongitude,'.',',',[rfReplaceAll]);

            if ValidaEstado(sEstado) then
            begin
                if frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft Access' then
                   InsertAccess(sEstado, sCidade, sLatitude, sLongitude)
                else
                if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft SQL Server')  or
                   (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'MySQL')                 or
                   (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Postgres')              or
                   (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Firebird ou Interbase') or
                   (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Oracle')                then
                    InsertSQLServer(sEstado, sCidade, sLatitude, sLongitude);
            end;

            cdsLocalizacao.Next;
        end;

        cdsFolder.Next;
    end;

    pgrGeral.Position := pgrGeral.Position + 1;
    pgrGeral.Update;
end;

procedure TfrmInfoLocalizacao.InsertSQLServer(sEstado, sCidade, sLatitude, sLongitude: string);
begin
    try
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('INSERT INTO GEO_REFERENCIA');
        ADOQuery1.SQL.Add('(');
        ADOQuery1.SQL.Add(' ID_REFERENCIA');
        ADOQuery1.SQL.Add(',CIDADE');
        ADOQuery1.SQL.Add(',MICROREGIAO');
        ADOQuery1.SQL.Add(',MESOREGIAO');
        ADOQuery1.SQL.Add(',ESTADO');
        ADOQuery1.SQL.Add(',REGIAO');
        ADOQuery1.SQL.Add(',PAIS');
        ADOQuery1.SQL.Add(',REF_PAIS');
        ADOQuery1.SQL.Add(',REF_REGIAO');
        ADOQuery1.SQL.Add(',REF_ESTADO');
        ADOQuery1.SQL.Add(',REF_MESO');
        ADOQuery1.SQL.Add(',REF_MICRO');
        ADOQuery1.SQL.Add(',LATITUDE');
        ADOQuery1.SQL.Add(',LONGITUDE');
        ADOQuery1.SQL.Add(')');
        ADOQuery1.SQL.Add('VALUES');
        ADOQuery1.SQL.Add('(');
        ADOQuery1.SQL.Add(      #39 + UpperCase(sEstado) + UpperCase(sCidade) + #39);
        ADOQuery1.SQL.Add(',' + #39 + sCidade  + #39);
        ADOQuery1.SQL.Add(',' + #39 + '...'    + #39);
        ADOQuery1.SQL.Add(',' + #39 + '...'    + #39);
        ADOQuery1.SQL.Add(',' + #39 + NomeEstado(sEstado) + #39);
        ADOQuery1.SQL.Add(',' + #39 + NomeRegiao(sEstado) + #39);
        ADOQuery1.SQL.Add(',' + #39 + 'Brasil' + #39);

        // REF_PAIS
        if (sCidade = 'Brasilia') and (sEstado = 'DF') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
            ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_REGIAO
        if (sCidade = 'Florianopolis') and (sEstado = 'SC') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Sao Paulo') and (sEstado = 'SP') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Goiania') and (sEstado = 'GO') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Salvador') and (sEstado = 'BA') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Manaus') and (sEstado = 'AM') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
            ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_ESTADO
        if cdsFoldername.AsString = 'Capitais' then
           ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
           ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_MESO
        ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_MICRO
        ADOQuery1.SQL.Add(',' + #39 + #39);

        ADOQuery1.SQL.Add(',' + StringReplace(FormatFloat('0.00000000',StrToFloat(sLatitude)),',','.',[rfReplaceAll]));
        ADOQuery1.SQL.Add(',' + StringReplace(FormatFloat('0.00000000',StrToFloat(sLongitude)),',','.',[rfReplaceAll]));

        ADOQuery1.SQL.Add(')');
        ADOQuery1.ExecSQL;
    except
    end;
end;

procedure TfrmInfoLocalizacao.InsertAccess(sEstado, sCidade, sLatitude, sLongitude: string);
begin
    try
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('INSERT INTO GEO_REFERENCIA');
        ADOQuery1.SQL.Add('(');
        ADOQuery1.SQL.Add(' ID_REFERENCIA');
        ADOQuery1.SQL.Add(',CIDADE');
        ADOQuery1.SQL.Add(',MICROREGIAO');
        ADOQuery1.SQL.Add(',MESOREGIAO');
        ADOQuery1.SQL.Add(',ESTADO');
        ADOQuery1.SQL.Add(',REGIAO');
        ADOQuery1.SQL.Add(',PAIS');
        ADOQuery1.SQL.Add(',REF_PAIS');
        ADOQuery1.SQL.Add(',REF_REGIAO');
        ADOQuery1.SQL.Add(',REF_ESTADO');
        ADOQuery1.SQL.Add(',REF_MESO');
        ADOQuery1.SQL.Add(',REF_MICRO');
        ADOQuery1.SQL.Add(',LATITUDE');
        ADOQuery1.SQL.Add(',LONGITUDE');
        ADOQuery1.SQL.Add(')');
        ADOQuery1.SQL.Add('VALUES');
        ADOQuery1.SQL.Add('(');
        ADOQuery1.SQL.Add(      #39 + UpperCase(sEstado) + UpperCase(sCidade) + #39);
        ADOQuery1.SQL.Add(',' + #39 + sCidade  + #39);
        ADOQuery1.SQL.Add(',' + #39 + '...'    + #39);
        ADOQuery1.SQL.Add(',' + #39 + '...'    + #39);
        ADOQuery1.SQL.Add(',' + #39 + NomeEstado(sEstado) + #39);
        ADOQuery1.SQL.Add(',' + #39 + NomeRegiao(sEstado) + #39);
        ADOQuery1.SQL.Add(',' + #39 + 'Brasil' + #39);

        // REF_PAIS
        if (sCidade = 'Brasilia') and (sEstado = 'DF') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
            ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_REGIAO
        if (sCidade = 'Florianopolis') and (sEstado = 'SC') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Sao Paulo') and (sEstado = 'SP') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Goiania') and (sEstado = 'GO') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Salvador') and (sEstado = 'BA') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
        if (sCidade = 'Manaus') and (sEstado = 'AM') then
            ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
            ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_ESTADO
        if cdsFoldername.AsString = 'Capitais' then
           ADOQuery1.SQL.Add(',' + #39 + 'S' + #39)
        else
           ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_MESO
        ADOQuery1.SQL.Add(',' + #39 + #39);

        // REF_MICRO
        ADOQuery1.SQL.Add(',' + #39 + #39);

        ADOQuery1.SQL.Add(',' + #39 + FormatFloat('0.00000000',StrToFloat(sLatitude))  + #39);
        ADOQuery1.SQL.Add(',' + #39 + FormatFloat('0.00000000',StrToFloat(sLongitude)) + #39);

        ADOQuery1.SQL.Add(')');

        ADOQuery1.ExecSQL;
    except
    end;
end;

procedure TfrmInfoLocalizacao.cxButton1Click(Sender: TObject);
begin
    if not FileExists(edtXML.Text) then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_381'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if not FileExists(edtXTR.Text) then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_382'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if (MessageDlg(HCLResourceStrings.FindID('sString_383'), mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        Exit;

    Atualiza;

    MessageDlg(HCLResourceStrings.FindID('sString_384'), mtInformation, [mbOK], 0);

    lOK := True;

    Close;
end;

procedure TfrmInfoLocalizacao.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfrmInfoLocalizacao.cxButton3Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
       edtXML.Text := OpenDialog1.FileName;
end;

procedure TfrmInfoLocalizacao.cxButton4Click(Sender: TObject);
begin
    if OpenDialog2.Execute then
       edtXTR.Text := OpenDialog2.FileName;
end;

procedure TfrmInfoLocalizacao.FormCreate(Sender: TObject);
begin
    lOK := False;
end;

procedure TfrmInfoLocalizacao.FormShow(Sender: TObject);
begin
    edtXML.Text := ExtractFilePath(Application.ExeName) + 'Localizacao.xml';
    edtXTR.Text := ExtractFilePath(Application.ExeName) + 'Localizacao.xtr';
end;

end.

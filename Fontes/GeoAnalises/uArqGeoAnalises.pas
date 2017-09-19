unit uArqGeoAnalises;

interface

uses
  xhConsts, adodb, dbclient, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, DB,






  cxLabel,
  cxTextEdit, cxDBEdit,
  cxDropDownEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxMaskEdit, cxMemo, StdCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmArqGeoAnalises = class(TForm)
    DataSource1: TDataSource;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel3: TcxLabel;
    cxDBMemo2: TcxDBMemo;
    btnConectar: TcxButton;
    ADOConnection1: TADOConnection;
    qryAtualiza: TADOQuery;
    cbxSGBD: TcxComboBox;
    cxLabel4: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure CriaBaseDados;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CriaAccess;
    procedure CriaSQLServer;
    procedure CriaOracle;
  public
    { Public declarations }
    lOK : boolean;
  end;

var
  frmArqGeoAnalises: TfrmArqGeoAnalises;
  lErro : boolean;

implementation

uses uPrincipal;

{$R *.dfm}

procedure TfrmArqGeoAnalises.btnConectarClick(Sender: TObject);
var
    ConnectionString: String;
begin
    ConnectionString := PromptDataSource(0, '');

    if ConnectionString > '' then
       frmPrincipal.cdsGeoAnalisesconnection_string.Value := ConnectionString;
end;

procedure TfrmArqGeoAnalises.CriaBaseDados;
begin
    lErro := false;

    try
        ADOConnection1.Close;
        ADOConnection1.ConnectionString := frmPrincipal.cdsGeoAnalisesconnection_string.AsString;
        ADOConnection1.Open;
    except
        on E: Exception do
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_387') +#13+#10+ '' +#13+#10+ HCLResourceStrings.FindID('sString_397') + e.Message, mtWarning, [mbOK], 0);
            lErro := true;
            exit;
        end;
    end;

    if frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft Access' then
       CriaAccess;

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft SQL Server')  or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'MySQL')                 or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Postgres')              or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Firebird ou Interbase') then
        CriaSQLServer;

    if frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Oracle' then
       CriaOracle;
end;

procedure TfrmArqGeoAnalises.CriaOracle;
begin
    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('(');
      qryAtualiza.SQL.Add(' ID_REFERENCIA   VARCHAR2(100) NOT NULL');
      qryAtualiza.SQL.Add(',CIDADE          VARCHAR2(100)');
      qryAtualiza.SQL.Add(',MICROREGIAO     VARCHAR2(100)');
      qryAtualiza.SQL.Add(',MESOREGIAO      VARCHAR2(100)');
      qryAtualiza.SQL.Add(',ESTADO          VARCHAR2(100)');
      qryAtualiza.SQL.Add(',REGIAO          VARCHAR2(100)');
      qryAtualiza.SQL.Add(',PAIS            VARCHAR2(100)');
      qryAtualiza.SQL.Add(',REF_PAIS        VARCHAR2(1)');
      qryAtualiza.SQL.Add(',REF_REGIAO      VARCHAR2(1)');
      qryAtualiza.SQL.Add(',REF_ESTADO      VARCHAR2(1)');
      qryAtualiza.SQL.Add(',REF_MESO        VARCHAR2(1)');
      qryAtualiza.SQL.Add(',REF_MICRO       VARCHAR2(1)');
      qryAtualiza.SQL.Add(',LATITUDE        FLOAT');
      qryAtualiza.SQL.Add(',LONGITUDE       FLOAT');
      qryAtualiza.SQL.Add(')');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('ALTER TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('ADD CONSTRAINT PK_GEO_REFERENCIA PRIMARY KEY(ID_REFERENCIA) ENABLE');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_PAIS');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (PAIS)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_REGIAO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (REGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_ESTADO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (ESTADO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MESO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MESOREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MICRO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MICROREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_CIDADE');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (CIDADE)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;
end;

procedure TfrmArqGeoAnalises.CriaSQLServer;
begin
    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('(');
      qryAtualiza.SQL.Add(' ID_REFERENCIA   VARCHAR(100) NOT NULL');
      qryAtualiza.SQL.Add(',CIDADE          VARCHAR(100)');
      qryAtualiza.SQL.Add(',MICROREGIAO     VARCHAR(100)');
      qryAtualiza.SQL.Add(',MESOREGIAO      VARCHAR(100)');
      qryAtualiza.SQL.Add(',ESTADO          VARCHAR(100)');
      qryAtualiza.SQL.Add(',REGIAO          VARCHAR(100)');
      qryAtualiza.SQL.Add(',PAIS            VARCHAR(100)');
      qryAtualiza.SQL.Add(',REF_PAIS        VARCHAR(1)');
      qryAtualiza.SQL.Add(',REF_REGIAO      VARCHAR(1)');
      qryAtualiza.SQL.Add(',REF_ESTADO      VARCHAR(1)');
      qryAtualiza.SQL.Add(',REF_MESO        VARCHAR(1)');
      qryAtualiza.SQL.Add(',REF_MICRO       VARCHAR(1)');
      qryAtualiza.SQL.Add(',LATITUDE        FLOAT');
      qryAtualiza.SQL.Add(',LONGITUDE       FLOAT');
      qryAtualiza.SQL.Add(')');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('ALTER TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('ADD CONSTRAINT PK_GEO_REFERENCIA PRIMARY KEY(ID_REFERENCIA)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_PAIS');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (PAIS)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_REGIAO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (REGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_ESTADO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (ESTADO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MESO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MESOREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MICRO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MICROREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_CIDADE');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (CIDADE)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;
end;

procedure TfrmArqGeoAnalises.CriaAccess;
begin
    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('(');
      qryAtualiza.SQL.Add(' ID_REFERENCIA   TEXT(100)');
      qryAtualiza.SQL.Add(',CIDADE          TEXT(100)');
      qryAtualiza.SQL.Add(',MICROREGIAO     TEXT(100)');
      qryAtualiza.SQL.Add(',MESOREGIAO      TEXT(100)');
      qryAtualiza.SQL.Add(',ESTADO          TEXT(100)');
      qryAtualiza.SQL.Add(',REGIAO          TEXT(100)');
      qryAtualiza.SQL.Add(',PAIS            TEXT(100)');
      qryAtualiza.SQL.Add(',REF_PAIS        TEXT(1)');
      qryAtualiza.SQL.Add(',REF_REGIAO      TEXT(1)');
      qryAtualiza.SQL.Add(',REF_ESTADO      TEXT(1)');
      qryAtualiza.SQL.Add(',REF_MESO        TEXT(1)');
      qryAtualiza.SQL.Add(',REF_MICRO       TEXT(1)');
      qryAtualiza.SQL.Add(',LATITUDE        DOUBLE');
      qryAtualiza.SQL.Add(',LONGITUDE       DOUBLE');
      qryAtualiza.SQL.Add(')');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('ALTER TABLE GEO_REFERENCIA');
      qryAtualiza.SQL.Add('ADD CONSTRAINT PK_GEO_REFERENCIA PRIMARY KEY(ID_REFERENCIA)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_PAIS');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (PAIS)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_REGIAO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (REGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_ESTADO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (ESTADO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MESO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MESOREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_MICRO');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (MICROREGIAO)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;

    try
      qryAtualiza.Close;
      qryAtualiza.SQL.Clear;
      qryAtualiza.SQL.Add('CREATE INDEX ixGEO_REFERENCIA_CIDADE');
      qryAtualiza.SQL.Add(' ON GEO_REFERENCIA (CIDADE)');
      qryAtualiza.ExecSQL;
      qryAtualiza.Close;
    except
    end;
end;

procedure TfrmArqGeoAnalises.cxButton1Click(Sender: TObject);
begin
    if cxDBTextEdit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_388'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cxDBMemo2.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_389'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString := cbxSGBD.Text;

    frmPrincipal.aguarde(0,HCLResourceStrings.FindID('sString_390'));
    CriaBaseDados;
    frmPrincipal.aguarde(1,'');

    if lErro then
       Exit;

    frmPrincipal.sArquivo := frmPrincipal.sTempDirUsuario + trim(frmPrincipal.cdsGeoAnalisesid_geo.AsString) + '.geo';
    frmPrincipal.cdsGeoAnalises.Post;
    frmPrincipal.cdsGeoAnalises.MergeChangeLog;
    frmPrincipal.cdsGeoAnalises.SaveToFile(frmPrincipal.sArquivo);

    {
    if SaveDialog1.Execute then
    begin
        frmPrincipal.cdsGeoAnalises.Post;
        frmPrincipal.cdsGeoAnalises.MergeChangeLog;
        frmPrincipal.cdsGeoAnalises.SaveToFile(SaveDialog1.FileName);
        frmPrincipal.sArquivo := SaveDialog1.FileName;
    end;}

    lOK := True;
    close;
end;

procedure TfrmArqGeoAnalises.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfrmArqGeoAnalises.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ADOConnection1.Close;
    frmPrincipal.cdsGeoAnalises.Cancel;
end;

procedure TfrmArqGeoAnalises.FormCreate(Sender: TObject);
begin
    lOK := False;
end;

procedure TfrmArqGeoAnalises.FormShow(Sender: TObject);
begin
    frmPrincipal.cdsGeoAnalises.EmptyDataSet;
    frmPrincipal.cdsGeoAnalises.Insert;
end;

end.

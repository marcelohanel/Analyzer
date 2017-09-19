unit uFiltraScoredCard;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxFilterControl, cxDBFilterControl, DB, ADODB,
  cxButtons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls;

type
  TfrmFiltraScoredCard = class(TForm)
    ADOQuery1: TADOQuery;
    cxFilter: TcxDBFilterControl;
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cTipo : string;
    cAnalise : string;
  end;

var
  frmFiltraScoredCard: TfrmFiltraScoredCard;

implementation

uses uScoredCardMan, uScoredCard, uFuncoes;

{$R *.dfm}

procedure TfrmFiltraScoredCard.FormShow(Sender: TObject);
var
    S : TMemoryStream;
    Query : TADOQuery;
    Query1 : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := frmScoredCard.bdDados;
    Query1.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT VISAO_DESTINO, BASE_ORIGEM, VISAO_ORIGEM FROM ANALISES');
    Query.SQL.Add(' WHERE ID_ANALISE = ' + #39 + cAnalise + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmScoredCard.sSGBD = 'Microsoft Access 2007')        or
           (frmScoredCard.sSGBD = 'Microsoft Access 2010')        or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmScoredCard.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT TOP 1 *');

            if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
               (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
                ADOQuery1.SQL.Add('FROM [' + Query.FieldByName('VISAO_DESTINO').Value + ']')
            else
                ADOQuery1.SQL.Add('FROM [_' + Query.FieldByName('VISAO_DESTINO').Value + ']');
        end;

        if frmScoredCard.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT *');

            if (Query.FieldByName('BASE_ORIGEM').Value  = '.') and
               (Query.FieldByName('VISAO_ORIGEM').Value = '.') then
                ADOQuery1.SQL.Add('FROM `' + Query.FieldByName('VISAO_DESTINO').Value + '`')
            else
                ADOQuery1.SQL.Add('FROM `_' + Query.FieldByName('VISAO_DESTINO').Value + '`');

            ADOQuery1.SQL.Add('LIMIT 0,1');
        end;

        ADOQuery1.Open;

        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT ID_SCORED, TITULO, GRAFICO, GRAFICO_MINIMO, GRAFICO_MAXIMO FROM SCORED_CARD_FILTRO');
        Query1.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
        Query1.SQL.Add('AND TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
        Query1.Open;
        Query1.First;
        if not Query1.IsEmpty then
        begin
            try
                S := TMemoryStream.Create;

                if cTipo = '0' then
                   TBlobField(Query1.FieldByName('GRAFICO')).SaveToStream(S);

                if cTipo = '1' then
                   TBlobField(Query1.FieldByName('GRAFICO_MINIMO')).SaveToStream(S);

                if cTipo = '2' then
                   TBlobField(Query1.FieldByName('GRAFICO_MAXIMO')).SaveToStream(S);

                S.Position := 0;
                cxFilter.LoadFromStream(S);
                S.Free;
            except
            end;
        end;
    end;

    Query.Close;
    Query.Free;

    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmFiltraScoredCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmScoredCard.bdDados,frmScoredCard.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    ADOQuery1.Close;
end;

procedure TfrmFiltraScoredCard.SpeedButton3Click(Sender: TObject);
var
    S : TMemoryStream;
    Query : TADOQuery;
begin
    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmScoredCard.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ID_SCORED, TITULO, TEXTO, TEXTO_MINIMO, TEXTO_MAXIMO, GRAFICO, GRAFICO_MINIMO, GRAFICO_MAXIMO FROM SCORED_CARD_FILTRO');
    Query.SQL.Add('WHERE ID_SCORED = ' + #39 + frmScoredCard.tblScoredCardID_SCORED.Value + #39);
    Query.SQL.Add('AND TITULO = ' + #39 + frmScoredCardMan.titulo + #39);
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
       Query.Edit
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_131'), mtInformation, [mbOK], 0);
        Exit;
    end;

    Query.FieldByName('ID_SCORED').Value := frmScoredCard.tblScoredCardID_SCORED.Value;
    Query.FieldByName('TITULO').Value    := frmScoredCardMan.titulo;

    if cTipo = '0' then
       Query.FieldByName('TEXTO').Value := cxFilter.FilterText;

    if cTipo = '1' then
       Query.FieldByName('TEXTO_MINIMO').Value := cxFilter.FilterText;

    if cTipo = '2' then
       Query.FieldByName('TEXTO_MAXIMO').Value := cxFilter.FilterText;

    S := TMemoryStream.Create;
    cxFilter.SaveToStream(S);
    S.Position := 0;

    if cTipo = '0' then
       TBlobField(Query.FieldByName('GRAFICO')).LoadFromStream(S);

    if cTipo = '1' then
       TBlobField(Query.FieldByName('GRAFICO_MINIMO')).LoadFromStream(S);

    if cTipo = '2' then
       TBlobField(Query.FieldByName('GRAFICO_MAXIMO')).LoadFromStream(S);

    S.Free;

    Query.Post;

    close;
end;

procedure TfrmFiltraScoredCard.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

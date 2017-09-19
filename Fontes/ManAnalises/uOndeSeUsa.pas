unit uOndeSeUsa;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, DB, ADODB,
  cxListBox, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls, cxContainer, cxEdit;

type
  TfrmOndeSeUsa = class(TForm)
    cxListBox1: TcxListBox;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    SpeedButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOndeSeUsa: TfrmOndeSeUsa;

implementation

uses uFuncoes, uAnalises;

{$R *.dfm}

procedure TfrmOndeSeUsa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmOndeSeUsa.FormShow(Sender: TObject);
begin
    cxListBox1.Items.Clear;

    cxListBox1.Items.Add('Análises ABC');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_abc from abc');
    ADOQuery1.SQL.Add('where id_analise = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Dynamics');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_dynamics from dynamics');
    ADOQuery1.SQL.Add('where id_analise = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Fotografias');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_fotografia from fotografia');
    ADOQuery1.SQL.Add('where id_analise = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Freqüências');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_frequencia from frequencia');
    ADOQuery1.SQL.Add('where id_analise = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Scored Card - Valor');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_scored, titulo from scored_card_filtro');
    ADOQuery1.SQL.Add('where id_analise = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString + ' - Título: ' + ADOQuery1.Fields[1].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Scored Card - Valor Mínimo');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_scored, titulo from scored_card_filtro');
    ADOQuery1.SQL.Add('where analise_minimo = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString + ' - Título: ' + ADOQuery1.Fields[1].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    cxListBox1.Items.Add('Scored Card - Valor Máximo');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select id_scored, titulo from scored_card_filtro');
    ADOQuery1.SQL.Add('where analise_maximo = ' + #39 + frmAnalises.tblAnalisesID_ANALISE.Value + #39);
    ADOQuery1.Open;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
        cxListBox1.Items.Add(' - ' + ADOQuery1.Fields[0].AsString + ' - Título: ' + ADOQuery1.Fields[1].AsString);
        ADOQuery1.Next;
    end;
    ADOQuery1.Close;
    cxListBox1.Items.Add('');

    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
 end;

procedure TfrmOndeSeUsa.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

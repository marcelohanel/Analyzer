unit uPersonalizarScored;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel,
  cxListBox, cxButtons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxContainer, cxEdit, StdCtrls;

type
  TfrmPersonalizarScored = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxListBox1: TcxListBox;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    cxListBox2: TcxListBox;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPersonalizarScored: TfrmPersonalizarScored;

implementation

uses uMostraScored, cxTL, uFuncoes;

{$R *.dfm}

procedure TfrmPersonalizarScored.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmPersonalizarScored.FormShow(Sender: TObject);
var
    i : integer;
    sAux : string;
begin
    for i := 0 to 13 do
    begin
        sAux := LePadraoString(frmMostraScored.bdDados,
                          'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                          frmMostraScored.sUsuario,
                          'frmPersonalizarScored',
                          'campo' + frmMostraScored.cxTreeList1.Columns[i].Caption.Text);

        if sAux = 'False' then
           cxListBox2.Items.Add(frmMostraScored.cxTreeList1.Columns[i].Caption.Text)
        else
           cxListBox1.Items.Add(frmMostraScored.cxTreeList1.Columns[i].Caption.Text);
    end;

    sAux := LePadraoString(frmMostraScored.bdDados,
                      'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                      frmMostraScored.sUsuario,
                      'frmPersonalizarScored',
                      'campo' + frmMostraScored.cxTreeList1.Columns[18].Caption.Text);

    if sAux = 'False' then
       cxListBox2.Items.Add(frmMostraScored.cxTreeList1.Columns[18].Caption.Text)
    else
       cxListBox1.Items.Add(frmMostraScored.cxTreeList1.Columns[18].Caption.Text);

    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmPersonalizarScored.cxButton1Click(Sender: TObject);
begin
    try
       cxListBox2.Items.Add(cxListBox1.Items.Strings[cxListBox1.ItemIndex]);
       cxListBox1.DeleteSelected;
    except
    end;
end;

procedure TfrmPersonalizarScored.cxButton2Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox1.Items.Count - 1 do
           cxListBox2.Items.Add(cxListBox1.Items.Strings[i]);
       cxListBox1.Items.Clear;
    except
    end;
end;

procedure TfrmPersonalizarScored.cxButton3Click(Sender: TObject);
begin
    try
       cxListBox1.Items.Add(cxListBox2.Items.Strings[cxListBox2.ItemIndex]);
       cxListBox2.DeleteSelected;
    except
    end;
end;

procedure TfrmPersonalizarScored.cxButton4Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox2.Items.Count - 1 do
           cxListBox1.Items.Add(cxListBox2.Items.Strings[i]);
       cxListBox2.Items.Clear;
    except
    end;
end;

procedure TfrmPersonalizarScored.SpeedButton3Click(Sender: TObject);
var
    i : integer;
begin
    frmMostraScored.qryAtualiza.Close;
    frmMostraScored.qryAtualiza.SQL.Clear;
    frmMostraScored.qryAtualiza.SQL.Add('DELETE PADROES');
    frmMostraScored.qryAtualiza.SQL.Add('WHERE ID_SCORED  = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39);
    frmMostraScored.qryAtualiza.SQL.Add('AND   ID_USUARIO = ' + #39 + frmMostraScored.sUsuario + #39);
    frmMostraScored.qryAtualiza.SQL.Add('AND   FORMULARIO = ' + #39 + 'frmPersonalizarScored' + #39);

  if (frmMostraScored.sSGBD = 'Microsoft Access 2007') or
     (frmMostraScored.sSGBD = 'Microsoft Access 2010') then
      frmMostraScored.qryAtualiza.SQL.Add('AND   CHAVE ALike ' + #39 + 'campo%' + #39);

  if (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
     (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
     frmMostraScored.qryAtualiza.SQL.Add('AND   CHAVE Like ' + #39 + 'campo%' + #39);

    frmMostraScored.qryAtualiza.ExecSQL;
    frmMostraScored.qryAtualiza.Close;

    for i := 0 to cxListBox1.Items.Count - 1 do
    begin
        SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                     frmMostraScored.sUsuario,
                                     'frmPersonalizarScored',
                                     'campo' + cxListBox1.Items.Strings[i],
                                     'True');
    end;

    for i := 0 to cxListBox2.Items.Count - 1 do
    begin
        SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                     frmMostraScored.sUsuario,
                                     'frmPersonalizarScored',
                                     'campo' + cxListBox2.Items.Strings[i],
                                     'False');
    end;

    close;
end;

procedure TfrmPersonalizarScored.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

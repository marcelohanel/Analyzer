unit uManDynamics;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,
  cxButtons, cxTextEdit,
  cxEdit, cxMemo, cxLabel, cxDropDownEdit,
  cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmManDynamics = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Memo2: TcxMemo;
    Edit1: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    cxLabel1: TcxLabel;
    cxMemo1: TcxMemo;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    tblAnalises: TADOTable;
    tblAnalisesID_ANALISE: TWideStringField;
    tblAnalisesDESCRICAO: TWideMemoField;
    tblAnalisesBASE_ORIGEM: TWideMemoField;
    tblAnalisesVISAO_ORIGEM: TWideStringField;
    tblAnalisesVISAO_DESTINO: TWideStringField;
    tblAnalisesINCREMENTAL: TWideStringField;
    tblAnalisesPODE_VISUALIZAR: TWideMemoField;
    tblAnalisesPODE_ALTERAR: TWideMemoField;
    tblAnalisesPODE_ATUALIZAR: TWideMemoField;
    tblAnalisesPODE_APAGAR: TWideMemoField;
    tblAnalisesDT_ATUALIZACAO: TDateTimeField;
    tblAnalisesINTERNA: TWideStringField;
    tblAnalisesANALISES_IGNORADOS: TWideMemoField;
    tblAnalisesVALORES_IGNORADOS: TWideMemoField;
    tblAnalisesGRID: TWideStringField;
    tblAnalisesGRUPO: TWideStringField;
    tblAnalisesDT_CRIACAO: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tblAnalisesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
  end;

var
  frmManDynamics: TfrmManDynamics;

implementation

uses uDynamics, uFuncoes;

{$R *.dfm}

procedure TfrmManDynamics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmDynamics.bdDados,frmDynamics.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManDynamics.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManDynamics.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    cxCheckBox1.Checked := False;
    ComboBox1.Clear;
    Memo2.Clear;
    cxMemo1.Clear;

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;

    tblAnalises.First;
    while not tblAnalises.Eof do
    begin
        lPode := False;

        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'#*'                      ,',') then lPode := False else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'#' + frmDynamics.sUsuario,',') then lPode := False else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'*'                       ,',') then lPode := True  else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,frmDynamics.sUsuario      ,',') then lPode := True;

        if lPode then
           ComboBox1.Properties.Items.Add(tblAnalisesID_ANALISE.Text);

        tblAnalises.Next;
    end;
    tblAnalises.Close;

    if Tipo = 'Alterar' then
    begin
        Edit1.Enabled  := False;
        Edit1.Text     := frmDynamics.tblDynamicsID_DYNAMICS.Value;
        ComboBox1.Text := frmDynamics.tblDynamicsID_ANALISE.Value;
        Memo2.Text     := frmDynamics.tblDynamicsDESCRICAO.Value;
        cxMemo1.Text   := frmDynamics.tblDynamicsSQL.Value;

        if frmDynamics.tblDynamicsPEDE_FILTRO.Value = 'S' then
           cxCheckBox1.Checked := True
        else
           cxCheckBox1.Checked := False;
    end;

    GeraLog(frmDynamics.bdDados,frmDynamics.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManDynamics.SpeedButton3Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_137'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if ComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_82'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if cxMemo1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_139'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Alterar' then
       frmDynamics.tblDynamics.Edit;

    frmDynamics.tblDynamicsID_DYNAMICS.Value := Edit1.Text;
    frmDynamics.tblDynamicsID_ANALISE.Value  := ComboBox1.Text;
    frmDynamics.tblDynamicsDESCRICAO.Value   := Memo2.Text;
    frmDynamics.tblDynamicsSQL.Value         := cxMemo1.Text;

    if cxCheckBox1.Checked then
       frmDynamics.tblDynamicsPEDE_FILTRO.Value := 'S'
    else
       frmDynamics.tblDynamicsPEDE_FILTRO.Value := 'N';

    if Tipo = 'Criar' then
    begin
        frmDynamics.tblDynamicsPODE_VISUALIZAR.Value := frmDynamics.sUsuario;
        frmDynamics.tblDynamicsPODE_ALTERAR.Value    := frmDynamics.sUsuario;
        frmDynamics.tblDynamicsPODE_APAGAR.Value     := frmDynamics.sUsuario;
    end;

    frmDynamics.tblDynamics.Post;
    Close;
end;

procedure TfrmManDynamics.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,frmDynamics.sUsuario,',') then
       Accept := True;
end;

end.

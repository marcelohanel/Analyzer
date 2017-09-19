unit uManSmartDocs;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,
  cxButtons, cxTextEdit,
  cxEdit, cxMemo, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxRadioGroup, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGroupBox, StdCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmManSmartDocs = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Memo2: TcxMemo;
    Edit1: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    cxButton1: TcxButton;
    OpenDialog1: TOpenDialog;
    cxRadioGroup1: TcxRadioGroup;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    edtPlanilha: TcxMaskEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtComplemento: TcxMemo;
    cxLabel3: TcxLabel;
    edtInicial: TcxMaskEdit;
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
    procedure cxButton1Click(Sender: TObject);
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
  frmManSmartDocs: TfrmManSmartDocs;

implementation

uses uSmartDocs, uFuncoes;

{$R *.dfm}

procedure TfrmManSmartDocs.cxButton1Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
    begin
        frmSmartDocs.tblSmartDocs.Edit;
        frmSmartDocs.tblSmartDocsARQUIVO.LoadFromFile(OpenDialog1.FileName);
        frmSmartDocs.tblSmartDocsNOME_ARQUIVO.Value := Copy(OpenDialog1.FileName,Length(ExtractFilePath(OpenDialog1.FileName)), Length(OpenDialog1.FileName) - Length(ExtractFilePath(OpenDialog1.FileName)) + 1);
        frmSmartDocs.tblSmartDocs.Post;
    end;
end;

procedure TfrmManSmartDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmSmartDocs.bdDados,frmSmartDocs.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManSmartDocs.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManSmartDocs.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    ComboBox1.Properties.Items.Clear;

    tblAnalises.Close;
    tblAnalises.Filtered := True;
    tblAnalises.Open;

    tblAnalises.First;
    while not tblAnalises.Eof do
    begin
        lPode := False;

        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'#' + frmSmartDocs.sUsuario,',') then lPode := False else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(tblAnalisesPODE_VISUALIZAR.Value,frmSmartDocs.sUsuario      ,',') then lPode := True;

        if lPode then
           ComboBox1.Properties.Items.Add(tblAnalisesID_ANALISE.Text);

        tblAnalises.Next;
    end;
    tblAnalises.Close;

    Memo2.Clear;
    if Tipo = 'Alterar' then
    begin
        Edit1.Enabled       := False;
        Edit1.Text          := frmSmartDocs.tblSmartDocsID_SMARTDOCS.Value;
        Memo2.Text          := frmSmartDocs.tblSmartDocsDESCRICAO.Value;
        ComboBox1.Text      := frmSmartDocs.tblSmartDocsID_ANALISE.Value;
        edtPlanilha.Text    := frmSmartDocs.tblSmartDocsPLANILHA.AsString;
        edtInicial.Text     := frmSmartDocs.tblSmartDocsPLANILHA_INI.AsString;
        edtComplemento.Text := frmSmartDocs.tblSmartDocsCOMPLEMENTO_SQL.Value;
        cxButton1.Visible   := True;
    end;

    GeraLog(frmSmartDocs.bdDados,frmSmartDocs.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManSmartDocs.SpeedButton3Click(Sender: TObject);
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_110'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if ComboBox1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_21'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if StrToInt(edtPlanilha.Text) <= 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_264'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if StrToInt(edtInicial.Text) <= 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_270'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Alterar' then
       frmSmartDocs.tblSmartDocs.Edit;

    if Tipo = 'Criar' then
       frmSmartDocs.tblSmartDocs.Insert;

    frmSmartDocs.tblSmartDocsID_SMARTDOCS.Value    := Edit1.Text;
    frmSmartDocs.tblSmartDocsDESCRICAO.Value       := Memo2.Text;
    frmSmartDocs.tblSmartDocsCOMPLEMENTO_SQL.Value := edtComplemento.Text;
    frmSmartDocs.tblSmartDocsID_ANALISE.Value      := ComboBox1.Text;
    frmSmartDocs.tblSmartDocsPLANILHA.Value        := StrToInt(edtPlanilha.Text);
    frmSmartDocs.tblSmartDocsPLANILHA_INI.Value    := StrToInt(edtInicial.Text);

    if cxRadioGroup1.ItemIndex = 0 then
       frmSmartDocs.tblSmartDocsTIPO_ARQUIVO.Value := '0';

    if Tipo = 'Criar' then
    begin
        if frmSmartDocs.sUsuario <> 'admin' then
        begin
            frmSmartDocs.tblSmartDocsPODE_VISUALIZAR.Value := frmSmartDocs.sUsuario + ', admin';
            frmSmartDocs.tblSmartDocsPODE_ALTERAR.Value    := frmSmartDocs.sUsuario + ', admin';
            frmSmartDocs.tblSmartDocsPODE_APAGAR.Value     := frmSmartDocs.sUsuario + ', admin';
        end
        else
        begin
            frmSmartDocs.tblSmartDocsPODE_VISUALIZAR.Value := frmSmartDocs.sUsuario;
            frmSmartDocs.tblSmartDocsPODE_ALTERAR.Value    := frmSmartDocs.sUsuario;
            frmSmartDocs.tblSmartDocsPODE_APAGAR.Value     := frmSmartDocs.sUsuario;
        end;
    end;

    frmSmartDocs.tblSmartDocs.Post;
    Close;
end;

procedure TfrmManSmartDocs.tblAnalisesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := False;

    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,'*',',') then
       Accept := True
    else
    if EncontraLista(DataSet.FieldByName('PODE_VISUALIZAR').Value,frmSmartDocs.sUsuario,',') then
       Accept := True;
end;

end.

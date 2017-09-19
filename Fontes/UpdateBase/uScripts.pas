unit uScripts;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  cxButtons, DB,










  cxGridDBTableView, cxGridLevel, cxGrid, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxBlobEdit, cxCheckBox, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, StdCtrls;

type
  TfrmScripts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    btnAdicionar: TcxButton;
    btnSair: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1Ordem: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1Conexao: TcxGridDBColumn;
    cxGrid1DBTableView1SQL: TcxGridDBColumn;
    cxGrid1DBTableView1Comando: TcxGridDBColumn;
    btnAlterar: TcxButton;
    btnApagar: TcxButton;
    cxGrid1DBTableView1Ativa: TcxGridDBColumn;
    cxGrid1DBTableView1Parametros: TcxGridDBColumn;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AchaOrdem;
    procedure FormCreate(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScripts: TfrmScripts;
  iOrdem : integer;

implementation

uses uUpdateBase, uInstrucao;

{$R *.dfm}

procedure TfrmScripts.AchaOrdem;
begin
    with frmUpdateBase do
    begin
        cdsScript.DisableControls;

        cdsScript.First;
        while not cdsScript.Eof do
        begin
            if iOrdem < cdsScriptOrdem.AsInteger then
               iOrdem := cdsScriptOrdem.AsInteger;

            cdsScript.Next;
        end;

        cdsScript.EnableControls;
    end;
end;

procedure TfrmScripts.btnAdicionarClick(Sender: TObject);
begin
    if frmInstrucao <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    AchaOrdem;

    frmInstrucao := TfrmInstrucao.Create(Self);

    frmInstrucao.Caption := HCLResourceStrings.FindID('sString_419');
    frmInstrucao.sTipo   := 'Inserir';
    frmInstrucao.iOrdem  := iOrdem + 10;

    frmInstrucao.ShowModal;
    FreeAndNil(frmInstrucao);
end;

procedure TfrmScripts.btnAlterarClick(Sender: TObject);
begin
    if frmUpdateBase.cdsScript.IsEmpty then
       exit;

    if frmInstrucao <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmInstrucao := TfrmInstrucao.Create(Self);

    frmInstrucao.Caption := HCLResourceStrings.FindID('sString_425');
    frmInstrucao.sTipo   := 'Alterar';

    frmInstrucao.ShowModal;
    FreeAndNil(frmInstrucao);
end;

procedure TfrmScripts.btnApagarClick(Sender: TObject);
begin
    if frmUpdateBase.cdsScript.IsEmpty then
       exit;

    if (MessageDlg(HCLResourceStrings.FindID('sString_424'), mtConfirmation, [mbYes, mbNo], 0) in [mrYes, mrNone]) then
    begin
        try
           frmUpdateBase.cdsScript.Delete;
        except
        end;
    end;
end;

procedure TfrmScripts.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmScripts.FormCreate(Sender: TObject);
begin
    iOrdem := 0;
end;

end.

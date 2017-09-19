unit uManABC;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,
  cxButtons, cxTextEdit,
  cxEdit, cxMemo, cxLabel, cxDropDownEdit,









  cxLookAndFeels, cxGraphics, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmManABC = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Memo2: TcxMemo;
    Edit1: TcxTextEdit;
    Label2: TcxLabel;
    Label5: TcxLabel;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ChamaDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
  end;

var
  frmManABC: TfrmManABC;

implementation

uses uCadABC, uFuncoes, uAguarde;

{$R *.dfm}

procedure TfrmManABC.cxButton1Click(Sender: TObject);
begin
    ChamaDesigner;
end;

procedure TfrmManABC.ChamaDesigner;
var
    comando : TStrings;
begin
    if not frmCadABC.tblAnalises.Locate('ID_ANALISE',frmCadABC.tblABCID_ANALISE.Value,[]) then
       Exit;

    frmCadABC.tblCenarios.Open;

    if not frmCadABC.tblCenarios.Locate('ID_ABC',frmCadABC.tblABCID_ABC.Value,[]) then
       Exit;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    if not frmCadABC.tblCenarios.Locate('ID_ABC;ID_USUARIO',VarArrayOf([frmCadABC.tblABCID_ABC.Value,frmCadABC.sUsuario]),[]) then
    begin
        frmCadABC.tblCenarios.Insert;
        frmCadABC.tblCenariosID_CENARIO.Value := '_#ABC#_' + frmCadABC.tblABCID_ABC.Value + frmCadABC.sUsuario;
        frmCadABC.tblCenariosID_ANALISE.Value := frmCadABC.tblABCID_ANALISE.Value;
        frmCadABC.tblCenariosID_ABC.Value     := frmCadABC.tblABCID_ABC.Value;
        frmCadABC.tblCenariosID_USUARIO.Value := frmCadABC.sUsuario;
        frmCadABC.tblCenariosA.Value          := '100';
        frmCadABC.tblCenariosB.Value          := '90';
        frmCadABC.tblCenariosC.Value          := '80';
        frmCadABC.tblCenariosD.Value          := '70';
        frmCadABC.tblCenariosE.Value          := '40';
        frmCadABC.tblCenarios.Post;
    end;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(frmCadABC.dxSkinController1.SkinName);
    comando.Add(frmCadABC.bdDados.ConnectionString);
    comando.Add(frmCadABC.bdArmazena.ConnectionString);
    comando.Add(frmCadABC.sSGBD);
    comando.Add(frmCadABC.sUsuario);
    comando.Add(frmCadABC.sBanco);

    if Tipo <> 'Visualizar' then
       comando.Add('ABC')
    else
       comando.Add('VisualizarABC');

    comando.Add(''); // Cubo
    comando.Add(''); // Pede Filtro
    comando.Add(frmCadABC.tblABCID_ANALISE.Value);
    comando.Add(''); // Fotografia
    comando.Add(''); // Frequencia
    comando.Add(frmCadABC.tblABCID_ABC.Value); // ABC
    comando.SaveToFile(frmCadABC.sTempDirUsuario + 'comandosdesigner.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                pchar('"kc4570mh" "' + frmCadABC.sTempDirUsuario + 'comandosdesigner.txt"'),SW_SHOWNORMAL);

    frmCadABC.tblCenarios.Close;

    FreeAndNil(frmAguarde);

    Self.Update;
end;

procedure TfrmManABC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmCadABC.bdDados,frmCadABC.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManABC.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManABC.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    ComboBox1.Clear;
    Memo2.Clear;

    frmCadABC.tblAnalises.First;
    while not frmCadABC.tblAnalises.Eof do
    begin
        lPode := False;

        if EncontraLista(frmCadABC.tblAnalisesPODE_VISUALIZAR.Value,'#*'                       ,',') then lPode := False else
        if EncontraLista(frmCadABC.tblAnalisesPODE_VISUALIZAR.Value,'#' + frmCadABC.sUsuario,',') then lPode := False else
        if EncontraLista(frmCadABC.tblAnalisesPODE_VISUALIZAR.Value,'*'                        ,',') then lPode := True  else
        if EncontraLista(frmCadABC.tblAnalisesPODE_VISUALIZAR.Value,frmCadABC.sUsuario      ,',') then lPode := True;

        if lPode then
           ComboBox1.Properties.Items.Add(frmCadABC.tblAnalisesID_ANALISE.Text);

        frmCadABC.tblAnalises.Next;
    end;

    if (Tipo = 'Alterar') or (Tipo = 'Visualizar') then
    begin
        Edit1.Enabled      := False;
        ComboBox1.Enabled  := False;
        Edit1.Text         := frmCadABC.tblABCID_ABC.Value;
        ComboBox1.Text     := frmCadABC.tblABCID_ANALISE.Value;
        Memo2.Text         := frmCadABC.tblABCDESCRICAO.Value;
    end;

    GeraLog(frmCadABC.bdDados,frmCadABC.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManABC.SpeedButton3Click(Sender: TObject);
begin
    if Tipo = 'Alterar' then
    begin
        if Edit1.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_82'), mtWarning, [mbOK], 0);
            Exit;
        end;

        if ComboBox1.Text = '' then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_82'), mtWarning, [mbOK], 0);
            Exit;
        end;

        frmCadABC.tblABC.Edit;

        frmCadABC.tblABCID_ABC.Value      := Edit1.Text;
        frmCadABC.tblABCID_ANALISE.Value  := ComboBox1.Text;
        frmCadABC.tblABCDESCRICAO.Value   := Memo2.Text;

        frmCadABC.tblABC.Post;
    end;

    Close;
end;

end.

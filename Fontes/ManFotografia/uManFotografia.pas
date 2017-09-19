unit uManFotografia;

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
  TfrmManFotografia = class(TForm)
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
  frmManFotografia: TfrmManFotografia;

implementation

uses uCadFotografia, uFuncoes, uAguarde;

{$R *.dfm}

procedure TfrmManFotografia.cxButton1Click(Sender: TObject);
begin
    ChamaDesigner;
end;

procedure TfrmManFotografia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmCadFotografia.bdDados,frmCadFotografia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManFotografia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManFotografia.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    ComboBox1.Clear;
    Memo2.Clear;

    frmCadFotografia.tblAnalises.First;
    while not frmCadFotografia.tblAnalises.Eof do
    begin
        lPode := False;

        if EncontraLista(frmCadFotografia.tblAnalisesPODE_VISUALIZAR.Value,'#*'          ,',')              then lPode := False else
        if EncontraLista(frmCadFotografia.tblAnalisesPODE_VISUALIZAR.Value,'#' + frmCadFotografia.sUsuario,',') then lPode := False else
        if EncontraLista(frmCadFotografia.tblAnalisesPODE_VISUALIZAR.Value,'*'           ,',')              then lPode := True  else
        if EncontraLista(frmCadFotografia.tblAnalisesPODE_VISUALIZAR.Value,frmCadFotografia.sUsuario      ,',') then lPode := True;

        if lPode then
           ComboBox1.Properties.Items.Add(frmCadFotografia.tblAnalisesID_ANALISE.Text);

        frmCadFotografia.tblAnalises.Next;
    end;

    if (Tipo = 'Alterar') or (Tipo = 'Visualizar') then
    begin
        Edit1.Enabled     := False;
        ComboBox1.Enabled := False;
        Edit1.Text        := frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value;
        ComboBox1.Text    := frmCadFotografia.tblFotografiaID_ANALISE.Value;
        Memo2.Text        := frmCadFotografia.tblFotografiaDESCRICAO.Value;
    end;

    GeraLog(frmCadFotografia.bdDados,frmCadFotografia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManFotografia.SpeedButton3Click(Sender: TObject);
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

        frmCadFotografia.tblFotografia.Edit;

        frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value := Edit1.Text;
        frmCadFotografia.tblFotografiaID_ANALISE.Value    := ComboBox1.Text;
        frmCadFotografia.tblFotografiaDESCRICAO.Value     := Memo2.Text;

        frmCadFotografia.tblFotografia.Post;
    end;

    Close;
end;

procedure TfrmManFotografia.ChamaDesigner;
var
    comando : TStrings;
begin
    if not frmCadFotografia.tblAnalises.Locate('ID_ANALISE',frmCadFotografia.tblFotografiaID_ANALISE.Value,[]) then
       Exit;

    frmCadFotografia.tblCenarios.Open;

    if not frmCadFotografia.tblCenarios.Locate('ID_FOTOGRAFIA',frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value,[]) then
       Exit;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    if not frmCadFotografia.tblCenarios.Locate('ID_FOTOGRAFIA;ID_USUARIO',VarArrayOf([frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value,frmCadFotografia.sUsuario]),[]) then
    begin
        frmCadFotografia.tblCenarios.Insert;
        frmCadFotografia.tblCenariosID_CENARIO.Value    := '_#FOTOGRAFIA#_' + frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value + frmCadFotografia.sUsuario;
        frmCadFotografia.tblCenariosID_ANALISE.Value    := frmCadFotografia.tblFotografiaID_ANALISE.Value;
        frmCadFotografia.tblCenariosID_FOTOGRAFIA.Value := frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value;
        frmCadFotografia.tblCenariosID_USUARIO.Value    := frmCadFotografia.sUsuario;
        frmCadFotografia.tblCenariosA.Value             := '100';
        frmCadFotografia.tblCenariosB.Value             := '90';
        frmCadFotografia.tblCenariosC.Value             := '80';
        frmCadFotografia.tblCenariosD.Value             := '70';
        frmCadFotografia.tblCenariosE.Value             := '40';

        frmCadFotografia.tblCenarios.Post;
    end;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(frmCadFotografia.dxSkinController1.SkinName);
    comando.Add(frmCadFotografia.bdDados.ConnectionString);
    comando.Add(frmCadFotografia.bdArmazena.ConnectionString);
    comando.Add(frmCadFotografia.sSGBD);
    comando.Add(frmCadFotografia.sUsuario);
    comando.Add(frmCadFotografia.sBanco);

    if Tipo <> 'Visualizar' then
       comando.Add('Fotografia')
    else
       comando.Add('VisualizarFotografia');

    comando.Add(''); // Cubo
    comando.Add(''); // Pede Filtro
    comando.Add(frmCadFotografia.tblFotografiaID_ANALISE.Value);
    comando.Add(frmCadFotografia.tblFotografiaID_FOTOGRAFIA.Value); // Fotografia
    comando.Add(''); // Frequencia
    comando.Add(''); // ABC
    comando.SaveToFile(frmCadFotografia.sTempDirUsuario + 'comandosdesigner.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                pchar('"kc4570mh" "' + frmCadFotografia.sTempDirUsuario + 'comandosdesigner.txt"'),SW_SHOWNORMAL);

    frmCadFotografia.tblCenarios.Close;

    FreeAndNil(frmAguarde);

    Self.Update;
end;

end.

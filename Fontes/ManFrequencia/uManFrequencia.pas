unit uManFrequencia;

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
  TfrmManFrequencia = class(TForm)
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
  frmManFrequencia: TfrmManFrequencia;

implementation

uses uCadFrequencia, uFuncoes, uAguarde;

{$R *.dfm}

procedure TfrmManFrequencia.cxButton1Click(Sender: TObject);
begin
    ChamaDesigner;
end;

procedure TfrmManFrequencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmCadFrequencia.bdDados,frmCadFrequencia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmManFrequencia.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmManFrequencia.FormShow(Sender: TObject);
var
    lPode : boolean;
begin
    ComboBox1.Clear;
    Memo2.Clear;

    frmCadFrequencia.tblAnalises.First;
    while not frmCadFrequencia.tblAnalises.Eof do
    begin
        lPode := False;

        if EncontraLista(frmCadFrequencia.tblAnalisesPODE_VISUALIZAR.Value,'#*'                           ,',') then lPode := False else
        if EncontraLista(frmCadFrequencia.tblAnalisesPODE_VISUALIZAR.Value,'#' + frmCadFrequencia.sUsuario,',') then lPode := False else
        if EncontraLista(frmCadFrequencia.tblAnalisesPODE_VISUALIZAR.Value,'*'                            ,',') then lPode := True  else
        if EncontraLista(frmCadFrequencia.tblAnalisesPODE_VISUALIZAR.Value,frmCadFrequencia.sUsuario      ,',') then lPode := True;

        if lPode then
           ComboBox1.Properties.Items.Add(frmCadFrequencia.tblAnalisesID_ANALISE.Text);

        frmCadFrequencia.tblAnalises.Next;
    end;

    if (Tipo = 'Alterar') or (Tipo = 'Visualizar') then
    begin
        Edit1.Enabled     := False;
        ComboBox1.Enabled := False;
        Edit1.Text        := frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value;
        ComboBox1.Text    := frmCadFrequencia.tblFrequenciaID_ANALISE.Value;
        Memo2.Text        := frmCadFrequencia.tblFrequenciaDESCRICAO.Value;
    end;

    GeraLog(frmCadFrequencia.bdDados,frmCadFrequencia.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmManFrequencia.ChamaDesigner;
var
    comando : TStrings;
begin
    if not frmCadFrequencia.tblAnalises.Locate('ID_ANALISE',frmCadFrequencia.tblFrequenciaID_ANALISE.Value,[]) then
       Exit;

    frmCadFrequencia.tblCenarios.Open;

    if not frmCadFrequencia.tblCenarios.Locate('ID_FREQUENCIA',frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value,[]) then
       Exit;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_416');
    frmAguarde.Show;
    frmAguarde.Update;

    if not frmCadFrequencia.tblCenarios.Locate('ID_FREQUENCIA;ID_USUARIO',VarArrayOf([frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value,frmCadFrequencia.sUsuario]),[]) then
    begin
        frmCadFrequencia.tblCenarios.Insert;
        frmCadFrequencia.tblCenariosID_CENARIO.Value    := '_#FREQUENCIA#_' + frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value + frmCadFrequencia.sUsuario;
        frmCadFrequencia.tblCenariosID_ANALISE.Value    := frmCadFrequencia.tblFrequenciaID_ANALISE.Value;
        frmCadFrequencia.tblCenariosID_FREQUENCIA.Value := frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value;
        frmCadFrequencia.tblCenariosID_USUARIO.Value    := frmCadFrequencia.sUsuario;
        frmCadFrequencia.tblCenariosA.Value             := '100';
        frmCadFrequencia.tblCenariosB.Value             := '90';
        frmCadFrequencia.tblCenariosC.Value             := '80';
        frmCadFrequencia.tblCenariosD.Value             := '70';
        frmCadFrequencia.tblCenariosE.Value             := '40';
        frmCadFrequencia.tblCenarios.Post;
    end;

    comando := TStringList.Create;

    comando.Clear;
    comando.Add(frmCadFrequencia.dxSkinController1.SkinName);
    comando.Add(frmCadFrequencia.bdDados.ConnectionString);
    comando.Add(frmCadFrequencia.bdArmazena.ConnectionString);
    comando.Add(frmCadFrequencia.sSGBD);
    comando.Add(frmCadFrequencia.sUsuario);
    comando.Add(frmCadFrequencia.sBanco);

    if Tipo <> 'Visualizar' then
       comando.Add('Frequencia')
    else
       comando.Add('VisualizarFrequencia');

    comando.Add(''); // Cubo
    comando.Add(''); // Pede Filtro
    comando.Add(frmCadFrequencia.tblFrequenciaID_ANALISE.Value);
    comando.Add(''); // Fotografia
    comando.Add(frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value); // Frequencia
    comando.Add(''); // ABC
    comando.SaveToFile(frmCadFrequencia.sTempDirUsuario + 'comandosdesigner.txt');
    comando.Free;

    ExecAndWait(pchar(ExtractFilePath(Application.ExeName) + 'pDesigner.exe'),
                pchar('"kc4570mh" "' + frmCadFrequencia.sTempDirUsuario + 'comandosdesigner.txt"'),SW_SHOWNORMAL);

    frmCadFrequencia.tblCenarios.Close;

    FreeAndNil(frmAguarde);

    Self.Update;
end;

procedure TfrmManFrequencia.SpeedButton3Click(Sender: TObject);
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

        frmCadFrequencia.tblFrequencia.Edit;

        frmCadFrequencia.tblFrequenciaID_FREQUENCIA.Value := Edit1.Text;
        frmCadFrequencia.tblFrequenciaID_ANALISE.Value    := ComboBox1.Text;
        frmCadFrequencia.tblFrequenciaDESCRICAO.Value     := Memo2.Text;

        frmCadFrequencia.tblFrequencia.Post;
    end;

    Close;
end;

end.

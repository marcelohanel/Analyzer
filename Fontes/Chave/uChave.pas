unit uChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLocalization, CEVersionInfo;

type
  TfrmChave = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Memo1: TMemo;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    chkAnalises: TCheckBox;
    chkRelatorios: TCheckBox;
    chkScored: TCheckBox;
    chkDynamics: TCheckBox;
    edtSenha: TEdit;
    Label6: TLabel;
    chkABC: TCheckBox;
    chkCubo: TCheckBox;
    chkFotografica: TCheckBox;
    chkFrequencia: TCheckBox;
    Label7: TLabel;
    edtValidade: TEdit;
    chkValidar: TCheckBox;
    chkScheduler: TCheckBox;
    Label8: TLabel;
    edtUsuario: TEdit;
    chkSmart: TCheckBox;
    chkAccess: TCheckBox;
    chkReporting: TCheckBox;
    chkVisio: TCheckBox;
    chkGeo: TCheckBox;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    chkWebBI: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChave: TfrmChave;

implementation

uses uFuncoes, uSenha;

{$R *.dfm}

procedure TfrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmChave.FormCreate(Sender: TObject);
begin
    SetLanguage(2,cxLocalizer1);
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;
end;

procedure TfrmChave.FormShow(Sender: TObject);
var
    aux : string;
begin
    frmSenha := TfrmSenha.Create(Self);
    frmSenha.ShowModal;
    aux := frmSenha.edtSenha.Text;
    FreeAndNil(frmSenha);

    if aux <> 'analyzerintelectivo2010' then
    begin
        MessageDlg('Senha Inválida', mtInformation, [mbOK], 0);
        Application.Terminate;
    end;
end;

procedure TfrmChave.Button1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmChave.Button2Click(Sender: TObject);
var
    f : textfile;
    aux : string;
begin
    Button3.Enabled := False;
    Edit1.Text      := '';
    Edit2.Text      := '';
    Edit3.Text      := '';
    Edit4.Text      := '';
    Memo1.Lines.Clear;

    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
    if OpenDialog1.Execute then
    begin
        Edit1.Text := OpenDialog1.FileName;
        if FileExists(Edit1.Text) then
        begin
            AssignFile(f,Edit1.Text);
            Reset(f);
            ReadLn(f,aux);
            Edit3.Text := EnDecryptString(aux);
            ReadLn(f,aux);
            Edit2.Text := EnDecryptString(aux);
            ReadLn(f,aux);
            Edit4.Text := EnDecryptString(aux);
            CloseFile(f);

            Button3.Enabled := True;
        end;
    end;
end;

procedure TfrmChave.Button3Click(Sender: TObject);
var
    f : textfile;
    i : integer;
    aux : string;
begin
    if Edit2.Text = '' then
    begin
        MessageBox(0, 'Nome do usuário inválido', 'Informação', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;
    if Edit3.Text = '' then
    begin
        MessageBox(0, 'Código de segurança inválido', 'Informação', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;
    if Edit4.Text = '' then
    begin
        MessageBox(0, 'Versão inválida', 'Informação', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    try
        StrToDate(edtValidade.Text);
    except
        MessageBox(0, 'Data de Validade inválida', 'Informação', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    try
        StrToInt(edtUsuario.Text);
    except
        MessageBox(0, 'Número de Usuários Inválidos', 'Informação', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    if (chkAnalises.Checked       = False) and
       (chkRelatorios.Checked     = False) and
       (chkScored.Checked         = False) and
       (chkABC.Checked            = False) and
       (chkCubo.Checked           = False) and
       (chkFotografica.Checked    = False) and
       (chkFrequencia.Checked     = False) and
       (chkDynamics.Checked       = False) and
       (chkSmart.Checked          = False) and
       (chkAccess.Checked         = False) and
       (chkReporting.Checked      = False) and
       (chkVisio.Checked          = False) and
       (chkGeo.Checked            = False) and
       (chkWebBI.Checked          = False) and
       (chkScheduler.Checked      = False) then
    begin
        MessageDlg('Nenhum módulo foi selecionado para ser liberado', mtInformation, [mbOK], 0);
        Exit;
    end;

    i := length(Edit1.Text) +
         length(Edit2.Text) +
         length(Edit3.Text) +
         length(Edit4.Text);

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Arquivo:' + Edit1.Text);
    Memo1.Lines.Add('Usuário:' + Edit2.Text);
    Memo1.Lines.Add('Código:'  + Edit3.Text);
    Memo1.Lines.Add('Versão:'  + Edit4.Text);
    Memo1.Lines.Add('Validade:'+ edtValidade.Text);
    
    if chkValidar.Checked         then Memo1.Lines.Add('Validar Informações de Hardware: SIM')    else Memo1.Lines.Add('Validar Informações de Hardware: NÃO');
    if chkAnalises.Checked        then Memo1.Lines.Add('Módulo de Análises: SIM')                 else Memo1.Lines.Add('Módulo de Análises: NÃO');
    if chkRelatorios.Checked      then Memo1.Lines.Add('Módulo de Relatórios: SIM')               else Memo1.Lines.Add('Módulo de Relatórios: NÃO');
    if chkSmart.Checked           then Memo1.Lines.Add('Módulo de SmartDocs: SIM')                else Memo1.Lines.Add('Módulo de SmartDocs: NÃO');
    if chkScored.Checked          then Memo1.Lines.Add('Módulo de Scored Cards: SIM')             else Memo1.Lines.Add('Módulo de Scored Cards: NÃO');
    if chkDynamics.Checked        then Memo1.Lines.Add('Módulo de Dynamics: SIM')                 else Memo1.Lines.Add('Módulo de Dynamics: NÃO');
    if chkABC.Checked             then Memo1.Lines.Add('Módulo de Análise ABC: SIM')              else Memo1.Lines.Add('Módulo de Análise ABC: NÃO');
    if chkCubo.Checked            then Memo1.Lines.Add('Módulo de Análise Cubo: SIM')             else Memo1.Lines.Add('Módulo de Análise Cubo: NÃO');
    if chkFotografica.Checked     then Memo1.Lines.Add('Módulo de Análise Fotográfica: SIM')      else Memo1.Lines.Add('Módulo de Análise Fotográfica: NÃO');
    if chkFrequencia.Checked      then Memo1.Lines.Add('Módulo de Análise Freqüência: SIM')       else Memo1.Lines.Add('Módulo de Análise Freqüência: NÃO');
    if chkScheduler.Checked       then Memo1.Lines.Add('Módulo de Scheduler: SIM')                else Memo1.Lines.Add('Módulo de Scheduler: NÃO');
    if chkAccess.Checked          then Memo1.Lines.Add('Módulo de Access: SIM')                   else Memo1.Lines.Add('Módulo de Access: NÃO');
    if chkReporting.Checked       then Memo1.Lines.Add('Módulo de Reporting: SIM')                else Memo1.Lines.Add('Módulo de Reporting: NÃO');
    if chkVisio.Checked           then Memo1.Lines.Add('Módulo de Visio: SIM')                    else Memo1.Lines.Add('Módulo de Visio: NÃO');
    if chkGeo.Checked             then Memo1.Lines.Add('Módulo de GeoAnalises: SIM')              else Memo1.Lines.Add('Módulo de GeoAnalises: NÃO');

    Memo1.Lines.Add('Módulo de Decision MySQL: NÃO'); // Módulo não mais utilizado

    if chkWebBI.Checked           then Memo1.Lines.Add('Módulo de WebBI: SIM')                    else Memo1.Lines.Add('Módulo de WebBI: NÃO');

    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');
    Memo1.Lines.Add('Módulo Reserva: NÃO');

    Memo1.Lines.Add('Tamanho:' + IntToStr(i));
    Memo1.Lines.Add(edtSenha.Text);
    Memo1.Lines.Add(edtUsuario.Text);
    Memo1.Lines.Add('Analyzer Business Intelligence');
    Memo1.Lines.Add('Marcelo Hanel');

    for i := 0 to Memo1.Lines.Count - 1 do
        Memo1.Lines.Strings[i] := EnDecryptString(Memo1.Lines.Strings[i]);

    AssignFile(f,ExtractFilePath(Edit1.Text) + 'Chave.sec');
    Rewrite(f);
    for i := 0 to Memo1.Lines.Count - 1 do
        WriteLn(f,Memo1.Lines.Strings[i]);
    CloseFile(f);

    aux := ExtractFilePath(Edit1.Text) + 'Chave.sec';
    MessageDlg('Chave gerada com sucesso.'+#13+#10+'Arquivo: ' + aux, mtInformation, [mbOK], 0);
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

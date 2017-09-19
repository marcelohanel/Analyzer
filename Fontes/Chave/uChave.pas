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
        MessageDlg('Senha Inv�lida', mtInformation, [mbOK], 0);
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
        MessageBox(0, 'Nome do usu�rio inv�lido', 'Informa��o', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;
    if Edit3.Text = '' then
    begin
        MessageBox(0, 'C�digo de seguran�a inv�lido', 'Informa��o', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;
    if Edit4.Text = '' then
    begin
        MessageBox(0, 'Vers�o inv�lida', 'Informa��o', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    try
        StrToDate(edtValidade.Text);
    except
        MessageBox(0, 'Data de Validade inv�lida', 'Informa��o', MB_ICONINFORMATION or MB_OK);
        Exit;
    end;

    try
        StrToInt(edtUsuario.Text);
    except
        MessageBox(0, 'N�mero de Usu�rios Inv�lidos', 'Informa��o', MB_ICONINFORMATION or MB_OK);
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
        MessageDlg('Nenhum m�dulo foi selecionado para ser liberado', mtInformation, [mbOK], 0);
        Exit;
    end;

    i := length(Edit1.Text) +
         length(Edit2.Text) +
         length(Edit3.Text) +
         length(Edit4.Text);

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Arquivo:' + Edit1.Text);
    Memo1.Lines.Add('Usu�rio:' + Edit2.Text);
    Memo1.Lines.Add('C�digo:'  + Edit3.Text);
    Memo1.Lines.Add('Vers�o:'  + Edit4.Text);
    Memo1.Lines.Add('Validade:'+ edtValidade.Text);
    
    if chkValidar.Checked         then Memo1.Lines.Add('Validar Informa��es de Hardware: SIM')    else Memo1.Lines.Add('Validar Informa��es de Hardware: N�O');
    if chkAnalises.Checked        then Memo1.Lines.Add('M�dulo de An�lises: SIM')                 else Memo1.Lines.Add('M�dulo de An�lises: N�O');
    if chkRelatorios.Checked      then Memo1.Lines.Add('M�dulo de Relat�rios: SIM')               else Memo1.Lines.Add('M�dulo de Relat�rios: N�O');
    if chkSmart.Checked           then Memo1.Lines.Add('M�dulo de SmartDocs: SIM')                else Memo1.Lines.Add('M�dulo de SmartDocs: N�O');
    if chkScored.Checked          then Memo1.Lines.Add('M�dulo de Scored Cards: SIM')             else Memo1.Lines.Add('M�dulo de Scored Cards: N�O');
    if chkDynamics.Checked        then Memo1.Lines.Add('M�dulo de Dynamics: SIM')                 else Memo1.Lines.Add('M�dulo de Dynamics: N�O');
    if chkABC.Checked             then Memo1.Lines.Add('M�dulo de An�lise ABC: SIM')              else Memo1.Lines.Add('M�dulo de An�lise ABC: N�O');
    if chkCubo.Checked            then Memo1.Lines.Add('M�dulo de An�lise Cubo: SIM')             else Memo1.Lines.Add('M�dulo de An�lise Cubo: N�O');
    if chkFotografica.Checked     then Memo1.Lines.Add('M�dulo de An�lise Fotogr�fica: SIM')      else Memo1.Lines.Add('M�dulo de An�lise Fotogr�fica: N�O');
    if chkFrequencia.Checked      then Memo1.Lines.Add('M�dulo de An�lise Freq��ncia: SIM')       else Memo1.Lines.Add('M�dulo de An�lise Freq��ncia: N�O');
    if chkScheduler.Checked       then Memo1.Lines.Add('M�dulo de Scheduler: SIM')                else Memo1.Lines.Add('M�dulo de Scheduler: N�O');
    if chkAccess.Checked          then Memo1.Lines.Add('M�dulo de Access: SIM')                   else Memo1.Lines.Add('M�dulo de Access: N�O');
    if chkReporting.Checked       then Memo1.Lines.Add('M�dulo de Reporting: SIM')                else Memo1.Lines.Add('M�dulo de Reporting: N�O');
    if chkVisio.Checked           then Memo1.Lines.Add('M�dulo de Visio: SIM')                    else Memo1.Lines.Add('M�dulo de Visio: N�O');
    if chkGeo.Checked             then Memo1.Lines.Add('M�dulo de GeoAnalises: SIM')              else Memo1.Lines.Add('M�dulo de GeoAnalises: N�O');

    Memo1.Lines.Add('M�dulo de Decision MySQL: N�O'); // M�dulo n�o mais utilizado

    if chkWebBI.Checked           then Memo1.Lines.Add('M�dulo de WebBI: SIM')                    else Memo1.Lines.Add('M�dulo de WebBI: N�O');

    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');
    Memo1.Lines.Add('M�dulo Reserva: N�O');

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

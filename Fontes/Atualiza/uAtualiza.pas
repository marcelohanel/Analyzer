unit uAtualiza;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons,
  cxLabel, cxProgressBar,





  cxLookAndFeels, dxSkinsForm,

  cxLocalization,

  CEVersionInfo, cxGraphics, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

function CopiaArquivo( Origem: String; Destino: String ; Progresso : TcxProgressBar ): Boolean;

type
  TfrmAtualiza = class(TForm)
    cxButton2: TcxButton;
    cxArquivo: TcxProgressBar;
    cxGeral: TcxProgressBar;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    dxSkinController1: TdxSkinController;
    cxLocalizer1: TcxLocalizer;
    CEVersionInfo1: TCEVersionInfo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualiza: TfrmAtualiza;
  sAtualiza : string;
  sSkin : string;
  sCaminho : string;

implementation

uses uFuncoes;

{$R *.dfm}

function CopiaArquivo( Origem: String; Destino: String ; Progresso : TcxProgressBar ): Boolean;
const
   TamanhoBuffer = 50000;
var
   ArqOrigem,
   ArqDestino: TFileStream;
   pBuf: Pointer;
   cnt: Integer;
   totCnt, TamanhoOrigem: Int64;
begin
   Result := True;
   totCnt := 0;

   try
       ArqOrigem := TFileStream.Create(Origem, fmOpenRead or fmShareDenyWrite);
   except
       on E: Exception do
       begin
          Result := False;
          Exit;
       end;
   end;

   TamanhoOrigem := ArqOrigem.size;

   Progresso.Properties.min := 0;
   Progresso.Properties.Max := 100;
   Progresso.Position := 0;

   try
      try
        ArqDestino := TFileStream.Create(Destino, fmCreate or fmShareExclusive);
      except
        on E: Exception do
        begin
          Result := False;
          Exit;
        end;
   end;

try
GetMem(pBuf, TamanhoBuffer);
try 
cnt := ArqOrigem.Read(pBuf^, TamanhoBuffer); 
cnt := ArqDestino.Write(pBuf^, cnt); 
totCnt := totCnt + cnt; 

while (cnt > 0) do 
begin 
cnt := ArqOrigem.Read(pBuf^, TamanhoBuffer); 
cnt := ArqDestino.Write(pBuf^, cnt); 
totcnt := totcnt + cnt; 
Progresso.Position := Round((totCnt / TamanhoOrigem) * 100); 
Application.ProcessMessages; 
end; 

finally 
FreeMem(pBuf, TamanhoBuffer); 
end; 
finally 
ArqDestino.Free; 
end; 
finally 
ArqOrigem.Free; 
end; 
end; 

procedure TfrmAtualiza.cxButton1Click(Sender: TObject);
var
    sOrigem  : string;
    sDestino : string;
    i : integer;
    sAux : string;
begin
    if sAtualiza = '' then
       exit;

    cxGeral.Properties.Min := 0;
    cxGeral.Properties.Max := NumEntries(sAtualiza,'#');
    cxGeral.Position       := 0;

    for i := 1 to NumEntries(sAtualiza,'#') do
    begin
        sAux     :=  Entry(i,sAtualiza,'#');

        sOrigem  := sCaminho + '\' + sAux;
        sDestino := ExtractFilePath(Application.ExeName) + sAux;

        if FileExists(sOrigem) then
           CopiaArquivo(sOrigem,sDestino,cxArquivo);

        cxGeral.Position := cxGeral.Position + 1;
    end;

    MessageDlg(HCLResourceStrings.FindID('sString_418'), mtInformation, [mbOK], 0);
    Application.Terminate;
end;

procedure TfrmAtualiza.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfrmAtualiza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmAtualiza.FormCreate(Sender: TObject);
begin
    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_417'), mtError, [mbOK], 0);
        Application.Terminate;
    end;

    SetLanguage(2, cxLocalizer1);

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    sAtualiza := ParamStr(2);
    sCaminho  := ParamStr(3);
    sSkin     := ParamStr(4);
end;

procedure TfrmAtualiza.FormShow(Sender: TObject);
begin
    dxSkinController1.SkinName := sSkin;

    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

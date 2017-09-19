unit uSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmSenha = class(TForm)
    edtSenha: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.dfm}

procedure TfrmSenha.BitBtn1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSenha.BitBtn2Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

end.

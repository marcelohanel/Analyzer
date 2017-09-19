unit GridHelper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TfrmGridHelper = class(TForm)
    cxMemo: TcxMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridHelper: TfrmGridHelper;

implementation

{$R *.DFM}

procedure TfrmGridHelper.FormShow(Sender: TObject);
begin
  cxMemo.Lines.Text := 'Passe o cursor sobre a área desejada...';
{$IFNDEF VER130}
  AlphaBlend := True;
  AlphaBlendValue := 200;
{$ENDIF}
end;

end.

program pSobre;

uses
  Forms,
  uSobre in 'uSobre.pas' {frmSobre},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;
end.

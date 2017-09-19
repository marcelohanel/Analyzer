program pLogs;

uses
  Forms,
  uLogs in 'uLogs.pas' {frmLogs},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Logs';
  Application.CreateForm(TfrmLogs, frmLogs);
  Application.Run;
end.

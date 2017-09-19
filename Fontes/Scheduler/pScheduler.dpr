program pScheduler;

uses
  Forms,
  uScheduler in 'uScheduler.pas' {frmScheduler},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmScheduler, frmScheduler);
  Application.Run;
end.

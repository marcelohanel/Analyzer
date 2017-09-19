program pParametros;

uses
  Forms,
  uParametros in 'uParametros.pas' {frmParametros},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParametros, frmParametros);
  Application.Run;
end.

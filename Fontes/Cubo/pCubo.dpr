program pCubo;

uses
  Forms,
  uCubo in 'uCubo.pas' {frmCubo},
  uFuncoes in '..\uFuncoes.pas',
  uAguarde in '..\uAguarde.pas' {frmAguarde};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCubo, frmCubo);
  Application.Run;
end.

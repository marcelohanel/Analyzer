program pManDecisionCube;

uses
  Forms,
  uDecisionCube in 'uDecisionCube.pas' {frmDecisionCube},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesDecision in 'uPermissoesDecision.pas' {frmPermissoesDecision},
  uManDecision in 'uManDecision.pas' {frmManDecision},
  uSQLCompletoUsuario in 'uSQLCompletoUsuario.pas' {frmSQLCompletoUsuario},
  uIncluirUsuarios in 'uIncluirUsuarios.pas' {frmIncluirUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManDecisionCube';
  Application.CreateForm(TfrmDecisionCube, frmDecisionCube);
  Application.Run;
end.

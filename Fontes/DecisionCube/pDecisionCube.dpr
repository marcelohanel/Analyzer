program pDecisionCube;

uses
  Forms,
  uFuncoes in '..\uFuncoes.pas',
  uDescricao in 'uDescricao.pas' {frmDescricao},
  uCopiarPadroesCubo in 'uCopiarPadroesCubo.pas' {frmCopiarPadroesCubo},
  uFiltrar in 'uFiltrar.pas' {frmFiltrar},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uDecisionCube in 'uDecisionCube.pas' {frmDecisionCube};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDecisionCube, frmDecisionCube);
  Application.Run;
end.

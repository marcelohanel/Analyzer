program pDynamics;

uses
  Forms,
  uDynamics in 'uDynamics.pas' {frmDynamics},
  uFuncoes in '..\uFuncoes.pas',
  uCopiarPadroesDynamics in 'uCopiarPadroesDynamics.pas' {frmCopiarPadroesDynamics},
  uDescricao in 'uDescricao.pas' {frmDescricao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Analyzer Dynamics';
  Application.CreateForm(TfrmDynamics, frmDynamics);
  Application.Run;
end.

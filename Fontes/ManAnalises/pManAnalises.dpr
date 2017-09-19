program pManAnalises;

uses
  Forms,
  uAnalises in 'uAnalises.pas' {frmAnalises},
  uFuncoes in '..\uFuncoes.pas',
  uOndeSeUsa in 'uOndeSeUsa.pas' {frmOndeSeUsa},
  uElementosAnalise in 'uElementosAnalise.pas' {frmElementosAnalise},
  uPermissoesAnalise in 'uPermissoesAnalise.pas' {frmPermissoesAnalise},
  uVisualizarDados in 'uVisualizarDados.pas' {frmVisualizarDados},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uWizardAnalise in 'uWizardAnalise.pas' {frmWizardAnalise},
  uAtualiza in '..\uAtualiza.pas' {frmAtualiza};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManAnalises';
  Application.CreateForm(TfrmAnalises, frmAnalises);
  Application.Run;
end.

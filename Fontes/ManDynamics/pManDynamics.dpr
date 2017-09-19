program pManDynamics;

uses
  Forms,
  uDynamics in 'uDynamics.pas' {frmDynamics},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesDynamics in 'uPermissoesDynamics.pas' {frmPermissoesDynamics},
  uVisualizarDadosDynamics in 'uVisualizarDadosDynamics.pas' {frmVisualizarDadosDynamics},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uManDynamics in 'uManDynamics.pas' {frmManDynamics};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManDynamics';
  Application.CreateForm(TfrmDynamics, frmDynamics);
  Application.Run;
end.

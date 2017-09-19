program pDesigner;

uses
  Forms,
  uDesigner in 'uDesigner.pas' {frmDesigner},
  uFuncoes in '..\uFuncoes.pas',
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uDescricao in 'uDescricao.pas' {frmDescricao},
  uFiltroPersonalizado in 'uFiltroPersonalizado.pas' {frmFiltroPersonalizado},
  uCriaDynamics in 'uCriaDynamics.pas' {frmCriaDynamics},
  uFotografar in 'uFotografar.pas' {frmFotografar},
  uMostraFotografia in 'uMostraFotografia.pas' {frmMostraFotografia},
  uSelecaoGraficoFotografia in 'uSelecaoGraficoFotografia.pas' {frmSelecaoGraficoFotografia},
  uCriaFotografia in 'uCriaFotografia.pas' {frmCriaFotografia},
  uFrequencia in 'uFrequencia.pas' {frmFrequencia},
  uMostraFrequencia in 'uMostraFrequencia.pas' {frmMostraFrequencia},
  uSelecaoGraficoFrequencia in 'uSelecaoGraficoFrequencia.pas' {frmSelecaoGraficoFrequencia},
  uCriaFrequencia in 'uCriaFrequencia.pas' {frmCriaFrequencia},
  uVisualiza in 'uVisualiza.pas' {frmVisualiza},
  uSelecaoGraficoABC in 'uSelecaoGraficoABC.pas' {frmSelecaoGraficoABC},
  uABC in 'uABC.pas' {frmABC},
  uCriaABC in 'uCriaABC.pas' {frmCriaABC};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Designer';
  Application.CreateForm(TfrmDesigner, frmDesigner);
  Application.Run;
end.

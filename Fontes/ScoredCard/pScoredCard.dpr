program pScoredCard;

uses
  Forms,
  uMostraScored in 'uMostraScored.pas' {frmMostraScored},
  uFuncoes in '..\uFuncoes.pas',
  uScoredAcumulado in 'uScoredAcumulado.pas' {frmScoredAcumulado},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uSelecaoGraficoScored in 'uSelecaoGraficoScored.pas' {frmSelecaoGraficoScored},
  uAnotacoes in 'uAnotacoes.pas' {frmAnotacoes},
  uCriaAnalise in 'uCriaAnalise.pas' {frmCriaAnalise},
  uPainel in 'uPainel.pas' {frmPainel},
  uPersonalizarScored in 'uPersonalizarScored.pas' {frmPersonalizarScored},
  uDescricao in 'uDescricao.pas' {frmDescricao},
  uRenomearScored in 'uRenomearScored.pas' {frmRenomearScored},
  uCopiarPadroesScored in 'uCopiarPadroesScored.pas' {frmCopiarPadroesScored};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMostraScored, frmMostraScored);
  Application.Run;
end.

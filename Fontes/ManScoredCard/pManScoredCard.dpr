program pManScoredCard;

uses
  Forms,
  uScoredCard in 'uScoredCard.pas' {frmScoredCard},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesScored in 'uPermissoesScored.pas' {frmPermissoesScored},
  uVisualizarDadosScored in 'uVisualizarDadosScored.pas' {frmVisualizarDadosScored},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uManScored in 'uManScored.pas' {frmManScored},
  uSubstituir in 'uSubstituir.pas' {frmSubstituir},
  uScoredCardMan in 'uScoredCardMan.pas' {frmScoredCardMan},
  uFiltraScoredCard in 'uFiltraScoredCard.pas' {frmFiltraScoredCard},
  uPermissoesItemScored in 'uPermissoesItemScored.pas' {frmPermissoesItemScored},
  uAtualiza in '..\uAtualiza.pas' {frmAtualiza};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManScoredCard';
  Application.CreateForm(TfrmScoredCard, frmScoredCard);
  Application.Run;
end.

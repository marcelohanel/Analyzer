program pAnalyzer;



uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uModule in 'uModule.pas' {dtmPrincipal: TDataModule},
  uAguarde in 'uAguarde.pas' {frmAguarde},
  uLogin in 'uLogin.pas' {frmLogin},
  uFuncoes in 'uFuncoes.pas',
  uSplash in 'uSplash.pas' {frmSplash},
  uExcel in 'uExcel.pas',
  uFiltro in 'uFiltro.pas' {frmFiltro},
  uAtualiza in 'uAtualiza.pas' {frmAtualiza};

{$R *.res}

begin
  frmSplash := TfrmSplash.create(application);
  frmSplash.Show;
  frmSplash.update;

  Application.Title := 'Analyzer';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmSplash.Hide;
  frmSplash.Free;

  Application.Run;
end.

program pManRelatorios;

uses
  Forms,
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesRelatorio in 'uPermissoesRelatorio.pas' {frmPermissoesRelatorio},
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uManRelatorios in 'uManRelatorios.pas' {frmManRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManRelatorios';
  Application.CreateForm(TfrmRelatorios, frmRelatorios);
  Application.Run;
end.

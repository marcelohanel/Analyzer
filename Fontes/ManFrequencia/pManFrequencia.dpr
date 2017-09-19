program pManFrequencia;

uses
  Forms,
  uCadFrequencia in 'uCadFrequencia.pas' {frmCadFrequencia},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesFrequencia in 'uPermissoesFrequencia.pas' {frmPermissoesFrequencia},
  uManFrequencia in 'uManFrequencia.pas' {frmManFrequencia},
  uAguarde in '..\uAguarde.pas' {frmAguarde};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManFrequencia';
  Application.CreateForm(TfrmCadFrequencia, frmCadFrequencia);
  Application.Run;
end.

program pManABC;

uses
  Forms,
  uCadABC in 'uCadABC.pas' {frmCadABC},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesABC in 'uPermissoesABC.pas' {frmPermissoesABC},
  uManABC in 'uManABC.pas' {frmManABC},
  uAguarde in '..\uAguarde.pas' {frmAguarde};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManABC';
  Application.CreateForm(TfrmCadABC, frmCadABC);
  Application.Run;
end.

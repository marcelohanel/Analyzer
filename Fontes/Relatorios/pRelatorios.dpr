program pRelatorios;

uses
  Forms,
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRelatorios, frmRelatorios);
  Application.Run;
end.

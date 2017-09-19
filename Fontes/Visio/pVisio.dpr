program pVisio;

uses
  Forms,
  uVisio in 'uVisio.pas' {frmVisio},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesVisio in 'uPermissoesVisio.pas' {frmPermissoesVisio},
  uManVisio in 'uManVisio.pas' {frmManVisio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Visio';
  Application.CreateForm(TfrmVisio, frmVisio);
  Application.Run;
end.

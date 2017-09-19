program pAtualiza;

uses
  Forms,
  uAtualiza in 'uAtualiza.pas' {frmAtualiza},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAtualiza, frmAtualiza);
  Application.Run;
end.

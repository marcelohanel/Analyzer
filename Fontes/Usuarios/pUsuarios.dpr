program pUsuarios;

uses
  Forms,
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  uFuncoes in '..\uFuncoes.pas',
  uCopiarPadroes in 'uCopiarPadroes.pas' {frmCopiarPadroes},
  uManUsuarios in 'uManUsuarios.pas' {frmManUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Usuários';
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.Run;
end.

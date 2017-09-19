program pChave;

uses
  Forms,
  uChave in 'uChave.pas' {frmChave},
  uFuncoes in '..\uFuncoes.pas',
  uSenha in 'uSenha.pas' {frmSenha};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Analyzer - Chave de Ativação';
  Application.CreateForm(TfrmChave, frmChave);
  Application.Run;
end.

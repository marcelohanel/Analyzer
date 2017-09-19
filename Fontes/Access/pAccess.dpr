program pAccess;

uses
  Forms,
  uAccess in 'uAccess.pas' {frmAccess},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesAccess in 'uPermissoesAccess.pas' {frmPermissoesAccess},
  uManAccess in 'uManAccess.pas' {frmManAccess};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Access';
  Application.CreateForm(TfrmAccess, frmAccess);
  Application.Run;
end.

program pManFotografia;

uses
  Forms,
  uCadFotografia in 'uCadFotografia.pas' {frmCadFotografia},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesFotografia in 'uPermissoesFotografia.pas' {frmPermissoesFotografia},
  uManFotografia in 'uManFotografia.pas' {frmManFotografia},
  uAguarde in '..\uAguarde.pas' {frmAguarde};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManFotografia';
  Application.CreateForm(TfrmCadFotografia, frmCadFotografia);
  Application.Run;
end.

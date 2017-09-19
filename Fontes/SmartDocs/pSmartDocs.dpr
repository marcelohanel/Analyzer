program pSmartDocs;

uses
  Forms,
  uSmartDocs in 'uSmartDocs.pas' {frmSmartDocs},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesSmartDocs in 'uPermissoesSmartDocs.pas' {frmPermissoesSmartDocs},
  uManSmartDocs in 'uManSmartDocs.pas' {frmManSmartDocs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SmartDocs';
  Application.CreateForm(TfrmSmartDocs, frmSmartDocs);
  Application.Run;
end.

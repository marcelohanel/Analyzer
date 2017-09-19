program pUpdateBase;

uses
  Forms,
  uUpdateBase in 'uUpdateBase.pas' {frmUpdateBase},
  uFuncoes in '..\uFuncoes.pas',
  uScripts in 'uScripts.pas' {frmScripts},
  uInstrucao in 'uInstrucao.pas' {frmInstrucao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUpdateBase, frmUpdateBase);
  Application.Run;
end.

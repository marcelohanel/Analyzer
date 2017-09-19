program pManGeoAnalises;

uses
  Forms,
  uGeoAnalises in 'uGeoAnalises.pas' {frmGeoAnalises},
  uFuncoes in '..\uFuncoes.pas',
  uPermissoesGeo in 'uPermissoesGeo.pas' {frmPermissoesGeo},
  uDefinirGrupo in 'uDefinirGrupo.pas' {frmDefinirGrupo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ManGeoAnalises';
  Application.CreateForm(TfrmGeoAnalises, frmGeoAnalises);
  Application.Run;
end.

program pGeoAnalises;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFiltro in 'uFiltro.pas' {frmFiltro},
  uInformacoes in 'uInformacoes.pas' {frmInformacoes},
  uInfoLocalizacao in 'uInfoLocalizacao.pas' {frmInfoLocalizacao},
  uFuncoes in '..\uFuncoes.pas',
  uAguarde in '..\uAguarde.pas' {frmAguarde},
  uArqGeoAnalises in 'uArqGeoAnalises.pas' {frmArqGeoAnalises},
  uEditarInfoFatos in 'uEditarInfoFatos.pas' {frmEditarInfoFatos},
  uEditarInfoLocalizacao in 'uEditarInfoLocalizacao.pas' {frmEditarInfoLocalizacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

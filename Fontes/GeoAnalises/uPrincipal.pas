{
campo_aux_1 -> utilizado para informar o SGBD
campo_aux_2 -> Formato da data para os filtros
campo_aux_3 -> Suporta between no filtro
campo_aux_4 -> Suporta like no filtro
campo_aux_5 -> Suporta in no filtro
}

unit uPrincipal;

interface

uses
  xhConsts, ShellApi, cxLocalization, Math, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, StdCtrls,
  SHDocVw,


  cxSplitter,

  cxLookAndFeels, dxSkinsForm, cxButtons,
  cxGroupBox, cxLabel, cxTextEdit, cxDropDownEdit,
  cxCheckComboBox, Menus, cxPC,
  DBClient, dxStatusBar,
  ImgList,

  CEVersionInfo, cxCheckBox, cxGraphics, cxControls, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit,
  dxSkinsdxStatusBarPainter, OleCtrls, cxMaskEdit,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  TeEngine, TeeProcs, Chart, xhChart, xhGrid;

function AssinalaString(valor: variant): string;

type
  TfrmPrincipal = class(TForm)
    bdDados: TADOConnection;
    cdsMapaTotalRef: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    cdsMapaTotalDim: TClientDataSet;
    cdsMapaTotalDimdimensao: TStringField;
    cdsMapaTotalDimvalor: TFloatField;
    cdsMapa: TClientDataSet;
    cdsMapapais: TStringField;
    cdsMaparegiao: TStringField;
    cdsMapaestado: TStringField;
    cdsMapamesoregiao: TStringField;
    cdsMapamicroregiao: TStringField;
    cdsMapacidade: TStringField;
    cdsMapadimensao: TStringField;
    cdsMapavalor: TFloatField;
    cdsMapaperc_ref: TFloatField;
    cdsMapaacum_perc_ref: TFloatField;
    cdsMapaabc_ref: TStringField;
    cdsMapaperc_dim: TFloatField;
    cdsMapaacum_perc_dim: TFloatField;
    cdsMapaabc_dim: TStringField;
    cdsMapaTotalRefperc: TFloatField;
    cdsMapaTotalRefacum_perc: TFloatField;
    cdsMapaTotalRefabc_perc: TStringField;
    cdsMapaperc: TFloatField;
    cdsMapaacum_perc: TFloatField;
    cdsMapaabc_perc: TStringField;
    cdsMapa1: TClientDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField14: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField15: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField16: TStringField;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    EncerrarAplicao1: TMenuItem;
    N1: TMenuItem;
    cdsGeoAnalises: TClientDataSet;
    cdsGeoAnalisesid_geo: TStringField;
    cdsGeoAnalisesdescricao: TMemoField;
    mnuAbrir: TMenuItem;
    cdsGeoAnalisesdt_criacao: TDateTimeField;
    cdsGeoAnalisesconnection_string: TMemoField;
    cdsGeoAnalisestabela: TStringField;
    cdsGeoAnalisescampo_ref: TStringField;
    cdsGeoAnalisescampo_demensao_1: TStringField;
    cdsGeoAnalisescampo_demensao_2: TStringField;
    cdsGeoAnalisescampo_demensao_3: TStringField;
    cdsGeoAnalisescampo_demensao_4: TStringField;
    cdsGeoAnalisescampo_demensao_5: TStringField;
    cdsGeoAnalisescampo_demensao_6: TStringField;
    cdsGeoAnalisescampo_demensao_7: TStringField;
    cdsGeoAnalisescampo_demensao_8: TStringField;
    cdsGeoAnalisescampo_demensao_9: TStringField;
    cdsGeoAnalisescampo_demensao_10: TStringField;
    cdsGeoAnalisescampo_demensao_11: TStringField;
    cdsGeoAnalisescampo_demensao_12: TStringField;
    cdsGeoAnalisescampo_demensao_13: TStringField;
    cdsGeoAnalisescampo_demensao_14: TStringField;
    cdsGeoAnalisescampo_demensao_15: TStringField;
    cdsGeoAnalisescampo_demensao_16: TStringField;
    cdsGeoAnalisescampo_demensao_17: TStringField;
    cdsGeoAnalisescampo_demensao_18: TStringField;
    cdsGeoAnalisescampo_demensao_19: TStringField;
    cdsGeoAnalisescampo_demensao_20: TStringField;
    cdsGeoAnalisescampo_sumario_1: TStringField;
    cdsGeoAnalisescampo_sumario_2: TStringField;
    cdsGeoAnalisescampo_sumario_3: TStringField;
    cdsGeoAnalisescampo_sumario_4: TStringField;
    cdsGeoAnalisescampo_sumario_5: TStringField;
    cdsGeoAnalisesmaximo_itens: TIntegerField;
    cdsGeoAnaliseslargura: TIntegerField;
    cdsGeoAnalisesaltura: TIntegerField;
    cdsGeoAnalisestamanho: TIntegerField;
    cdsGeoAnalisesitens_mark: TIntegerField;
    cdsGeoAnalisesvisao: TStringField;
    cdsGeoAnalisesvisualiza_coord: TStringField;
    cdsGeoAnalisesendereco_a: TStringField;
    cdsGeoAnalisesendereco_b: TStringField;
    cdsGeoAnalisesendereco_c: TStringField;
    Ferramentas1: TMenuItem;
    dxStatusBar1: TdxStatusBar;
    ImageList1: TImageList;
    mnuLocalizacao: TMenuItem;
    cdsGeoAnalisescampo_aux_1: TStringField;
    cdsGeoAnalisescampo_aux_2: TStringField;
    cdsGeoAnalisescampo_aux_3: TStringField;
    cdsGeoAnalisescampo_aux_4: TStringField;
    cdsGeoAnalisescampo_aux_5: TStringField;
    cdsGeoAnalisescampo_aux_6: TStringField;
    cdsGeoAnalisescampo_aux_7: TStringField;
    cdsGeoAnalisescampo_aux_8: TStringField;
    cdsGeoAnalisescampo_aux_9: TStringField;
    cdsGeoAnalisescampo_aux_10: TStringField;
    cdsGeoAnalisescampo_aux_11: TStringField;
    cdsGeoAnalisescampo_aux_12: TStringField;
    cdsGeoAnalisescampo_aux_13: TStringField;
    cdsGeoAnalisescampo_aux_14: TStringField;
    cdsGeoAnalisescampo_aux_16: TStringField;
    cdsGeoAnalisescampo_aux_17: TStringField;
    cdsGeoAnalisescampo_aux_18: TStringField;
    cdsGeoAnalisescampo_aux_19: TStringField;
    cdsGeoAnalisescampo_aux_20: TStringField;
    mnuEditarLocalizacao: TMenuItem;
    cxLocalizer1: TcxLocalizer;
    N3: TMenuItem;
    mnuFatos: TMenuItem;
    cdsGeoAnalisescampo_dimensao_21: TStringField;
    cdsGeoAnalisescampo_dimensao_22: TStringField;
    cdsGeoAnalisescampo_dimensao_23: TStringField;
    cdsGeoAnalisescampo_dimensao_24: TStringField;
    cdsGeoAnalisescampo_dimensao_25: TStringField;
    cdsGeoAnalisescampo_dimensao_26: TStringField;
    cdsGeoAnalisescampo_dimensao_27: TStringField;
    cdsGeoAnalisescampo_dimensao_29: TStringField;
    cdsGeoAnalisescampo_dimensao_292: TStringField;
    cdsGeoAnalisescampo_dimensao_30: TStringField;
    cdsGeoAnalisescampo_dimensao_31: TStringField;
    cdsGeoAnalisescampo_dimensao_32: TStringField;
    cdsGeoAnalisescampo_dimensao_33: TStringField;
    cdsGeoAnalisescampo_dimensao_34: TStringField;
    cdsGeoAnalisescampo_dimensao_35: TStringField;
    cdsGeoAnalisescampo_dimensao_36: TStringField;
    cdsGeoAnalisescampo_dimensao_37: TStringField;
    cdsGeoAnalisescampo_dimensao_38: TStringField;
    cdsGeoAnalisescampo_dimensao_39: TStringField;
    cdsGeoAnalisescampo_dimensao_40: TStringField;
    cdsGeoAnalisescampo_dimensao_41: TStringField;
    cdsGeoAnalisescampo_dimensao_42: TStringField;
    cdsGeoAnalisescampo_dimensao_43: TStringField;
    cdsGeoAnalisescampo_dimensao_44: TStringField;
    cdsGeoAnalisescampo_dimensao_45: TStringField;
    cdsGeoAnalisescampo_dimensao_46: TStringField;
    cdsGeoAnalisescampo_dimensao_47: TStringField;
    cdsGeoAnalisescampo_dimensao_48: TStringField;
    cdsGeoAnalisescampo_dimensao_49: TStringField;
    cdsGeoAnalisescampo_dimensao_50: TStringField;
    cdsGeoAnalisescampo_sumario_6: TStringField;
    cdsGeoAnalisescampo_sumario_7: TStringField;
    cdsGeoAnalisescampo_sumario_8: TStringField;
    cdsGeoAnalisescampo_sumario_9: TStringField;
    cdsGeoAnalisescampo_sumario_10: TStringField;
    cdsGeoAnalisescampo_sumario_11: TStringField;
    cdsGeoAnalisescampo_sumario_12: TStringField;
    cdsGeoAnalisescampo_sumario_13: TStringField;
    cdsGeoAnalisescampo_sumario_14: TStringField;
    cdsGeoAnalisescampo_sumario_15: TStringField;
    cdsGeoAnalisescampo_sumario_16: TStringField;
    cdsGeoAnalisescampo_sumario_17: TStringField;
    cdsGeoAnalisescampo_sumario_18: TStringField;
    cdsGeoAnalisescampo_sumario_19: TStringField;
    cdsGeoAnalisescampo_sumario_20: TStringField;
    cdsGeoAnalisescampo_sumario_21: TStringField;
    cdsGeoAnalisescampo_sumario_22: TStringField;
    cdsGeoAnalisescampo_sumario_23: TStringField;
    cdsGeoAnalisescampo_sumario_24: TStringField;
    cdsGeoAnalisescampo_sumario_25: TStringField;
    cdsGeoAnalisescampo_sumario_26: TStringField;
    cdsGeoAnalisescampo_sumario_27: TStringField;
    cdsGeoAnalisescampo_sumario_28: TStringField;
    cdsGeoAnalisescampo_sumario_29: TStringField;
    cdsGeoAnalisescampo_sumario_30: TStringField;
    cdsGeoAnalisescampo_sumario_31: TStringField;
    cdsGeoAnalisescampo_sumario_32: TStringField;
    cdsGeoAnalisescampo_sumario_33: TStringField;
    cdsGeoAnalisescampo_sumario_34: TStringField;
    cdsGeoAnalisescampo_sumario_35: TStringField;
    cdsGeoAnalisescampo_sumario_36: TStringField;
    cdsGeoAnalisescampo_sumario_37: TStringField;
    cdsGeoAnalisescampo_sumario_39: TStringField;
    cdsGeoAnalisescampo_sumario_38: TStringField;
    cdsGeoAnalisescampo_sumario_40: TStringField;
    cdsGeoAnalisescampo_sumario_41: TStringField;
    cdsGeoAnalisescampo_sumario_42: TStringField;
    cdsGeoAnalisescampo_sumario_43: TStringField;
    cdsGeoAnalisescampo_sumario_44: TStringField;
    cdsGeoAnalisescampo_sumario_45: TStringField;
    cdsGeoAnalisescampo_sumario_46: TStringField;
    cdsGeoAnalisescampo_sumario_47: TStringField;
    cdsGeoAnalisescampo_sumario_48: TStringField;
    cdsGeoAnalisescampo_sumario_49: TStringField;
    cdsGeoAnalisescampo_sumario_50: TStringField;
    cdsGeoAnalisescampo_aux_21: TStringField;
    cdsGeoAnalisescampo_aux_22: TStringField;
    cdsGeoAnalisescampo_aux_23: TStringField;
    cdsGeoAnalisescampo_aux_24: TStringField;
    cdsGeoAnalisescampo_aux_25: TStringField;
    cdsGeoAnalisescampo_aux_26: TStringField;
    cdsGeoAnalisescampo_aux_27: TStringField;
    cdsGeoAnalisescampo_aux_28: TStringField;
    cdsGeoAnalisescampo_aux_29: TStringField;
    cdsGeoAnalisescampo_aux_30: TStringField;
    qryMapa: TADOQuery;
    ImageList2: TImageList;
    cdsGeoAnalisescampo_aux_b_1: TBlobField;
    cdsGeoAnalisescampo_aux_b_2: TBlobField;
    cdsGeoAnalisescampo_aux_b_3: TBlobField;
    cdsGeoAnalisescampo_aux_b_4: TBlobField;
    cdsGeoAnalisescampo_aux_b_5: TBlobField;
    cdsGeoAnalisescampo_aux_b_6: TBlobField;
    cdsGeoAnalisescampo_aux_b_7: TBlobField;
    cdsGeoAnalisescampo_aux_b_8: TBlobField;
    cdsGeoAnalisescampo_aux_b_9: TBlobField;
    cdsGeoAnalisescampo_aux_b_10: TBlobField;
    dxSkinController1: TdxSkinController;
    tblGeoAnalise: TADOTable;
    tblGeoAnaliseID_GEO: TWideStringField;
    tblGeoAnaliseDESCRICAO: TWideMemoField;
    tblGeoAnalisePODE_VISUALIZAR: TWideMemoField;
    tblGeoAnalisePODE_ALTERAR: TWideMemoField;
    tblGeoAnalisePODE_APAGAR: TWideMemoField;
    tblGeoAnaliseDT_CRIACAO: TDateTimeField;
    bdAnalyzer: TADOConnection;
    tblGeoAnaliseARQUIVO: TBlobField;
    CEVersionInfo1: TCEVersionInfo;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    GroupBox3: TcxGroupBox;
    BitBtn3: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cbxVisao: TcxComboBox;
    cbxVisaoMapa: TcxComboBox;
    chkNavegador: TcxCheckBox;
    GroupBox2: TcxGroupBox;
    btnFiltro: TcxButton;
    Label3: TcxLabel;
    Label2: TcxLabel;
    cbxSumario: TcxComboBox;
    cbxFuncao: TcxComboBox;
    cbxDimensao: TcxComboBox;
    cbbValorDimensao: TcxCheckComboBox;
    GroupBox1: TcxGroupBox;
    Label4: TcxLabel;
    Label7: TcxLabel;
    Label5: TcxLabel;
    Label8: TcxLabel;
    Label9: TcxLabel;
    Label6: TcxLabel;
    cbbPais: TcxCheckComboBox;
    cbbRegiao: TcxCheckComboBox;
    cbbEstado: TcxCheckComboBox;
    cbbMesoRegiao: TcxCheckComboBox;
    cbbMicroRegiao: TcxCheckComboBox;
    cbbCidade: TcxCheckComboBox;
    Panel2: TPanel;
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure PlotarMapa;
    procedure MontaDimensao;
    procedure MapaSimple;
    procedure MontaLocais(Local: string);
    procedure Dispcampos(Valor: Boolean);
    procedure btnFiltroClick(Sender: TObject);
    procedure MontaAnalise;
    procedure cbbPaisPropertiesChange(Sender: TObject);
    procedure cbbRegiaoPropertiesChange(Sender: TObject);
    procedure cbbEstadoPropertiesChange(Sender: TObject);
    procedure cbbMesoRegiaoPropertiesChange(Sender: TObject);
    procedure cbbMicroRegiaoPropertiesChange(Sender: TObject);
    procedure aguarde(Tipo: Integer; Mensagem: string);
    procedure cbxDimensaoPropertiesChange(Sender: TObject);
    procedure EncerrarAplicao1Click(Sender: TObject);
    procedure mnuAbrirClick(Sender: TObject);
    procedure cdsGeoAnalisesAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure mnuLocalizacaoClick(Sender: TObject);
    procedure mnuEditarLocalizacaoClick(Sender: TObject);
    procedure mnuFatosClick(Sender: TObject);
  private
    procedure MontaMarks(Texto, Latitude, Longitude, Titulo: string; ABC: string);
    procedure MontaInfoMapa;
    procedure CriaDataSetMapa;
    procedure AbrirArquivo;
    procedure CriarArquivo;
    { Private declarations }
  public
    { Public declarations }
    sArquivo        : string;
    sGeo            : string;
    sFiltro         : string;
    iItens          : integer;
    sMapa           : string;
    sTabela         : string;
    sRef            : string;
    sTitulo         : string;
    sTamanho        : string;
    sLargura        : string;
    sAltura         : string;
    sRegistros      : string;
    sVisualizaCoord : string;
    sDimensao       : array [1..50] of string;
    sSumario        : array [1..50] of string;
    sIconeA         : string;
    sIconeB         : string;
    sIconeC         : string;
    vTotalGeral     : double;
    lPrimeiroAcesso : boolean;
    lProblemaNome   : boolean;
    sUsuario        : string;
    sTempDirUsuario : string;
  end;

var
  frmPrincipal: TfrmPrincipal;
  dCurvaA, dCurvaB : double;

implementation

uses uAguarde, uFiltro, uArqGeoAnalises, uInformacoes, uInfoLocalizacao,
  uFuncoes, uEditarInfoLocalizacao, uEditarInfoFatos;

{$R *.dfm}

function AssinalaString(valor: variant): string;
var
    sResult : string;
begin
    if valor = Null then
       sResult := ''
    else
       sResult := valor;

    result := sResult;
end;

procedure TfrmPrincipal.AbrirArquivo;
begin
    if frmInformacoes <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_391'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if sArquivo <> '' then
    begin
        try
           cdsGeoAnalises.CreateDataSet;
        except
        end;

        cdsGeoAnalises.EmptyDataSet;

        try
           cdsGeoAnalises.LoadFromFile(sArquivo);
        except
           on E: Exception do
           begin
               MessageDlg(HCLResourceStrings.FindID('sString_392')+#13+#10+''+#13+#10+HCLResourceStrings.FindID('sString_397') + e.Message, mtWarning, [mbOK], 0);
               exit;
           end;
        end;

        try
           bdDados.Close;
           bdDados.ConnectionString := cdsGeoAnalisesconnection_string.AsString;
           bdDados.Open();
        except
          on E: Exception do
          begin
              MessageDlg(HCLResourceStrings.FindID('sString_393') +#13+#10+ HCLResourceStrings.FindID('sString_370') + E.Message, mtInformation, [mbOK], 0);
              Exit;
          end;
        end;

        frmInformacoes := TfrmInformacoes.Create(Self);

        if not lPrimeiroAcesso then
           frmInformacoes.ShowModal
        else
        begin
            frmInformacoes.Show;
            frmInformacoes.Hide;
            frmInformacoes.Grava;
        end;

        if frmInformacoes.lOK then
        begin
            aguarde(0,HCLResourceStrings.FindID('sString_394'));

            lProblemaNome := False;

            if ParamStr(5) = '/Criar' then
            begin
                if tblGeoAnalise.Locate('ID_GEO',cdsGeoAnalisesid_geo.AsString,[]) then
                begin
                    MessageDlg(HCLResourceStrings.FindID('sString_413'), mtWarning, [mbOK], 0);
                    lProblemaNome := True;
                end
                else
                begin
                    tblGeoAnalise.Insert;

                    tblGeoAnaliseID_GEO.Value := cdsGeoAnalisesid_geo.Value;
                    tblGeoAnaliseDESCRICAO.Value := cdsGeoAnalisesdescricao.Value;
                    tblGeoAnaliseARQUIVO.LoadFromFile(sArquivo);

                    if frmPrincipal.sUsuario <> 'admin' then
                    begin
                        frmPrincipal.tblGeoAnalisePODE_VISUALIZAR.Value := frmPrincipal.sUsuario + ', admin';
                        frmPrincipal.tblGeoAnalisePODE_ALTERAR.Value    := frmPrincipal.sUsuario + ', admin';
                        frmPrincipal.tblGeoAnalisePODE_APAGAR.Value     := frmPrincipal.sUsuario + ', admin';
                    end
                    else
                    begin
                        frmPrincipal.tblGeoAnalisePODE_VISUALIZAR.Value := frmPrincipal.sUsuario;
                        frmPrincipal.tblGeoAnalisePODE_ALTERAR.Value    := frmPrincipal.sUsuario;
                        frmPrincipal.tblGeoAnalisePODE_APAGAR.Value     := frmPrincipal.sUsuario;
                    end;

                    tblGeoAnalise.Post;
                end;
            end;

            if (ParamStr(5) = '/Alterar') or (ParamStr(5) = '/Abrir') then
            begin
                if not tblGeoAnalise.Locate('ID_GEO',cdsGeoAnalisesid_geo.AsString,[]) then
                begin
                    MessageDlg(HCLResourceStrings.FindID('sString_413'), mtWarning, [mbOK], 0);
                    lProblemaNome := True;
                end
                else
                begin
                    tblGeoAnalise.Edit;

                    tblGeoAnaliseID_GEO.Value := cdsGeoAnalisesid_geo.Value;
                    tblGeoAnaliseDESCRICAO.Value := cdsGeoAnalisesdescricao.Value;
                    tblGeoAnaliseARQUIVO.LoadFromFile(sArquivo);

                    tblGeoAnalise.Post;
                end;
            end;

            dxStatusBar1.Panels[3].Text := HCLResourceStrings.FindID('sString_395') + sArquivo;

            mnuEditarLocalizacao.Enabled := True;
            mnuFatos.Enabled             := True;

            if FileExists(sMapa) then
               DeleteFile(sMapa);

            Dispcampos(True);
            MontaAnalise;

            aguarde(1,'');
        end;

        frmInformacoes.Close;
        FreeAndNil(frmInformacoes);
    end;
end;

procedure TfrmPrincipal.mnuAbrirClick(Sender: TObject);
begin
    AbrirArquivo;
end;

procedure TfrmPrincipal.aguarde(Tipo: Integer; Mensagem: string);
begin
    if Tipo = 0 then
    begin
        if frmAguarde <> nil then
           exit;

        frmAguarde := TfrmAguarde.Create(Self);
        frmAguarde.cMensagem := Mensagem;
        frmAguarde.Show;
        frmAguarde.Update;
    end;

    if Tipo = 1 then
    begin
        if frmAguarde <> nil then
           FreeAndNil(frmAguarde);
    end;

    if Tipo = 2 then
    begin
        if frmAguarde <> nil then
           exit;

        frmAguarde := TfrmAguarde.Create(Self);

        frmAguarde.Label2.Visible         := False;
        frmAguarde.cxProgressBar1.Visible := True;

        frmAguarde.Show;
        frmAguarde.Update;
    end;
end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
begin
    if cbbPais.Properties.Items.Count <= 0 then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_396'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cbxSumario.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_398'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cbxFuncao.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_399'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cbxDimensao.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_400'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if cbxVisao.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_401'), mtInformation, [mbOK], 0);
        Exit;
    end;

    aguarde(2,'');

    frmAguarde.cxProgressBar1.Properties.Max := 14;
    frmAguarde.cxProgressBar1.Position       := 0;
    frmAguarde.Update;

    try
       CriaDataSetMapa;
       PlotarMapa;
    finally
       frmAguarde.cxProgressBar1.Position := 14;
       frmAguarde.Update;
       aguarde(1,'');
    end;
end;

procedure TfrmPrincipal.btnFiltroClick(Sender: TObject);
begin
    frmFiltro.ShowModal;
end;

procedure TfrmPrincipal.PlotarMapa;
begin
    MapaSimple;

    if chkNavegador.Checked = False then
       WebBrowser1.Navigate(sMapa)
    else
       ShellExecute(handle,'open', pchar(sMapa),nil, nil, sw_shownormal);
end;

procedure TfrmPrincipal.cbbEstadoPropertiesChange(Sender: TObject);
begin
    aguarde(0,HCLResourceStrings.FindID('sString_403'));

    MontaLocais('MESOREGIAO');
    MontaLocais('MICROREGIAO');
    MontaLocais('CIDADE');

    aguarde(1,'');
end;

procedure TfrmPrincipal.cbbMesoRegiaoPropertiesChange(Sender: TObject);
begin
    aguarde(0,HCLResourceStrings.FindID('sString_403'));

    MontaLocais('MICROREGIAO');
    MontaLocais('CIDADE');

    aguarde(1,'');
end;

procedure TfrmPrincipal.cbbMicroRegiaoPropertiesChange(Sender: TObject);
begin
    aguarde(0,HCLResourceStrings.FindID('sString_403'));
    MontaLocais('CIDADE');
    aguarde(1,'');
end;

procedure TfrmPrincipal.cbbPaisPropertiesChange(Sender: TObject);
begin
    aguarde(0,HCLResourceStrings.FindID('sString_403'));

    MontaLocais('REGIAO');
    MontaLocais('ESTADO');
    MontaLocais('MESOREGIAO');
    MontaLocais('MICROREGIAO');
    MontaLocais('CIDADE');

    aguarde(1,'');
end;

procedure TfrmPrincipal.cbbRegiaoPropertiesChange(Sender: TObject);
begin
    aguarde(0,HCLResourceStrings.FindID('sString_403'));

    MontaLocais('ESTADO');
    MontaLocais('MESOREGIAO');
    MontaLocais('MICROREGIAO');
    MontaLocais('CIDADE');

    aguarde(1,'');
end;

procedure TfrmPrincipal.cbxDimensaoPropertiesChange(Sender: TObject);
begin
    MontaDimensao;
end;

procedure TfrmPrincipal.cdsGeoAnalisesAfterInsert(DataSet: TDataSet);
begin
    cdsGeoAnalisesdt_criacao.Value      := Now;
    cdsGeoAnalisesmaximo_itens.Value    := 1000;
    cdsGeoAnaliseslargura.Value         := 1000;
    cdsGeoAnalisesaltura.Value          := 1000;
    cdsGeoAnalisestamanho.Value         := 3;
    cdsGeoAnalisesitens_mark.Value      := 10;
    cdsGeoAnalisesvisao.Value           := 'Mapa';
    cdsGeoAnalisesvisualiza_coord.Value := 'N';
    cdsGeoAnalisescampo_aux_2.Value     := 'MM/DD/YYYY';
    cdsGeoAnalisescampo_aux_3.Value     := 'S';
    cdsGeoAnalisescampo_aux_4.Value     := 'S';
    cdsGeoAnalisescampo_aux_5.Value     := 'S';
    cdsGeoAnalisesendereco_a.Value      := 'http://thydzik.com/thydzikGoogleMap/markerlink.php?text=A&color=5680FC';
    cdsGeoAnalisesendereco_b.Value      := 'http://thydzik.com/thydzikGoogleMap/markerlink.php?text=B&color=FCF356';
    cdsGeoAnalisesendereco_c.Value      := 'http://thydzik.com/thydzikGoogleMap/markerlink.php?text=C&color=FC6355';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(bdAnalyzer,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    if FileExists(sMapa) then
       DeleteFile(sMapa);

    if FileExists(ParamStr(3)) then
       DeleteFile(ParamStr(3));

    FreeAndNil(cdsMapa);
    FreeAndNil(cdsMapa1);
    FreeAndNil(cdsMapaTotalRef);
    FreeAndNil(cdsMapaTotalDim);
    FreeAndNil(cdsGeoAnalises);

    tblGeoAnalise.Close;

    bdDados.Close;
    bdAnalyzer.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg('Parâmetros Inválidos', mtError, [mbOK], 0);
        Application.Terminate;
    end;

    dxSkinController1.SkinName := ParamStr(2);
    if ParamStr(2) <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    sUsuario        := ParamStr(4);
    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    lPrimeiroAcesso := True;
    lProblemaNome   := False;

    SetLanguage(2, cxLocalizer1);

    cdsGeoAnalises.Close;
    cdsGeoAnalises.CreateDataSet;

    sMapa := sTempDirUsuario + 'Mapa.html';

    if FileExists(sMapa) then
       DeleteFile(sMapa);

    Dispcampos(False);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
    comando : TStrings;
begin
    dxStatusBar1.Panels[0].Text := HCLResourceStrings.FindID('sString_404') + DateToStr(Date);
    dxStatusBar1.Panels[1].Text := HCLResourceStrings.FindID('sString_405') + CEVersionInfo1.FileVersion;

    try
       comando := TStringList.Create;
       comando.Clear;
       comando.LoadFromFile(ParamStr(3));

       bdAnalyzer.Close;
       bdAnalyzer.ConnectionString := comando.Text;
       bdAnalyzer.Open;

       comando.Free;

       tblGeoAnalise.Filtered := False;

       if (ParamStr(5) = '/Alterar') or  (ParamStr(5) = '/Abrir') then
       begin
          tblGeoAnalise.Filter := 'ID_GEO = ' + #39 + ParamStr(6) + #39;
          tblGeoAnalise.Filtered := True;
       end;

       tblGeoAnalise.Open;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_318') +#13+#10+
                     HCLResourceStrings.FindID('sString_370') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    GeraLog(bdAnalyzer,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    if ParamStr(5) = '/Criar' then
       CriarArquivo;

    if (ParamStr(5) = '/Alterar') or (ParamStr(5) = '/Abrir') then
    begin
        if ParamStr(5) = '/Alterar' then
           lPrimeiroAcesso := False;

        sArquivo := sTempDirUsuario + trim(tblGeoAnaliseID_GEO.AsString) + '.geo';
        tblGeoAnaliseARQUIVO.SaveToFile(sArquivo);

        if not FileExists(sArquivo) then
        begin
            MessageDlg(HCLResourceStrings.FindID('sString_412'), mtError, [mbOK], 0);
            Application.Terminate;
        end;

        AbrirArquivo;

        if ParamStr(7) <> 'Sim' then
        begin
           mnuAbrir.Enabled       := False;
           mnuLocalizacao.Enabled := False;
        end;
    end;

    cxPageControl2.ActivePageIndex := 0;
end;

procedure TfrmPrincipal.mnuLocalizacaoClick(Sender: TObject);
begin
    if sArquivo = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_406'), mtInformation, [mbOK], 0);
        Exit;
    end;

    if frmInfoLocalizacao <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_407'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmInfoLocalizacao := TfrmInfoLocalizacao.Create(Self);
    frmInfoLocalizacao.ShowModal;

    if frmInfoLocalizacao.lOK then
    begin
        MontaLocais('PAIS');
        MontaLocais('REGIAO');
        MontaLocais('ESTADO');
        MontaLocais('MESOREGIAO');
        MontaLocais('MICROREGIAO');
        MontaLocais('CIDADE');
    end;

    FreeAndNil(frmInfoLocalizacao);
end;

procedure TfrmPrincipal.Dispcampos(Valor: Boolean);
begin
    GroupBox1.Enabled    := Valor;
    GroupBox2.Enabled    := Valor;
    GroupBox3.Enabled    := Valor;
    WebBrowser1.Enabled  := Valor;
    cxSplitter1.Enabled  := Valor;

    Memo1.Clear;
    Memo1.Lines.Add('<HTML></HTML>');

    try
       Memo1.Lines.SaveToFile(sMapa);
    except
    end;

    //WebBrowser1.Navigate(sMapa);

    if Valor = False then
    begin
        cbxSumario.ItemIndex       := -1;
        cbxDimensao.ItemIndex      := -1;
        cbxFuncao.ItemIndex        := -1;
        cbbValorDimensao.ItemIndex := -1;
        cbbPais.ItemIndex          := -1;
        cbbRegiao.ItemIndex        := -1;
        cbbEstado.ItemIndex        := -1;
        cbbMesoRegiao.ItemIndex    := -1;
        cbbMicroRegiao.ItemIndex   := -1;
        cbbCidade.ItemIndex        := -1;
        cbxVisao.ItemIndex         := -1;
        cbxVisaoMapa.ItemIndex     := -1;
    end;
end;

procedure TfrmPrincipal.EncerrarAplicao1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrincipal.MontaAnalise;
var
    i : integer;
    sAux: string;
begin
    try
       bdDados.Close;
       bdDados.ConnectionString := cdsGeoAnalisesconnection_string.AsString;
       bdDados.Open();
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_393') +#13+#10+ HCLResourceStrings.FindID('sString_370') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    iItens           := cdsGeoAnalisesMAXIMO_ITENS.Value;
    sTabela          := cdsGeoAnalisesTABELA.AsString;
    sRef             := cdsGeoAnalisesCAMPO_REF.AsString;
    sTitulo          := cdsGeoAnalisesID_GEO.AsString;
    sLargura         := cdsGeoAnalisesLARGURA.AsString;
    sAltura          := cdsGeoAnalisesALTURA.AsString;
    sTamanho         := cdsGeoAnalisesTAMANHO.AsString;
    sRegistros       := cdsGeoAnalisesITENS_MARK.AsString;
    sVisualizaCoord  := cdsGeoAnalisesVISUALIZA_COORD.AsString;
    sIconeA          := cdsGeoAnalisesENDERECO_A.AsString;
    sIconeB          := cdsGeoAnalisesENDERECO_B.AsString;
    sIconeC          := cdsGeoAnalisesENDERECO_C.AsString;

    if cdsGeoAnalisesVISAO.AsString = 'Mapa' then
       cbxVisaoMapa.ItemIndex := 0
    else
    if cdsGeoAnalisesVISAO.AsString = 'Satélite' then
       cbxVisaoMapa.ItemIndex := 1
    else
    if cdsGeoAnalisesVISAO.AsString = 'Híbrido' then
       cbxVisaoMapa.ItemIndex := 2
    else
       cbxVisaoMapa.ItemIndex := 3;

    cbxFuncao.ItemIndex    := 0;
    cbxVisao.ItemIndex     := 0;

    cbxDimensao.Properties.OnChange(Self);

    cbbValorDimensao.Properties.Items.Clear;
    cbxDimensao.Properties.Items.Clear;
    cbxSumario.Properties.Items.Clear;
    for i := 1 to 50 do
    begin
        sAux := cdsGeoAnalises.FieldByName('campo_dimensao_' + IntToStr(i)).AsString;

        if sAux <> '' then
        begin
           cbxDimensao.Properties.Items.Add(sAux);
           sDimensao[i] := sAux;
        end;

        sAux := cdsGeoAnalises.FieldByName('campo_sumario_' + IntToStr(i)).AsString;

        if sAux <> '' then
        begin
           cbxSumario.Properties.Items.Add(sAux);
           sSumario[i] := sAux;
        end;
    end;

    try
        MontaLocais('PAIS');
        MontaLocais('REGIAO');
        MontaLocais('ESTADO');
        MontaLocais('MESOREGIAO');
        MontaLocais('MICROREGIAO');
        MontaLocais('CIDADE');
    except
    end;

    Dispcampos(True);

    try
       FreeAndNil(frmFiltro);
    except
    end;

    frmFiltro := TfrmFiltro.Create(Self);

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft Access')     or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft SQL Server') then
        frmFiltro.qryFiltro.SQL.Add('SELECT TOP 1 * FROM ' + sTabela);

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'MySQL')    or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Postgres') then
        frmFiltro.qryFiltro.SQL.Add('SELECT * FROM ' + sTabela + ' LIMIT 1');

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Firebird ou Interbase') then
        frmFiltro.qryFiltro.SQL.Add('SELECT FIRST 1 * FROM ' + sTabela);

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Oracle') then
    begin
        frmFiltro.qryFiltro.SQL.Add('SELECT * FROM ' + sTabela);
        frmFiltro.qryFiltro.SQL.Add('WHERE ROWNUM = 1');
    end;

    frmFiltro.qryFiltro.Open;
end;

function retornaFiltro(): string;
var
    sAux : string;
    i : integer;
begin
    if frmPrincipal.cbbPais.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbPais.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbPais.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbPais.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.PAIS IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.PAIS IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbRegiao.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbRegiao.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.REGIAO IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.REGIAO IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbEstado.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbEstado.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbEstado.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbEstado.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.ESTADO IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.ESTADO IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbMesoRegiao.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbMesoRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbMesoRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbMesoRegiao.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.MESOREGIAO IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.MESOREGIAO IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbMicroRegiao.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbMicroRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbMicroRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbMicroRegiao.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.MICROREGIAO IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.MICROREGIAO IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbCidade.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbCidade.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbCidade.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbCidade.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND GEO_REFERENCIA.CIDADE IN (' + sAux + ')'
        else
           result := result + ' AND GEO_REFERENCIA.CIDADE IN (' + sAux + ')';
    end;

    if frmPrincipal.cbbValorDimensao.Text <> '' then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbValorDimensao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbValorDimensao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbValorDimensao.Text,';') + #39;
        end;

        if result = '' then
           result := 'AND ' + frmPrincipal.sTabela + '.' + frmPrincipal.cbxDimensao.Text + ' IN (' + sAux + ')'
        else
           result := result + ' AND ' + frmPrincipal.sTabela + '.' + frmPrincipal.cbxDimensao.Text + ' IN (' + sAux + ')';
    end;

    if frmPrincipal.sFiltro <> '' then
    begin
        if result = '' then
           result := 'AND ' + frmPrincipal.sFiltro
        else
           result := result + ' AND ' + frmPrincipal.sFiltro;
    end;
end;

function retornaEndereco(pais, regiao, estado, meso, micro, cidade: string): string;
var
    Query : TADOQuery;
    sSQLBasico : string;
begin
    result  := 'BRASIL';

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmPrincipal.bdDados;

    Query.Close;

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft Access')     or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Microsoft SQL Server') then
        Query.SQL.Add('SELECT TOP 1 PAIS, REGIAO, MESOREGIAO, MICROREGIAO, ESTADO, CIDADE, LATITUDE, LONGITUDE');

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Firebird ou Interbase') then
        Query.SQL.Add('SELECT FIRST 1 PAIS, REGIAO, MESOREGIAO, MICROREGIAO, ESTADO, CIDADE, LATITUDE, LONGITUDE');

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'MySQL')    or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Postgres') or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Oracle')   then
        Query.SQL.Add('SELECT PAIS, REGIAO, MESOREGIAO, MICROREGIAO, ESTADO, CIDADE, LATITUDE, LONGITUDE');

    Query.SQL.Add('FROM GEO_REFERENCIA');

    if pais <> '' then
       Query.SQL.Add('WHERE PAIS = ' + #39 + StringReplace(pais,#39,'',[rfReplaceAll]) + #39);

    if regiao <> '' then
       Query.SQL.Add('AND REGIAO = ' + #39 + StringReplace(regiao,#39,'',[rfReplaceAll]) + #39);

    if estado <> '' then
       Query.SQL.Add('AND ESTADO = ' + #39 + StringReplace(estado,#39,'',[rfReplaceAll]) + #39);

    if meso <> '' then
       Query.SQL.Add('AND MESOREGIAO = ' + #39 + StringReplace(meso,#39,'',[rfReplaceAll]) + #39);

    if micro <> '' then
       Query.SQL.Add('AND MICROREGIAO = ' + #39 + StringReplace(micro,#39,'',[rfReplaceAll]) + #39);

    if cidade <> '' then
       Query.SQL.Add('AND CIDADE = ' + #39 + StringReplace(cidade,#39,'',[rfReplaceAll]) + #39);

     sSQLBasico := Query.SQL.Text;

    if frmPrincipal.cbxVisao.Text = 'País' then
       Query.SQL.Add('AND REF_PAIS = ' + #39 + 'S' + #39);

    if frmPrincipal.cbxVisao.Text = 'Região' then
       Query.SQL.Add('AND REF_REGIAO = ' + #39 + 'S' + #39);

    if frmPrincipal.cbxVisao.Text = 'Estado' then
       Query.SQL.Add('AND REF_ESTADO = ' + #39 + 'S' + #39);

    if frmPrincipal.cbxVisao.Text = 'Meso Região' then
       Query.SQL.Add('AND REF_MESO = ' + #39 + 'S' + #39);

    if frmPrincipal.cbxVisao.Text = 'Micro Região' then
       Query.SQL.Add('AND REF_MICRO = ' + #39 + 'S' + #39);

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'MySQL')    or
       (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Postgres') then
        Query.SQL.Add('LIMIT 1');

    if (frmPrincipal.cdsGeoAnalisescampo_aux_1.AsString = 'Oracle') then
        Query.SQL.Add('AND ROWNUM = 1');

    Query.Open;

    if Query.IsEmpty then
    begin
       Query.Close;
       Query.SQL.Clear;
       Query.SQL.Add(sSQLBasico);
       Query.Open;
    end;

    Query.First;
    if not Query.IsEmpty then
    begin
       if regiao = '' then
          result := Query.FieldByName('PAIS').AsString
       else
       begin
          result := Query.FieldByName('PAIS').AsString;

          if Query.FieldByName('ESTADO').AsString <> '' then
             result := result + ', ' + Query.FieldByName('ESTADO').AsString;

          if Query.FieldByName('CIDADE').AsString <> '' then
             result := result + ', ' + Query.FieldByName('CIDADE').AsString;
       end;
    end;

    result := result + '|' +
           StringReplace(Query.FieldByName('LONGITUDE').AsString,',','.',[rfReplaceAll]) + '|' +
           StringReplace(Query.FieldByName('LATITUDE').AsString,',','.',[rfReplaceAll]);

    Query.Close;
    Query.Free;
end;

procedure TfrmPrincipal.MontaMarks(Texto, Latitude, Longitude, Titulo: string; ABC: string);
begin
    if (Latitude = '') or (Latitude = '0') then
       exit;

    if (Longitude = '') or (Longitude = '0') then
       exit;

    Texto := StringReplace(Texto,'"','',[rfReplaceAll]);

    if (sIconeA <> '') and (ABC = 'A') then
        Memo1.Lines.Add('   addMarkA(map, ' + Latitude + ', ' + Longitude + ', "' + Texto + '", "' + Titulo + '"); ')
    else
    if (sIconeB <> '') and (ABC = 'B') then
        Memo1.Lines.Add('   addMarkB(map, ' + Latitude + ', ' + Longitude + ', "' + Texto + '", "' + Titulo + '"); ')
    else
    if (sIconeC <> '') and (ABC = 'C') then
        Memo1.Lines.Add('   addMarkC(map, ' + Latitude + ', ' + Longitude + ', "' + Texto + '", "' + Titulo + '"); ')
    else
        Memo1.Lines.Add('   addMark(map, ' + Latitude + ', ' + Longitude + ', "' + Texto + '", "' + Titulo + '"); ');

end;

procedure TfrmPrincipal.MapaSimple;
var
    sEndereco : string;
    sTipoMapa : string;
begin
    sEndereco := '';

    if cbxVisaoMapa.Text = 'Mapa' then
       sTipoMapa := 'mapTypeId: google.maps.MapTypeId.ROADMAP'
    else
    if cbxVisaoMapa.Text = 'Satélite' then
       sTipoMapa := 'mapTypeId: google.maps.MapTypeId.SATELLITE'
    else
    if cbxVisaoMapa.Text = 'Híbrido' then
       sTipoMapa := 'mapTypeId: google.maps.MapTypeId.HYBRID'
    else
    if cbxVisaoMapa.Text = 'Terreno' then
       sTipoMapa := 'mapTypeId: google.maps.MapTypeId.TERRAIN';

    // API 3.0

    Memo1.Lines.Clear;
    Memo1.Lines.Add('<html>');
    Memo1.Lines.Add('<head>');

    Memo1.Lines.Add('<style>');
    Memo1.Lines.Add('.h1');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('font-family: verdana;');
    Memo1.Lines.Add('font-size: 11px;');
    Memo1.Lines.Add('border:0px solid #000000;');
    Memo1.Lines.Add('}');
    Memo1.Lines.Add('</style>');

    Memo1.Lines.Add('<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />');
    Memo1.Lines.Add('<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>');
    Memo1.Lines.Add('<title>GeoAnalises</title>');
    Memo1.Lines.Add('<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>');
    Memo1.Lines.Add('<script type="text/javascript">');

    Memo1.Lines.Add('function LatLngControl(mapa)');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('   this.ANCHOR_OFFSET_ = new google.maps.Point(8, 8);');
    Memo1.Lines.Add('   this.node_ = this.createHtmlNode_();');
    Memo1.Lines.Add('   mapa.controls[google.maps.ControlPosition.TOP].push(this.node_);');
    Memo1.Lines.Add('   this.setMap(mapa);');
    Memo1.Lines.Add('   this.set("visible", false);');
    Memo1.Lines.Add('}');

    Memo1.Lines.Add('LatLngControl.prototype = new google.maps.OverlayView();');
    Memo1.Lines.Add('LatLngControl.prototype.draw = function() {};');

    Memo1.Lines.Add('LatLngControl.prototype.createHtmlNode_ = function()');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('  var divNode = document.createElement("div");');
    Memo1.Lines.Add('  divNode.id = "latlng-control";');
    Memo1.Lines.Add('  divNode.index = 100;');
    Memo1.Lines.Add('  return divNode;');
    Memo1.Lines.Add('};');

    Memo1.Lines.Add('LatLngControl.prototype.visible_changed = function()');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('  this.node_.style.display = this.get("visible") ? "" : "none";');
    Memo1.Lines.Add('};');

    Memo1.Lines.Add('LatLngControl.prototype.updatePosition = function(latLng)');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('  var projection = this.getProjection();');
    Memo1.Lines.Add('  var point = projection.fromLatLngToContainerPixel(latLng);');
    Memo1.Lines.Add('  this.node_.style.left = point.x + this.ANCHOR_OFFSET_.x + "px";');
    Memo1.Lines.Add('  this.node_.style.top = point.y + this.ANCHOR_OFFSET_.y + "px";');
    Memo1.Lines.Add('  this.node_.innerHTML =');
    Memo1.Lines.Add('  [');
    Memo1.Lines.Add('    latLng.toUrlValue(4),');
    Memo1.Lines.Add('  ].join("");');
    Memo1.Lines.Add('};');

    Memo1.Lines.Add('function initialize()');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('   var myCenter = new google.maps.LatLng(0,0);');
    Memo1.Lines.Add('   var myOptions = {zoom: 4,center: myCenter,' + sTipoMapa + '}');
    Memo1.Lines.Add('   var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);');

    Memo1.Lines.Add('var latLngControl = new LatLngControl(map);');

    if sVisualizaCoord = 'S' then
    begin
        Memo1.Lines.Add('google.maps.event.addListener(map, "mouseover", function(mEvent) {latLngControl.set("visible", true);});');
        Memo1.Lines.Add('google.maps.event.addListener(map, "mouseout", function(mEvent) {latLngControl.set("visible", false);});');
        Memo1.Lines.Add('google.maps.event.addListener(map, "mousemove", function(mEvent) {latLngControl.updatePosition(mEvent.latLng);});');
    end;

    MontaInfoMapa;

    Memo1.Lines.Add('}');

    if sIconeA <> '' then
    begin
        Memo1.Lines.Add('function addMarkA(mapa, latitude, longitude, contentString, title)');
        Memo1.Lines.Add('{');
        Memo1.Lines.Add('   var myLatlng = new google.maps.LatLng(latitude,longitude);');
        Memo1.Lines.Add('   var infowindow = new google.maps.InfoWindow({content: contentString});');
        Memo1.Lines.Add('   var marker = new google.maps.Marker({position: myLatlng, map: mapa, title: title, clickable: true, icon: ' + #39 + sIconeA + #39 + '})');
        Memo1.Lines.Add('   google.maps.event.addListener(marker, "click", function() {infowindow.open(mapa,marker);});');
        Memo1.Lines.Add('   mapa.setCenter(myLatlng);');
        Memo1.Lines.Add('}');
    end;

    if sIconeB <> '' then
    begin
        Memo1.Lines.Add('function addMarkB(mapa, latitude, longitude, contentString, title)');
        Memo1.Lines.Add('{');
        Memo1.Lines.Add('   var myLatlng = new google.maps.LatLng(latitude,longitude);');
        Memo1.Lines.Add('   var infowindow = new google.maps.InfoWindow({content: contentString});');
        Memo1.Lines.Add('   var marker = new google.maps.Marker({position: myLatlng, map: mapa, title: title, clickable: true, icon: ' + #39 + sIconeB + #39 + '})');
        Memo1.Lines.Add('   google.maps.event.addListener(marker, "click", function() {infowindow.open(mapa,marker);});');
        Memo1.Lines.Add('   mapa.setCenter(myLatlng);');
        Memo1.Lines.Add('}');
    end;

    if sIconeB <> '' then
    begin
        Memo1.Lines.Add('function addMarkC(mapa, latitude, longitude, contentString, title)');
        Memo1.Lines.Add('{');
        Memo1.Lines.Add('   var myLatlng = new google.maps.LatLng(latitude,longitude);');
        Memo1.Lines.Add('   var infowindow = new google.maps.InfoWindow({content: contentString});');
        Memo1.Lines.Add('   var marker = new google.maps.Marker({position: myLatlng, map: mapa, title: title, clickable: true, icon: ' + #39 + sIconeC + #39 + '})');
        Memo1.Lines.Add('   google.maps.event.addListener(marker, "click", function() {infowindow.open(mapa,marker);});');
        Memo1.Lines.Add('   mapa.setCenter(myLatlng);');
        Memo1.Lines.Add('}');
    end;

    Memo1.Lines.Add('function addMark(mapa, latitude, longitude, contentString, title)');
    Memo1.Lines.Add('{');
    Memo1.Lines.Add('   var myLatlng = new google.maps.LatLng(latitude,longitude);');
    Memo1.Lines.Add('   var infowindow = new google.maps.InfoWindow({content: contentString});');
    Memo1.Lines.Add('   var marker = new google.maps.Marker({position: myLatlng, map: mapa, title: title, clickable: true})');
    Memo1.Lines.Add('   google.maps.event.addListener(marker, "click", function() {infowindow.open(mapa,marker);});');
    Memo1.Lines.Add('   mapa.setCenter(myLatlng);');
    Memo1.Lines.Add('}');

    Memo1.Lines.Add('</script>');
    Memo1.Lines.Add('</head>');
    Memo1.Lines.Add('<body style="margin:0px; padding:0px;" onload="initialize()">');
    Memo1.Lines.Add('<div id="map_canvas" style="width: ' + sLargura + 'px; height: ' + sAltura + 'px"></div>');
    Memo1.Lines.Add('</body>');
    Memo1.Lines.Add('</html>');

    if FileExists(sMapa) then
       DeleteFile(sMapa);

    Memo1.Lines.SaveToFile(sMapa);
end;

procedure TfrmPrincipal.MontaInfoMapa;
var
    sPais   : string;
    sRegiao : string;
    sEstado : string;
    sMeso   : string;
    sMicro  : string;
    sCidade : string;
    sTexto  : string;
    sLat    : string;
    sLon    : string;
    vOutros: double;
    sReferencia : string;
    sDimensao   : string;
    sAux        : string;
    a           : integer;
    vTotalLocal : double;
    vPerc       : double;
begin
    // Montar as Marcas
    sReferencia  := '';

    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        sPais   := '';
        sRegiao := '';
        sEstado := '';
        sMeso   := '';
        sMicro  := '';
        sCidade := '';

        if cbxVisao.Text = 'País' then
        begin
            sPais := cdsMapa.FieldByName('PAIS').AsString;
        end;

        if cbxVisao.Text = 'Região' then
        begin
            sPais   := cdsMapa.FieldByName('PAIS').AsString;
            sRegiao := cdsMapa.FieldByName('REGIAO').AsString;
        end;

        if cbxVisao.Text = 'Estado' then
        begin
            sPais   := cdsMapa.FieldByName('PAIS').AsString;
            sRegiao := cdsMapa.FieldByName('REGIAO').AsString;
            sEstado := cdsMapa.FieldByName('ESTADO').AsString;
        end;

        if cbxVisao.Text = 'Meso Região' then
        begin
            sPais   := cdsMapa.FieldByName('PAIS').AsString;
            sRegiao := cdsMapa.FieldByName('REGIAO').AsString;
            sEstado := cdsMapa.FieldByName('ESTADO').AsString;
            sMeso   := cdsMapa.FieldByName('MESOREGIAO').AsString;
        end;

        if cbxVisao.Text = 'Micro Região' then
        begin
            sPais   := cdsMapa.FieldByName('PAIS').AsString;
            sRegiao := cdsMapa.FieldByName('REGIAO').AsString;
            sEstado := cdsMapa.FieldByName('ESTADO').AsString;
            sMeso   := cdsMapa.FieldByName('MESOREGIAO').AsString;
            sMicro  := cdsMapa.FieldByName('MICROREGIAO').AsString;
        end;

        if cbxVisao.Text = 'Cidade' then
        begin
            sPais   := cdsMapa.FieldByName('PAIS').AsString;
            sRegiao := cdsMapa.FieldByName('REGIAO').AsString;
            sEstado := cdsMapa.FieldByName('ESTADO').AsString;
            sMeso   := cdsMapa.FieldByName('MESOREGIAO').AsString;
            sMicro  := cdsMapa.FieldByName('MICROREGIAO').AsString;
            sCidade := cdsMapa.FieldByName('CIDADE').AsString;
        end;

        sPais   := RemoveAcento(sPais);
        sRegiao := RemoveAcento(sRegiao);
        sEstado := RemoveAcento(sEstado);
        sMeso   := RemoveAcento(sMeso);
        sMicro  := RemoveAcento(sMicro);
        sCidade := RemoveAcento(sCidade);

        sAux := sPais + sRegiao + sEstado + sMeso + sMicro + sCidade;

        if sAux <> sReferencia then
        begin
            vTotalLocal := 0;
            sReferencia := sAux;

            sTexto := '<table border=0 width=400 class=' + #39 + 'h1' + #39 + '>';
            sTexto := sTexto + '<tr><td colspan=2 align=center bgcolor=#BBFFFF>Localizacao</td></tr>';

            if sPais <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Pais:</td><td width=70% align=left>' + sPais + '</td></tr>';

            if sRegiao <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Regiao:</td><td width=70% align=left>' + sRegiao + '</td></tr>';

            if sEstado <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Estado:</td><td width=70% align=left>' + sEstado + '</td></tr>';

            if sMeso <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Meso Regiao:</td><td width=70% align=left>' + sMeso + '</td></tr>';

            if sMicro <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Micro Regiao:</td><td width=70% align=left>' + sMicro + '</td></tr>';

            if sCidade <> '' then
               sTexto := sTexto + '<tr><td width=30% align=right>Cidade:</td><td width=70% align=left>' + sCidade + '</td></tr>';

            sTexto := sTexto + '</table>';

            sTexto := sTexto + '<table border=0 width=400 class=' + #39 + 'h1' + #39 + '>';
            sTexto := sTexto + '<tr><td colspan=6 align=center bgcolor=#BBFFFF>Informacoes</td></tr>';
            sTexto := sTexto + '<tr>';
            sTexto := sTexto + '<td width=30% align=center>Dimensao</td>';
            sTexto := sTexto + '<td width=20% align=center>Valor</td>';
            sTexto := sTexto + '<td width=15% align=center>% Local</td>';
            sTexto := sTexto + '<td width=10% align=center>ABC</td>';
            sTexto := sTexto + '<td width=15% align=center>% Dim</td>';
            sTexto := sTexto + '<td width=10% align=center>ABC</td>';
            sTexto := sTexto + '</tr>';

            a := 0;
            vOutros := 0;
            cdsMapa1.First;
            cdsMapa1.RecNo := cdsMapa.RecNo;
            while not cdsMapa1.Eof do
            begin
                sDimensao := RemoveAcento(cdsMapa1.FieldByName('PAIS').AsString) +
                             RemoveAcento(cdsMapa1.FieldByName('REGIAO').AsString) +
                             RemoveAcento(cdsMapa1.FieldByName('ESTADO').AsString) +
                             RemoveAcento(cdsMapa1.FieldByName('MESOREGIAO').AsString) +
                             RemoveAcento(cdsMapa1.FieldByName('MICROREGIAO').AsString) +
                             RemoveAcento(cdsMapa1.FieldByName('CIDADE').AsString);

                if sDimensao = sAux then
                begin
                    vTotalLocal := vTotalLocal + cdsMapa1.FieldByName('VALOR').AsCurrency;

                    if a >= StrToInt(sRegistros) then
                    begin
                       vOutros := vOutros + cdsMapa1.FieldByName('VALOR').AsCurrency;
                    end
                    else
                    begin
                        sTexto := sTexto + '<tr>';
                        sTexto := sTexto + '<td>';
                        sTexto := sTexto + RemoveAcento(Copy(cdsMapa1.FieldByName('DIMENSAO').AsString,1,15));
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '<td align=right>';
                        sTexto := sTexto + FormatCurr('###,###,##0.00', cdsMapa1.FieldByName('VALOR').AsCurrency);
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '<td align=right>';
                        sTexto := sTexto + FormatCurr('##0.00', cdsMapa1.FieldByName('PERC_REF').AsCurrency);
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '<td align=CENTER>';
                        sTexto := sTexto + cdsMapa1.FieldByName('ABC_REF').AsString;
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '<td align=right>';
                        sTexto := sTexto + FormatCurr('##0.00', cdsMapa1.FieldByName('PERC_DIM').AsCurrency);
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '<td align=CENTER>';
                        sTexto := sTexto + cdsMapa1.FieldByName('ABC_DIM').AsString;
                        sTexto := sTexto + '</td>';

                        sTexto := sTexto + '</tr>';
                    end;

                    a := a + 1;
                end
                else
                   cdsMapa1.Last;

                cdsMapa1.Next;
            end;

            if vOutros <> 0 then
            begin
                sTexto := sTexto + '<tr>';
                sTexto := sTexto + '<td>Outros</td>';

                sTexto := sTexto + '<td align=right>';
                sTexto := sTexto + FormatCurr('###,###,##0.00', vOutros);
                sTexto := sTexto + '</td>';

                if vTotalLocal <> 0 then
                   vPerc := vOutros * 100 / vTotalLocal
                else
                   vPerc := 0;

                sTexto := sTexto + '<td align=right>';
                sTexto := sTexto + FormatCurr('##0.00', vPerc);
                sTexto := sTexto + '</td>';

                sTexto := sTexto + '</tr>';
            end;

            sTexto := sTexto + '</table>';

            sTexto := sTexto + '<table border=0 width=400 class=' + #39 + 'h1' + #39 + '>';
            sTexto := sTexto + '<tr><td colspan=3 align=center bgcolor=#BBFFFF>Totais</td></tr>';
            sTexto := sTexto + '<tr><td width=15% align=right>Total Local: </td><td width=20% align=right>' + FormatCurr('###,###,##0.00', vTotalLocal) + '</td><td width=10% align=right>' + FormatCurr('##0.00', cdsMapa.FieldByName('PERC').AsCurrency) + ' % </td></tr>';
            sTexto := sTexto + '<tr><td width=15% align=right>Total Geral: </td><td width=20% align=right>' + FormatCurr('###,###,##0.00', vTotalGeral) + '</td><td width=10% align=center>' + cdsMapa.FieldByName('ABC_PERC').AsString + '</td></tr>';
            sTexto := sTexto + '</table>';

            sTitulo := entry(1,retornaEndereco(sPais,sRegiao,sEstado,sMeso,sMicro,sCidade),'|');
            sTitulo := RemoveAcento(sTitulo);
            sLat    := entry(2,retornaEndereco(sPais,sRegiao,sEstado,sMeso,sMicro,sCidade),'|');
            sLon    := entry(3,retornaEndereco(sPais,sRegiao,sEstado,sMeso,sMicro,sCidade),'|');

            MontaMarks(sTexto,sLat,sLon,sTitulo,cdsMapa.FieldByName('ABC_PERC').AsString);
        end;

        cdsMapa.Next;
    end;
end;

procedure TfrmPrincipal.CriaDataSetMapa;
var
    sSumario : string;
    sDimensao : string;
    sSelect   : string;
    sGroup    : string;
    sAux      : string;
    sAux_1    : string;
    dAux      : double;
    dCurvaA, dCurvaB : double;
    Res : integer;
    i : integer;
    sAtual, sAnterior: string;
begin
    frmAguarde.cxProgressBar1.Position := 1;
    frmAguarde.Update;

    cdsMapa.Close;
    cdsMapa.CreateDataSet;

    cdsMapa1.Close;
    cdsMapa1.CreateDataSet;

    cdsMapaTotalRef.Close;
    cdsMapaTotalRef.CreateDataSet;

    cdsMapaTotalDim.Close;
    cdsMapaTotalDim.CreateDataSet;

    sSumario  := sTabela + '.' + cbxSumario.Text;
    sDimensao := sTabela + '.' + cbxDimensao.Text;

    qryMapa.Close;
    qryMapa.SQL.Clear;

    if cbxVisao.Text = 'País' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS';
    end
    else
    if cbxVisao.Text = 'Região' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO';
    end
    else
    if cbxVisao.Text = 'Estado' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO';
    end
    else
    if cbxVisao.Text = 'Meso Região' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO';
    end
    else
    if cbxVisao.Text = 'Micro Região' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO, GEO_REFERENCIA.MICROREGIAO';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO, GEO_REFERENCIA.MICROREGIAO';
    end
    else
    if cbxVisao.Text = 'Cidade' then
    begin
        sSelect := 'SELECT GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO, GEO_REFERENCIA.MICROREGIAO, GEO_REFERENCIA.CIDADE';
        sGroup  := 'GROUP BY GEO_REFERENCIA.PAIS, GEO_REFERENCIA.REGIAO, GEO_REFERENCIA.ESTADO, GEO_REFERENCIA.MESOREGIAO, GEO_REFERENCIA.MICROREGIAO, GEO_REFERENCIA.CIDADE';
    end;

    qryMapa.SQL.Add(sSelect);
    qryMapa.SQL.Add(', ' + sDimensao);

    if cbxFuncao.Text = 'Somar' then
       qryMapa.SQL.Add(', Sum(' + sSumario + ') AS SumOf' + cbxSumario.Text)
    else
    if cbxFuncao.Text = 'Contar' then
       qryMapa.SQL.Add(', Count(' + sSumario + ') AS CountOf' + cbxSumario.Text)
    else
    if cbxFuncao.Text = 'Média' then
       qryMapa.SQL.Add(', Avg(' + sSumario + ') AS AvgOf' + cbxSumario.Text)
    else
    if cbxFuncao.Text = 'Mínimo' then
       qryMapa.SQL.Add(', Min(' + sSumario + ') AS MinOf' + cbxSumario.Text)
    else
    if cbxFuncao.Text = 'Máximo' then
       qryMapa.SQL.Add(', Max(' + sSumario + ') AS MaxOf' + cbxSumario.Text);

    //qryMapa.SQL.Add('FROM ' + sTabela + ' INNER JOIN GEO_REFERENCIA ON ' + sTabela + '.' + sRef + ' = GEO_REFERENCIA.ID_REFERENCIA');

    qryMapa.SQL.Add('FROM GEO_REFERENCIA, ' + sTabela);
    qryMapa.SQL.Add('WHERE ' + sTabela + '.' + sRef + ' = GEO_REFERENCIA.ID_REFERENCIA');
    qryMapa.SQL.Add(retornaFiltro());

    qryMapa.SQL.Add(sGroup);
    qryMapa.SQL.Add(', ' + sDimensao);

    frmAguarde.cxProgressBar1.Position := 2;
    frmAguarde.Update;

    // Cria dataset com as informações para o mapa
    qryMapa.Open;
    qryMapa.First;
    while not qryMapa.Eof do
    begin
        cdsMapa.Insert;

        if cbxVisao.Text = 'País' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
        end
        else
        if cbxVisao.Text = 'Região' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
            cdsMapa.Fields[1].Value := qryMapa.FieldByName('REGIAO').Value;
        end
        else
        if cbxVisao.Text = 'Estado' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
            cdsMapa.Fields[1].Value := qryMapa.FieldByName('REGIAO').Value;
            cdsMapa.Fields[2].Value := qryMapa.FieldByName('ESTADO').Value;
        end
        else
        if cbxVisao.Text = 'Meso Região' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
            cdsMapa.Fields[1].Value := qryMapa.FieldByName('REGIAO').Value;
            cdsMapa.Fields[2].Value := qryMapa.FieldByName('ESTADO').Value;
            cdsMapa.Fields[3].Value := qryMapa.FieldByName('MESOREGIAO').Value;
        end
        else
        if cbxVisao.Text = 'Micro Região' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
            cdsMapa.Fields[1].Value := qryMapa.FieldByName('REGIAO').Value;
            cdsMapa.Fields[2].Value := qryMapa.FieldByName('ESTADO').Value;
            cdsMapa.Fields[3].Value := qryMapa.FieldByName('MESOREGIAO').Value;
            cdsMapa.Fields[4].Value := qryMapa.FieldByName('MICROREGIAO').Value;
        end
        else
        if cbxVisao.Text = 'Cidade' then
        begin
            cdsMapa.Fields[0].Value := qryMapa.FieldByName('PAIS').Value;
            cdsMapa.Fields[1].Value := qryMapa.FieldByName('REGIAO').Value;
            cdsMapa.Fields[2].Value := qryMapa.FieldByName('ESTADO').Value;
            cdsMapa.Fields[3].Value := qryMapa.FieldByName('MESOREGIAO').Value;
            cdsMapa.Fields[4].Value := qryMapa.FieldByName('MICROREGIAO').Value;
            cdsMapa.Fields[5].Value := qryMapa.FieldByName('CIDADE').Value;
        end;

        cdsMapa.Fields[6].Value := qryMapa.FieldByName(cbxDimensao.Text).Value;

        if cbxFuncao.Text = 'Somar' then
           cdsMapa.Fields[7].Value := RoundTo(qryMapa.FieldByName('SumOf' + cbxSumario.Text).Value, -2)
        else
        if cbxFuncao.Text = 'Contar' then
           cdsMapa.Fields[7].Value := RoundTo(qryMapa.FieldByName('CountOf' + cbxSumario.Text).Value, -2)
        else
        if cbxFuncao.Text = 'Média' then
           cdsMapa.Fields[7].Value := RoundTo(qryMapa.FieldByName('AvgOf' + cbxSumario.Text).Value, -2)
        else
        if cbxFuncao.Text = 'Mínimo' then
           cdsMapa.Fields[7].Value := RoundTo(qryMapa.FieldByName('MinOf' + cbxSumario.Text).Value, -2)
        else
        if cbxFuncao.Text = 'Máximo' then
           cdsMapa.Fields[7].Value := RoundTo(qryMapa.FieldByName('MaxOf' + cbxSumario.Text).Value, -2);

        cdsMapa.Post;

        qryMapa.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 3;
    frmAguarde.Update;

    // Montar Total por Referencia
    cdsMapa.Close;
    cdsMapa.IndexName := 'cdsMapaIndex1';
    cdsMapa.Open;
    sAux := '';
    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        sAux_1 := cdsMapa.Fields[0].AsString + cdsMapa.Fields[1].AsString + cdsMapa.Fields[2].AsString + cdsMapa.Fields[3].AsString + cdsMapa.Fields[4].AsString + cdsMapa.Fields[5].AsString;

        if sAux <> sAux_1 then
        begin
           if cdsMapaTotalRef.State = dsInsert then
              cdsMapaTotalRef.Post;

           cdsMapaTotalRef.Insert;

           cdsMapaTotalRef.Fields[0].Value := cdsMapa.Fields[0].Value;
           cdsMapaTotalRef.Fields[1].Value := cdsMapa.Fields[1].Value;
           cdsMapaTotalRef.Fields[2].Value := cdsMapa.Fields[2].Value;
           cdsMapaTotalRef.Fields[3].Value := cdsMapa.Fields[3].Value;
           cdsMapaTotalRef.Fields[4].Value := cdsMapa.Fields[4].Value;
           cdsMapaTotalRef.Fields[5].Value := cdsMapa.Fields[5].Value;
           cdsMapaTotalRef.Fields[6].Value := RoundTo(cdsMapa.Fields[7].Value, -2);

           sAux := cdsMapa.Fields[0].AsString + cdsMapa.Fields[1].AsString + cdsMapa.Fields[2].AsString + cdsMapa.Fields[3].AsString + cdsMapa.Fields[4].AsString + cdsMapa.Fields[5].AsString;
        end
        else
        begin
           cdsMapaTotalRef.Fields[6].Value := RoundTo(cdsMapaTotalRef.Fields[6].Value + cdsMapa.Fields[7].Value,-2);
        end;

        cdsMapa.Next;
    end;
    if cdsMapaTotalRef.State = dsInsert then
       cdsMapaTotalRef.Post;

    frmAguarde.cxProgressBar1.Position := 4;
    frmAguarde.Update;

    // Montar Total por Dimensao
    cdsMapa.Close;
    cdsMapa.IndexName := 'cdsMapaIndex2';
    cdsMapa.Open;
    sAux := '';
    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        if cdsMapa.Fields[6].AsString = '' then
           sAux_1 := '...'
        else
           sAux_1 := cdsMapa.Fields[6].AsString;

        if sAux <> sAux_1 then
        begin
           if cdsMapaTotalDim.State = dsInsert then
              cdsMapaTotalDim.Post;

           cdsMapaTotalDim.Insert;

           cdsMapaTotalDim.Fields[0].Value := cdsMapa.Fields[6].Value;
           cdsMapaTotalDIm.Fields[1].Value := RoundTo(cdsMapa.Fields[7].Value, -2);

           if cdsMapa.Fields[6].AsString = '' then
              sAux := '...'
           else
              sAux := cdsMapa.Fields[6].AsString;
        end
        else
        begin
           cdsMapaTotalDim.Fields[1].Value := RoundTo(cdsMapaTotalDim.Fields[1].Value + cdsMapa.Fields[7].Value,-2);
        end;

        cdsMapa.Next;
    end;
    if cdsMapaTotalDim.State = dsInsert then
       cdsMapaTotalDim.Post;

    frmAguarde.cxProgressBar1.Position := 5;
    frmAguarde.Update;

    // calcula percentual da referencia
    dCurvaA := 0;
    dCurvaB := 0;

    cdsMapa.Close;
    cdsMapa.IndexName := 'cdsMapaIndex1';
    cdsMapa.Open;

    cdsMapaTotalRef.Close;
    cdsMapaTotalRef.IndexName := 'cdsMapaTotalRefIndex2';
    cdsMapaTotalRef.Open;

    frmAguarde.cxProgressBar1.Position := 6;
    frmAguarde.Update;

    dAux      := 0;
    sAnterior := '';
    sAtual    := '';
    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        if cdsMapaTotalRef.Locate('PAIS;REGIAO;ESTADO;MESOREGIAO;MICROREGIAO;CIDADE',
               VarArrayOf([
               cdsMapa.FieldByName('PAIS').Value,
               cdsMapa.FieldByName('REGIAO').Value,
               cdsMapa.FieldByName('ESTADO').Value,
               cdsMapa.FieldByName('MESOREGIAO').Value,
               cdsMapa.FieldByName('MICROREGIAO').Value,
               cdsMapa.FieldByName('CIDADE').Value
               ]),[loCaseInsensitive]) then
        begin
            if sAnterior = '' then
               sAnterior := AssinalaString(cdsMapaTotalRef.FieldByName('PAIS').Value)        +
                            AssinalaString(cdsMapaTotalRef.FieldByName('REGIAO').Value)      +
                            AssinalaString(cdsMapaTotalRef.FieldByName('ESTADO').Value)      +
                            AssinalaString(cdsMapaTotalRef.FieldByName('MESOREGIAO').Value)  +
                            AssinalaString(cdsMapaTotalRef.FieldByName('MICROREGIAO').Value) +
                            AssinalaString(cdsMapaTotalRef.FieldByName('CIDADE').Value);

            sAtual := AssinalaString(cdsMapaTotalRef.FieldByName('PAIS').Value)        +
                      AssinalaString(cdsMapaTotalRef.FieldByName('REGIAO').Value)      +
                      AssinalaString(cdsMapaTotalRef.FieldByName('ESTADO').Value)      +
                      AssinalaString(cdsMapaTotalRef.FieldByName('MESOREGIAO').Value)  +
                      AssinalaString(cdsMapaTotalRef.FieldByName('MICROREGIAO').Value) +
                      AssinalaString(cdsMapaTotalRef.FieldByName('CIDADE').Value);

            if sAtual <> sAnterior then
            begin
               dAux      := 0;
               dCurvaA   := 0;
               dCurvaB   := 0;
               sAnterior := sAtual;
            end;

            cdsMapa.Edit;

            if cdsMapaTotalRef.FieldByName('VALOR').AsFloat <> 0 then
               cdsMapa.FieldByName('PERC_REF').Value := RoundTo(cdsMapa.FieldByName('VALOR').AsFloat * 100 / cdsMapaTotalRef.FieldByName('VALOR').AsFloat, -2)
            else
               cdsMapa.FieldByName('PERC_REF').Value := 0;

            dAux := dAux + cdsMapa.FieldByName('PERC_REF').Value;
            cdsMapa.FieldByName('ACUM_PERC_REF').Value := RoundTo(dAux, -2);

            if dCurvaA > 70 then
            begin
                if dCurvaB > 90 then
                begin
                    Res := 3;
                end
                else
                begin
                    Res := 2;
                    dCurvaB := dAux;
                end;
            end
            else
            begin
                Res := 1;
                dCurvaA := dAux;
            end;

            if Res = 1 then
               cdsMapa.FieldByName('ABC_REF').Value := 'A'
            else
            if Res = 2 then
               cdsMapa.FieldByName('ABC_REF').Value := 'B'
            else
               cdsMapa.FieldByName('ABC_REF').Value := 'C';

            cdsMapa.Post;
        end;

        {if dAux > 100 then
        begin
           dAux    := 0;
           dCurvaA := 0;
           dCurvaB := 0;
        end; }

        cdsMapa.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 7;
    frmAguarde.Update;

    // calcula percentual da dimensao
    dCurvaA := 0;
    dCurvaB := 0;

    cdsMapa.Close;
    cdsMapa.IndexName := 'cdsMapaIndex2';
    cdsMapa.Open;

    cdsMapaTotalDim.Close;
    cdsMapaTotalDim.IndexName := 'cdsMapaTotalDimIndex1';
    cdsMapaTotalDim.Open;

    frmAguarde.cxProgressBar1.Position := 8;
    frmAguarde.Update;

    dAux      := 0;
    sAnterior := '';
    sAtual    := '';
    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        if cdsMapaTotalDim.Locate('DIMENSAO',VarArrayOf([cdsMapa.FieldByName('DIMENSAO').Value]),[loCaseInsensitive]) then
        begin
            if sAnterior = '' then
               sAnterior := AssinalaString(cdsMapaTotalDim.FieldByName('DIMENSAO').Value);

            sAtual := AssinalaString(cdsMapaTotalDim.FieldByName('DIMENSAO').Value);;

            if sAtual <> sAnterior then
            begin
               dAux      := 0;
               dCurvaA   := 0;
               dCurvaB   := 0;
               sAnterior := sAtual;
            end;

            cdsMapa.Edit;

            if cdsMapaTotalDim.FieldByName('VALOR').AsFloat <> 0 then
               cdsMapa.FieldByName('PERC_DIM').Value := RoundTo(cdsMapa.FieldByName('VALOR').AsFloat * 100 / cdsMapaTotalDim.FieldByName('VALOR').AsFloat, -2)
            else
               cdsMapa.FieldByName('PERC_DIM').Value := 0;

            dAux := dAux + cdsMapa.FieldByName('PERC_DIM').Value;
            cdsMapa.FieldByName('ACUM_PERC_DIM').Value := RoundTo(dAux, -2);

            if dCurvaA > 70 then
            begin
                if dCurvaB > 90 then
                begin
                    Res := 3;
                end
                else
                begin
                    Res := 2;
                    dCurvaB := dAux;
                end;
            end
            else
            begin
                Res := 1;
                dCurvaA := dAux;
            end;

            if Res = 1 then
               cdsMapa.FieldByName('ABC_DIM').Value := 'A'
            else
            if Res = 2 then
               cdsMapa.FieldByName('ABC_DIM').Value := 'B'
            else
               cdsMapa.FieldByName('ABC_DIM').Value := 'C';

            cdsMapa.Post;
        end;

        {if dAux > 100 then
        begin
           dAux    := 0;
           dCurvaA := 0;
           dCurvaB := 0;
        end; }

        cdsMapa.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 9;
    frmAguarde.Update;

    // calcula percentual da total
    cdsMapaTotalRef.Close;
    cdsMapaTotalRef.IndexName := 'cdsMapaTotalRefIndex1';
    cdsMapaTotalRef.Open;

    vTotalGeral := 0;
    cdsMapaTotalRef.First;
    while not cdsMapaTotalRef.Eof do
    begin
        vTotalGeral := vTotalGeral + cdsMapaTotalRef.FieldByName('VALOR').Value;
        cdsMapaTotalRef.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 10;
    frmAguarde.Update;

    dCurvaA := 0;
    dCurvaB := 0;
    dAux    := 0;

    cdsMapaTotalRef.First;
    while not cdsMapaTotalRef.Eof do
    begin
        cdsMapaTotalRef.Edit;

        if vTotalGeral <> 0 then
           cdsMapaTotalRef.FieldByName('PERC').Value := RoundTo(cdsMapaTotalRef.FieldByName('VALOR').AsFloat * 100 / vTotalGeral, -2)
        else
           cdsMapaTotalRef.FieldByName('PERC').Value := 0;

        dAux := dAux + cdsMapaTotalRef.FieldByName('PERC').Value;
        cdsMapaTotalRef.FieldByName('ACUM_PERC').Value := RoundTo(dAux, -2);

        if dCurvaA > 70 then
        begin
            if dCurvaB > 90 then
            begin
                Res := 3;
            end
            else
            begin
                Res := 2;
                dCurvaB := dAux;
            end;
        end
        else
        begin
            Res := 1;
            dCurvaA := dAux;
        end;

        if Res = 1 then
           cdsMapaTotalRef.FieldByName('ABC_PERC').Value := 'A'
        else
        if Res = 2 then
           cdsMapaTotalRef.FieldByName('ABC_PERC').Value := 'B'
        else
           cdsMapaTotalRef.FieldByName('ABC_PERC').Value := 'C';

        cdsMapaTotalRef.Post;
        cdsMapaTotalRef.Next;
    end;

    cdsMapaTotalRef.Close;
    cdsMapaTotalRef.IndexName := 'cdsMapaTotalRefIndex2';
    cdsMapaTotalRef.Open;

    frmAguarde.cxProgressBar1.Position := 11;
    frmAguarde.Update;

    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        if cdsMapaTotalRef.Locate('PAIS;REGIAO;ESTADO;MESOREGIAO;MICROREGIAO;CIDADE',
               VarArrayOf([
               cdsMapa.FieldByName('PAIS').Value,
               cdsMapa.FieldByName('REGIAO').Value,
               cdsMapa.FieldByName('ESTADO').Value,
               cdsMapa.FieldByName('MESOREGIAO').Value,
               cdsMapa.FieldByName('MICROREGIAO').Value,
               cdsMapa.FieldByName('CIDADE').Value
               ]),[loCaseInsensitive]) then
        begin
            cdsMapa.Edit;
            cdsMapa.FieldByName('PERC').Value      := cdsMapaTotalRef.FieldByName('PERC').Value;
            cdsMapa.FieldByName('ACUM_PERC').Value := cdsMapaTotalRef.FieldByName('ACUM_PERC').Value;
            cdsMapa.FieldByName('ABC_PERC').Value  := cdsMapaTotalRef.FieldByName('ABC_PERC').Value;
            cdsMapa.Post;
        end;

        cdsMapa.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 12;
    frmAguarde.Update;

    cdsMapaTotalRef.Close;
    cdsMapaTotalDim.Close;

    cdsMapa.Close;
    cdsMapa.IndexName := 'cdsMapaIndex1';
    cdsMapa.Open;

    cdsMapa1.Close;
    cdsMapa1.IndexName := 'cdsMapaIndex1';
    cdsMapa1.Open;

    // Copia Informacoes do Mapa para o Mapa 1
    cdsMapa.First;
    while not cdsMapa.Eof do
    begin
        cdsMapa1.Insert;

        for i := 0 to cdsMapa.Fields.Count - 1 do
            cdsMapa1.Fields[i].Value := cdsMapa.Fields[i].Value;

        cdsMapa1.Post;

        cdsMapa.Next;
    end;

    frmAguarde.cxProgressBar1.Position := 13;
    frmAguarde.Update;
end;

procedure TfrmPrincipal.CriarArquivo;
begin
    if frmArqGeoAnalises <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_408'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmArqGeoAnalises := TfrmArqGeoAnalises.Create(Self);
    frmArqGeoAnalises.ShowModal;

    lPrimeiroAcesso := False;

    if frmArqGeoAnalises.lOK then
       AbrirArquivo
    else
       Application.Terminate;

    FreeAndNil(frmArqGeoAnalises);
end;

procedure TfrmPrincipal.mnuEditarLocalizacaoClick(Sender: TObject);
begin
    if frmEditarInfoLocalizacao <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_409'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmEditarInfoLocalizacao := TfrmEditarInfoLocalizacao.Create(Self);
    frmEditarInfoLocalizacao.ShowModal;
    FreeAndNil(frmEditarInfoLocalizacao);
end;

procedure TfrmPrincipal.mnuFatosClick(Sender: TObject);
begin
    if frmEditarInfoFatos <> nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_410'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmEditarInfoFatos := TfrmEditarInfoFatos.Create(Self);
    frmEditarInfoFatos.ShowModal;
    FreeAndNil(frmEditarInfoFatos);
end;

procedure TfrmPrincipal.MontaDimensao;
var
    Query : TADOQuery;
begin
    cbbValorDimensao.Properties.Items.Clear;

    cbbValorDimensao.Enabled := True;

    if cbxDimensao.Text = '' then
    begin
        cbbValorDimensao.Enabled := False;
        Exit;
    end;

    aguarde(0,HCLResourceStrings.FindID('sString_403'));

    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;

    Query.Close;
    Query.SQL.Add('SELECT');
    Query.SQL.Add(cbxDimensao.Text);
    Query.SQL.Add('FROM');
    Query.SQL.Add(sTabela);
    Query.SQL.Add('GROUP BY');
    Query.SQL.Add(cbxDimensao.Text);
    Query.SQL.Add('ORDER BY');
    Query.SQL.Add(cbxDimensao.Text);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        if cbbValorDimensao.Properties.Items.Count <= iItens then
        begin
           if Query.Fields[0].AsString <> '' then
           begin
               with cbbValorDimensao.Properties.Items.Add do
               begin
                   DisplayName := Query.Fields[0].AsString;
                   Description := Query.Fields[0].AsString;
               end;
           end;
        end;

        Query.Next;
    end;

    Query.Close;
    Query.Free;

    aguarde(1,'');
end;

procedure TfrmPrincipal.MontaLocais(Local: string);
var
    Query  : TADOQuery;
    sWhere : string;
    Nivel  : integer;
    sAux : string;
    i : integer;
begin
    Nivel := 0;

    if Local = 'PAIS' then
    begin
        cbbPais.Properties.Items.Clear;
        Nivel := 0;
    end;

    if Local = 'REGIAO' then
    begin
        cbbRegiao.Properties.Items.Clear;
        Nivel := 1;
    end;

    if Local = 'ESTADO' then
    begin
        cbbEstado.Properties.Items.Clear;
        Nivel := 2;
    end;

    if Local = 'MESOREGIAO' then
    begin
        cbbMesoRegiao.Properties.Items.Clear;
        Nivel := 3;
    end;

    if Local = 'MICROREGIAO' then
    begin
        cbbMicroRegiao.Properties.Items.Clear;
        Nivel := 4;
    end;

    if Local = 'CIDADE' then
    begin
        cbbCidade.Properties.Items.Clear;
        Nivel := 5;
    end;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := bdDados;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT ' + Local + ' FROM GEO_REFERENCIA');

    if (Nivel >= 1) and (cbbPais.Text <> '') then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbPais.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbPais.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbPais.Text,';') + #39;
        end;

        if sWhere <> '' then
           sWhere := sWhere + ' AND PAIS IN (' + sAux + ')'
        else
           sWhere := sWhere + 'PAIS IN (' + sAux + ')';
    end;

    if (Nivel >= 2) and (cbbRegiao.Text <> '') then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbRegiao.Text,';') + #39;
        end;

        if sWhere <> '' then
           sWhere := sWhere + ' AND REGIAO IN (' + sAux + ')'
        else
           sWhere := sWhere + 'REGIAO IN (' + sAux + ')';
    end;

    if (Nivel >= 3) and (cbbEstado.Text <> '') then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbEstado.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbEstado.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbEstado.Text,';') + #39;
        end;

        if sWhere <> '' then
           sWhere := sWhere + ' AND ESTADO IN (' + sAux + ')'
        else
           sWhere := sWhere + 'ESTADO IN (' + sAux + ')';
    end;

    if (Nivel >= 4) and (cbbMesoRegiao.Text <> '') then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbMesoRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbMesoRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbMesoRegiao.Text,';') + #39;
        end;

        if sWhere <> '' then
           sWhere := sWhere + ' AND MESOREGIAO IN (' + sAux + ')'
        else
           sWhere := sWhere + 'MESOREGIAO IN (' + sAux + ')';
    end;

    if (Nivel >= 5) and (cbbMicroRegiao.Text <> '') then
    begin
        sAux := '';
        for i := 1 to NumEntries(frmPrincipal.cbbMicroRegiao.Text,';') do
        begin
            if sAux <> '' then
               sAux := sAux + ',' + #39 + Entry(i,frmPrincipal.cbbMicroRegiao.Text,';') + #39
            else
               sAux := #39 + Entry(i,frmPrincipal.cbbMicroRegiao.Text,';') + #39;
        end;

       if sWhere <> '' then
          sWhere := sWhere + ' AND MICROREGIAO IN (' + sAux + ')'
       else
          sWhere := sWhere + 'MICROREGIAO IN (' + sAux + ')';
    end;

    if sWhere <> '' then
       Query.SQL.Add('WHERE ' + sWhere);

    Query.SQL.Add('GROUP BY ' + Local);
    Query.SQL.Add('ORDER BY ' + Local);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        if Local = 'PAIS' then
        begin
           if cbbPais.Properties.Items.Count <= iItens then
           begin
               with cbbPais.Properties.Items.Add do
               begin
                   DisplayName := Query.FieldByName(Local).AsString;
                   Description := Query.FieldByName(Local).AsString;
               end;
           end;
        end;

        if Local = 'REGIAO' then
        begin
           if cbbRegiao.Properties.Items.Count <= iItens then
           begin
               with cbbRegiao.Properties.Items.Add do
               begin
                   DisplayName := Query.FieldByName(Local).AsString;
                   Description := Query.FieldByName(Local).AsString;
               end;
           end;
        end;

        if Local = 'ESTADO' then
        begin
           if cbbEstado.Properties.Items.Count <= iItens then
           begin
               with cbbEstado.Properties.Items.Add do
               begin
                   DisplayName := Query.FieldByName(Local).AsString;
                   Description := Query.FieldByName(Local).AsString;
               end;
           end;
        end;

        if Local = 'MESOREGIAO' then
        begin
           if cbbMesoRegiao.Properties.Items.Count <= iItens then
           begin
               with cbbMesoRegiao.Properties.Items.Add do
               begin
                   DisplayName := Query.FieldByName(Local).AsString;
                   Description := Query.FieldByName(Local).AsString;
               end;
           end;
        end;

        if Local = 'MICROREGIAO' then
        begin
            if cbbMicroRegiao.Properties.Items.Count <= iItens then
            begin
                with cbbMicroRegiao.Properties.Items.Add do
                begin
                    DisplayName := Query.FieldByName(Local).AsString;
                    Description := Query.FieldByName(Local).AsString;
                end;
            end;
        end;

        if Local = 'CIDADE' then
        begin
            if cbbCidade.Properties.Items.Count <= iItens then
            begin
                with cbbCidade.Properties.Items.Add do
                begin
                    DisplayName := Query.FieldByName(Local).AsString;
                    Description := Query.FieldByName(Local).AsString;
                end;
            end;
        end;

        Query.Next;
    end;

    Query.Close;
    Query.Free;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

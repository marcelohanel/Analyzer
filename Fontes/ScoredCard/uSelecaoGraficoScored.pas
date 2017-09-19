unit uSelecaoGraficoScored;

interface

uses
  xhConsts, cxGridExportLink, Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, DB, ADODB,
  cxStyles,
  cxDBData,
  cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxDropDownEdit, cxLabel,


  cxGridPopupMenu, dxPSCore,
  cxRadioGroup,






  cxFilter, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxData, cxDataStorage,
  cxEdit, cxContainer, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, cxGridCustomPopupMenu,
  dxPScxCommon, StdCtrls, cxGroupBox, cxTextEdit, cxMaskEdit, cxClasses,
  cxGridCustomView, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxPScxTLLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrmSelecaoGraficoScored = class(TForm)
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel5: TPanel;
    Label1: TcxLabel;
    ComboBox1: TcxComboBox;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    cxGridPopupMenu1: TcxGridPopupMenu;
    SaveDialog1: TSaveDialog;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1_Atualizacao_: TcxGridDBColumn;
    cxGrid1DBTableView1_Data_: TcxGridDBColumn;
    cxGrid1DBTableView1_Valor_: TcxGridDBColumn;
    cxGrid1DBTableView1_EvolucaoAnterior_: TcxGridDBColumn;
    cxGrid1DBTableView1_EvolucaoOriginal_: TcxGridDBColumn;
    cxGrid1DBTableView1_ValorMinimo_: TcxGridDBColumn;
    cxGrid1DBTableView1_ValorMaximo_: TcxGridDBColumn;
    cxGrid1DBTableView1_PercMinimo_: TcxGridDBColumn;
    cxGrid1DBTableView1_PercMaximo_: TcxGridDBColumn;
    cxGrid1DBTableView1_ValorFaltaMinimo_: TcxGridDBColumn;
    cxGrid1DBTableView1_ValorFaltaMaximo_: TcxGridDBColumn;
    cxGrid1DBTableView1_PercFaltaMinimo_: TcxGridDBColumn;
    cxGrid1DBTableView1_PercFaltaMaximo_: TcxGridDBColumn;
    cxGrid1DBTableView1_Situacao_: TcxGridDBColumn;
    cxRadioGroup1: TcxRadioGroup;
    SpeedButton9: TcxButton;
    cxButton2: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton4: TcxButton;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure MontaGrafico (Filtro: string);
    procedure MontaTela;
  private
    { Private declarations }
  public
    { Public declarations }
    cScoredCard : string;
  end;

var
  frmSelecaoGraficoScored: TfrmSelecaoGraficoScored;

implementation

uses uFuncoes, uMostraScored;

{$R *.dfm}

procedure TfrmSelecaoGraficoScored.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    ADOQuery1.Close;
    Action := caFree;
end;

procedure TfrmSelecaoGraficoScored.MontaGrafico (Filtro: string);
var
    b      : integer;
    aux    : string;
    aux1   : string;
    mes    : string;
    mesAnt : string;
    lPode  : boolean;
    dDataIni : TDate;
    dDataFim : TDate;
begin
    frmMostraScored.Chart1.Series[0].Clear;
    frmMostraScored.Chart1.Series[1].Clear;
    frmMostraScored.Chart1.Series[2].Clear;
    frmMostraScored.Chart1.Series[3].Clear;
    frmMostraScored.Chart1.Series[4].Clear;
    frmMostraScored.Chart1.Series[5].Clear;
    frmMostraScored.Chart1.Series[6].Clear;
    frmMostraScored.Chart1.Series[7].Clear;
    frmMostraScored.Chart1.Series[8].Clear;
    frmMostraScored.Chart1.Series[9].Clear;
    frmMostraScored.Chart1.Series[10].Clear;

    for b := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
    begin
        lPode := False;

        if cxRadioGroup1.ItemIndex = 0 then  // Dia
        begin
            lPode := True;
            aux   := VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]);
        end;

        if cxRadioGroup1.ItemIndex = 1 then  // Mês
        begin
            mes := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2) + '/' +
                   Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);

            if mes <> mesAnt then
            begin
                lPode := True;
                aux   := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2) + '/' +
                         Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
            end;

            mesAnt := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2) + '/' +
                      Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
        end;

        if cxRadioGroup1.ItemIndex = 2 then  // Trimestre
        begin
            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 1) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 3) then
                aux1 := '01/';

            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 4) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 6) then
               aux1 := '02/';

            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 7) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 9) then
                aux1 := '03/';

            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 10) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 12) then
                aux1 := '04/';

            mes := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);

            if mes <> mesAnt then
            begin
                lPode := True;
                aux   := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
            end;

            mesAnt := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
        end;

        if cxRadioGroup1.ItemIndex = 3 then  // Semestre
        begin
            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 1) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 6) then
                aux1 := '01/';

            if (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) >= 7) and
               (StrToInt(Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),4,2)) <= 12) then
               aux1 := '02/';

            mes := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);

            if mes <> mesAnt then
            begin
                lPode := True;
                aux   := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
            end;

            mesAnt := aux1 + Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
        end;

        if cxRadioGroup1.ItemIndex = 4 then  // Ano
        begin
            mes := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);

            if mes <> mesAnt then
            begin
                lPode := True;
                aux   := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
            end;

            mesAnt := Copy(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1]),7,4);
        end;

        if lPode then
        begin
            if Filtro = 'Últimos 7 dias' then
            begin
                dDataIni := Now - 7;
                dDataFim := Now;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if Filtro = 'Últimos 15 dias' then
            begin
                dDataIni := Now - 15;
                dDataFim := Now;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if Filtro = 'Últimos 30 dias' then
            begin
                dDataIni := Now - 30;
                dDataFim := Now;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if Filtro = 'Últimos 60 dias' then
            begin
                dDataIni := Now - 60;
                dDataFim := Now;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if Filtro = 'Últimos 90 dias' then
            begin
                dDataIni := Now - 90;
                dDataFim := Now;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if Filtro = 'Personalizado' then
            begin
                dDataIni := frmMostraScored.edtDataIni.Date;
                dDataFim := frmMostraScored.edtDataFim.Date;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) < dDataIni) then
                    lPode := False;

                if (StrToDate(VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[1])) > dDataFim) then
                    lPode := False;
            end;
        end;

        if lPode then
        begin
            if VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[13]) = 'G' then
            begin
                frmMostraScored.Chart1.Series[ 0].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 2], aux, clGreen);
                frmMostraScored.Chart1.Series[ 1].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 3], aux, clGreen);
                frmMostraScored.Chart1.Series[ 2].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 4], aux, clGreen);
                frmMostraScored.Chart1.Series[ 3].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 5], aux, clGreen);
                frmMostraScored.Chart1.Series[ 4].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 6], aux, clGreen);
                frmMostraScored.Chart1.Series[ 5].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 7], aux, clGreen);
                frmMostraScored.Chart1.Series[ 6].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 8], aux, clGreen);
                frmMostraScored.Chart1.Series[ 7].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 9], aux, clGreen);
                frmMostraScored.Chart1.Series[ 8].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[10], aux, clGreen);
                frmMostraScored.Chart1.Series[ 9].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[11], aux, clGreen);
                frmMostraScored.Chart1.Series[10].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[12], aux, clGreen);
            end
            else
            if VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[13]) = 'W' then
            begin
                frmMostraScored.Chart1.Series[ 0].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 2], aux, clYellow);
                frmMostraScored.Chart1.Series[ 1].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 3], aux, clYellow);
                frmMostraScored.Chart1.Series[ 2].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 4], aux, clYellow);
                frmMostraScored.Chart1.Series[ 3].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 5], aux, clYellow);
                frmMostraScored.Chart1.Series[ 4].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 6], aux, clYellow);
                frmMostraScored.Chart1.Series[ 5].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 7], aux, clYellow);
                frmMostraScored.Chart1.Series[ 6].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 8], aux, clYellow);
                frmMostraScored.Chart1.Series[ 7].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 9], aux, clYellow);
                frmMostraScored.Chart1.Series[ 8].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[10], aux, clYellow);
                frmMostraScored.Chart1.Series[ 9].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[11], aux, clYellow);
                frmMostraScored.Chart1.Series[10].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[12], aux, clYellow);
            end
            else
            if VarToStr(cxGrid1DBTableView1.ViewData.Records[b].Values[13]) = 'R' then
            begin
                frmMostraScored.Chart1.Series[ 0].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 2], aux, clRed);
                frmMostraScored.Chart1.Series[ 1].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 3], aux, clRed);
                frmMostraScored.Chart1.Series[ 2].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 4], aux, clRed);
                frmMostraScored.Chart1.Series[ 3].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 5], aux, clRed);
                frmMostraScored.Chart1.Series[ 4].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 6], aux, clRed);
                frmMostraScored.Chart1.Series[ 5].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 7], aux, clRed);
                frmMostraScored.Chart1.Series[ 6].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 8], aux, clRed);
                frmMostraScored.Chart1.Series[ 7].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[ 9], aux, clRed);
                frmMostraScored.Chart1.Series[ 8].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[10], aux, clRed);
                frmMostraScored.Chart1.Series[ 9].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[11], aux, clRed);
                frmMostraScored.Chart1.Series[10].Add(cxGrid1DBTableView1.ViewData.Records[b].Values[12], aux, clRed);
            end;
        end;
    end;
end;

procedure TfrmSelecaoGraficoScored.SpeedButton3Click(Sender: TObject);
begin
    MontaGrafico('Todos');
    Close;
end;

procedure TfrmSelecaoGraficoScored.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmSelecaoGraficoScored.MontaTela;
var
    i : integer;
    S : TMemoryStream;
    sAux : string;
begin
    cxRadioGroup1.ItemIndex := frmMostraScored.cxRadioGroup1.ItemIndex;

    for i := 0 to frmMostraScored.cxStyleRepository1.StyleSheetCount - 1 do
        ComboBox1.Properties.Items.Add(frmMostraScored.cxStyleRepository1.StyleSheets[i].Caption);

    if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
       (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT');
        ADOQuery1.SQL.Add('[_Atualizacao_],');
        ADOQuery1.SQL.Add('[_Data_],');
        ADOQuery1.SQL.Add('[_Valor_],');
        ADOQuery1.SQL.Add('[_EvolucaoAnterior_],');
        ADOQuery1.SQL.Add('[_EvolucaoOriginal_],');
        ADOQuery1.SQL.Add('[_Situacao_],');
        ADOQuery1.SQL.Add('[_Situacao_] AS [_Situacao1_],');
        ADOQuery1.SQL.Add('[_ValorMinimo_],');
        ADOQuery1.SQL.Add('[_ValorMaximo_],');
        ADOQuery1.SQL.Add('[_PercMinimo_],');
        ADOQuery1.SQL.Add('[_PercMaximo_],');
        ADOQuery1.SQL.Add('[_ValorFaltaMinimo_],');
        ADOQuery1.SQL.Add('[_ValorFaltaMaximo_],');
        ADOQuery1.SQL.Add('[_PercFaltaMinimo_],');
        ADOQuery1.SQL.Add('[_PercFaltaMaximo_]');
        ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        ADOQuery1.SQL.Add('WHERE [_Titulo_] = ' + #39 + cScoredCard + #39);
        ADOQuery1.SQL.Add('ORDER BY [_Data_]');
        ADOQuery1.Open;
    end;

    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT');
        ADOQuery1.SQL.Add('_Atualizacao_,');
        ADOQuery1.SQL.Add('_Data_,');
        ADOQuery1.SQL.Add('_Valor_,');
        ADOQuery1.SQL.Add('_EvolucaoAnterior_,');
        ADOQuery1.SQL.Add('_EvolucaoOriginal_,');
        ADOQuery1.SQL.Add('_Situacao_,');
        ADOQuery1.SQL.Add('_Situacao_ AS _Situacao1_,');
        ADOQuery1.SQL.Add('_ValorMinimo_,');
        ADOQuery1.SQL.Add('_ValorMaximo_,');
        ADOQuery1.SQL.Add('_PercMinimo_,');
        ADOQuery1.SQL.Add('_PercMaximo_,');
        ADOQuery1.SQL.Add('_ValorFaltaMinimo_,');
        ADOQuery1.SQL.Add('_ValorFaltaMaximo_,');
        ADOQuery1.SQL.Add('_PercFaltaMinimo_,');
        ADOQuery1.SQL.Add('_PercFaltaMaximo_');
        ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
        ADOQuery1.SQL.Add('WHERE _Titulo_ = ' + #39 + cScoredCard + #39);
        ADOQuery1.SQL.Add('ORDER BY _Data_');
        ADOQuery1.Open;
    end;

    sAux := LePadraoString(frmMostraScored.bdDados,
                      'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                      frmMostraScored.sUsuario,
                      'frmSelecaoGraficoScored',
                      cScoredCard + 'cxRadioGroup1');
    if sAux <> '' then
    begin
        try
           cxRadioGroup1.ItemIndex := StrToInt(sAux);
        except
        end;
    end;

    ComboBox1.Text := LePadraoString(frmMostraScored.bdDados,
                                'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                                frmMostraScored.sUsuario,
                                'frmSelecaoGraficoScored',
                                cScoredCard + 'ComboBox1');

    if ExistePadao(frmMostraScored.bdDados,
                   frmMostraScored.tblScoredCardID_SCORED.Value,
                   frmMostraScored.sUsuario,
                   'frmSelecaoGraficoScored',
                   cScoredCard + 'cxGrid1') then
    begin
        S := TMemoryStream.Create;

        LePadraoStream(frmMostraScored.bdDados,
                                'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                                       frmMostraScored.sUsuario,
                                       'frmSelecaoGraficoScored',
                                       cScoredCard + 'cxGrid1',
                                       S);

        S.Position := 0;
        cxGrid1DBTableView1.DataController.Filter.LoadFromStream(S);
        S.Free;
    end;

    cxGrid1DBTableView1_Valor_.Caption            := frmMostraScored.cxTreeList1.Columns[1].Caption.Text;
    cxGrid1DBTableView1_EvolucaoAnterior_.Caption := frmMostraScored.cxTreeList1.Columns[3].Caption.Text;
    cxGrid1DBTableView1_EvolucaoOriginal_.Caption := frmMostraScored.cxTreeList1.Columns[4].Caption.Text;
    cxGrid1DBTableView1_ValorMinimo_.Caption      := frmMostraScored.cxTreeList1.Columns[5].Caption.Text;
    cxGrid1DBTableView1_ValorMaximo_.Caption      := frmMostraScored.cxTreeList1.Columns[6].Caption.Text;
    cxGrid1DBTableView1_PercMinimo_.Caption       := frmMostraScored.cxTreeList1.Columns[7].Caption.Text;
    cxGrid1DBTableView1_PercMaximo_.Caption       := frmMostraScored.cxTreeList1.Columns[8].Caption.Text;
    cxGrid1DBTableView1_ValorFaltaMinimo_.Caption := frmMostraScored.cxTreeList1.Columns[9].Caption.Text;
    cxGrid1DBTableView1_ValorFaltaMaximo_.Caption := frmMostraScored.cxTreeList1.Columns[10].Caption.Text;
    cxGrid1DBTableView1_PercFaltaMinimo_.Caption  := frmMostraScored.cxTreeList1.Columns[11].Caption.Text;
    cxGrid1DBTableView1_PercFaltaMaximo_.Caption  := frmMostraScored.cxTreeList1.Columns[12].Caption.Text;
    cxGrid1DBTableView1_Situacao_.Caption         := frmMostraScored.cxTreeList1.Columns[2].Caption.Text;
end;

procedure TfrmSelecaoGraficoScored.FormShow(Sender: TObject);
begin
    Self.Caption := HCLResourceStrings.FindID('sString_187') + cScoredCard;
    MontaTela;

    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmSelecaoGraficoScored.SpeedButton6Click(Sender: TObject);
begin
    cxGrid1DBTableView1.Columns[13].RepositoryItem := nil;

    ExportGridToHTML(frmMostraScored.sTempDirUsuario + 'analyzer.html',cxGrid1);
    EnviaMail(frmMostraScored.sTempDirUsuario + 'analyzer.html',HCLResourceStrings.FindID('sString_188') + frmMostraScored.Caption);

    cxGrid1DBTableView1.Columns[13].RepositoryItem := frmMostraScored.cxEditRepository1ImageComboBoxItem4;
end;

procedure TfrmSelecaoGraficoScored.SpeedButton9Click(Sender: TObject);
var
    S : TMemoryStream;
begin
    SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                 frmMostraScored.sUsuario,
                                 'frmSelecaoGraficoScored',
                                 cScoredCard + 'cxRadioGroup1',
                                 IntToStr(cxRadioGroup1.ItemIndex));

    SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                 frmMostraScored.sUsuario,
                                 'frmSelecaoGraficoScored',
                                 cScoredCard + 'ComboBox1',
                                 ComboBox1.Text);

    S := TMemoryStream.Create;
    cxGrid1DBTableView1.DataController.Filter.SaveToStream(S);
    S.Position := 0;

    SalvaPadraoStream(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                      frmMostraScored.sUsuario,
                                      'frmSelecaoGraficoScored',
                                      cScoredCard + 'cxGrid1',
                                      S);

    S.Free;

    MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
end;

procedure TfrmSelecaoGraficoScored.cxButton2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
    begin
        cxGrid1DBTableView1.Columns[13].RepositoryItem := nil;
        ExportGridToExcel(SaveDialog1.FileName,cxGrid1);
        cxGrid1DBTableView1.Columns[13].RepositoryItem := frmMostraScored.cxEditRepository1ImageComboBoxItem4;
    end;
end;

procedure TfrmSelecaoGraficoScored.SpeedButton4Click(Sender: TObject);
begin
    dxComponentPrinter.CurrentLinkIndex := 0;
    dxComponentPrinter.PrintTitle := HCLResourceStrings.FindID('sString_188') + frmMostraScored.Caption;
    dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmSelecaoGraficoScored.ComboBox1PropertiesChange(Sender: TObject);
begin
   try
      cxGrid1DBTableView1.Styles.StyleSheet := frmMostraScored.cxStyleRepository1.StyleSheets[ComboBox1.ItemIndex];
   except
      cxGrid1DBTableView1.Styles.StyleSheet := nil;
   end;
end;

end.

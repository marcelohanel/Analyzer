unit uDecisionCube;

interface

uses
  EditChar, TeeEdiGene, TeeBrazil, shellapi, xhArrays, Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, xhHierCube, Chart, xhChart, TeeGally, xhExport, xhConsts,
  cxButtons, cxEdit, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxPC, Menus, ADODB, xhInternalGrid, ImgList, TeeProcs, xhGrid, cxLookAndFeels, dxSkinsForm,
  cxLocalization, CEVersionInfo, cxGraphics, cxLookAndFeelPainters, cxControls, cxContainer,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, TeEngine, cxGroupBox, StdCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu;

type
  TfrmDecisionCube = class(TForm)
    Panel1: TPanel;
    HierCube1: THierCube;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    HierCubeGrid1: THierCubeGrid;
    dxSkinController1: TdxSkinController;
    bdDados: TADOConnection;
    tblDecision: TADOTable;
    tblDecisionID_DECISION: TWideStringField;
    tblDecisionDESCRICAO: TWideMemoField;
    tblDecisionPODE_VISUALIZAR: TWideMemoField;
    tblDecisionPODE_ALTERAR: TWideMemoField;
    tblDecisionPODE_APAGAR: TWideMemoField;
    tblDecisionDT_CRIACAO: TDateTimeField;
    tblDecisionSQL_COMPLETO: TWideMemoField;
    tblDecisionCAMPO_DIMENSAO_1: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_2: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_3: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_4: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_5: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_6: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_7: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_8: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_9: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_10: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_11: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_12: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_13: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_14: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_15: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_16: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_17: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_18: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_19: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_20: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_21: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_22: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_23: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_24: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_25: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_26: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_27: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_28: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_29: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_30: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_31: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_32: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_33: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_34: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_35: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_36: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_37: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_38: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_39: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_40: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_41: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_42: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_43: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_44: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_45: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_46: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_47: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_48: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_49: TWideStringField;
    tblDecisionCAMPO_DIMENSAO_50: TWideStringField;
    tblDecisionCAMPO_SUMARIO_1: TWideStringField;
    tblDecisionCAMPO_SUMARIO_2: TWideStringField;
    tblDecisionCAMPO_SUMARIO_3: TWideStringField;
    tblDecisionCAMPO_SUMARIO_4: TWideStringField;
    tblDecisionCAMPO_SUMARIO_5: TWideStringField;
    tblDecisionCAMPO_SUMARIO_6: TWideStringField;
    tblDecisionCAMPO_SUMARIO_7: TWideStringField;
    tblDecisionCAMPO_SUMARIO_8: TWideStringField;
    tblDecisionCAMPO_SUMARIO_9: TWideStringField;
    tblDecisionCAMPO_SUMARIO_10: TWideStringField;
    tblDecisionCAMPO_SUMARIO_11: TWideStringField;
    tblDecisionCAMPO_SUMARIO_12: TWideStringField;
    tblDecisionCAMPO_SUMARIO_13: TWideStringField;
    tblDecisionCAMPO_SUMARIO_14: TWideStringField;
    tblDecisionCAMPO_SUMARIO_15: TWideStringField;
    tblDecisionCAMPO_SUMARIO_16: TWideStringField;
    tblDecisionCAMPO_SUMARIO_17: TWideStringField;
    tblDecisionCAMPO_SUMARIO_18: TWideStringField;
    tblDecisionCAMPO_SUMARIO_19: TWideStringField;
    tblDecisionCAMPO_SUMARIO_20: TWideStringField;
    tblDecisionLIMITE_REGISTROS: TIntegerField;
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    xChart1: THierCubeChart;
    SpeedButton6: TcxButton;
    SaveDialog1: TSaveDialog;
    SpeedButton2: TcxButton;
    SpeedButton4: TcxButton;
    cxButton1: TcxButton;
    SpeedButton9: TcxButton;
    RadioGroup1: TcxRadioGroup;
    qryAtualiza: TADOQuery;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    ImageList2: TImageList;
    cxButton3: TcxButton;
    HierCubeGridExportToPDF1: THierCubeGridExportToPDF;
    SaveDialog2: TSaveDialog;
    cxLocalizer1: TcxLocalizer;
    qryAux: TADOQuery;
    CEVersionInfo1: TCEVersionInfo;
    tblDecisionCAMPO_SUMARIO_21: TWideStringField;
    tblDecisionCAMPO_SUMARIO_22: TWideStringField;
    tblDecisionCAMPO_SUMARIO_23: TWideStringField;
    tblDecisionCAMPO_SUMARIO_24: TWideStringField;
    tblDecisionCAMPO_SUMARIO_25: TWideStringField;
    tblDecisionCAMPO_SUMARIO_26: TWideStringField;
    tblDecisionCAMPO_SUMARIO_27: TWideStringField;
    tblDecisionCAMPO_SUMARIO_28: TWideStringField;
    tblDecisionCAMPO_SUMARIO_29: TWideStringField;
    tblDecisionCAMPO_SUMARIO_30: TWideStringField;
    tblDecisionCAMPO_SUMARIO_31: TWideStringField;
    tblDecisionCAMPO_SUMARIO_32: TWideStringField;
    tblDecisionCAMPO_SUMARIO_33: TWideStringField;
    tblDecisionCAMPO_SUMARIO_34: TWideStringField;
    tblDecisionCAMPO_SUMARIO_35: TWideStringField;
    tblDecisionCAMPO_SUMARIO_36: TWideStringField;
    tblDecisionCAMPO_SUMARIO_37: TWideStringField;
    tblDecisionCAMPO_SUMARIO_38: TWideStringField;
    tblDecisionCAMPO_SUMARIO_39: TWideStringField;
    tblDecisionCAMPO_SUMARIO_40: TWideStringField;
    tblDecisionCAMPO_SUMARIO_41: TWideStringField;
    tblDecisionCAMPO_SUMARIO_42: TWideStringField;
    tblDecisionCAMPO_SUMARIO_43: TWideStringField;
    tblDecisionCAMPO_SUMARIO_44: TWideStringField;
    tblDecisionCAMPO_SUMARIO_45: TWideStringField;
    tblDecisionCAMPO_SUMARIO_46: TWideStringField;
    tblDecisionCAMPO_SUMARIO_47: TWideStringField;
    tblDecisionCAMPO_SUMARIO_48: TWideStringField;
    tblDecisionCAMPO_SUMARIO_49: TWideStringField;
    tblDecisionCAMPO_SUMARIO_50: TWideStringField;
    PopupMenu1: TPopupMenu;
    ExportarparaTXT1: TMenuItem;
    ExportarparaHTML1: TMenuItem;
    ExportarparaRTF1: TMenuItem;
    ExportarparaPDF1: TMenuItem;
    ExportarparaXLS1: TMenuItem;
    ExportarparaBMP1: TMenuItem;
    HierCubeGridExportToTXT1: THierCubeGridExportToTXT;
    HierCubeGridExportToHTML1: THierCubeGridExportToHTML;
    HierCubeGridExportToRTF1: THierCubeGridExportToRTF;
    HierCubeGridExportToPDF2: THierCubeGridExportToPDF;
    HierCubeGridExportToXLS1: THierCubeGridExportToXLS;
    HierCubeGridExportToBMP1: THierCubeGridExportToBMP;
    bdArmazena: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure LeParametros;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure HierCubeGrid1CustomDrawCell(Sender: TObject;
      Args: TCustomDrawCellEventArgs);
    procedure HierCubeGrid1DrawCell(Sender: TObject; Args: TDrawCellEventArgs);
    procedure HierCubeGrid1DrawLabelCell(Sender: TObject; var Value: AnsiString;
      var aFont: TFont; var aColor: TColor; LabelNode: TLabelNode);
    procedure HierCubeGrid1GetSubFunctionCalculator(Sender: TObject;
      SubFun: TSubFunction; var Calculator: TSubFunctionCalculator);
    procedure cxButton3Click(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure ExportarparaTXT1Click(Sender: TObject);
    procedure ExportarparaHTML1Click(Sender: TObject);
    procedure ExportarparaRTF1Click(Sender: TObject);
    procedure ExportarparaPDF1Click(Sender: TObject);
    procedure ExportarparaXLS1Click(Sender: TObject);
    procedure ExportarparaBMP1Click(Sender: TObject);
    procedure AddCenarios;
    procedure SalvaGrid;
  private
    { Private declarations }
    function MyColPercentCalculator(Args: TSubFunctionCalculatorArgs;
      out Res: Double): boolean;
    function MyColAnterior(Args: TSubFunctionCalculatorArgs;
      out Res: Double): boolean;
    function CurvaABC1(Args: TSubFunctionCalculatorArgs;
      out Res: Double): boolean;
  public
    { Public declarations }
    sUsuario        : string;
    sSkin           : string;
    sSQLOriginal    : string;
    sSQL            : string;
    sWhere          : string;
    lPrimeiraVez    : boolean;
    sDecicion       : string;
    sCenario        : string;
    sTempDirUsuario : string;
    sSGBD           : string;
  end;

var
  frmDecisionCube: TfrmDecisionCube;
  dCurvaA, dCurvaB : double;
  StreamFiltro: TMemoryStream;


implementation

uses uFuncoes, uDescricao, uCopiarPadroesCubo, uFiltrar, uAguarde;

{$R *.dfm}

function TfrmDecisionCube.MyColAnterior(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  vAnterior, vAtual : double;
  lPode : boolean;
begin
    Result := False;
    lPode  := True;

    with Args do
    begin
        if FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty = False then
           lPode := False;

        if ColLabelNode = nil then
           lPode := False;

        if ColTreeIndex = 0 then
           lPode := False;

        if lPode then
        begin
            Node := ColLabelNode;
            res  := 0;

            if Node.IsSubTotal = False then
            begin
                vAnterior := FunctionData[ColTreeIndex - 1, RowTreeIndex].Data;
                vAtual    := FunctionData[ColTreeIndex, RowTreeIndex].Data;

                if vAnterior <> 0 then
                   res := ((vAtual / vAnterior) -1) * 100
                else
                   res := 0;
            end;
        end
        else
           res := 0;

        Result := True;
    end;
end;

function TfrmDecisionCube.CurvaABC1(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Data, Sum: double;
  Valor : double;
begin
  { by default the cell is empty }
  Result := False;
  with Args do
  begin
    { if the function has no value then our sub-function must be empty too }
    if FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty = False then
       exit;

    { othewise look for parent node in row area }
    if RowLabelNode = nil then
       exit; { no dimensions in row area - exit }

    Node := RowLabelNode;
    if Node.IsSubTotal then
    begin
      dCurvaA := 0;
      dCurvaB := 0;

      exit;
  {    Node := Node.Parent;
      if Node = nil then
         exit;}
    end;

    { value to calculate the percent for }
    Data := Data + FunctionData[ColTreeIndex, RowTreeIndex].Data;

    if Node.Parent <> nil then
      { there is a parent node - no need to calculate the sum }
      Sum := FunctionData[ColTreeIndex, Node.Parent.TreeIndex].Data
    else
    begin
        { the list of all nodes from the area of adequate comparisons including the given one }
        SumIndex.FillWith(SubTotal);
        GridInfo.ScanFromLabelNode(ColLabelNode, Args.SumIndex);
        SumInfo.GetAggregate(SumIndex, Fun, Sum);
    end;

    if Sum <> 0 then
    begin
      Valor := Data / Sum * 100;
    end
    else
    begin
      Valor := 0;
    end;

    if dCurvaA > 70 then
    begin
        if dCurvaB > 90 then
        begin
            Res := 3;
        end
        else
        begin
            Res := 2;
            dCurvaB := Valor;
        end;
    end
    else
    begin
        Res := 1;
        dCurvaA := Valor;
    end;

    if Node.Parent <> nil then
       Res := 0;

    Result := True;
  end;
end;

procedure TfrmDecisionCube.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
       xChart1.UseDimension := xhcRows
    else
       xChart1.UseDimension := xhcColumns;
end;

procedure TfrmDecisionCube.SpeedButton1Click(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 0 then
    begin
        HierCubeGridExportToPDF1.ExportToFile(sTempDirUsuario + 'cubomysql.pdf');
        ShellExecute(handle,'open', pchar(sTempDirUsuario + 'cubomysql.pdf'),'', nil, sw_shownormal);
    end;

    if cxPageControl1.ActivePageIndex = 1 then
       ChartPreview(Self,TCustomChart(xChart1));
end;

procedure TfrmDecisionCube.SpeedButton2Click(Sender: TObject);
begin
    EditChart(Self,TCustomChart(xChart1));
end;

procedure TfrmDecisionCube.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmDecisionCube.SpeedButton4Click(Sender: TObject);
begin
    ChangeAllSeriesGallery(Self, TCustomChart(xChart1));
end;

procedure TfrmDecisionCube.SalvaGrid;
var
    S: TMemoryStream;
begin
    SalvaPadraoString(bdDados,
      'ID_DECISION = ' + #39 + tblDecisionID_DECISION.AsString + #39,
      'ID_DECISION',
      tblDecisionID_DECISION.AsString,
      sUsuario,
      Self.Name,
      'RadioGroup1',
      IntToStr(RadioGroup1.ItemIndex));

    S := TMemoryStream.Create;
    HierCubeGrid1.SaveToStream(S, scGridState);
    S.Position := 0;
    SalvaPadraoStream(bdDados,
    'ID_DECISION = ' + #39 + tblDecisionID_DECISION.AsString + #39,
    'ID_DECISION',
    tblDecisionID_DECISION.AsString,
    sUsuario,
    Self.Name,
    'Grid',
    S);
    S.Free;
end;

procedure TfrmDecisionCube.SpeedButton9Click(Sender: TObject);
var
    lSalva : boolean;
begin
    lSalva := True;

    if not HierCube1.Active then
       lSalva := False;

    if lSalva then
    begin
        SalvaGrid;
        MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmDecisionCube.cxButton1Click(Sender: TObject);
begin
    if frmDescricao = nil then
    begin
        frmDescricao := TfrmDescricao.Create(Self);

        frmDescricao.cxMemo1.Clear;
        frmDescricao.cxMemo1.Lines.Text := tblDecisionDESCRICAO.AsString;

        frmDescricao.ShowModal;
        FreeAndNil(frmDescricao);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmDescricao);
    end;
end;

procedure TfrmDecisionCube.cxButton2Click(Sender: TObject);
begin
    if MessageDlg(HCLResourceStrings.FindID('sString_45'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        qryAtualiza.Close;
        qryAtualiza.SQL.Clear;
        qryAtualiza.SQL.Add('DELETE FROM PADROES');
        qryAtualiza.SQL.Add('WHERE ID_USUARIO = ' + #39 + sUsuario + #39);
        qryAtualiza.SQL.Add('AND FORMULARIO = ' + #39 + Self.Name + #39);
        qryAtualiza.ExecSQL;
        qryAtualiza.Close;

        MessageDlg(HCLResourceStrings.FindID('sString_59'), mtInformation, [mbOK], 0);
        Close;
    end;
end;

procedure TfrmDecisionCube.cxButton3Click(Sender: TObject);
var
    lPode : boolean;
begin
    if frmFiltrar = nil then
    begin
        lPode := True;

        frmFiltrar := TfrmFiltrar.Create(Self);

        try
           StreamFiltro.Position := 0;
           frmFiltrar.cxDBFilterControl1.LoadFromStream(StreamFiltro);
        except
        end;

        if sCenario <> '' then
        begin
            frmFiltrar.ComboBox1.Properties.Items.Add(sCenario);
            frmFiltrar.ComboBox1.Text := sCenario;
        end;

        frmFiltrar.CarregaCenarios;

        if lPrimeiraVez then
           if frmFiltrar.ComboBox1.Properties.Items.Count <= 0 then
              lPode := False;

        if lPode then
        begin
            frmFiltrar.ShowModal;

            if frmFiltrar.ModalResult = mrOk then
            begin
                frmAguarde := TfrmAguarde.Create(Self);
                frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_415');
                frmAguarde.Show;
                frmAguarde.Update;

                StreamFiltro.Clear;
                frmFiltrar.cxDBFilterControl1.SaveToStream(StreamFiltro);

                sWhere := frmFiltrar.cxDBFilterControl1.FilterText;
                sCenario := frmFiltrar.ComboBox1.Text;

                if (Pos('WHERE',UpperCase(sSQLOriginal)) > 0) then
                begin
                    if sWhere <> '' then
                       sSQL := sSQLOriginal + ' AND ' + sWhere;
                end
                else
                begin
                    if sWhere <> '' then
                       sSQL := sSQLOriginal + ' ' + sWhere;
                end;

                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Add(sSQL);
                ADOQuery1.MaxRecords := 0;

                HierCube1.RefreshFactTable(false);

                FreeAndNil(frmAguarde);
            end
            else
            begin
                if lPrimeiraVez then
                   Application.Terminate;
            end;
        end
        else
        begin
            sSQL := sSQLOriginal;

            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSQL);
            ADOQuery1.MaxRecords := 0;

            HierCube1.RefreshFactTable(false);
        end;

        lPrimeiraVez := False;

        FreeAndNil(frmFiltrar);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmFiltrar);
    end;
end;

procedure TfrmDecisionCube.cxButton4Click(Sender: TObject);
begin
    if frmCopiarPadroesCubo = nil then
    begin
        frmCopiarPadroesCubo := TfrmCopiarPadroesCubo.Create(Self);

        frmCopiarPadroesCubo.edtUsuario.Text := sUsuario;

        frmCopiarPadroesCubo.ShowModal;
        FreeAndNil(frmCopiarPadroesCubo);
    end
    else
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        FreeAndNil(frmCopiarPadroesCubo);
    end;
end;

procedure TfrmDecisionCube.cxPageControl1Change(Sender: TObject);
begin
    if cxPageControl1.ActivePageIndex = 1 then
    begin
        SpeedButton6.Enabled := False;
        SpeedButton2.Enabled := True;
        SpeedButton4.Enabled := True;
        RadioGroup1.Enabled  := True;
    end
    else
    begin
        SpeedButton6.Enabled := True;
        SpeedButton2.Enabled := False;
        SpeedButton4.Enabled := False;
        RadioGroup1.Enabled  := False;
    end;
end;

procedure TfrmDecisionCube.ExportarparaBMP1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.bmp';
    SaveDialog1.Filter     := 'BMP|*.bmp';

    if SaveDialog1.Execute then
       HierCubeGridExportToBMP1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.ExportarparaHTML1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.htm';
    SaveDialog1.Filter     := 'HTML|*.htm';

    if SaveDialog1.Execute then
       HierCubeGridExportToHTML1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.ExportarparaPDF1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.pdf';
    SaveDialog1.Filter     := 'PDF|*.pdf';

    if SaveDialog1.Execute then
       HierCubeGridExportToPDF1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.ExportarparaRTF1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.rtf';
    SaveDialog1.Filter     := 'RTF|*.rtf';

    if SaveDialog1.Execute then
       HierCubeGridExportToRTF1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.ExportarparaTXT1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.txt';
    SaveDialog1.Filter     := 'TXT|*.txt';

    if SaveDialog1.Execute then
       HierCubeGridExportToTXT1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.ExportarparaXLS1Click(Sender: TObject);
begin
    SaveDialog1.DefaultExt := '*.xls';
    SaveDialog1.Filter     := 'XLS|*.xls';

    if SaveDialog1.Execute then
       HierCubeGridExportToXLS1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmDecisionCube.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    try
      DeleteFile(sTempDirUsuario + 'cubomysql.pdf');
    except
    end;

    try
      DeleteFile(sTempDirUsuario + 'conexaodms.txt');
    except
    end;

    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    StreamFiltro.Free;
    tblDecision.Close;
    bdDados.Close;
end;

procedure TfrmDecisionCube.FormCreate(Sender: TObject);
begin
    TeeSetBrazil;

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    lPrimeiraVez := True;

    if ParamStr(1) <> 'kc4570mh' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_365'), mtInformation, [mbOK], 0);
        Application.Terminate;
    end;

    SetLanguage(2,cxLocalizer1);
    cxPageControl1.ActivePageIndex := 0;

    sSkin           := ParamStr(5);
    sUsuario        := ParamStr(4);
    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    StreamFiltro := TMemoryStream.Create;
end;

procedure TfrmDecisionCube.FormShow(Sender: TObject);
var
    S: TMemoryStream;
    sAux : string;
begin
    LeParametros;

    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);

    if not HierCube1.Active then
       Exit;

    sAux := LePadraoString(bdDados,
              'ID_DECISION = ' + #39 + tblDecisionID_DECISION.AsString + #39,
              sUsuario,
              Self.Name,
              'RadioGroup1');

    if sAux <> '' then
    begin
        RadioGroup1.ItemIndex := StrToInt(sAux);
        RadioGroup1.OnClick(Self);
    end;

    cxButton3.Click;

    try
        S := TMemoryStream.Create;
        LePadraoStream(bdDados,
                  'ID_DECISION = ' + #39 + tblDecisionID_DECISION.AsString + #39,
                  sUsuario,
                  Self.Name,
                  'Grid',
                  S);
        S.Position := 0;
        HierCubeGrid1.LoadFromStream(S);
        S.Free;
    except
    end;

    AddCenarios;
end;

procedure TfrmDecisionCube.AddCenarios;
var
    Query  : TADOQuery;
    aux : string;
    lSalva : boolean;
begin
    lSalva := False;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmDecisionCube.bdDados;
    Query.CursorLocation := clUseServer;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM TASK');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + sUsuario + #39);
    Query.SQL.Add('  AND FORMULARIO = ' + #39 + 'frmCopiarPadroesCubo' + #39);
    Query.SQL.Add('  AND INSTRUCAO  = ' + #39 + 'CopiaCenario' + tblDecisionID_DECISION.AsString + #39);
    Query.Open;

    Query.First;
    while not Query.Eof do
    begin
        lSalva := True;

        TBlobField(Query.FieldByName('CAMPO')).SaveToFile(sTempDirUsuario + 'AddCenario.txt');

        if FileExists(sTempDirUsuario + 'AddCenario.txt') then
        begin
            try
                HierCubeGrid1.PivotStates.Add(Query.FieldByName('VALOR').AsString).ReadFile(sTempDirUsuario + 'AddCenario.txt');
                DeleteFile(sTempDirUsuario + 'AddCenario.txt');
            except
            end;
        end;

        Query.Next;
    end;

    if lSalva then
       SalvaGrid;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM TASK');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + sUsuario + #39);
    Query.SQL.Add('  AND FORMULARIO = ' + #39 + 'frmCopiarPadroesCubo' + #39);
    Query.SQL.Add('  AND INSTRUCAO  = ' + #39 + 'CopiaCenario' + tblDecisionID_DECISION.AsString + #39);
    Query.ExecSQL;

    Query.Close;
    Query.Free;
end;

procedure TfrmDecisionCube.HierCubeGrid1CustomDrawCell(Sender: TObject;
  Args: TCustomDrawCellEventArgs);
var
  Value      : double;
  Index, X, Y: integer;
  R          : TRect;
begin
  if (Args.CellType = enData) and not Args.IsNull then
  begin
      if (Args.SubLevelNode.Fun = stSum) and (Args.SubLevelNode.SubFun = sstValue) then
      begin
          if (Sender as THierCubeGrid).GetDataAsDouble(Args.RowLabelNode, Args.ColLabelNode,
             Args.SubLevelNode.SumInfoID, stSum, sstCompareWithPrevByRow, Value) then
          begin
            R := Args.Rect;
            Args.Canvas.FillRect(R);

            if Value < 0 then
               Index := 1
            else
               Index := 0;

            X := R.Right - ImageList2.Width;
            Y := R.Top + (R.Bottom - R.Top - ImageList2.Height) div 2;

            ImageList2.Draw(Args.Canvas, X, Y, Index);
            R.Right := X;

            xhInternalGrid.DrawText(Args.Canvas, Args.ValueString, R, taRightJustify, taCenter);
          end;
      end;

      if (Args.SubLevelNode.SubFun = sstCustom2) then
      begin
          if Args.RowLabelNode.IsSubTotal then
             exit;

          if (Sender as THierCubeGrid).GetDataAsDouble(Args.RowLabelNode, Args.Col, Value) then
          begin
            R := Args.Rect;
            Args.Canvas.FillRect(R);

            if Value = 1 then
               Index := 2;

            if Value = 2 then
               Index := 3;

            if Value = 3 then
               Index := 4;

            X := R.Right - (ImageList2.Width * 4);
            Y := R.Top + (R.Bottom - R.Top - ImageList2.Height) div 2;

            ImageList2.Draw(Args.Canvas, X, Y, Index);
            R.Right := X;

            //xhInternalGrid.DrawText(Args.Canvas, Args.ValueString, R, taRightJustify, taCenter);
            xhInternalGrid.DrawText(Args.Canvas, '', R, taLeftJustify, taCenter);
          end;
      end;
  end;
end;

procedure TfrmDecisionCube.HierCubeGrid1DrawCell(Sender: TObject;
  Args: TDrawCellEventArgs);
begin
  with Args do
  begin
      if CellType = enData then
      begin
          if ColLabelNode <> nil then
             if ColLabelNode.IsSubTotal then
                Color := $00D6F4F8;

          if RowLabelNode <> nil then
             if RowLabelNode.IsSubTotal then
                Color := $00D6F4F8;

          if IsNull then
             ValueString := '';
      end
      else
      if CellType = enDimLabel then
      begin
          if RowLabelNode.Expandable then
             Font.Color := clBlue;

          if RowLabelNode.IsSubTotal then
             Font.Color := clPurple;
      end;
  end;
end;

procedure TfrmDecisionCube.HierCubeGrid1DrawLabelCell(Sender: TObject;
  var Value: AnsiString; var aFont: TFont; var aColor: TColor;
  LabelNode: TLabelNode);
begin
  if LabelNode.Expandable then aFont.Color := clBlue;
  if LabelNode.IsSubTotal then aFont.Color := clPurple;
end;

procedure TfrmDecisionCube.HierCubeGrid1GetSubFunctionCalculator(
  Sender: TObject; SubFun: TSubFunction;
  var Calculator: TSubFunctionCalculator);
begin
  if SubFun = sstCustom1 then Calculator := MyColPercentCalculator;
  if SubFun = sstCustom2 then Calculator := CurvaABC1;
  if SubFun = sstCustom3 then Calculator := MyColAnterior;
end;

function TfrmDecisionCube.MyColPercentCalculator(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Data, Sum: double;
begin
  { by default the cell is empty }
  Result := False;
  with Args do
  begin
    { if the function has no value then our sub-function must be empty too }
    if FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty = False then
       exit;

    { othewise look for parent node in row area }
    if RowLabelNode = nil then
       exit; { no dimensions in row area - exit }

    Node := RowLabelNode;
    if Node.IsSubTotal then
    begin
      exit;
  {    Node := Node.Parent;
      if Node = nil then
         exit;}
    end;

    { value to calculate the percent for }
    Data := Data + FunctionData[ColTreeIndex, RowTreeIndex].Data;

    if Node.Parent <> nil then
      { there is a parent node - no need to calculate the sum }
      Sum := FunctionData[ColTreeIndex, Node.Parent.TreeIndex].Data
    else
    begin
        { the list of all nodes from the area of adequate comparisons including the given one }
        SumIndex.FillWith(SubTotal);
        GridInfo.ScanFromLabelNode(ColLabelNode, Args.SumIndex);
        SumInfo.GetAggregate(SumIndex, Fun, Sum);
    end;

    if Sum <> 0 then
      Res := Data / Sum * 100
    else
      Res := 0;

    Result := True;
  end;
end;

procedure TfrmDecisionCube.LeParametros;
var
    i,a       : integer;
    sAux      : string;
    comando   : TStrings;
    sCon      : string;
    lPode     : boolean;
begin
    sCon := ParamStr(3);

    comando := TStringList.Create;
    comando.Clear;
    comando.LoadFromFile(sCon);

    sSGBD := comando.Strings[2];

    try
       bdDados.Close;
       bdDados.ConnectionString := comando.Strings[0];
       bdDados.Open;

       bdArmazena.Close;
       bdArmazena.ConnectionString := comando.Strings[1];
       bdArmazena.Open;

       tblDecision.Close;
       tblDecision.Filtered := False;
       tblDecision.Filter := 'ID_DECISION = ' + #39 + ParamStr(2) + #39;
       tblDecision.Filtered := True;
       tblDecision.Open;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_318') +#13+#10+
                     HCLResourceStrings.FindID('sString_370') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;

    comando.Free;

    sDecicion := tblDecisionID_DECISION.AsString;

    try
        sDecicion    := tblDecisionID_DECISION.AsString;
        Self.Caption := Self.Caption + ' - ' + tblDecisionID_DECISION.AsString;
        sSQLOriginal := tblDecisionSQL_COMPLETO.AsString;

        bdArmazena.Close;
        ADOQuery1.Close;
        HierCube1.DataSet := ADOQuery1;

        HierCube1.Active := False;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT SQL_COMPLETO FROM DECISION_USUARIO');
        qryAux.SQL.Add('WHERE ID_DECISION = ' + #39 + sDecicion + #39);
        qryAux.SQL.Add('  AND ID_USUARIO  = ' + #39 + sUsuario + #39);
        qryAux.Open;
        qryAux.First;
        if not qryAux.IsEmpty then
           sSQLOriginal := qryAux.Fields[0].AsString;
        qryAux.Close;

        sSQL := sSQLOriginal;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add(sSQLOriginal);
        ADOQuery1.MaxRecords := 1;
        ADOQuery1.Open;

        HierCube1.DimensionMap.Clear;
        HierCube1.BuildDimensionMap;

        for i := 1 to 50 do
        begin
            sAux := tblDecision.FieldByName('CAMPO_DIMENSAO_' + IntToStr(i)).AsString;
            if sAux <> '' then
            begin
                lPode := False;

                for a := 0 to ADOQuery1.Fields.Count - 1 do
                    if sAux = ADOQuery1.Fields[a].FieldName then
                       lPode := true;

                if lPode then
                   HierCube1.DefineFieldAsDimension(sAux, dgPage);
            end;
        end;

        for i := 1 to 50 do
        begin
            sAux := tblDecision.FieldByName('CAMPO_SUMARIO_' + IntToStr(i)).AsString;
            if sAux <> '' then
            begin
                lPode := False;

                for a := 0 to ADOQuery1.Fields.Count - 1 do
                    if sAux = ADOQuery1.Fields[a].FieldName then
                       lPode := true;

                if lPode then
                begin
                    with HierCube1.DefineFieldAsSummary(sAux) do
                    begin
                        DefaultFormat := '#,##0.00';
                    end;
                end;
            end;
        end;

        HierCube1.Active := True;

        for i := 0 to HierCubeGrid1.SummarySettings.Count - 1 do
            HierCubeGrid1.SummarySettings.FindSumInfoID(i).Visible := False;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_366') +#13+#10+
                     HCLResourceStrings.FindID('sString_370') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;
end;

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

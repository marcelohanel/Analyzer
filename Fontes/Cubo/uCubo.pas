unit uCubo;

interface

uses
  TeeBrazil, EditChar, xhArrays, Db, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, xhHierCube, Chart, xhChart, StdCtrls, TeeGally, xhExport,
  xhConsts, cxButtons, cxEdit, cxRadioGroup, cxTextEdit,
  cxPC, ADODB,ShellApi, xhInternalGrid, ImgList, TeeProcs, TeeEdiGene, xhGrid, cxLookAndFeels,
  dxSkinsForm, cxLocalization, CEVersionInfo, cxGraphics, cxControls, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxContainer, Menus, cxGroupBox, TeEngine, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu;

type
  TfrmCubo = class(TForm)
    HC: THierCube;
    HierCubeGridExportToExcel1: THierCubeGridExportToExcel;
    SaveDialog1: TSaveDialog;
    PageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Grid: THierCubeGrid;
    xChart1: THierCubeChart;
    Panel1: TPanel;
    RadioGroup1: TcxRadioGroup;
    SpeedButton4: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton6: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    bdDados: TADOConnection;
    qryAtualiza: TADOQuery;
    bdArmazena: TADOConnection;
    ADOQuery1: TADOQuery;
    Memo1: TMemo;
    tblCenarios: TADOTable;
    tblCenariosID_CENARIO: TWideStringField;
    tblCenariosID_USUARIO: TWideStringField;
    tblCenariosID_ANALISE: TWideStringField;
    tblCenariosID_ABC: TWideStringField;
    tblCenariosFILTROS: TMemoField;
    tblCenariosELEMENTOS: TMemoField;
    tblCenariosVALORES: TMemoField;
    tblCenariosA: TWideStringField;
    tblCenariosB: TWideStringField;
    tblCenariosC: TWideStringField;
    tblCenariosD: TWideStringField;
    tblCenariosE: TWideStringField;
    tblCenariosFOTOGRAFIA_DATA: TWideStringField;
    tblCenariosFOTOGRAFIA_VALOR: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_FOT_FIM: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_INI: TWideStringField;
    tblCenariosFOTOGRAFIA_DT_COM_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA: TWideStringField;
    tblCenariosFREQUENCIA_VALOR: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_INI: TWideStringField;
    tblCenariosFREQUENCIA_DT_FRE_FIM: TWideStringField;
    tblCenariosFREQUENCIA_DATA_BASE: TWideStringField;
    tblCenariosID_FOTOGRAFIA: TWideStringField;
    tblCenariosID_FREQUENCIA: TWideStringField;
    tblCenariosORDEM: TWideStringField;
    tblCenariosORDEM_TIPO: TWideStringField;
    tblCenariosLINHAS: TIntegerField;
    tblCenariosFILTRO_PERSONALIZADO_TEXTO: TWideMemoField;
    tblCenariosFILTRO_PERSONALIZADO_GRAFICO: TBlobField;
    tblCenariosREGISTROS: TIntegerField;
    tblCenariosFREQUENCIA_DIAS: TIntegerField;
    tblCenariosFREQUENCIA_ATUAL: TWideStringField;
    ImageList2: TImageList;
    cxLocalizer1: TcxLocalizer;
    HierCubeGridExportToPDF1: THierCubeGridExportToPDF;
    dxSkinController1: TdxSkinController;
    CEVersionInfo1: TCEVersionInfo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure GridDrawDataCell(Sender: TObject; Col, Row: Integer;
      var Value: String; var aFont: TFont; var aColor: TColor;
      AState: TGridDrawState);
    procedure GridEditFactTable(Sender: TObject; ModifiedRecords: TDataSet;
      var Accept: Boolean);
    procedure CarregaGrid;
    procedure PageControl1Change(Sender: TObject);
    procedure GridDrawLabelCell(Sender: TObject; var Value: AnsiString;
      var aFont: TFont; var aColor: TColor; LabelNode: TLabelNode);
    procedure FormCreate(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TObject;
      Args: TCustomDrawCellEventArgs);
    procedure GridDrawCell(Sender: TObject; Args: TDrawCellEventArgs);
    procedure GridGetSubFunctionCalculator(Sender: TObject;
      SubFun: TSubFunction; var Calculator: TSubFunctionCalculator);
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
    sUsuario : string;
    sTempDirUsuario : string;
  end;

var
  frmCubo: TfrmCubo;
  dCurvaA, dCurvaB : double;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmCubo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    ADOQuery1.Close;

    tblCenarios.Close;

    bdDados.Close;

    try
      DeleteFile(sTempDirUsuario + 'cubo.txt');
      DeleteFile(sTempDirUsuario + 'comandocubo.txt');
      DeleteFile(sTempDirUsuario + 'cubo.pdf');
    except
    end;

    Action := caFree;
end;

procedure TfrmCubo.FormCreate(Sender: TObject);
var
    sSkin : string;
begin
    TeeSetBrazil;

    Self.Caption := CEVersionInfo1.ProductName + ' - ' + CEVersionInfo1.FileVersion;

    SetLanguage(2, cxLocalizer1);

    Memo1.Lines.Clear;
    sUsuario := ParamStr(4);

    sTempDirUsuario := 'C:\Analyzer\Temp\' + sUsuario + '\';

    if FileExists(ParamStr(1)) then
       Memo1.Lines.LoadFromFile(ParamStr(1))
    else
       Application.Terminate;

    sSkin := Memo1.Lines.Strings[0]; //Entry(1,Memo1.Lines.Text,'#');

    dxSkinController1.SkinName := sSkin;
    if sSkin <> 'Nenhum' then
       dxSkinController1.UseSkins := True
    else
       dxSkinController1.UseSkins := False;

    try
      bdDados.Close;
      bdDados.ConnectionString := Memo1.Lines.Strings[1];
      bdDados.Open;

      tblCenarios.Open;

      bdArmazena.Close;
      bdArmazena.ConnectionString := Memo1.Lines.Strings[8];
      bdArmazena.Open;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_40') + E.Message, mtInformation, [mbOK], 0);
          Application.Terminate;
      end;
    end;
end;

procedure TfrmCubo.CarregaGrid;
var
   S: TMemoryStream;
   i: Integer;
   Elementos, Sumarios : integer;
   sAux : string;
begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.LoadFromFile(sTempDirUsuario + 'cubo.txt');
    ADOQuery1.Open;

    try
      HC.DataSet := ADOQuery1;
      HC.BuildDimensionMap;

      Elementos := StrToInt(ParamStr(2)); //StrToInt(Entry(10,Memo1.Lines.Text,'#'));
      Sumarios  := StrToInt(ParamStr(3)); //StrToInt(Entry(11,Memo1.Lines.Text,'#'));

      for i := 0 to Elementos - 1 do
          HC.DefineFieldAsDimension(ADOQuery1.Fields[i].FieldName, dgPage);

      for i := Elementos to Elementos + Sumarios - 1 do
          HC.DefineFieldAsSummary(ADOQuery1.Fields[i].FieldName).DefaultFormat := '#,##0.00';

      xChart1.ControlSummaryName := ADOQuery1.Fields[Elementos].FieldName;

      HC.Active := True;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_30') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
          ADOQuery1.Close;
      end;
    end;

    if not HC.Active then
       Exit;

    if Memo1.Lines.Strings[4] = '' then // frmDesigner.ComboBox1.Text = '' then
       Exit;

    sAux := LePadraoString(bdDados,
                          'ID_CENARIO = ' + #39 + Memo1.Lines.Strings[4] + #39 + ' AND ID_ANALISE = ' + #39 + Memo1.Lines.Strings[2] + #39,
                          Memo1.Lines.Strings[5],
                          'frmCubo',
                          'RadioGroup1');

    if sAux <> '' then
    begin
        RadioGroup1.ItemIndex := StrToInt(sAux);
        RadioGroup1.OnClick(Self);
    end;

    try
        S := TMemoryStream.Create;
        LePadraoStream(bdDados,
                       'ID_CENARIO = ' + #39 + Memo1.Lines.Strings[4] + #39 + ' AND ID_ANALISE = ' + #39 + Memo1.Lines.Strings[2] + #39,
                       Memo1.Lines.Strings[5],
                       'frmCubo',
                       'Grid',
                       S);
        S.Position := 0;
        Grid.LoadFromStream(S);
        S.Free;
    except
    end;
end;

procedure TfrmCubo.FormShow(Sender: TObject);
begin
    Self.Caption := Self.Caption + ' - ' + Memo1.Lines.Strings[2];

    if Memo1.Lines.Strings[3] <> '' then
       Self.Caption := Self.Caption + ' - ' + Memo1.Lines.Strings[3];

    CarregaGrid;

    GeraLog(bdDados,sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmCubo.SpeedButton3Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCubo.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
       xChart1.UseDimension := xhcRows
    else
       xChart1.UseDimension := xhcColumns;
end;

procedure TfrmCubo.SpeedButton1Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        HierCubeGridExportToPDF1.ExportToFile(sTempDirUsuario + 'cubo.pdf');
        ShellExecute(handle,'open', pchar(sTempDirUsuario + 'cubo.pdf'),'', nil, sw_shownormal);
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        ChartPreview(Self,TCustomChart(xChart1));
    end;
end;

procedure TfrmCubo.SpeedButton2Click(Sender: TObject);
begin
    EditChart(Self,TCustomChart(xChart1));
end;

procedure TfrmCubo.SpeedButton4Click(Sender: TObject);
begin
    ChangeAllSeriesGallery(Self, TCustomChart(xChart1));
end;

procedure TfrmCubo.SpeedButton5Click(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then
    begin
        HierCubeGridExportToPDF1.ExportToFile(sTempDirUsuario + 'cubo.pdf');
        EnviaMail(sTempDirUsuario + 'cubo.pdf',HCLResourceStrings.FindID('sString_320') + Memo1.Lines.Strings[2]);
    end;

    if PageControl1.ActivePageIndex = 1 then
    begin
        xChart1.SaveToMetafile(sTempDirUsuario + 'analyzer.wmf');
        EnviaMail(sTempDirUsuario + 'analyzer.wmf',HCLResourceStrings.FindID('sString_232') + Memo1.Lines.Strings[2]);
    end;
end;

procedure TfrmCubo.SpeedButton6Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
       HierCubeGridExportToExcel1.ExportToFile(SaveDialog1.FileName);
end;

procedure TfrmCubo.GridDrawCell(Sender: TObject; Args: TDrawCellEventArgs);
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

procedure TfrmCubo.GridDrawDataCell(Sender: TObject; Col, Row: Integer;
  var Value: String; var aFont: TFont; var aColor: TColor;
  AState: TGridDrawState);
var
  GridInfo: TGridInfo;
  ColNode, RowNode: TLabelNode;
begin
  GridInfo := (Sender as THierCubeGrid).GridInfo;
  if GridInfo = nil then EXIT;
  ColNode := GridInfo.Col2LabelNode(Col);
  RowNode := GridInfo.Row2LabelNode(Row);
  if ColNode <> nil then
  if ColNode.IsSubTotal then aColor := $00D6F4F8;
  if RowNode <> nil then
  if RowNode.IsSubTotal then aColor := $00D6F4F8;
end;

procedure TfrmCubo.GridDrawLabelCell(Sender: TObject; var Value: AnsiString;
  var aFont: TFont; var aColor: TColor; LabelNode: TLabelNode);
begin
  if LabelNode.Expandable then aFont.Color := clBlue;
  if LabelNode.IsSubTotal then aFont.Color := clPurple;
end;

procedure TfrmCubo.GridEditFactTable(Sender: TObject;
  ModifiedRecords: TDataSet; var Accept: Boolean);
begin
  Accept := True;
end;

function TfrmCubo.MyColAnterior(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
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

function TfrmCubo.MyColPercentCalculator(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
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

function TfrmCubo.CurvaABC1(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
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

procedure TfrmCubo.GridGetSubFunctionCalculator(Sender: TObject;
  SubFun: TSubFunction; var Calculator: TSubFunctionCalculator);
begin
  if SubFun = sstCustom1 then Calculator := MyColPercentCalculator;
  if SubFun = sstCustom2 then Calculator := CurvaABC1;
  if SubFun = sstCustom3 then Calculator := MyColAnterior;
end;

procedure TfrmCubo.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 1 then
    begin
        RadioGroup1.Enabled  := True;
        SpeedButton1.Enabled := True;
        SpeedButton2.Enabled := True;
        SpeedButton4.Enabled := True;
        SpeedButton5.Enabled := True;
        SpeedButton6.Enabled := False;
    end
    else
    begin
        RadioGroup1.Enabled  := False;
        SpeedButton2.Enabled := False;
        SpeedButton4.Enabled := False;
        SpeedButton1.Enabled := True;
        SpeedButton5.Enabled := True;
        SpeedButton6.Enabled := True;
    end;
end;

procedure TfrmCubo.GridCustomDrawCell(Sender: TObject;
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

Initialization
Begin
    SetLanguage(1, nil);
end;

end.

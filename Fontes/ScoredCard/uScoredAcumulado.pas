unit uScoredAcumulado;

interface

uses
  xhConsts, cxTLExportLink, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtons, ExtCtrls,
  cxStyles, cxTL, cxCheckBox,
  DB, ADODB, cxLabel,
  cxDropDownEdit, AbRMeter, _GClass, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxCustomData, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, StdCtrls,
  cxMaskEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmScoredAcumulado = class(TForm)
    Panel1: TPanel;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxComboBox2: TcxComboBox;
    cxLabel2: TcxLabel;
    ADOQuery1: TADOQuery;
    Label2: TcxLabel;
    ComboBox2: TcxComboBox;
    Panel6: TPanel;
    Panel7: TPanel;
    imgAmarela: TImage;
    imgVermelha: TImage;
    imgVerde: TImage;
    Panel8: TPanel;
    mValor: TAb270Meter;
    mPercMaximo: TAb180Meter;
    mPercMinimo: TAb180Meter;
    Panel9: TPanel;
    SpeedButton9: TcxButton;
    cxButton7: TcxButton;
    cxButton1: TcxButton;
    SpeedButton5: TcxButton;
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxCheckBox1: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ComboBox2PropertiesChange(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MontaAno(Ano: integer);
    procedure MontaDash;
    procedure MontaData(DataIni, DataFim, Titulo: string);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : integer;
    iIndex  : integer;
  end;

var
  frmScoredAcumulado: TfrmScoredAcumulado;
  ValorScored : Double;
  ValorMinimo : Double;
  ValorMaximo : Double;

implementation

uses uMostraScored, uFuncoes, uAguarde,
  uPainel;

{$R *.dfm}

procedure TfrmScoredAcumulado.ComboBox2PropertiesChange(Sender: TObject);
begin
   try
      cxTreeList1.Styles.StyleSheet := frmMostraScored.cxStyleRepository3.StyleSheets[ComboBox2.ItemIndex];
   except
      cxTreeList1.Styles.StyleSheet := nil;
   end;
end;

procedure TfrmScoredAcumulado.cxButton1Click(Sender: TObject);
begin
    if frmMostraScored.SaveDialog1.Execute then
    begin
        cxTreeList1.Columns[02].Visible := False;
        cxTreeList1.Columns[12].Visible := True;

        cxTreeList1.Columns[02].Position.ColIndex := 12;
        cxTreeList1.Columns[12].Position.ColIndex := 02;

        cxExportTLToExcel(frmMostraScored.SaveDialog1.FileName,cxTreeList1);

        cxTreeList1.Columns[12].Visible := False;
        cxTreeList1.Columns[02].Visible := True;

        cxTreeList1.Columns[12].Position.ColIndex := 12;
        cxTreeList1.Columns[02].Position.ColIndex := 02;
    end;
end;

procedure TfrmScoredAcumulado.cxButton7Click(Sender: TObject);
begin
    if frmPainel <> Nil then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_15'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmPainel := TfrmPainel.Create(Self);

    frmPainel.iTipo    := 1;
    frmPainel.iIndex   := iIndex;
    frmPainel.Caption  := cxTreeList1.AbsoluteItems[iIndex].Values[0];
    frmPainel.valor    := cxTreeList1.AbsoluteItems[iIndex].Values[1];
    frmPainel.minimo   := cxTreeList1.AbsoluteItems[iIndex].Values[3];
    frmPainel.maximo   := cxTreeList1.AbsoluteItems[iIndex].Values[4];
    frmPainel.sScored  := frmMostraScored.tblScoredCardID_SCORED.Value;

    frmPainel.ShowModal;
    FreeAndNil(frmPainel);
end;

procedure TfrmScoredAcumulado.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        Panel6.Visible := True;
        MontaDash;
    end
    else
       Panel6.Visible := False;
end;

procedure TfrmScoredAcumulado.cxComboBox2PropertiesChange(Sender: TObject);
begin
    frmAguarde           := TfrmAguarde.Create(Self);
//    frmAguarde.cMensagem := sString_291;
    frmAguarde.cxProgressBar1.Visible := True;
    frmAguarde.cxProgressBar1.Properties.Max := cxTreeList1.AbsoluteCount;
    frmAguarde.Show;
    frmAguarde.Update;

    if cxComboBox2.Text = '' then
       exit;

    if Tipo = 0 then //ano
       MontaAno(StrToInt(cxComboBox2.Text));

    if Tipo = 1 then //Semestre
       MontaAno(StrToInt(tbGetLongStr(cxComboBox2.Text,'/')));

    if Tipo = 2 then //Trimestre
       MontaAno(StrToInt(tbGetLongStr(cxComboBox2.Text,'/')));

   if cxCheckBox1.Checked then
      MontaDash;

    FreeAndNil(frmAguarde);
end;

procedure TfrmScoredAcumulado.cxTreeList1FocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
    try
       iIndex := AFocusedNode.AbsoluteIndex;

       if cxCheckBox1.Checked then
          MontaDash;
    except
    end;
end;

procedure TfrmScoredAcumulado.MontaDash;
var
    max : double;
    min : double;
    minimo : double;
    maximo : double;
    valor  : double;
    PercMinimo : double;
    PercMaximo : double;
begin
    imgVerde.Visible    := False;
    imgAmarela.Visible  := False;
    imgVermelha.Visible := False;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 0 then
       imgVerde.Visible := True;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 1 then
       imgAmarela.Visible := True;

    if cxTreeList1.AbsoluteItems[iIndex].Values[2] = 2 then
       imgVermelha.Visible := True;

 // Valor

    valor    := cxTreeList1.AbsoluteItems[iIndex].Values[1];
    minimo   := cxTreeList1.AbsoluteItems[iIndex].Values[3];
    maximo   := cxTreeList1.AbsoluteItems[iIndex].Values[4];

    min := 0;
    max := maximo + (maximo - minimo);

    if valor > max then
       max := valor;

    if valor < min then
       min := valor;

    mValor.LimitLower                 := min - 1;
    mValor.LimitUpper                 := max + 1;
    mValor.SignalSettings.ValueFrom   := min;
    mValor.SignalSettings.ValueTo     := max;
    mValor.SectorSettings.Sector1From := 0;

    if max <> 0 then
       mValor.SectorSettings.Sector1To := Round((minimo * 100 / max) * 10)
    else
       mValor.SectorSettings.Sector1To := 0;

    mValor.SectorSettings.Sector2From := mValor.SectorSettings.Sector1To + 1;

    if max <> 0 then
       mValor.SectorSettings.Sector2To := Round((maximo * 100 / max) * 10)
    else
       mValor.SectorSettings.Sector2To := 0;

    mValor.SectorSettings.Sector3From := mValor.SectorSettings.Sector2To + 1;
    mValor.SectorSettings.Sector3To   := 1000;
    mValor.Value                      := valor;

    if cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
    begin
        mValor.SectorSettings.Sector1Color := clGreen;
        mValor.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mValor.SectorSettings.Sector1Color := clRed;
        mValor.SectorSettings.Sector3Color := clGreen;
    end;

// Percentual Minimo

    if minimo <> 0 then
       PercMinimo := valor * 100 / minimo
    else
       PercMinimo := 0;

    mPercMinimo.SignalSettings.ValueFrom    := 0;
    mPercMinimo.SignalSettings.ValueTo      := 100;

    if PercMinimo < 0 then
       mPercMinimo.SignalSettings.ValueFrom := PercMinimo;

    if PercMinimo > 100 then
       mPercMinimo.SignalSettings.ValueTo   := PercMinimo;

    mPercMinimo.LimitUpper                  := PercMinimo + 1;
    mPercMinimo.Value                       := PercMinimo;

    if cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
    begin
        mPercMinimo.SectorSettings.Sector1Color := clGreen;
        mPercMinimo.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mPercMinimo.SectorSettings.Sector1Color := clRed;
        mPercMinimo.SectorSettings.Sector3Color := clGreen;
    end;

// Perc. Máximo

    if maximo <> 0 then
       PercMaximo := valor * 100 / maximo
    else
       PercMaximo := 0;

    mPercMaximo.SignalSettings.ValueFrom    := 0;
    mPercMaximo.SignalSettings.ValueTo      := 100;

    if PercMaximo < 0 then
       mPercMaximo.SignalSettings.ValueFrom := PercMaximo;
    if PercMaximo > 100 then
       mPercMaximo.SignalSettings.ValueTo   := PercMaximo;

    mPercMaximo.LimitUpper                  := PercMaximo + 1;
    mPercMaximo.Value                       := PercMaximo;

    if cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
    begin
        mPercMaximo.SectorSettings.Sector1Color := clGreen;
        mPercMaximo.SectorSettings.Sector3Color := clRed;
    end
    else
    begin
        mPercMaximo.SectorSettings.Sector1Color := clRed;
        mPercMaximo.SectorSettings.Sector3Color := clGreen;
    end;

    mValor.SignalSettings.Name1      := cxTreeList1.Columns[1].Caption.Text;
    mPercMinimo.SignalSettings.Name1 := cxTreeList1.Columns[5].Caption.Text;
    mPercMaximo.SignalSettings.Name1 := cxTreeList1.Columns[6].Caption.Text;
end;

procedure TfrmScoredAcumulado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmScoredAcumulado.FormCreate(Sender: TObject);
begin
    iIndex := 0;
end;

procedure TfrmScoredAcumulado.FormShow(Sender: TObject);
var
    aux : string;
    i : integer;
    sAux : string;
begin
    if Tipo = 0 then // Ano
       Self.Caption := HCLResourceStrings.FindID('sString_223'); //'Acumulado Por Ano';

    if Tipo = 1 then // Semestre
       Self.Caption := HCLResourceStrings.FindID('sString_225'); //'Acumulado Por Semestre';

    if Tipo = 2 then // Trimestre
       Self.Caption := HCLResourceStrings.FindID('sString_263'); //'Acumulado Por Trimestre';

    ComboBox2.Properties.Items.Clear;
    for i := 0 to frmMostraScored.cxStyleRepository3.StyleSheetCount - 1 do
        ComboBox2.Properties.Items.Add(frmMostraScored.cxStyleRepository3.StyleSheets[i].Caption);

    ComboBox2.Text := LePadraoString(frmMostraScored.bdDados,
                                'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                                frmMostraScored.sUsuario,
                                'frmScoredAcumulado',
                                'ComboBox2');
    cxComboBox2.Properties.Items.Clear;

    if Tipo = 0 then //Ano
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT Year([_Data_]) AS Expr1');
            ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('GROUP BY Year([_Data_])');
            ADOQuery1.SQL.Add('ORDER BY Year([_Data_]) DESC');
        end;

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT Year(`_Data_`) AS Expr1');
            ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('GROUP BY Year(`_Data_`)');
            ADOQuery1.SQL.Add('ORDER BY Year(`_Data_`) DESC');
        end;

        ADOQuery1.Open;
        ADOQuery1.First;
        aux := ADOQuery1.Fields[0].AsString;
        while not ADOQuery1.Eof do
        begin
            cxComboBox2.Properties.Items.Add(ADOQuery1.Fields[0].AsString);
            ADOQuery1.Next;
        end;
        ADOQuery1.Close;
    end;

    if Tipo = 1 then //Semestre
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT Month([_Data_]) & "/" & Year([_Data_]) AS Expr1, [_Data_]');
            ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('GROUP BY Month([_Data_]) & "/" & Year([_Data_]), [_Data_]');
            ADOQuery1.SQL.Add('ORDER BY [_Data_] DESC');
        end;

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT CONCAT(Month(`_Data_`),"/",Year(`_Data_`)) AS Expr1, `_Data_`');
            ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('GROUP BY CONCAT(Month(`_Data_`),"/",Year(`_Data_`)), `_Data_`');
            ADOQuery1.SQL.Add('ORDER BY `_Data_` DESC');
        end;

        ADOQuery1.Open;
        ADOQuery1.First;

        aux := '';

        while not ADOQuery1.Eof do
        begin
            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '1') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '2') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '3') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '4') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '5') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '6') then
                if cxComboBox2.Properties.Items.IndexOf('01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '7') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '8') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '9') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '10') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '11') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '12') then
                if cxComboBox2.Properties.Items.IndexOf('02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            ADOQuery1.Next;
        end;
        ADOQuery1.Close;
    end;

    if Tipo = 2 then //Trimestre
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            ADOQuery1.SQL.Add('SELECT Month([_Data_]) & "/" & Year([_Data_]) AS Expr1, [_Data_]');
            ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
            ADOQuery1.SQL.Add('GROUP BY Month([_Data_]) & "/" & Year([_Data_]), [_Data_]');
            ADOQuery1.SQL.Add('ORDER BY [_Data_] DESC');
        end;

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
        begin
            ADOQuery1.SQL.Add('SELECT CONCAT(Month(`_Data_`), "/", Year(`_Data_`)) AS Expr1, `_Data_`');
            ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
            ADOQuery1.SQL.Add('GROUP BY CONCAT(Month(`_Data_`), "/", Year(`_Data_`)), `_Data_`');
            ADOQuery1.SQL.Add('ORDER BY `_Data_` DESC');
        end;

        ADOQuery1.Open;
        ADOQuery1.First;

        aux := '';

        while not ADOQuery1.Eof do
        begin
            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '1') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '2') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '3') then
                if cxComboBox2.Properties.Items.IndexOf('01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '01/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '4') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '5') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '6') then
                if cxComboBox2.Properties.Items.IndexOf('02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '02/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '7') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '8') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '9') then
                if cxComboBox2.Properties.Items.IndexOf('03/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('03/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '03/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            if (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '10') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '11') or
               (tbGetShortStr(ADOQuery1.Fields[0].AsString,'/') = '12') then
                if cxComboBox2.Properties.Items.IndexOf('04/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/')) < 0 then
                begin
                    cxComboBox2.Properties.Items.Add('04/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/'));

                    if aux = '' then
                       aux := '04/' + tbGetLongStr(ADOQuery1.Fields[0].AsString,'/');
                end;

            ADOQuery1.Next;
        end;
        ADOQuery1.Close;
    end;

    cxComboBox2.Text := aux;

    sAux := LePadraoString(frmMostraScored.bdDados,
                      'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                      frmMostraScored.sUsuario,
                      'frmScoredAcumulado',
                      'cxCheckBox1');

    if sAux = 'S' then
       cxCheckBox1.Checked := True
    else
       cxCheckBox1.Checked := False;

    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmScoredAcumulado.MontaAno(Ano: integer);
var
    i      : integer;
    valor1 : double;
    valor2 : double;
    valor3 : double;
begin
    for i := 0 to cxTreeList1.AbsoluteCount - 1 do
    begin
        frmAguarde.cxProgressBar1.Position := frmAguarde.cxProgressBar1.Position + 1;
        frmAguarde.Update;

        valor1 := 0;
        valor2 := 0;
        valor3 := 0;

        if Tipo = 0 then // ano
        begin
            MontaData('01/01/' + IntToStr(Ano),'31/01/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/02/' + IntToStr(Ano),'28/02/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/03/' + IntToStr(Ano),'31/03/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/04/' + IntToStr(Ano),'30/04/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/05/' + IntToStr(Ano),'31/05/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/06/' + IntToStr(Ano),'30/06/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/07/' + IntToStr(Ano),'31/07/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/08/' + IntToStr(Ano),'31/08/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/09/' + IntToStr(Ano),'30/09/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/10/' + IntToStr(Ano),'31/10/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/11/' + IntToStr(Ano),'30/11/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;

            MontaData('01/12/' + IntToStr(Ano),'31/12/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
            valor1 := valor1 + ValorScored;
            valor2 := valor2 + ValorMinimo;
            valor3 := valor3 + ValorMaximo;
        end;

        if Tipo = 1 then // Semestre
        begin
            if tbGetShortStr(cxComboBox2.Text,'/') = '01' then
            begin
                MontaData('01/01/' + IntToStr(Ano),'31/01/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/02/' + IntToStr(Ano),'28/02/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/03/' + IntToStr(Ano),'31/03/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/04/' + IntToStr(Ano),'30/04/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/05/' + IntToStr(Ano),'31/05/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/06/' + IntToStr(Ano),'30/06/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;

            if tbGetShortStr(cxComboBox2.Text,'/') = '02' then
            begin
                MontaData('01/07/' + IntToStr(Ano),'31/07/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/08/' + IntToStr(Ano),'31/08/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/09/' + IntToStr(Ano),'30/09/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/10/' + IntToStr(Ano),'31/10/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/11/' + IntToStr(Ano),'30/11/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/12/' + IntToStr(Ano),'31/12/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;
        end;

        if Tipo = 2 then // Trimestre
        begin
            if tbGetShortStr(cxComboBox2.Text,'/') = '01' then
            begin
                MontaData('01/01/' + IntToStr(Ano),'31/01/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/02/' + IntToStr(Ano),'28/02/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/03/' + IntToStr(Ano),'31/03/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;

            if tbGetShortStr(cxComboBox2.Text,'/') = '02' then
            begin
                MontaData('01/04/' + IntToStr(Ano),'30/04/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/05/' + IntToStr(Ano),'31/05/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/06/' + IntToStr(Ano),'30/06/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;

            if tbGetShortStr(cxComboBox2.Text,'/') = '03' then
            begin
                MontaData('01/07/' + IntToStr(Ano),'31/07/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/08/' + IntToStr(Ano),'31/08/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
                MontaData('01/09/' + IntToStr(Ano),'30/09/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);

                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;

            if tbGetShortStr(cxComboBox2.Text,'/') = '04' then
            begin
                MontaData('01/10/' + IntToStr(Ano),'31/10/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/11/' + IntToStr(Ano),'30/11/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;

                MontaData('01/12/' + IntToStr(Ano),'31/12/' + IntToStr(Ano),cxTreeList1.AbsoluteItems[i].Values[0]);
                valor1 := valor1 + ValorScored;
                valor2 := valor2 + ValorMinimo;
                valor3 := valor3 + ValorMaximo;
            end;
        end;

        cxTreeList1.AbsoluteItems[i].Values[1]  := FloatToStr(valor1);
        cxTreeList1.AbsoluteItems[i].Values[3]  := FloatToStr(valor2);
        cxTreeList1.AbsoluteItems[i].Values[4]  := FloatToStr(valor3);
        cxTreeList1.AbsoluteItems[i].Values[7]  := FloatToStr(valor2 - valor1);
        cxTreeList1.AbsoluteItems[i].Values[8]  := FloatToStr(valor3 - valor1);

        if valor2 <> 0 then
        begin
            cxTreeList1.AbsoluteItems[i].Values[5]  := FloatToStr(valor1 * 100 / valor2);
            cxTreeList1.AbsoluteItems[i].Values[9]  := FloatToStr((valor2 - valor1) * 100 / valor2);
        end
        else
        begin
            cxTreeList1.AbsoluteItems[i].Values[5]  := '0';
            cxTreeList1.AbsoluteItems[i].Values[9]  := '0';
        end;

        if valor3 <> 0 then
        begin
            cxTreeList1.AbsoluteItems[i].Values[6]  := FloatToStr(valor1 * 100 / valor3);
            cxTreeList1.AbsoluteItems[i].Values[10] := FloatToStr((valor3 - valor1) * 100 / valor3);
        end
        else
        begin
            cxTreeList1.AbsoluteItems[i].Values[6]  := '0';
            cxTreeList1.AbsoluteItems[i].Values[10] := '0';
        end;

        if cxTreeList1.AbsoluteItems[i].Values[11] = 'C' then
        begin
            if valor1 < valor2 then
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '2';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Ruim';
            end
            else
            if valor1 > valor3 then
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '0';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Bom';
            end
            else
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '1';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Regular';
            end;
        end
        else
        begin
            if valor1 < valor2 then
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '0';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Bom';
            end
            else
            if valor1 > valor3 then
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '2';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Ruim';
            end
            else
            begin
                cxTreeList1.AbsoluteItems[i].Values[2]   := '1';
                cxTreeList1.AbsoluteItems[i].Values[12]  := 'Regular';
            end;
        end;
    end;
end;

procedure TfrmScoredAcumulado.MontaData(DataIni, DataFim, Titulo: string);
var
  auxIni: string;
  auxFim: string;
begin
    ValorScored := 0;
    ValorMinimo := 0;
    ValorMaximo := 0;

    frmScoredAcumulado.ADOQuery1.Close;
    frmScoredAcumulado.ADOQuery1.SQL.Clear;

    if (frmMostraScored.sSGBD = 'Microsoft Access 2007') or
       (frmMostraScored.sSGBD = 'Microsoft Access 2010') then
    begin
        frmScoredAcumulado.ADOQuery1.SQL.Add('SELECT TOP 1 [_Titulo_], [_Valor_], [_ValorMinimo_], [_ValorMaximo_], [_Data_]');
        frmScoredAcumulado.ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        frmScoredAcumulado.ADOQuery1.SQL.Add('WHERE [_Data_]   >= CVDATE(' + #39 + DataIni + #39 + ')');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   [_Data_]   <= CVDATE(' + #39 + DataFim + #39 + ')');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   [_Titulo_]  = ' + #39 + Titulo + #39);
        frmScoredAcumulado.ADOQuery1.SQL.Add('ORDER BY [_Data_] DESC');
    end;

    if (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
    begin
        frmScoredAcumulado.ADOQuery1.SQL.Add('SELECT TOP 1 [_Titulo_], [_Valor_], [_ValorMinimo_], [_ValorMaximo_], [_Data_]');
        frmScoredAcumulado.ADOQuery1.SQL.Add('FROM [_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + ']');
        frmScoredAcumulado.ADOQuery1.SQL.Add('WHERE [_Data_]   >= CONVERT(DATETIME,' + #39 + DataIni + #39 + ',103)');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   [_Data_]   <= CONVERT(DATETIME,' + #39 + DataFim + #39 + ',103)');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   [_Titulo_]  = ' + #39 + Titulo + #39);
        frmScoredAcumulado.ADOQuery1.SQL.Add('ORDER BY [_Data_] DESC');
    end;

    if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
    begin
        auxIni := #39 + NumEntry(3, DataIni, '/') + '-' +
                        NumEntry(2, DataIni, '/') + '-' +
                        NumEntry(1, DataIni, '/') + #39;

        auxFim := #39 + NumEntry(3, DataFim, '/') + '-' +
                        NumEntry(2, DataFim, '/') + '-' +
                        NumEntry(1, DataFim, '/') + #39;

        frmScoredAcumulado.ADOQuery1.SQL.Add('SELECT _Titulo_, _Valor_, _ValorMinimo_, _ValorMaximo_, _Data_');
        frmScoredAcumulado.ADOQuery1.SQL.Add('FROM `_ScoredCard_' + uppercase(frmMostraScored.tblScoredCardID_SCORED.Value) + '`');
        frmScoredAcumulado.ADOQuery1.SQL.Add('WHERE _Data_   >= CAST(' + auxIni + ' AS DATE)');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   _Data_   <= CAST(' + auxFim + ' AS DATE)');
        frmScoredAcumulado.ADOQuery1.SQL.Add('AND   _Titulo_  = ' + #39 + Titulo + #39);
        frmScoredAcumulado.ADOQuery1.SQL.Add('ORDER BY _Data_ DESC');
        frmScoredAcumulado.ADOQuery1.SQL.Add('LIMIT 0,1');
    end;

    frmScoredAcumulado.ADOQuery1.Open;
    frmScoredAcumulado.ADOQuery1.First;

    if not frmScoredAcumulado.ADOQuery1.IsEmpty then
    begin
        ValorScored := frmScoredAcumulado.ADOQuery1.Fields[1].AsCurrency;
        ValorMinimo := frmScoredAcumulado.ADOQuery1.Fields[2].AsCurrency;
        ValorMaximo := frmScoredAcumulado.ADOQuery1.Fields[3].AsCurrency;
    end;

    frmScoredAcumulado.ADOQuery1.Close;
end;

procedure TfrmScoredAcumulado.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmScoredAcumulado.SpeedButton3Click(Sender: TObject);
begin
    frmMostraScored.dxComponentPrinter.CurrentLinkIndex := 2;
    frmMostraScored.dxComponentPrinter.PrintTitle := Self.Caption;
    frmMostraScored.dxComponentPrinter.Preview(True,nil);
end;

procedure TfrmScoredAcumulado.SpeedButton5Click(Sender: TObject);
begin
    cxTreeList1.Columns[02].Visible := False;
    cxTreeList1.Columns[12].Visible := True;

    cxTreeList1.Columns[02].Position.ColIndex := 12;
    cxTreeList1.Columns[12].Position.ColIndex := 02;

    cxExportTLToHTML(frmMostraScored.sTempDirUsuario + 'analyzer.html',cxTreeList1);
    EnviaMail(frmMostraScored.sTempDirUsuario + 'analyzer.html',Self.Caption);

    cxTreeList1.Columns[12].Visible := False;
    cxTreeList1.Columns[02].Visible := True;

    cxTreeList1.Columns[12].Position.ColIndex := 12;
    cxTreeList1.Columns[02].Position.ColIndex := 02;
end;

procedure TfrmScoredAcumulado.SpeedButton9Click(Sender: TObject);
begin
    SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                 frmMostraScored.sUsuario,
                                 'frmScoredAcumulado',
                                 'ComboBox2',
                                 ComboBox2.Text);

    if cxCheckBox1.Checked then
       SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                    frmMostraScored.sUsuario,
                                    'frmScoredAcumulado',
                                    'cxCheckBox1',
                                    'S')
    else
       SalvaPadraoString(frmMostraScored.bdDados,
                 'ID_SCORED = ' + #39 + frmMostraScored.tblScoredCardID_SCORED.Value + #39,
                 'ID_SCORED',
                 frmMostraScored.tblScoredCardID_SCORED.Value,
                                    frmMostraScored.sUsuario,
                                    'frmScoredAcumulado',
                                    'cxCheckBox1',
                                    'N');

    MessageDlg(HCLResourceStrings.FindID('sString_335'), mtInformation, [mbOK], 0);
end;

end.

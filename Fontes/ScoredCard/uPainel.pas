unit uPainel;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  cxButtons,
  ExtCtrls, _GClass, AbRMeter,
  cxTextEdit, cxLabel,
  cxCurrencyEdit, cxDropDownEdit, cxImageComboBox, TeeProcs,
  TeEngine, Chart, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxMaskEdit;

type
  TfrmPainel = class(TForm)
    Panel3: TPanel;
    mValor: TAb270Meter;
    mPercMinimo: TAb180Meter;
    mPercMaximo: TAb180Meter;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxImageComboBox1: TcxImageComboBox;
    cxImageComboBox2: TcxImageComboBox;
    cxImageComboBox3: TcxImageComboBox;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cxCurrencyEdit4: TcxCurrencyEdit;
    cxCurrencyEdit5: TcxCurrencyEdit;
    cxCurrencyEdit6: TcxCurrencyEdit;
    cxCurrencyEdit7: TcxCurrencyEdit;
    cxCurrencyEdit8: TcxCurrencyEdit;
    cxCurrencyEdit9: TcxCurrencyEdit;
    Chart1: TChart;
    Panel1: TPanel;
    SpeedButton1: TcxButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Valor      : double;
    Minimo     : double;
    Maximo     : double;
    PercMinimo : double;
    PercMaximo : double;
    iIndex     : integer;
    sScored    : string;
    iTipo      : integer;
  end;

var
  frmPainel: TfrmPainel;

implementation

uses uMostraScored, uScoredAcumulado, uFuncoes;

{$R *.dfm}

procedure TfrmPainel.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmPainel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmPainel.FormShow(Sender: TObject);
var
    max : double;
    min : double;
begin
    try
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

        if iTipo = 0 then
        begin
            if frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
            begin
                mValor.SectorSettings.Sector1Color := clGreen;
                mValor.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mValor.SectorSettings.Sector1Color := clRed;
                mValor.SectorSettings.Sector3Color := clGreen;
            end;
        end;

        if iTipo = 1 then //Acumulado
        begin
            if frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
            begin
                mValor.SectorSettings.Sector1Color := clGreen;
                mValor.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mValor.SectorSettings.Sector1Color := clRed;
                mValor.SectorSettings.Sector3Color := clGreen;
            end;
        end;

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

        if iTipo = 0 then
        begin
            if frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
            begin
                mPercMinimo.SectorSettings.Sector1Color := clGreen;
                mPercMinimo.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mPercMinimo.SectorSettings.Sector1Color := clRed;
                mPercMinimo.SectorSettings.Sector3Color := clGreen;
            end;
        end;

        if iTipo = 1 then // Acumulado
        begin
            if frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
            begin
                mPercMinimo.SectorSettings.Sector1Color := clGreen;
                mPercMinimo.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mPercMinimo.SectorSettings.Sector1Color := clRed;
                mPercMinimo.SectorSettings.Sector3Color := clGreen;
            end;
        end;

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

        if iTipo = 0 then
        begin
            if frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[18] = HCLResourceStrings.FindID('sString_305') then
            begin
                mPercMaximo.SectorSettings.Sector1Color := clGreen;
                mPercMaximo.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mPercMaximo.SectorSettings.Sector1Color := clRed;
                mPercMaximo.SectorSettings.Sector3Color := clGreen;
            end;

            cxTextEdit1.Text           := frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[0];
            cxCurrencyEdit1.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[1]);
            cxImageComboBox1.EditValue := frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[2];
            cxImageComboBox2.EditValue := frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[3];
            cxImageComboBox3.EditValue := frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[4];
            cxCurrencyEdit2.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[5]);
            cxCurrencyEdit3.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[6]);
            cxCurrencyEdit4.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[8]);
            cxCurrencyEdit5.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[7]);

            cxCurrencyEdit6.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[9]);
            cxCurrencyEdit7.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[10]);
            cxCurrencyEdit8.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[11]);
            cxCurrencyEdit9.Value      := StrToFloat(frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[12]);

            try
               frmMostraScored.cxComboBox1.Text := frmMostraScored.cxTreeList1.AbsoluteItems[iIndex].Values[0];
               //frmMostraScored.cxComboBox1.Properties.OnChange(Self);
               Chart1.AddSeries(frmMostraScored.Chart1.Series[0]);
               Chart1.View3D := False;
               Chart1.Series[0].Visible := True;
            except
            end;
        end;

        if iTipo = 1 then // Acumulado
        begin
            if frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[11] = HCLResourceStrings.FindID('sString_305') then
            begin
                mPercMaximo.SectorSettings.Sector1Color := clGreen;
                mPercMaximo.SectorSettings.Sector3Color := clRed;
            end
            else
            begin
                mPercMaximo.SectorSettings.Sector1Color := clRed;
                mPercMaximo.SectorSettings.Sector3Color := clGreen;
            end;

            cxTextEdit1.Text           := frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[0];
            cxCurrencyEdit1.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[1]);
            cxImageComboBox1.EditValue := frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[2];
            cxCurrencyEdit2.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[3]);
            cxCurrencyEdit3.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[4]);
            cxCurrencyEdit4.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[6]);
            cxCurrencyEdit5.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[5]);
            cxCurrencyEdit6.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[7]);
            cxCurrencyEdit7.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[8]);
            cxCurrencyEdit8.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[9]);
            cxCurrencyEdit9.Value      := StrToFloat(frmScoredAcumulado.cxTreeList1.AbsoluteItems[iIndex].Values[10]);

            Chart1.Visible := False;
        end;

        cxLabel1.Caption  := frmMostraScored.cxTreeList1.Columns[0].Caption.Text;
        cxLabel2.Caption  := frmMostraScored.cxTreeList1.Columns[1].Caption.Text;
        cxLabel3.Caption  := frmMostraScored.cxTreeList1.Columns[2].Caption.Text;
        cxLabel4.Caption  := frmMostraScored.cxTreeList1.Columns[3].Caption.Text;
        cxLabel5.Caption  := frmMostraScored.cxTreeList1.Columns[4].Caption.Text;
        cxLabel6.Caption  := frmMostraScored.cxTreeList1.Columns[5].Caption.Text;
        cxLabel7.Caption  := frmMostraScored.cxTreeList1.Columns[6].Caption.Text;
        cxLabel8.Caption  := frmMostraScored.cxTreeList1.Columns[7].Caption.Text;
        cxLabel9.Caption  := frmMostraScored.cxTreeList1.Columns[8].Caption.Text;
        cxLabel10.Caption := frmMostraScored.cxTreeList1.Columns[9].Caption.Text;
        cxLabel11.Caption := frmMostraScored.cxTreeList1.Columns[10].Caption.Text;
        cxLabel12.Caption := frmMostraScored.cxTreeList1.Columns[11].Caption.Text;
        cxLabel13.Caption := frmMostraScored.cxTreeList1.Columns[12].Caption.Text;

        mValor.SignalSettings.Name1      := frmMostraScored.cxTreeList1.Columns[1].Caption.Text;
        mPercMinimo.SignalSettings.Name1 := frmMostraScored.cxTreeList1.Columns[7].Caption.Text;
        mPercMaximo.SignalSettings.Name1 := frmMostraScored.cxTreeList1.Columns[8].Caption.Text;
    except
    end;

    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

end.

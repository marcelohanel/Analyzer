unit uCriaAnalise;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxTextEdit,
  cxLabel, ADODB, DB, cxButtons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls;

type
  TfrmCriaAnalise = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label2: TcxLabel;
    Edit1: TcxTextEdit;
    Label5: TcxLabel;
    Memo2: TcxMemo;
    ADOQuery1: TADOQuery;
    ADOCommand1: TADOCommand;
    cxLabel1: TcxLabel;
    edtGrupo: TcxTextEdit;
    tblAnalises: TADOTable;
    tblAnalisesID_ANALISE: TWideStringField;
    tblAnalisesDESCRICAO: TMemoField;
    tblAnalisesBASE_ORIGEM: TMemoField;
    tblAnalisesVISAO_ORIGEM: TWideStringField;
    tblAnalisesVISAO_DESTINO: TWideStringField;
    tblAnalisesINCREMENTAL: TWideStringField;
    tblAnalisesPODE_VISUALIZAR: TMemoField;
    tblAnalisesPODE_ALTERAR: TMemoField;
    tblAnalisesPODE_ATUALIZAR: TMemoField;
    tblAnalisesPODE_APAGAR: TMemoField;
    tblAnalisesDT_ATUALIZACAO: TDateTimeField;
    tblAnalisesINTERNA: TWideStringField;
    tblAnalisesANALISES_IGNORADOS: TMemoField;
    tblAnalisesVALORES_IGNORADOS: TMemoField;
    tblAnalisesGRID: TWideStringField;
    tblAnalisesGRUPO: TWideStringField;
    tblAnalisesDT_CRIACAO: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQL : string;
    FROM : string;
    Tipo : integer;
  end;

var
  frmCriaAnalise: TfrmCriaAnalise;

implementation

uses uAguarde, uFuncoes, uMostraScored;

{$R *.dfm}

procedure TfrmCriaAnalise.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmCriaAnalise.SpeedButton3Click(Sender: TObject);
var
    a         : integer;
    aux       : string;
    //analise   : string;
    comando   : string;
    vetCampos : array of string;
begin
    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_129'), mtInformation, [mbOK], 0);
        Exit;
    end;

    frmAguarde := TfrmAguarde.Create(Self);
    frmAguarde.cMensagem := HCLResourceStrings.FindID('sString_231');
    frmAguarde.Show;
    frmAguarde.Update;

    tblAnalises.Open;

    if Tipo = 0 then
    begin
       if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
          (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
          (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
          (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
          (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
          (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
          (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
           aux := SQL + ' INTO [_' + Edit1.Text + '] ' + FROM;

       if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
          aux := 'CREATE TABLE `_' + Edit1.Text + '` AS ' + SQL + ' ' + FROM;
    end;

    try
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := aux;
        ADOQuery1.ExecSQL;

        tblAnalises.Insert;
        tblAnalisesID_ANALISE.Value      := Edit1.Text;
        tblAnalisesGRUPO.Value           := edtGrupo.Text;
        tblAnalisesDESCRICAO.Value       := Memo2.Text;
        tblAnalisesBASE_ORIGEM.Value     := '.';
        tblAnalisesVISAO_ORIGEM.Value    := '.';
        tblAnalisesVISAO_DESTINO.Value   := '_' + Edit1.Text;
        tblAnalisesINCREMENTAL.Value     := 'N';
        tblAnalisesINTERNA.Value         := 'N';
        tblAnalisesGRID.Value            := 'S';
        tblAnalisesPODE_ALTERAR.Value    := frmMostraScored.sUsuario;
        tblAnalisesPODE_VISUALIZAR.Value := frmMostraScored.sUsuario;
        tblAnalisesPODE_ATUALIZAR.Value  := frmMostraScored.sUsuario;
        tblAnalisesPODE_APAGAR.Value     := frmMostraScored.sUsuario;
        tblAnalises.Post;

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;

        if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
           (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
           ADOQuery1.SQL.ADD('SELECT TOP 1 * FROM [_' + Edit1.Text + ']');

        if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
           ADOQuery1.SQL.ADD('SELECT * FROM `_' + Edit1.Text + '` LIMIT 0,1');

        ADOQuery1.Open;

        SetLength(vetCampos,2);
        for a := 0 to ADOQuery1.FieldCount - 1 do
        begin
            vetCampos[a] := ADOQuery1.Fields[a].FieldName;
            SetLength(vetCampos,length(vetCampos) + 1);
        end;
        ADOQuery1.Close;

        try
            for a := 0 to Length(vetCampos) - 3 do
            begin
                if (frmMostraScored.sSGBD = 'Microsoft Access 2007')        or
                   (frmMostraScored.sSGBD = 'Microsoft Access 2010')        or
                   (frmMostraScored.sSGBD = 'Microsoft SQL Server 2000')    or
                   (frmMostraScored.sSGBD = 'Microsoft SQL Server 2005')    or
                   (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008')    or
                   (frmMostraScored.sSGBD = 'Microsoft SQL Server 2008 R2') or
                   (frmMostraScored.sSGBD = 'Microsoft SQL Server 2012')    then
                   comando := 'CREATE INDEX [ix' + vetCampos[a] + '] ON [_' + Edit1.Text + '] ([' + vetCampos[a] + '])';

                if frmMostraScored.sSGBD = 'Sun MySQL 5.x' then
                   comando := 'CREATE INDEX `ix' + vetCampos[a] + '` ON `_' + Edit1.Text + '` (`' + vetCampos[a] + '`)';

                ADOCommand1.CommandText := comando;
                ADOCommand1.Execute;
            end;
        except
        end;
    except
      on E: Exception do
      begin
          MessageDlg(HCLResourceStrings.FindID('sString_130') +#13+#10 + HCLResourceStrings.FindID('sString_368') + E.Message, mtInformation, [mbOK], 0);
      end;
    end;

    tblAnalises.Close;

    FreeAndNil(frmAguarde);
    close;
end;

procedure TfrmCriaAnalise.FormShow(Sender: TObject);
begin
    GeraLog(frmMostraScored.bdDados,frmMostraScored.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmCriaAnalise.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

end.

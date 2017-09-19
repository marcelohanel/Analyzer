unit uWizardAnalise;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, AdoConEd,
  cxButtons, cxEdit,
  cxLabel, cxCheckBox, cxDropDownEdit, cxMemo, cxTextEdit, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls, cxContainer,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmWizardAnalise = class(TForm)
    Connection: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOCommand1: TADOCommand;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    SpeedButton1: TcxButton;
    SpeedButton2: TcxButton;
    SpeedButton3: TcxButton;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    Label5: TcxLabel;
    Edit1: TcxTextEdit;
    Edit2: TcxTextEdit;
    Memo1: TcxMemo;
    Memo2: TcxMemo;
    ComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    edtGrupo: TcxTextEdit;
    ADOQuery2: TADOQuery;
    CheckBox1: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CriaBaseDados;
    procedure AtualizaBaseDados;
    procedure Memo1Exit(Sender: TObject);
    procedure ComboBox1PropertiesInitPopup(Sender: TObject);
    procedure ExcluiBaseDados;
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo : string;
    lErro : boolean;
  end;

var
  frmWizardAnalise: TfrmWizardAnalise;

implementation

uses uAnalises, uFuncoes, uAtualiza;

{$R *.dfm}

procedure TfrmWizardAnalise.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmWizardAnalise.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmWizardAnalise.FormShow(Sender: TObject);
begin
    if Tipo = 'Criar' then
    begin
        Edit1.Clear;
        Memo1.Clear;
        ComboBox1.Clear;
        Edit2.Clear;
        Memo2.Clear;
        CheckBox1.Checked := False;
        edtGrupo.Clear;
    end
    else
    if Tipo = 'Alterar' then
    begin
        ComboBox1.Properties.Items.Add(frmAnalises.tblAnalisesVISAO_ORIGEM.Value);
        Edit1.Text     := frmAnalises.tblAnalisesID_ANALISE.Value;
        Memo2.Text     := frmAnalises.tblAnalisesDESCRICAO.Value;
        Memo1.Text     := frmAnalises.tblAnalisesBASE_ORIGEM.Value;
        ComboBox1.Text := frmAnalises.tblAnalisesVISAO_ORIGEM.Value;
        Edit2.Text     := frmAnalises.tblAnalisesVISAO_DESTINO.Value;
        edtGrupo.Text  := frmAnalises.tblAnalisesGRUPO.Value;

        if frmAnalises.tblAnalisesINCREMENTAL.Value = 'S' then
           CheckBox1.Checked := True
        else
           CheckBox1.Checked := False;

        if frmAnalises.tblAnalisesINTERNA.Value = 'S' then
           cxCheckBox1.Checked := True
        else
           cxCheckBox1.Checked := False;

        Memo1.Enabled         := False;
        ComboBox1.Enabled     := False;
        Edit2.Enabled         := False;
        Edit1.Enabled         := False;
        SpeedButton2.Enabled  := False;
    end;

    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmWizardAnalise.SpeedButton2Click(Sender: TObject);
begin
   Connection.Close;
   Connection.ConnectionString := Memo1.Text;
   if EditConnectionString(Connection) then
   begin
       Memo1.Text := Connection.ConnectionString;
       ComboBox1.Clear;
   end;
end;

procedure TfrmWizardAnalise.ExcluiBaseDados;
var
    comando : string;
begin
    try
        if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
           (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
        begin
            if frmAnalises.tblAnalisesGRID.Value = 'S' then
               comando := 'DROP TABLE [' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + ']'
            else
               comando := 'DROP TABLE [_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + ']';
        end;

        if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
        begin
            if frmAnalises.tblAnalisesGRID.Value = 'S' then
               comando := 'DROP TABLE `' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '`'
            else
               comando := 'DROP TABLE `_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '`';
        end;

        ADOCommand1.CommandText := comando;
        ADOCommand1.Execute;
    except
    end;
end;

procedure TfrmWizardAnalise.AtualizaBaseDados;
var
    i : integer;
    a : integer;
    comando : string;
    vetCampos : array of string;
begin
    lErro := True;

    Connection.Close;
    Connection.ConnectionString := frmAnalises.tblAnalisesBASE_ORIGEM.Value;
    Connection.Open;

    if frmAnalises.tblAnalisesINCREMENTAL.Value = 'N' then
    begin
        ExcluiBaseDados;
        frmAtualiza.pbGeral.Position := 1;
        frmAtualiza.Update;

        CriaBaseDados;
        frmAtualiza.pbGeral.Position := 2;
        frmAtualiza.Update;

        if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
           (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
           (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
           comando := 'DELETE FROM [_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + ']';

        if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
           comando := 'DELETE FROM `_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value + '`');

        ADOCommand1.CommandText := comando;
        ADOCommand1.Execute;
    end
    else
    begin
        try
             ADOQuery2.Close;
             ADOQuery2.SQL.Clear;

             if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
                (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
                (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
                (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
                (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
                (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
                (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
                ADOQuery2.SQL.Add('SELECT TOP 1 * FROM [_' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + ']');

             if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
             begin
                ADOQuery2.SQL.Add('SELECT * FROM `_' + frmAnalises.tblAnalisesVISAO_DESTINO.Value + '`');
                ADOQuery2.SQL.Add('LIMIT 0,1');
             end;

             ADOQuery2.Open;
             ADOQuery2.Close;
        except
            CriaBaseDados;
            frmAtualiza.pbGeral.Position := 2;
            frmAtualiza.Update;
        end;
    end;

    ADOTable2.Close;
    ADOTable2.TableName := frmAnalises.tblAnalisesVISAO_ORIGEM.Value;
    ADOTable2.Open;

    ADOTable1.Close;
    ADOTable1.TableName := '_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value);
    ADOTable1.Open;

    frmAtualiza.pbTarefa.Properties.Max := ADOTable2.RecordCount;
    frmAtualiza.Update;

    ADOTable2.First;
    while not ADOTable2.Eof do
    begin
        ADOTable1.Insert;
        for i := 0 to ADOTable2.FieldCount - 1 do
            ADOTable1.Fields[i].Value := ADOTable2.Fields[i].Value;
        ADOTable1.Post;

        ADOTable2.Next;

        frmAtualiza.pbTarefa.Position := frmAtualiza.pbTarefa.Position + 1;
        frmAtualiza.Update;
    end;

    SetLength(vetCampos,2);
    for a := 0 to ADOTable1.FieldCount - 1 do
    begin
        vetCampos[a] := ADOTable1.Fields[a].FieldName;
        SetLength(vetCampos,length(vetCampos) + 1);
    end;
    ADOTable1.Close;
    ADOTable2.Close;

    try
        for a := 0 to Length(vetCampos) - 3 do
        begin
            if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
               (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
               (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
               comando := 'CREATE INDEX [ix' + vetCampos[a] + '] ON [_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '] ([' + vetCampos[a] + '])';

            if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
               comando := 'CREATE INDEX `ix' + vetCampos[a] + '` ON `_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '` (`' + vetCampos[a] + '`)';

            ADOCommand1.CommandText := comando;
            ADOCommand1.Execute;
        end;
    except
    end;

    Connection.Close;

    lErro := False;
end;

procedure TfrmWizardAnalise.CriaBaseDados;
var
    comando : string;
    campos  : string;
    i       : integer;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;

    if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
       (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
       ADOQuery1.SQL.Add('SELECT * FROM [' + frmAnalises.tblAnalisesVISAO_ORIGEM.Value + ']');

    if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
       ADOQuery1.SQL.Add('SELECT * FROM `' + frmAnalises.tblAnalisesVISAO_ORIGEM.Value + '`');

    ADOQuery1.Open;

    i      := 0;
    campos := '';
    while i <= ADOQuery1.Fields.Count - 1 do
    begin
       if (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftSmallint) or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftInteger)  or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftWord)     or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftFloat)    or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftCurrency) or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftBCD)      or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftAutoInc)  or
          (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftLargeint) then
       begin
          if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
             (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
             (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
             campos := campos + '[' + ADOQuery1.Fields[i].FieldName + '] NUMERIC(16,4)';

          if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
             campos := campos + '`' + ADOQuery1.Fields[i].FieldName + '`' + ' FLOAT';

           if i < ADOQuery1.Fields.Count - 1 then
              campos := campos + ', ';
       end
       else
       begin
           if (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftDate)     or
              (ADOQuery1.FieldByName(ADOQuery1.Fields[i].FieldName).DataType = ftDateTime) then
           begin
               if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
                  (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
                  campos := campos + '[' + ADOQuery1.Fields[i].FieldName + '] DATETIME';

               if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
                  campos := campos + '`' + ADOQuery1.Fields[i].FieldName + '` DATETIME';

               if i < ADOQuery1.Fields.Count - 1 then
                  campos := campos + ', ';
           end
           else
           begin
               if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
                  (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
                  (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
                  campos := campos + '[' + ADOQuery1.Fields[i].FieldName + '] VARCHAR(100)';

               if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
                  campos := campos + '`' + ADOQuery1.Fields[i].FieldName + '` VARCHAR(100)';

               if i < ADOQuery1.Fields.Count - 1 then
                  campos := campos + ', ';
           end;
       end;

       i := i + 1;
    end;
    ADOQuery1.Close;

    if (frmAnalises.sSGBD = 'Microsoft Access 2007')        or
       (frmAnalises.sSGBD = 'Microsoft Access 2010')        or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2000')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2005')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2008')    or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2008 R2') or
       (frmAnalises.sSGBD = 'Microsoft SQL Server 2012')    then
       comando := 'CREATE TABLE [_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '] (' + campos + ')';

    if frmAnalises.sSGBD = 'Sun MySQL 5.x' then
       comando := 'CREATE TABLE `_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value) + '` (' + campos + ')';

    ADOCommand1.CommandText := comando;
    ADOCommand1.Execute;
end;

procedure TfrmWizardAnalise.SpeedButton3Click(Sender: TObject);
begin
    if Edit2.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_19'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Edit1.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_21'), mtWarning, [mbOK], 0);
        Exit;
    end;

    if Tipo = 'Criar' then
       frmAnalises.tblAnalises.Insert;

    if Tipo = 'Alterar' then
       frmAnalises.tblAnalises.Edit;

    frmAnalises.tblAnalisesID_ANALISE.Value        := Edit1.Text;
    frmAnalises.tblAnalisesDESCRICAO.Value         := Memo2.Text;
    frmAnalises.tblAnalisesGRUPO.Value             := edtGrupo.Text;

    if Memo1.Text = '' then
       frmAnalises.tblAnalisesBASE_ORIGEM.Value    := '.'
    else
       frmAnalises.tblAnalisesBASE_ORIGEM.Value    := Memo1.Text;

    if ComboBox1.Text = '' then
       frmAnalises.tblAnalisesVISAO_ORIGEM.Value   := '.'
    else
       frmAnalises.tblAnalisesVISAO_ORIGEM.Value   := ComboBox1.Text;

    frmAnalises.tblAnalisesVISAO_DESTINO.Value     := Edit2.Text;

    if CheckBox1.Checked = True then
       frmAnalises.tblAnalisesINCREMENTAL.Value := 'S'
    else
       frmAnalises.tblAnalisesINCREMENTAL.Value := 'N';

    if cxCheckBox1.Checked = True then
       frmAnalises.tblAnalisesINTERNA.Value := 'S'
    else
       frmAnalises.tblAnalisesINTERNA.Value := 'N';

    if Tipo = 'Criar' then
    begin
        if frmAnalises.sUsuario <> 'admin' then
        begin
            frmAnalises.tblAnalisesPODE_ATUALIZAR.Value  := frmAnalises.sUsuario + ', admin';
            frmAnalises.tblAnalisesPODE_VISUALIZAR.Value := frmAnalises.sUsuario + ', admin';
            frmAnalises.tblAnalisesPODE_ALTERAR.Value    := frmAnalises.sUsuario + ', admin';
            frmAnalises.tblAnalisesPODE_APAGAR.Value     := frmAnalises.sUsuario + ', admin';
        end
        else
        begin
            frmAnalises.tblAnalisesPODE_ATUALIZAR.Value  := frmAnalises.sUsuario;
            frmAnalises.tblAnalisesPODE_VISUALIZAR.Value := frmAnalises.sUsuario;
            frmAnalises.tblAnalisesPODE_ALTERAR.Value    := frmAnalises.sUsuario;
            frmAnalises.tblAnalisesPODE_APAGAR.Value     := frmAnalises.sUsuario;
        end;
    end;

    frmAnalises.tblAnalises.Post;

    Close;
end;

procedure TfrmWizardAnalise.Memo1Exit(Sender: TObject);
begin
   Connection.Close;
   Connection.ConnectionString := Memo1.Text;
   ComboBox1.Clear;
end;

procedure TfrmWizardAnalise.ComboBox1PropertiesInitPopup(Sender: TObject);
begin
    if Memo1.Text <> '' then
    begin
        ComboBox1.Clear;
        Connection.GetTableNames(ComboBox1.Properties.Items);
    end;
end;

end.

unit uCopiarPadroes;

interface

uses
  xhConsts, ADODB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,





  cxTextEdit, cxDropDownEdit, cxEdit,
  cxLabel, cxButtons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, StdCtrls;

type
  TfrmCopiarPadroes = class(TForm)
    SpeedButton3: TcxButton;
    SpeedButton1: TcxButton;
    cxLabel1: TcxLabel;
    cbxUsuario: TcxComboBox;
    cxLabel2: TcxLabel;
    edtUsuario: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopiarPadroes: TfrmCopiarPadroes;

implementation

uses uFuncoes, uUsuarios;

{$R *.dfm}

procedure TfrmCopiarPadroes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmUsuarios.bdDados,frmUsuarios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);
end;

procedure TfrmCopiarPadroes.FormShow(Sender: TObject);
var
    Query : TADOQuery;
begin
    cbxUsuario.Clear;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmUsuarios.bdDados;
    Query.CursorLocation := clUseServer;

    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SELECT ID_USUARIO FROM USUARIOS');
        Query.Open;
        Query.First;
        while not Query.Eof do
        begin
            if Query.Fields[0].AsString <> edtUsuario.Text then
               cbxUsuario.Properties.Items.Add(Query.Fields[0].AsString);
            Query.Next;
        end;
        Query.Close;
    except
    end;

    Query.Close;
    Query.Free;

    GeraLog(frmUsuarios.bdDados,frmUsuarios.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmCopiarPadroes.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmCopiarPadroes.SpeedButton3Click(Sender: TObject);
var
    Query  : TADOQuery;
    Query1 : TADOQuery;
    i : integer;
    aux : string;
begin
    if cbxUsuario.Text = '' then
    begin
        MessageDlg(HCLResourceStrings.FindID('sString_272'), mtInformation, [mbOK], 0);
        Exit;
    end;

    Query                := TADOQuery.Create(Application);
    Query.Connection     := frmUsuarios.bdDados;
    Query.CursorLocation := clUseServer;

    Query1                := TADOQuery.Create(Application);
    Query1.Connection     := frmUsuarios.bdDados;
    Query1.CursorLocation := clUseServer;

    // CENARIOS
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM CENARIOS');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM CENARIOS');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + edtUsuario.Text + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                begin
                    Query1.Fields[i].Value := cbxUsuario.Text;
                end
                else
                if Query.Fields[i].FieldName = 'ID_CENARIO' then
                begin
                    aux := StringReplace(Query.Fields[i].AsString,edtUsuario.Text,cbxUsuario.Text,[rfReplaceAll]);

                    if aux = Query.Fields[i].AsString then
                       Query1.Fields[i].Value := Query.Fields[i].AsString + '_' + cbxUsuario.Text
                    else
                       Query1.Fields[i].Value := aux;
                end
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    // CENARIOS_CUBO
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM CENARIOS_CUBO');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM CENARIOS_CUBO');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + edtUsuario.Text + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                begin
                    Query1.Fields[i].Value := cbxUsuario.Text;
                end
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    // CENARIOS_DYNAMICS
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM CENARIOS_DYNAMICS');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM CENARIOS_DYNAMICS');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + edtUsuario.Text + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                begin
                    Query1.Fields[i].Value := cbxUsuario.Text;
                end
                else
                if Query.Fields[i].FieldName = 'ID_CENARIO_DYNAMICS' then
                begin
                    Query1.Fields[i].Value := Query.Fields[i].AsString //+ '_' + cbxUsuario.Text
                end
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    // PADROES
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM PADROES');
    Query1.SQL.Add('WHERE ID_USUARIO = ' + #39 + '-0-' + #39);
    Query1.Open;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM PADROES');
    Query.SQL.Add('WHERE ID_USUARIO = ' + #39 + edtUsuario.Text + #39);
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
        try
            Query1.Insert;
            for i := 0 to Query.FieldCount - 1 do
            begin
                if Query.Fields[i].FieldName = 'ID_USUARIO' then
                begin
                    Query1.Fields[i].Value := cbxUsuario.Text;
                end
                else
                   Query1.Fields[i].Value := Query.Fields[i].Value
            end;
            Query1.Post;
        except
            Query1.Cancel;
        end;

        Query.Next;
    end;

    Query.Close;
    Query.Free;

    Query1.Close;
    Query1.Free;

    close;
end;

end.

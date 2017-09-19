unit uElementosAnalise;

interface

uses
  xhConsts, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,
  cxButtons,
  cxLabel,
  cxListBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, StdCtrls;

type
  TfrmElementosAnalise = class(TForm)
    SpeedButton1: TcxButton;
    SpeedButton3: TcxButton;
    Label2: TcxLabel;
    cxLabel1: TcxLabel;
    cxListBox1: TcxListBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxListBox2: TcxListBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxListBox3: TcxListBox;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxListBox4: TcxListBox;
    cxLabel5: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElementosAnalise: TfrmElementosAnalise;

implementation

uses uFuncoes, uAnalises;

{$R *.dfm}

procedure TfrmElementosAnalise.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_356'),Self.Caption);

    Action := caFree;
end;

procedure TfrmElementosAnalise.SpeedButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmElementosAnalise.FormShow(Sender: TObject);
var
    aux : string;
    i,a : integer;
    lPode : boolean;
begin
    cxListBox1.Items.Clear;
    cxListBox2.Items.Clear;
    cxListBox3.Items.Clear;
    cxListBox4.Items.Clear;

    if (frmAnalises.tblAnalisesBASE_ORIGEM.Value  = '.') and
       (frmAnalises.tblAnalisesVISAO_ORIGEM.Value = '.') then
        aux := uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value)
    else
        aux := '_' + uppercase(frmAnalises.tblAnalisesVISAO_DESTINO.Value);

    frmAnalises.bdArmazena.GetFieldNames(aux,cxListBox1.Items);

    cxListBox3.Items := cxListBox1.Items;

    cxListBox2.Items.Text := frmAnalises.tblAnalisesANALISES_IGNORADOS.Value;
    cxListBox4.Items.Text := frmAnalises.tblAnalisesVALORES_IGNORADOS.Value;

    a := 0;
    while a <= cxListBox2.Items.Count - 1 do
    begin
        lPode := True;
        for i := 0 to cxListBox1.Items.Count - 1 do
            if cxListBox2.Items.Strings[a] = cxListBox1.Items.Strings[i] then
               lPode := False;
        if lPode then
           cxListBox2.Items.Delete(a)
        else
           a := a + 1;
    end;

    a := 0;
    while a <= cxListBox1.Items.Count - 1 do
    begin
        lPode := True;
        for i := 0 to cxListBox2.Items.Count - 1 do
            if cxListBox2.Items.Strings[i] = cxListBox1.Items.Strings[a] then
            begin
                cxListBox1.Items.Delete(a);
                lPode := False;
            end;
        if lPode then
           a := a + 1;
    end;

    a := 0;
    while a <= cxListBox4.Items.Count - 1 do
    begin
        lPode := True;
        for i := 0 to cxListBox3.Items.Count - 1 do
            if cxListBox4.Items.Strings[a] = cxListBox3.Items.Strings[i] then
               lPode := False;
        if lPode then
           cxListBox4.Items.Delete(a)
        else
           a := a + 1;
    end;

    a := 0;
    while a <= cxListBox3.Items.Count - 1 do
    begin
        lPode := True;
        for i := 0 to cxListBox4.Items.Count - 1 do
            if cxListBox4.Items.Strings[i] = cxListBox3.Items.Strings[a] then
            begin
                cxListBox3.Items.Delete(a);
                lPode := False;
            end;
        if lPode then
           a := a + 1;
    end;

    GeraLog(frmAnalises.bdDados,frmAnalises.sUsuario,Self.Name,HCLResourceStrings.FindID('sString_355'),Self.Caption);
end;

procedure TfrmElementosAnalise.SpeedButton3Click(Sender: TObject);
begin
    frmAnalises.tblAnalises.Edit;
    frmAnalises.tblAnalisesANALISES_IGNORADOS.Value := cxListBox2.Items.Text;
    frmAnalises.tblAnalisesVALORES_IGNORADOS.Value  := cxListBox4.Items.Text;
    frmAnalises.tblAnalises.Post;

    Close;
end;

procedure TfrmElementosAnalise.cxButton1Click(Sender: TObject);
begin
    try
       cxListBox2.Items.Add(cxListBox1.Items.Strings[cxListBox1.ItemIndex]);
       cxListBox1.DeleteSelected;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton2Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox1.Items.Count - 1 do
           cxListBox2.Items.Add(cxListBox1.Items.Strings[i]);
       cxListBox1.Items.Clear;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton3Click(Sender: TObject);
begin
    try
       cxListBox1.Items.Add(cxListBox2.Items.Strings[cxListBox2.ItemIndex]);
       cxListBox2.DeleteSelected;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton4Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox2.Items.Count - 1 do
           cxListBox1.Items.Add(cxListBox2.Items.Strings[i]);
       cxListBox2.Items.Clear;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton5Click(Sender: TObject);
begin
    try
       cxListBox4.Items.Add(cxListBox3.Items.Strings[cxListBox3.ItemIndex]);
       cxListBox3.DeleteSelected;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton6Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox3.Items.Count - 1 do
           cxListBox4.Items.Add(cxListBox3.Items.Strings[i]);
       cxListBox3.Items.Clear;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton7Click(Sender: TObject);
begin
    try
       cxListBox3.Items.Add(cxListBox4.Items.Strings[cxListBox4.ItemIndex]);
       cxListBox4.DeleteSelected;
    except
    end;
end;

procedure TfrmElementosAnalise.cxButton8Click(Sender: TObject);
var
    i : integer;
begin
    try
       for i := 0 to cxListBox4.Items.Count - 1 do
           cxListBox3.Items.Add(cxListBox4.Items.Strings[i]);
       cxListBox4.Items.Clear;
    except
    end;
end;

end.

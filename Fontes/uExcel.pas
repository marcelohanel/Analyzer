unit uExcel;

interface

uses
Windows, SysUtils, Variants, Classes, ComObj;

(*** t31x31r4-delphi@yahoo.com (Teixeira) ***)

type
  TXls = class
public
  DebugOn : Boolean;

destructor Destroy(); override;
constructor Create(); overload;
constructor Create(DebugOn: Boolean); overload;

function FecharXLS(): boolean;
function VisualizarXLS(Planilha: integer): boolean;
function PrintXLS(Planilha: Integer; Range: String): boolean;
function SalvarXLS(): boolean;
function AbrirXLS(Arquivo: String): boolean;
function LerCelularXLS(Planilha: Integer; Celula: String; var Valor: String): boolean; overload;
function GravarCelularXLS(Planilha: Integer; Celula, Valor: variant): boolean; overload;
function LerCelularXLS(Planilha, x, y: Integer; var Valor: String): boolean; overload;
function GravarCelularXLS(Planilha, x, y: Integer; Valor: String): boolean; overload;
function PegaLetraColuna(IntNumber : Integer) : String;

function XLS_EmUso () : boolean;

private
  HandleXLS : Variant;
  ColsXLS : Array [1..256] of String;
  EmUso : Boolean;

  function ProcuraColunaXLS (Col: String): Integer;
  function ObterCelulaXLS(Celula: String; var x, y: Integer): Boolean;
  procedure Inicializa(DebugOn: Boolean);
  procedure Debug(sMsg: String);

// protected

// published
// property

end;

implementation

procedure TXls.Debug(sMsg: String);
var
  fArq : TextFile;
  sTmp : String;
begin
  if DebugOn then begin
    sTmp := './debug.log';

    AssignFile (fArq, sTmp);

    if FileExists (sTmp) then Append (fArq)
    else begin
      Rewrite (fArq);
      Writeln (fArq, 'TXls.Debug()');
    end;

    Writeln (fArq, sMsg);

    Flush (fArq);
    CloseFile (fArq);
  end;
end;

constructor TXls.Create(DebugOn: Boolean);
begin
  Inicializa(DebugOn);
  inherited Create();
end;

constructor TXls.Create();
begin
  Create(False);
end;

procedure TXls.Inicializa(DebugOn: Boolean);
var iCol: Integer;
begin
  for iCol := 1 to 256 do ColsXLS [iCol] := PegaLetraColuna (iCol);
  HandleXLS := Unassigned;
  EmUso := False;
end;

function PegaLetraColuna (i : Integer): String;
var p, s: String;
begin
  p := '';
  s := '';
  if i < 1 then p := 'A' // Primeira Coluna
  else if i > 256 then p := 'IV' // Ultima Coluna
  else if i > 26 then begin
    s := Chr(64 + (i mod 26));
    if s = '' then begin // Faz um ajuste !!!! :-(
      p := Chr(63 + (i div 26));
      s := 'Z';
    end else p := Chr(64 + (i div 26));
    end else p := Chr(64 + i);
      Result := p + s;
end;

function TXls.SalvarXLS(): boolean;
begin
  if (EmUso) then begin
    try
      HandleXLS.WorkBooks[1].Save;
      Debug('TXls.SalvarXLS()');
    except
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function TXls.PegaLetraColuna(IntNumber : Integer) : String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result:=Chr(64 + (IntNumber div 26));
        Result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;
  
function TXls.PrintXLS(Planilha: Integer; Range: String): boolean;
begin
  if (EmUso) then begin
    try
      if (Planilha > 0) then begin
        HandleXLS.WorkBooks[1].Sheets[Planilha].PageSetup.PrintArea := Trim(Range);
        HandleXLS.WorkBooks[1].Sheets[Planilha].PrintOut(Copies:=1, Collate:=True);
      end else begin
        HandleXLS.WorkBooks[1].PrintOut(Copies:=1, Collate:=True);
      end;
      Debug('TXls.PrintXLS()');
    except
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function TXls.FecharXLS(): boolean;
begin
  if (EmUso) then begin
    EmUso := False;
    try
      HandleXLS.DisplayAlerts := False;
      HandleXLS.WorkBooks[1].Close;
      HandleXLS.Quit;
      HandleXLS := Unassigned;
    except
    end;
  end;
  Debug('TXls.FecharXLS()');
  Result := True;
end;

destructor TXls.Destroy();
begin
  try
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Quit;
  except
  end;
  Debug('TXls.Destroy()');
  Debug(' ');
  inherited Destroy();
end;

function TXls.AbrirXLS(Arquivo: String): boolean;
begin
  if (Not FileExists (Arquivo)) Or (EmUso) then begin
    Result := False;
  Exit;
end;

try
  HandleXLS := CreateOleObject('Excel.Application');
  HandleXLS.WorkBooks.Open(Arquivo);
  HandleXLS.DisplayAlerts := False;
  HandleXLS.Visible := False;
  Debug('TXls.AbrirXLS(' + Arquivo + ')');
except
  Result := False;
  Exit;
end;
EmUso := True;
Result := True;
end;

function TXls.ProcuraColunaXLS (Col: String): Integer;
var iCont: Integer;
begin
  iCont := 0;
  repeat
    inc(iCont);
  until (iCont > Length(ColsXLS)) Or (ColsXLS[iCont] = UpperCase(Trim(Col)));
  if iCont > 256 then
    Result := 0
  else
  Result := iCont;
end;

function TXls.ObterCelulaXLS(Celula: String; var x, y: Integer): Boolean;
var i : integer;
  Col : String;
begin // "CA23", x, y); A1..IV65536
  Celula := UpperCase(Trim(Celula));
  Col := '';
  for i := 1 to Length(Celula) do begin
    if (copy(Celula, i, 1)[1] in ['A'..'Z']) then
      Col := Col + copy(Celula, i, 1)
    else break;
  end; // for
  x := StrToInt(copy(Celula, i, Length(Celula) - i + 1));
  y := ProcuraColunaXLS (Col);
  Result := ((y > 0) And (y <= 256)) And ((x > 0) And (x <= 65536));
end;

function TXls.VisualizarXLS(Planilha: integer): boolean;
begin
    HandleXLS.Visible := True;
    HandleXLS.WorkBooks[1].Sheets[Planilha].Select;
    Result := True;
end;

function TXls.LerCelularXLS(Planilha: Integer; Celula: String; var Valor: String): boolean;
var
  x, y: Integer;
begin
  if (Not ObterCelulaXLS(Celula, x, y)) Or (Not EmUso) then begin
    Result := False;
    Exit;
  end;
  try
    Valor := HandleXLS.WorkBooks[1].Sheets[Planilha].Cells[x, y];
    Debug('TXls.LerCelulaXLS(' + IntToStr(Planilha) + '!' + Celula + ' = [' + Valor + '])');
    Result := True;
  except
    Result := False;
  end;
end;

function TXls.LerCelularXLS(Planilha, x, y: Integer; var Valor: String): boolean;
begin
  if Not EmUso then begin
    Result := False;
    Exit;
  end;
  try
    Valor := HandleXLS.WorkBooks[1].Sheets[Planilha].Cells[x, y];
    Debug('TXls.LerCelulaXLS(' + IntToStr(Planilha) + '!' + IntToStr(x) + ', ' + IntToStr(y) + ' = [' + Valor + '])');
    Result := True;
  except
  Result := False;
  end;
end;

function TXls.GravarCelularXLS(Planilha: Integer; Celula, Valor: variant): boolean;
var
  x, y: Integer;
begin
  if (Not ObterCelulaXLS(Celula, x, y)) Or (Not EmUso) then begin
    Result := False;
    Exit;
  end;
  try
    HandleXLS.WorkBooks[1].Sheets[Planilha].Cells[x, y] := Valor;
    Debug('TXls.GravarCelulaXLS(' + IntToStr(Planilha) + '!' + Celula + ' = [' + Valor + '])');
    Result := True;
  except
    Result := False;
  end;
end;

function TXls.GravarCelularXLS(Planilha, x, y: Integer; Valor: String): boolean;
begin
  if Not EmUso then begin
    Result := False;
  Exit;
  end;
  try
    HandleXLS.WorkBooks[1].Sheets[Planilha].Cells[x, y] := Valor;
    Debug('TXls.GravarCelulaXLS(' + IntToStr(Planilha) + '!' + IntToStr(x) + ', ' + IntToStr(y) + ' = [' + Valor + '])');
    Result := True;
  except
  Result := False;
  end;
end;

function TXls.XLS_EmUso (): boolean;
begin
  try
    Result := Self.EmUso;
  except
    Result := False;
  end;
end;

end.



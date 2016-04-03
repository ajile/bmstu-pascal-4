program main;

{$mode objfpc}{$H+}

type
  TStringArray = array of string;

function Explode(Ch: Char; const Text: string): TStringArray;
var
  i, k, Len: Integer;
  Count: Integer;
begin
  if Text = '' then
  begin
    Result := nil;
    Exit;
  end; // if
  Count := 0;
  Len := Length(Text);
  for i := 1 to Len do
  begin
    if Text[i] = Ch then Inc(Count);
  end; // for i
  SetLength(Result, Count + 1);
  Count := 0;
  k := 1;
  for i := 1 to Len do
  begin
    if Text[i] = Ch then
    begin
      Result[Count] := Copy(Text, k, i - k);
      Inc(Count);
      k := i + 1;
    end; // if
  end;
  Result[Count] := Copy(Text, k, Len - k + 1);
end;


var
  i: integer;
  posit: integer;
  text: String = 'Бывший защитник петербургского Зенита Константин Лепёхин поделился впечатлениями от матча второго тура российской Премьер-Лиги котором сине-бело-голубые одержали домашнюю победу над московским ЦСКА счётом прошедшей игре дубль оформил бразильский нападающий Халк';
  words: TStringArray;
begin
  words := Explode(' ', text);

  for i:=0 to length(words)-1 do
  begin
    posit := Pos(words, 'а');
    writeLn(posit);
  end;

end.


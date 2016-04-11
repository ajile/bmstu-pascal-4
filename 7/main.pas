program main;

{$mode objfpc}{$H+}

const
  LETTER = 'a';

type
  TStringArray = array of string;

var
  i: integer;
  counter: integer = 1;
  text: string = 'we`re having a problem billing your account';
  sWord: string = '';
  symbol: char;
  hasLetter: boolean = false;
  shift: integer = 0;
begin

  // Откликаемся...
  for i := 1 to length(text) do begin

    symbol := text[i];

    if shift > 0 then begin
      text[i - shift] := text[i];
    end;

    // Если символ НЕ попал в диапазон алфавита - значит "слово" закончилось и
    // мы можем проверить наличие подстроки `LETTER`.
    if (symbol > #122) or (symbol < #65) then begin
      if (counter = 3) or (counter = 5) then begin
        if not(hasLetter) then begin
          shift := shift + length(sWord) + 1;
        end;
      end;
      sWord := '';
      hasLetter := false;
      inc(counter);
      continue;
    end;

    if symbol = LETTER then begin
      hasLetter := true;
    end;

    sWord := concat(sWord, symbol);


  end;

  setlength(text, length(text) - shift);


end.


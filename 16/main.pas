program main;

{$mode Delphi}

// TURNING ON DEBUGGING FOR ME (MAC) ONLY
{$IFDEF Darwin}
  {$DEFINE DEBUG}
{$ENDIF}

{$IFDEF DEBUG}
  {$WARNING This code compiling with log messages}
{$ENDIF}

uses sysutils, math;

// =============================================================================

// Класс `вещественное число`, записанное с точкой. Параметры – его значение и
// запись. Методы: конструктор и процедура, определяющая количество цифр в
// дробной и целой части числа.
type
  RealClass = class
  private
    number: real;
    integerPartString: string;
    fractionPartString: string;
    integerPart, fractionPart: integer;
  public
    constructor create(n: real);
    function getFractionLength(): integer;
    function getIntegerLength(): integer;
    function ratio() : double;
  end;

constructor RealClass.create(n: real);
  var
    numberString: string;
    i: integer;
    reached: boolean = false;
  begin
    numberString := FloatToStr(n);
    for i := 1 to length(numberString) do begin
      if numberString[i] = '.' then begin
        reached := true;
        continue;
      end;
      if not(reached) then begin
        integerPartString := concat(integerPartString, numberString[i]);
      end else begin
        fractionPartString := concat(fractionPartString, numberString[i]);
      end;
    end;
    integerPart := StrToInt(integerPartString);
    fractionPart := StrToInt(fractionPartString);
    // writeln(integerPartString);
    // writeln(integerPart);

    number := n;
  end;

function RealClass.getFractionLength() : integer;
  begin
    result := length(fractionPartString);
  end;

function RealClass.getIntegerLength() : integer;
  begin
    result := length(integerPartString);
  end;

function RealClass.ratio() : double;
 begin
   
 end;
// =============================================================================

// Класс массив вещественных чисел переменной длины. Параметры: количество чисел
// и массив. Метод определения суммы введенных чисел и отношения количества цифр
// в целой и дробной частях.

type
  RealClassList = class
  public
    list: array of RealClass;
    constructor create();
    procedure add(scObject: RealClass);
    function sumRatio() : double;
    function sum() : double;
  end;

constructor RealClassList.create();
  begin
  end;

procedure RealClassList.add(scObject: RealClass);
 var
   l: integer = 0;
 begin
   l := length(list) + 1;
   setlength(list, l);
   list[l] := scObject;
   // list[l+1] := scObject;
   // writeln(scObject.getIntegerLength(), '-', scObject.getFractionLength());
   // writeln(length(list));
 end;

function RealClassList.sumRatio() : double;
 var
  i: integer;
  res: double = 0;
 begin
   for i := 1 to length(list) do begin
     res := res + (list[i].getIntegerLength() / list[i].getFractionLength());
   end;
   result := res;
 end;

function RealClassList.sum() : double;
 var
  i: integer;
  res: double = 0;
 begin
   for i := 1 to length(list) do begin
     res := res + list[i].number;
   end;
   result := res;
 end;

// =============================================================================

var
  realNumberList: RealClassList;
begin

  realNumberList := RealClassList.create();
  realNumberList.add(RealClass.create(11.22334455));
  // realNumberList.add(RealClass.create(3124.543262));
  // realNumberList.add(RealClass.create(5432.64232));
  // realNumberList.add(RealClass.create(12.5327347));

  writeln('Sum: ', realNumberList.sum());
  writeln('Sum of ratio: ', realNumberList.sumRatio());

  {$IFDEF DEBUG}
    // writeln('The integer part of the number: ', realNumber.getIntegerLength());
    // writeln('The fraction part of the number: ', realNumber.getFractionLength());
  {$ENDIF}

end.

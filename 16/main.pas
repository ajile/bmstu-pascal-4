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
  public
    constructor create(n: real);
    function getFraction(): real;
    function getFractionLength(): integer;
    function getInteger(): integer;
    function getIntegerLength(): integer;
  end;

constructor RealClass.create(n: real);
  begin
    number := n;
  end;

function RealClass.getFraction() : real;
  begin
    // writeln( length(IntToStr(getInteger())) );
    // writeln( IntToStr(getInteger()) );
    // writeln( IntToStr(getInteger()) );
    // writeln(  power(10, length(IntToStr(getInteger())))  );
    // writeln(  frac(number) * power(10, length(IntToStr(getInteger())))  );
    // writeln(    );
    result := frac(number);
  end;

function RealClass.getFractionLength() : integer;
  begin
    result := 1;
  end;

function RealClass.getInteger() : integer;
  begin
    result := trunc(number);
  end;

function RealClass.getIntegerLength() : integer;
  begin
    result := length(IntToStr(getInteger()));
  end;

// =============================================================================

// Класс массив вещественных чисел переменной длины. Параметры: количество чисел
// и массив. Метод определения суммы введенных чисел и отношения количества цифр
// в целой и дробной частях.

// @TODO

// =============================================================================

var
  realNumber: RealClass;
  num: real = 11.22334455;
begin

  {$IFDEF DEBUG}
    writeln('The number program working on: ', FloatToStr(num));
    writeln('=========================================');
  {$ENDIF}

  realNumber := RealClass.create(num);

  {$IFDEF DEBUG}
    writeln('The integer part of the number: ', realNumber.getInteger());
    writeln('The fraction part of the number: ', realNumber.getFraction());
  {$ENDIF}

end.

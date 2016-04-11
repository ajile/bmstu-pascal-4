program main;

{$mode objfpc}{$m+}

// =============================================================================

// Класс `вещественное число`, записанное с точкой. Параметры – его значение и
// запись. Методы: конструктор и процедура, определяющая количество цифр в
// дробной и целой части числа.
type
  RealClass = class
  private
    number: single;
  public
    constructor create(n: single);
    function getFraction(): single;
    function getFractionLength(): integer;
    function getInteger(): integer;
    function getIntegerLength(): integer;
  end;

constructor RealClass.create(n: single);
  begin
    number := n;
  end;

function RealClass.getFraction() : single;
  begin
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
    result := 1;
  end;

// =============================================================================

// Класс массив вещественных чисел переменной длины. Параметры: количество чисел
// и массив. Метод определения суммы введенных чисел и отношения количества цифр
// в целой и дробной частях.

// @TODO

// =============================================================================

var
  realNumber: RealClass;
  numberForTest: single;
begin

  numberForTest := 11.22;

  // Откликаемся...
  writeln('The number the program working on: ', numberForTest);
  writeln('=========================================');

  realNumber := RealClass.create(numberForTest);

  writeln('The integer part of the number: ', realNumber.getInteger());
  writeln('The fraction part of the number: ', realNumber.getFraction());

end.

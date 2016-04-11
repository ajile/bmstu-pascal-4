program main;

{$mode objfpc}{$m+}

uses crt, math;

// =============================================================================

const
  DECIMALS = 10;

type

  RealClass = class

  private
    val: real;
   
  public
    constructor create(n: real);
    function getFractionLength(): real;
    function getIntegerLength(): integer;
  end;

constructor RealClass.create(n: real);
  begin
    val := n;
  end;

function RealClass.getFractionLength() : real;
  begin
    result := round(frac(val) * math.power(10, DECIMALS));
  end;

function RealClass.getIntegerLength() : integer;
  begin
    result := trunc(val);
  end;

// =============================================================================

// type

//   RealClassList = class

//   private
//     height: integer;
   
//   public
//     // constructor createBox(l, w, h: integer);
//     // function getVolume(): integer;
//   end;

// // constructor RealClassList.createBox(l, w, h:integer);
// //   begin
// //     length:=l;
// //     width:=w;
// //     height:=h;
// //   end;

// // function RealClassList.getVolume() : integer;
// //   begin
// //     result := getArea() * height;
// //   end;

// =============================================================================

var
  realNumber: RealClass;
  aNumber: real;
begin

  aNumber := 987.45678;

  // Откликаемся...
  writeln('The number we working on: ', aNumber);
  writeln('=========================================');

  realNumber := RealClass.create(aNumber);

  writeln('The integer part of the number: ', realNumber.getIntegerLength());
  writeln('The fraction part of the number: ', realNumber.getFractionLength());
  // box := RealClassList.createBox(10, 20, 30);
  // writeln('Area of the realNumber: ', realNumber.getArea());
  // writeln('Volume of the box: ', box.getVolume());
end.

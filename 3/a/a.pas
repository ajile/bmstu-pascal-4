program main;

{$mode objfpc}{$H+}

uses b;

function fn1(x: double): double;
begin
  result := sqrt(x);
end;



function fn2(x: double): double;
begin
  result := x;
end;



var
  point: array[1..2] of double;
  isInFirstFunction: boolean;
  Y1, Y2: double;
begin
  // Координаты точки
  point[0] := 5;
  point[1] := 2;

  writeln('X', point[0]);
  writeln('Y', point[1]);

  Y1 := fn1(point[0]);
  Y2 := fn2(point[0]);

  writeln('Function 1 result (Y1)', Y1);
  writeln('Function 2 result (Y2)', Y2);

  writeln('Point"s Y less then function"s 1 Y ', point[1] <= Y1);
  writeln('Point"s Y less then function"s 2 Y ', point[1] <= Y2);

  if (point[1] <= Y1) and (point[1] <= Y2) and (Y1 > 0) and (Y2 > 0)
     then
         writeln('Contained')
     else
         writeln('Not contained')
end.

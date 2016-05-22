program main;

{$mode objfpc}{$H+}

uses math;

function getLength(iterations: integer): double;
var
  i, x: integer;
  val, prev, hypotenuse, sum, step, height: double;
begin
  x := 4;
  prev := 0;
  step := x / iterations;
  sum := 0;

  for i:=1 to iterations do
  begin
    val := sqrt(power(step * i, 3));
    height := val - prev;
    prev := val;
    hypotenuse := sqrt(power(step, 2) + power(height, 2));
    sum := sum + hypotenuse;
  end;
  result := sum;
end;


var
  result, sample: double;
  i: integer;
begin

  // 9,073415289388
  sample := 9.073;
  i := 1;

  repeat
    result := getLength(i);
    writeLn('Iteration ', i, ' result ', result);
    inc(i);
  until result > sample;

end.


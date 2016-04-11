program main;


{$mode Delphi}


// TURNING ON DEBUGGING FOR ME (MAC) ONLY
{$IFDEF Darwin}
  {$DEFINE DEBUG}
{$ENDIF}

{$IFDEF DEBUG}
  {$WARNING This code compiling with log messages}
{$ENDIF}


uses math;


function fn(x: real): real;
begin
  result := sqr(x) + 1;
end;


var
  x, x0: real;
begin

  {$IFDEF DEBUG}
    X := -0.5;
    writeln('X:', X);
  {$ELSE}
    // Просим пользователя ввести X
    write('Input X:'); readln(x);
  {$ENDIF}

  // Поскольку паскаль не умеет делить по мудулю дробные числа мы разбиваем
  // часло на целую часть и дробную. Целую часть делим по модулю и прибавляем к
  // результату деления дробную часть.
  x0 := (trunc(x) mod 2) + frac(x);

  // Далее отправляем это число в функцию. Таким образом периодичность функции
  // нам удается нивелировать.
  writeln('X0: ', fn(x0));

end.

program main;

{$mode Delphi}
{$GOTO ON}

// TURNING ON DEBUGGING FOR ME (MAC) ONLY
{$IFDEF Darwin}
  {$DEFINE DEBUG}
{$ENDIF}

{$IFDEF DEBUG}
  {$WARNING This code compiling with log messages}
{$ENDIF}

 
// Маркер для завершения программы с выводом результата на экран. Используется
// когда становится известно, что точка не входит в область пересечения двух
// графиков.
// Можно было бы сделать вывод на экран через простой вызов функции и exit из
// программы, но goto в конкретном случае лучше.
label result;


function lineY(x: double): double; begin
  result := 1 + x;
end;


function parabolaX(y: double): double; begin
  parabolaX := sqr(y) * (-1);
end;


var

  X, Y: double;

  XFits: boolean = false;
  YFits: boolean = false;

  inSquare: boolean = false;

  bLine: boolean = false;
  bParabola: boolean = false;

  totalFit: boolean = false;

begin

  {$IFDEF DEBUG}
    // X := -0.01;  // Не попадает в область параболы
    X := -0.50;  // Попадает в область параболы
    Y := 0.45;
    writeln('X:', X);
    writeln('Y:', Y);
  {$ELSE}
    // Просим пользователя ввести координаты точки
    write('Input X: '); readln(X);
    write('Input Y: '); readln(Y);
  {$ENDIF}


  // Поскольку функции симметричны относительно оси абсцисс, мы можем отбросить
  // знак у Y и проверять вхождение точки по Y в перекрытие только верхних
  // графиков.
  Y := abs(Y);

  // Проверяем входит ли точка в нужный нам квадрат? На самом деле нам не нужно
  // проверять принадлежность точки квардату, потому что есть проверка вхождения
  // точки в область под графиком линии. Минимально достаточным было бы добавить
  // туда проверку Y > 0. Тем не менее для лучшей читаемости кода и увеличения
  // относительной гибкости кода мы делаем здесь проверку на вхождение точки в
  // квадрат.
  XFits := (X >= -1) and (X <= 0);
  YFits := (Y >= 0) and (Y <= 1);
  inSquare := XFits and YFits;

  {$IFDEF DEBUG}
    writeln('X ∈ square: ', XFits);
    writeln('Y ∈ square: ', YFits);
    writeln;
    writeln('Point ∈ square: ', inSquare);
  {$ENDIF}

  // Уже известно, что точка не входит в область пересечения 2х графиков,
  // поэтому переходим к выводу конечного результата.
  if not(inSquare) then goto result;

  // Находится ли точка под графиком линии
  bLine := Y < lineY(X);

  {$IFDEF DEBUG}
    writeln;
    writeln('Point Y ∈ area below the line: ', bLine);
  {$ENDIF}

  // Уже известно, что точка не входит в область пересечения 2х графиков,
  // поэтому переходим к выводу конечного результата.
  if not(bLine) then goto result;

  // Находится ли точка под графиком параболы
  bParabola := X <= parabolaX(Y);

  {$IFDEF DEBUG}
    writeln;
    writeln('Point X ∈ area at right of the parabola: ', bParabola);
  {$ENDIF}

  // Маркер, на который мы переходим если становится известно, что точка не
  // входит в область пересечения 2х графиков.
  result:

  // Определяем принадлежит ли точка пересечению графиков.
  totalFit := inSquare and bLine and bParabola;

  writeln;
  writeln('The point on the area: ', totalFit);

end.

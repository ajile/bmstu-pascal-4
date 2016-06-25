program main;

const DIMENSION = 10;

// Простая сортировка методом пузырька
procedure bubblesort(var numbers: array of integer);
var
  i, j, tmp: integer;
begin
  for i := length(numbers) - 1 downto 1 do
    for j := 1 to i do
      if (numbers[j-1] > numbers[j]) then begin
        tmp := numbers[j-1];
        numbers[j-1] := numbers[j];
        numbers[j] := tmp;
      end;
end;

var
  i, j: integer;
  list: array[1..10] of integer = (4,0,1,4,2,8,3,2,1,0);
begin

  // Наполняем матрицу случайными числами
  for i:=1 to length(list) - 1 do writeln(list[i]);

  bubblesort(list);
  writeln;
  writeln('Отсортированный массив:');

  for i:=1 to length(list) - 1 do writeln(list[i]);

  writeln;
  writeln('Без 0:');

  for i:=1 to length(list) - 1 do begin
  	if list[i] <> 0 then writeln(list[i]);
  end;

end.

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
  matrix: array[1..DIMENSION] of array[1..DIMENSION] of integer;
begin

  // Наполняем матрицу случайными числами
  for i:=1 to length(matrix) - 1 do begin
    for j:=1 to length(matrix[i]) do begin
      matrix[i][j] := random(10);
    end;
  end;

  writeln('The incoming matrix:'); writeln;

  // Показываем получившуюся матрицу
  for i:=1 to length(matrix) - 1 do begin
    for j:=1 to length(matrix[i]) do begin
      write(matrix[i][j], ' ');
    end;
    writeln;
  end;


  writeln;
  writeln('↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓');
  writeln;


  // Показываем отсортированную матрицу
  for i:=1 to length(matrix) - 1 do begin

    // Сортируем строку
    bubblesort(matrix[i]);

    // Распечатываем строку
    for j:=1 to length(matrix[i]) do begin
      write(matrix[i][j], ' ');
    end;

    writeln;

  end;

end.

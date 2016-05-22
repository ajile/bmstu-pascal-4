program main;

const
  DIMENSION = 20;

var
  i, j: integer;

  // Индексы элемента массива
  p, q: integer;

  // Значение икомого элемента
  seeking: integer;
  total: integer;
  lines: integer;

  isFound: boolean;

  matrix: array of array[1..DIMENSION] of integer;
begin

  total := 0;
  lines := 0;

  setlength(matrix, DIMENSION);

  // Наполняем матрицу случайными числами
  for i:=1 to length(matrix) - 1 do begin
    for j:=1 to length(matrix[i]) do begin
      matrix[i][j] := random(20);
    end;
  end;

  // Просим ввести число q от 1 до 9
  repeat write('Input q (1 ≤ q ≤ 9): '); read(q); until (q >= 1) and (q <= 9);

  // Просим ввести число p от 1 до 9
  repeat write('Input p (1 ≤ p ≤ 9): '); read(p); until (p >= 1) and (p <= 9);

  writeln;

  // Находим по указанным индексам элемент строки матрицы с которым мы будем
  // "удалять"
  seeking := matrix[p][q];

  writeln('Seeking matrixs element is: ', seeking);


  // Проходим по строкам матрицы
  for i:=1 to length(matrix) - 1 do begin

    writeln;

    if lines > 0 then begin
      matrix[i - lines] := matrix[i];
    end;

    isFound := false;

    // Проходим по столбцам матрицы
    for j:=1 to length(matrix[i]) do begin
      write(matrix[i][j], chr(9));
      // Является ли элемент искомым
      if matrix[i][j] = seeking then begin
        isFound := true;
        inc(total);
      end;
    end;

    if isFound then begin
      inc(lines);
      write('   ←   Element is found');
    end;

  end;

  setlength(matrix, length(matrix) - lines);

  writeln;
  writeln;

  for i:=1 to length(matrix) - 1 do begin
    for j:=1 to length(matrix[i]) do begin
      write(matrix[i][j], chr(9));
    end;
    writeln;
  end;

  writeln;

  writeln('Total amount of the found elements: ', Total);
  writeln('Amount of the matrix lines contains the element: ', lines);

end.

program main;

//
// Generator:
//
// const list = new Array();
// for (let i = 0; i < 40; i++)
//   list.push(Math.random()*100 >> 0)
//

var
  i, j, counter, total: integer;
  list: array [1..40] of Longint = (29, 79, 98, 15, 76, 63, 95, 12, 2, 85, 6, 85, 51, 98, 45, 85, 69, 62, 33, 34, 52, 86, 74, 47, 5, 17, 97, 75, 2, 9, 0, 97, 38, 28, 22, 74, 12, 73, 23, 66);
begin

  total := 0;

  // Проходим по списку, для каждого элемента которого считаем кол-во элементов
  // меньше из того же списка по значению
  for i:=0 to length(list) - 1 do begin

    // В каждой итерации верхнего цикла обнуляем счетчик
    counter := 0;

    // Еще один проход по списку
    for j:=0 to i do begin

      // Если число второго цикла меньше числа певого цикла - инкрементируем
      // счетчик, значение которого будет выведено на экран в конце итерации
      // первого цикла.
      if list[j] > list[i] then inc(counter)

    end;

    total := total + counter;

    // Распечатываем результат по каждому элементу списка
    writeln('Для числа ', list[i],' инверсий: ', counter);

  end;

  writeln('Общее количество инверсий: ', total);

end.

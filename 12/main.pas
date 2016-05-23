program main;

{$mode objfpc}{$H+}

uses
 Sysutils;

const
  FILE_NAME_IN = '/home/ajile/Learning/bmstu-pascal-4/12/input.txt';
  FILE_NAME_OUT = '/home/ajile/Learning/bmstu-pascal-4/12/output.txt';
  AMOUNT = 3;
  DELIMITER = ';';

var
  input: file of char;
  output: TextFile;
  symbol: char;
  counter: integer = 0;
  sWord: string = '';
begin

  // Откликаемся...
  writeln('Reading the contents of file: ', FILE_NAME_IN);
  writeln('=========================================');

  // Указываем файлы, которые будем использовать
  assignFile(input, FILE_NAME_IN);
  assignFile(output, FILE_NAME_OUT);

  // Открываем файл на чтение
  reset(input); 

  // Открываем файл на запись
  rewrite(output); 

  // Считываем файл посимвольно. В каждой итерации если проверяем попал ли
  // символ в диапазон алфавита. Если попал, записываем его в специальный массив
  // символов. Если не попал, проверяем длину массива символом, она должна быть
  // больше чем указанная константа. Если так - записываем этот массив в файл.
  // Если нет сбрасываем счетчик "слова", тем самым обнуляем массив символов.
  while not eof(input) do begin

    // Считываем символ в переменную
    read(input, symbol);

    // Если символ НЕ попал в диапазон алфавита - значит "слово" закончилось и
    // мы можем проверить его длину и если все ОК записать в файл.
    if (symbol > #122) or (symbol < #65) then begin

      // Смотрим сколько букв было насчитано.
      if counter > AMOUNT then begin

        // @todo: Строка для отладки, её можно удалить
        writeln('The word im gonna to write down to the file: ', sWord);

        // Обещано сделано - пишем слово в файл и добавляем в конце разделитель
        write(output, concat(sWord, DELIMITER));

      end;

      // Обнуляем счетчик
      counter := 0;

      // В этой итерации больше нечего делать. идем дальше
      continue;

    end;

    // Сдвигаем текущий указатель символа в массиве
    inc(counter);

    // Требуем еще одну ячейку под хранение символа
    setlength(sWord, counter);

    // Кладем символ в конец массива
    sWord[counter] := symbol;

  end;


  closeFile(input);
  closeFile(output);
end.


program main;

{$mode objfpc}{$H+}

uses
 Sysutils;

const
  FILE_NAME_IN = '/Users/ajile/Learning/bmstu-pascal-4/12/input.txt';
  FILE_NAME_OUT = '/Users/ajile/Learning/bmstu-pascal-4/12/output.txt';

var
  input: TextFile;
  output: TextFile;
  s: string;
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

  while not eof(input) do
    begin
      readln(input, s);
      writeln(s);
    end;

  closeFile(input);
  closeFile(output);
end.


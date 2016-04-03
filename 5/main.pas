program main;

{$mode objfpc}{$H+}


//
// Generator:
//
// const list = new Array();
// for (let i = 0; i < 40; i++) {
//   list.push(Math.random()*100 >> 0)
// }
//

var
  i, counter: integer;
  list: array [1..40] of Longint = (29, 79, 98, 15, 76, 63, 95, 12, 2, 85, 6, 85, 51, 98, 45, 85, 69, 62, 33, 34, 52, 86, 74, 47, 5, 17, 97, 75, 2, 9, 0, 97, 38, 28, 22, 74, 12, 73, 23, 66);
begin
  counter := 0;
  for i:=1 to length(list) do
  begin
    if list[i-1] > list[i] then inc(counter)
  end;
  write('Число инверсий: ', counter);
end.


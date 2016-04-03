program main;

{$mode objfpc}{$H+}


//
// Generator:
//
// const list = new Array();
// for (let i = 0; i < 10; i++) {
//   let sublist = new Array();
//   for (let j = 0; j < 10; j++) {
//     sublist.push(Math.random()*100 >> 0)
//   }
//   list.push(sublist);
// }
// 
// // Pascal array
// JSON.stringify(list).replace(/\[/gi, "(").replace(/\]/gi, ")");
// (
//   (75,15,92,40,18,63,16,49,38,38),
//   (47,35,35,56,54,0,8,3,46,67),
//   (1,45,4,67,2,15,26,32,6,98),
//   (97,72,55,20,80,80,79,55,12,24),
//   (56,9,32,6,82,21,29,44,50,91),
//   (4,60,1,71,56,83,96,79,54,2),
//   (82,28,70,32,46,83,51,44,50,18),
//   (23,16,90,16,11,21,46,65,24,74),
//   (44,62,97,10,81,94,44,65,49,39),
//   (39,61,15,69,43,99,85,28,26,88)
// )
//

var
  i, j: integer;
  p, q: integer;
  element: integer;
  matrix: array[1..2, 1..10] of integer;
begin

  p := 1;
  q := 1;

  matrix[0][0] := 75;
  matrix[0][1] := 15;
  matrix[0][2] := 92;
  matrix[0][3] := 40;
  matrix[0][4] := 18;
  matrix[0][5] := 63;
  matrix[0][6] := 16;
  matrix[0][7] := 49;
  matrix[0][8] := 38;
  matrix[0][9] := 38;

  matrix[1][0] := 47;
  matrix[1][1] := 35;
  matrix[1][2] := 35;
  matrix[1][3] := 56;
  matrix[1][4] := 54;
  matrix[1][5] := 0;
  matrix[1][6] := 8;
  matrix[1][7] := 3;
  matrix[1][8] := 46;
  matrix[1][9] := 67;

  element := matrix[p][q];

  writeLn('Seeking element is ', element);

  for i:=0 to length(matrix)-1 do
  begin
    for j:=0 to length(matrix[i])-1 do
    begin
      writeLn(matrix[i][j]);
      // writeLn(matrix[i][j] = element);
    end;
    writeLn('======', i);
  end;


  // matrix[0] = (75,15,92,40,18,63,16,49,38,38),
  // matrix[1] = (47,35,35,56,54,0,8,3,46,67),
  // matrix[2] = (1,45,4,67,2,15,26,32,6,98),
  // matrix[3] = (97,72,55,20,80,80,79,55,12,24),
  // matrix[4] = (56,9,32,6,82,21,29,44,50,91),
  // matrix[5] = (4,60,1,71,56,83,96,79,54,2),
  // matrix[6] = (82,28,70,32,46,83,51,44,50,18),
  // matrix[7] = (23,16,90,16,11,21,46,65,24,74),
  // matrix[8] = (44,62,97,10,81,94,44,65,49,39),
  // matrix[9] = (39,61,15,69,43,99,85,28,26,88)
  write('TEST');
end.


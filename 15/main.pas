program main;

{$mode objfpc}{$m+}

uses crt;

// =============================================================================

type

  PlankClass = class

  private
    length, width: integer;
   
  public
    constructor create(l, w: integer);
    function getArea(): integer;
  end;

constructor PlankClass.create(l,w:integer);
  begin
    length:=l;
    width:=w;
  end;

function PlankClass.getArea() : integer;
  begin
    result := width * length;
  end;

// =============================================================================

type

  BoxClass = class(PlankClass)

  private
    height: integer;
   
  public
    constructor createBox(l, w, h: integer);
    function getVolume(): integer;
  end;

constructor BoxClass.createBox(l, w, h:integer);
  begin
    length:=l;
    width:=w;
    height:=h;
  end;

function BoxClass.getVolume() : integer;
  begin
    result := getArea() * height;
  end;

// =============================================================================

var
  plank: PlankClass;
  box: BoxClass;
begin
  plank := PlankClass.create(10, 20);
  box := BoxClass.createBox(10, 20, 30);
  writeln('Area of the plank: ', plank.getArea());
  writeln('Volume of the box: ', box.getVolume());
end.


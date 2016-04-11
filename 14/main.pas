program main;

{$mode objfpc}{$m+}

uses crt;

// =============================================================================

type

  ProductClass = class

  private
    name: string;
    amount: integer;
    cost: double;
   
  public
    constructor create(n: string; a: integer; c: double);
    function getPrice(percentage: single): double;
  end;

constructor ProductClass.create(n: string; a: integer; c: double);
  begin
    name:=n;
    amount:=a;
    cost:=c;
  end;

function ProductClass.getPrice(percentage: single) : double;
  begin
    result := amount * (cost * (1 + percentage));
  end;

// =============================================================================

var
  product: ProductClass;
begin
  product := ProductClass.create('Product#1', 1, 1.5);
  writeln('Product price: ', product.getPrice(1));
end.


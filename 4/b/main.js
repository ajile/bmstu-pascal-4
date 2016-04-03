// Function executing on each iteration
var f = (x) => Math.sqrt(Math.pow(x, 3));

const range = [0, 4];

var getLength = (func, iterations = 10) => {
  var step = (range[1] - range[0]) / iterations;
  var prev = 0;
  var sum = 0;

  for (let i = 1; i <= iterations; i++) {
    let value = f(step * i);
    let height = value - prev;
    let hypotenuse = Math.sqrt(Math.pow(step, 2) + Math.pow(height, 2));
    prev = value;
    sum += hypotenuse;
  }

  return sum;
};


var oc = 9.073;//89388
var i = 1;
var res;

do {
  res = getLength(f, i);
  console.log(res, oc);
  i++;
} while(res < oc || i < 50);

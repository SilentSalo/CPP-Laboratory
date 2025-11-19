import 'dart:math';
import 'dart:core';

void main() {
  int variant = 7;
  
  double x0 = 1.23 * variant;
  double x1 = x0 + 10;
  double delta = 1.0;
  double y = 4.6 * variant;
  double z = 36.6 / variant;
  
  print('Параметри:');
  print('X₀ = ${x0.toStringAsFixed(2)}');
  print('X₁ = ${x1.toStringAsFixed(2)}');
  print('Δ = $delta');
  print('Y = ${y.toStringAsFixed(2)}');
  print('Z = ${z.toStringAsFixed(2)}');
  print('=' * 50);
  
  // b=f[x,y,z]
  double Function(double, double, double) b = (double x, double y, double z) {
    return 1 - (x + y) / pow(z.abs(), 0.34) + pow(y, 2) / 6 + pow(z, 3) / 120 + exp(x - y) / (z + y);
  };
  
  // a[x,y,z,b]
  double calculateFunction(double x, double y, double z, double b) {
    double x1 = y - sqrt((x * x - b).abs());
	  double x2 = (y - x * x) / (z + 4 * y * y);
	  double x3 = log(pow((x1 * x2).abs(), 2/3));
	
	  return x3;
  }
  
  print('   x     |     b     |    a[x,y,z,b]');
  print('-' * 40);
  
  for (double x = x0; x <= x1; x += delta) {
    double bValue = b(x, y, z);
    double result = calculateFunction(x, y, z, bValue);
    
    if (result.isNaN) {
      print('${x.toStringAsFixed(2).padLeft(7)} | ${bValue.toStringAsFixed(4).padLeft(9)} | Невизначено');
    } else if (result.isInfinite) {
      print('${x.toStringAsFixed(2).padLeft(7)} | ${bValue.toStringAsFixed(4).padLeft(9)} | ∞');
    } else {
      print('${x.toStringAsFixed(2).padLeft(7)} | ${bValue.toStringAsFixed(4).padLeft(9)} | ${result.toStringAsFixed(6).padLeft(12)}');
    }
  }
}

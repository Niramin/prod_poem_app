import 'dart:math';


abstract class helper {
  static double nextDouble(double min, double max) {
    Random _random = new Random();
    double ans = min + _random.nextDouble() * (max - min);

    return ans;
  }
  static int next(int min, int max) {

    Random _random = new Random();

    return min + _random.nextInt(max - min);
  }
}

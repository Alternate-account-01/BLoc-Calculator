abstract class CalculatorEvent {
  const CalculatorEvent();
}

class Plus extends CalculatorEvent {
  final double a;
  final double b;
  const Plus(this.a, this.b);
}

class Minus extends CalculatorEvent {
  final double a;
  final double b;
  const Minus(this.a, this.b);
}

class Multiply extends CalculatorEvent {
  final double a;
  final double b;
  const Multiply(this.a, this.b);
}

class Division extends CalculatorEvent {
  final double a;
  final double b;
  const Division(this.a, this.b);
}

class Reset extends CalculatorEvent {
  const Reset();
}

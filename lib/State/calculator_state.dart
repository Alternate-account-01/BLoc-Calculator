abstract class CalculatorState {}

class Theothercalculator extends CalculatorState {}

class CalculatorSuccess extends CalculatorState {
  final double result;
  CalculatorSuccess(this.result);
}

class CalculatorError extends CalculatorState {
  final String message;
  CalculatorError(this.message);
}
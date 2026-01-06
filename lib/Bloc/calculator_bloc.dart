import 'package:flutter_bloc/flutter_bloc.dart';
import '../Events/Calculator_event.dart';
import '../State/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<Plus>((event, emit) => emit(CalculatorState(result: event.a + event.b)));
    on<Minus>(
      (event, emit) => emit(CalculatorState(result: event.a - event.b)),
    );
    on<Multiply>(
      (event, emit) => emit(CalculatorState(result: event.a * event.b)),
    );
    on<Division>((event, emit) {
      final divisor = event.b == 0.0 ? 0.0 : event.b;
      final result = divisor == 0.0 ? 0.0 : (event.a / divisor);
      emit(CalculatorState(result: result));
    });
    on<Reset>((event, emit) => emit(CalculatorState(result: 0.0)));
  }
}

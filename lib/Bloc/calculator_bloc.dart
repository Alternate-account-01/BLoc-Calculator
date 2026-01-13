import 'package:flutter_bloc/flutter_bloc.dart';
import '../Events/Calculator_event.dart';
import '../State/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(Theothercalculator()) {
    on<Plus>((e, emit) {
      emit(CalculatorSuccess(e.a + e.b));
    });

    on<Minus>((e, emit) {
      emit(CalculatorSuccess(e.a - e.b));
    });

    on<Multiply>((e, emit) {
      emit(CalculatorSuccess(e.a * e.b));
    });

    on<Division>((e, emit) {
      if (e.b == 0) {
        emit(CalculatorError("You Can't divide by zero dawgg"));
      } else {
        emit(CalculatorSuccess(e.a / e.b));
      }
    });

    on<Reset>((e, emit) {
      emit(Theothercalculator());
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/Calculator_BLoC.dart';
import '../Events/Calculator_event.dart';
import '../State/calculator_state.dart';
import 'package:flutter/services.dart';

class SecondCalculatorPage extends StatefulWidget {
  const SecondCalculatorPage({super.key});

  @override
  State<SecondCalculatorPage> createState() => _SecondCalculatorPageState();
}

class _SecondCalculatorPageState extends State<SecondCalculatorPage> {
  final TextEditingController angka1 = TextEditingController();
  final TextEditingController angka2 = TextEditingController();

  double get a => double.tryParse(angka1.text) ?? 0;
  double get b => double.tryParse(angka2.text) ?? 0;

  @override
  void dispose() {
    angka1.dispose();
    angka2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator (BLoC)'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: angka1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Input angka 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: angka2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Input angka 2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            Row(
              children: [
                _btn("+", () => context.read<CalculatorBloc>().add(Plus(a, b))),
                _btn(
                  "-",
                  () => context.read<CalculatorBloc>().add(Minus(a, b)),
                ),
                _btn(
                  "×",
                  () => context.read<CalculatorBloc>().add(Multiply(a, b)),
                ),
                _btn(
                  "÷",
                  () => context.read<CalculatorBloc>().add(Division(a, b)),
                ),
              ],
            ),

            const SizedBox(height: 20),


            Expanded(
              child: Center(
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    if (state is CalculatorError) {
                      return Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    }

                    if (state is CalculatorSuccess) {
                      return Text(
                        "HASIL : ${state.result}",
                        style: const TextStyle(fontSize: 26),
                      );
                    }

                    return const Text(
                      "HASIL : 0",
                      style: TextStyle(fontSize: 26),
                    );
                  },
                ),
              ),
            ),

            Center(
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {

                  String displayValue = "0";
                  Color textColor = Colors.black;

                  if (state is CalculatorSuccess) {
                    displayValue = state.result.toString();
                  } else if (state is CalculatorError) {
                    displayValue = "Error";
                    textColor = Colors.red;
                  }

                  return Text(
                    displayValue,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                angka1.clear();
                angka2.clear();
                context.read<CalculatorBloc>().add(const Reset());
              },
              child: const Text("RESET"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn(String label, VoidCallback onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(onPressed: onTap, child: Text(label)),
      ),
    );
  }
}

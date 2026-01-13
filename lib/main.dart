import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_semester/Pages/second_calculator_page.dart';
import 'Bloc/Calculator_BLoC.dart';

void main() {
  runApp(    BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:  SecondCalculatorPage(),
      ),
    );
  }
}

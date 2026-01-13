// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../Bloc/Calculator_BLoC.dart';
// import '../Events/Calculator_event.dart';
// import '../State/calculator_state.dart';
// import 'package:flutter/services.dart';

// class CalculatorPage extends StatelessWidget {
//   CalculatorPage({super.key});

//   final TextEditingController _controller = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Calculator (BLoC)'), centerTitle: true),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _controller,
//                       keyboardType: const TextInputType.numberWithOptions(
//                         decimal: true,
//                       ),
//                       decoration: const InputDecoration(hintText: 'Angka 1'),
//                       inputFormatters: [
//                         FilteringTextInputFormatter.allow(RegExp(r'^\d.?\d*')),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16),

//                   Expanded(
//                     child: TextField(
//                       controller: _controller2,
//                       keyboardType: const TextInputType.numberWithOptions(
//                         decimal: true,
//                       ),
//                       decoration: const InputDecoration(hintText: 'Angka 2'),
//                       inputFormatters: [
//                         FilteringTextInputFormatter.allow(RegExp(r'^\d.?\d*')),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => context.read<CalculatorBloc>().add(
//                         Plus(
//                           double.tryParse(_controller.text.trim()) ?? 0.0,
//                           double.tryParse(_controller2.text.trim()) ?? 0.0,
//                         ),
//                       ),
//                       child: const Text('+'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => context.read<CalculatorBloc>().add(
//                         Minus(
//                           double.tryParse(_controller.text.trim()) ?? 0.0,
//                           double.tryParse(_controller2.text.trim()) ?? 0.0,
//                         ),
//                       ),
//                       child: const Text('-'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => context.read<CalculatorBloc>().add(
//                         Multiply(
//                           double.tryParse(_controller.text.trim()) ?? 0.0,
//                           double.tryParse(_controller2.text.trim()) ?? 0.0,
//                         ),
//                       ),
//                       child: const Text('*'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => context.read<CalculatorBloc>().add(
//                         Division(
//                           double.tryParse(_controller.text.trim()) ?? 0.0,
//                           double.tryParse(_controller2.text.trim()) ?? 0.0,
//                         ),
//                       ),
//                       child: const Text('/'),
//                     ),
//                   ],
//                 ),
//               ),

//               Center(
//                 child: BlocBuilder<CalculatorBloc, CalculatorState>(
//                   builder: (context, state) => Text(
//                     '${state.result}',
//                     style: const TextStyle(fontSize: 32),
//                   ),
//                 ),
//               ),

//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           _controller.clear();
//                           _controller2.clear();
//                           context.read<CalculatorBloc>().add(const Reset());
//                         },
//                         child: const Text('Reset'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

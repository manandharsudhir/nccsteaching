import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providers/state_provider_example.dart';
import 'package:statemanagement/screens/screen_two.dart';

// class ScreenOne extends StatefulWidget {
//   const ScreenOne({super.key, required this.title});

//   final String title;

//   @override
//   State<ScreenOne> createState() => _ScreenOneState();
// }

// class _ScreenOneState extends State<ScreenOne> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//               style: TextStyle(fontSize: 32),
//             ),
//             Text(
//               '$_counter',
//               style: TextStyle(
//                 fontSize: 40,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ScreenTwo(
//                       title: "Screen Two",
//                       counter: _counter,
//                     ),
//                   ),
//                 );
//               },
//               child: Text(
//                 'Go to Screen Two',
//                 style: TextStyle(fontSize: 32),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class ScreenOne extends ConsumerWidget {
  const ScreenOne({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterStateProvider);
    final todoState = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (todoState.map((e) => e.toJson()).toString()),
              style: TextStyle(fontSize: 32),
            ),
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              counterState.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenTwo(
                      title: "Screen Two",
                    ),
                  ),
                );
              },
              child: Text(
                'Go to Screen Two',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

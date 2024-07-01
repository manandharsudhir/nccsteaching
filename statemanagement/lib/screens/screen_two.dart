import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/model/todo_model.dart';
import 'package:statemanagement/providers/state_provider_example.dart';

class ScreenTwo extends ConsumerWidget {
  const ScreenTwo({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoProvider.notifier).state.add(
                TodoModel(
                  title: counterState.toString(),
                ),
              );

          // ref.read(todoProvider.notifier).state.add(TodoModwl)
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

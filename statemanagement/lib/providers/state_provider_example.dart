import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/model/todo_model.dart';

// final counterStateProvider = StateProvider<int>((ref) => 0);

final todoProvider = StateProvider<List<TodoModel>>((ref) => []);

// final counterStateProvider = StateNotifierProvider<CounterStateProvider, int>(
//     (ref) => CounterStateProvider());

// class CounterStateProvider extends StateNotifier<int> {
//   CounterStateProvider() : super(0);

//   void increment() {
//     print(state);
//     state = state + 1;
//   }

//   void decrement() {
//     print(state);
//     state = state - 1;
//   }
// }

final counterStateProvider =
    ChangeNotifierProvider<CounterStateProvider>((ref) {
  return CounterStateProvider();
});

class CounterStateProvider extends ChangeNotifier {
  CounterStateProvider();

  int counterValue = 0;
  int newCounterValue = 0;

  void incrementNew() {
    newCounterValue = newCounterValue + 1;
  }

  void increment() {
    counterValue = counterValue + 1;
    notifyListeners();
  }

  void decrement() {
    counterValue = counterValue - 1;
    notifyListeners();
  }
}

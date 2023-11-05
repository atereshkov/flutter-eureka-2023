import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}

/*
class CounterCubitTest extends Cubit<CounterCubitStateTest> {
  CounterCubitTest() : super(const CounterCubitStateTest(0));

  /// Add 1 to the current state.
  void increment() => emit(CounterCubitStateTest(state.counter + 1));

  /// Subtract 1 from the current state.
  void decrement() => emit(CounterCubitStateTest(state.counter + 1));
}

class CounterCubitStateTest {
  final int counter;
  const CounterCubitStateTest(this.counter);
}
*/
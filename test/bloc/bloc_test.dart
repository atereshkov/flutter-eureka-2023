import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_dive_back/counter_bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('initial', () {
    test('initial state is 0', () {
      expect(CounterBloc().state, const CounterInitial(0));
    });
  });

  group('increment', () {
    blocTest<CounterBloc, CounterState>(
      'emits [1] when state is 0',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => const <UpdateState>[UpdateState(1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [1, 2] when state is 0 and invoked twice',
      build: CounterBloc.new,
      act: (bloc) => bloc
        ..add(IncrementEvent())
        ..add(IncrementEvent()),
      expect: () => const <CounterState>[UpdateState(1), UpdateState(2)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [42] when state is 41',
      build: CounterBloc.new,
      seed: () => const UpdateState(41),
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => const <CounterState>[UpdateState(42)],
    );
  });

  group('decrement', () {
    blocTest<CounterBloc, CounterState>(
      'emits [-1] when state is 0',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => const <UpdateState>[UpdateState(-1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [-1, -2] when state is 0 and invoked twice',
      build: CounterBloc.new,
      act: (bloc) => bloc
        ..add(DecrementEvent())
        ..add(DecrementEvent()),
      expect: () => const <UpdateState>[UpdateState(-1), UpdateState(-2)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [42] when state is 43',
      build: CounterBloc.new,
      seed: () => const UpdateState(43),
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => const <CounterState>[UpdateState(42)],
    );
  });
}
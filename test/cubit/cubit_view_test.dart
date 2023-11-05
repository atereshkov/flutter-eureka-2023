import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dive_back/counter_cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

const _incrementButtonKey = Key('counterView_increment_floatingActionButton');
const _decrementButtonKey = Key('counterView_decrement_floatingActionButton');

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
  });

  testWidgets('Renders page title', (tester) async {
    when(() => counterCubit.state).thenReturn(100);
    const title = 'Counter View Cubit';

    await tester.pumpApp(counterCubit, title: title);
    
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Renders current CounterCubit state', (tester) async {
    when(() => counterCubit.state).thenReturn(100);

    await tester.pumpApp(counterCubit);
    
    expect(find.text('100'), findsOneWidget);
  });

  testWidgets('Tapping increment button invokes increment', (tester) async {
    when(() => counterCubit.state).thenReturn(0);
    when(() => counterCubit.increment()).thenReturn(null);

    await tester.pumpApp(counterCubit);

    await tester.tap(find.byKey(_incrementButtonKey));
    verify(() => counterCubit.increment()).called(1);
  });

  testWidgets('Tapping decrement button invokes decrement', (tester) async {
    when(() => counterCubit.state).thenReturn(0);
    when(() => counterCubit.decrement()).thenReturn(null);

    await tester.pumpApp(counterCubit);

    await tester.tap(find.byKey(_decrementButtonKey));
    verify(() => counterCubit.decrement()).called(1);
  });
}

extension on WidgetTester {
  Future<void> pumpApp(CounterCubit cubit, { String title = 'Title'}) async {
    await pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: CounterViewCubit(title: title),
        ),
      ),
    );
  }
}
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dive_back/counter_bloc/counter_bloc.dart';
import 'package:flutter_dive_back/counter_bloc/view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

const _incrementButtonKey = Key('counterView_increment_floatingActionButton');
const _decrementButtonKey = Key('counterView_decrement_floatingActionButton');

class MockCounterBloc extends MockBloc<CounterEvent, CounterState> implements CounterBloc {}

void main() {
  late CounterBloc counterBloc;

  setUp(() {
    counterBloc = MockCounterBloc();
  });

  testWidgets('Renders page title', (tester) async {
    when(() => counterBloc.state).thenReturn(const CounterInitial(100));
    const title = 'Counter View Cubit';

    await tester.pumpApp(counterBloc, title: title);
    
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Renders current CounterCubit state', (tester) async {
    when(() => counterBloc.state).thenReturn(const CounterInitial(100));

    await tester.pumpApp(counterBloc);
    
    expect(find.text('100'), findsOneWidget);
  });

  testWidgets('Tapping increment button invokes increment', (tester) async {
    when(() => counterBloc.state).thenReturn(const CounterInitial(0));
    // when(() => counterBloc.add(IncrementEvent())).thenReturn(null);

    await tester.pumpApp(counterBloc);

    await tester.tap(find.byKey(_incrementButtonKey));
    verify(() => counterBloc.add(IncrementEvent())).called(1);
  });

  testWidgets('Tapping decrement button invokes decrement', (tester) async {
    when(() => counterBloc.state).thenReturn(const CounterInitial(0));
    // when(() => counterBloc.add(DecrementEvent())).thenReturn(null);

    await tester.pumpApp(counterBloc);

    await tester.tap(find.byKey(_decrementButtonKey));
    verify(() => counterBloc.add(DecrementEvent())).called(1);
  });
}

extension on WidgetTester {
  Future<void> pumpApp(CounterBloc bloc, { String title = 'Title'}) async {
    await pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: CounterViewBloc(title: title),
        ),
      ),
    );
  }
}
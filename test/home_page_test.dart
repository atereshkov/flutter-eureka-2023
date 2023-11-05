import 'package:flutter/material.dart';
import 'package:flutter_dive_back/counter_bloc/counter_bloc.dart';
import 'package:flutter_dive_back/counter_cubit/counter_cubit.dart';
import 'package:flutter_dive_back/counter_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

const _homeCubitButtonKey = Key('home_button_cubit');
const _homeBlocButtonKey = Key('home_button_bloc');

void main() {
  testWidgets('Renders page title', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterHomePage()));
    expect(find.text('Counter Home'), findsOneWidget);
  });

  group('Cubit button', () {
    testWidgets('Renders Cubit button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterHomePage()));
      expect(find.byKey(_homeCubitButtonKey), findsOneWidget);
    });

    testWidgets('Tapping Cubit button renders Cubit page', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterHomePage()));
      await tester.tap(find.byKey(_homeCubitButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(CounterPageCubit), findsOneWidget);
    });
  });

  group('Bloc button', () {
    testWidgets('Renders Bloc button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterHomePage()));
      expect(find.byKey(_homeBlocButtonKey), findsOneWidget);
    });

    testWidgets('Tapping Bloc button renders Cubit page', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterHomePage()));
      await tester.tap(find.byKey(_homeBlocButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(CounterPageBloc), findsOneWidget);
    });
  });
}

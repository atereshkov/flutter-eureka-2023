import 'package:flutter/material.dart';
import 'package:flutter_dive_back/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

const _homeCubitButtonKey = Key('home_button_cubit');
const _homeBlocButtonKey = Key('home_button_bloc');

void main() {
  group('CounterApp', () {
    testWidgets('renders correct AppBar text', (tester) async {
      await tester.pumpApp();

      expect(find.text('Counter Home'), findsOneWidget);
    });
  });

  group('Counter Cubit', () {
    testWidgets('renders correct initial count', (tester) async {
      await tester.pumpApp();
      
      await tester.tap(find.byKey(_homeCubitButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('tapping increment button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.tap(find.byKey(_homeCubitButtonKey));
      await tester.pumpAndSettle();

      await tester.incrementCounter();
      expect(find.text('1'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('2'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping decrement button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.tap(find.byKey(_homeCubitButtonKey));
      await tester.pumpAndSettle();

      await tester.decrementCounter();
      expect(find.text('-1'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-2'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-3'), findsOneWidget);
    });
  });

  group('Counter Bloc', () {
    testWidgets('renders correct initial count', (tester) async {
      await tester.pumpApp();
      
      await tester.tap(find.byKey(_homeBlocButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('tapping increment button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.tap(find.byKey(_homeBlocButtonKey));
      await tester.pumpAndSettle();

      await tester.incrementCounter();
      expect(find.text('1'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('2'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping decrement button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.tap(find.byKey(_homeBlocButtonKey));
      await tester.pumpAndSettle();

      await tester.decrementCounter();
      expect(find.text('-1'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-2'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-3'), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }

  Future<void> incrementCounter() async {
    await tap(find.byKey(const Key('counterView_increment_floatingActionButton')));
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(find.byKey(const Key('counterView_decrement_floatingActionButton')));
    await pump();
  }
}
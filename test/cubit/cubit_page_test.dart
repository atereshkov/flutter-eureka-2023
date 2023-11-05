import 'package:flutter/material.dart';
import 'package:flutter_dive_back/counter_cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Page is a StatelessWidget', (tester) async {
    expect(const CounterPageCubit(title: ''), isA<StatelessWidget>());
  });

  testWidgets('Renders CounterViewCubit', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterPageCubit(title: '')));
    expect(find.byType(CounterViewCubit), findsOneWidget);
  });
}

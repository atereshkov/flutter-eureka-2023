import 'package:flutter/material.dart';
import 'package:flutter_dive_back/counter_bloc/page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Page is a StatelessWidget', (tester) async {
    expect(const CounterPageBloc(title: ''), isA<StatelessWidget>());
  });

  testWidgets('Renders CounterViewCubit', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterPageBloc(title: '')));
    expect(find.byType(CounterPageBloc), findsOneWidget);
  });
}

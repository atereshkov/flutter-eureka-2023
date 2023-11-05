import 'package:flutter/material.dart';
import 'package:flutter_dive_back/app.dart';
import 'package:flutter_dive_back/counter_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App is a StatelessWidget', (tester) async {
    expect(const CounterApp(), isA<StatelessWidget>());
  });

  testWidgets('Renders CounterHomePage', (tester) async {
    await tester.pumpWidget(const CounterApp());
    expect(find.byType(CounterHomePage), findsOneWidget);
  });
}

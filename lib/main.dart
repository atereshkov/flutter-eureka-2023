import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'counter_cubit/observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
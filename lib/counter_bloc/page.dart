import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view.dart';
import 'bloc.dart';

class CounterPageBloc extends StatelessWidget {
  const CounterPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterViewBloc(),
    );
  }
}

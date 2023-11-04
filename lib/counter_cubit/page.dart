import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view.dart';
import 'cubit.dart';

class CounterPageCubit extends StatelessWidget {
  const CounterPageCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterViewCubit(),
    );
  }
}

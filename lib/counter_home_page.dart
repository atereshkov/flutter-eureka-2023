import 'package:flutter/material.dart';
import 'package:flutter_dive_back/counter_cubit/counter_cubit.dart';
import 'package:flutter_dive_back/counter_bloc/counter_bloc.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key('home_button_cubit'),
              child: const Text('Counter Cubit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterPageCubit(title: 'Counter Cubit')),
                );
              },
            ),
            ElevatedButton(
              key: const Key('home_button_bloc'),
              child: const Text('Counter BLoC'),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterPageBloc(title: 'Counter Bloc')),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}

part of 'bloc.dart';

@immutable
sealed class CounterState {
  final int counter;
  const CounterState(this.counter);
}

final class CounterInitial extends CounterState {
  const CounterInitial(int counter) : super(counter);
}

final class UpdateState extends CounterState {
  const UpdateState(int counter) : super(counter);
}
part of 'bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial(int counter) : super(counter);
}

final class UpdateState extends CounterState {
  const UpdateState(int counter) : super(counter);
}
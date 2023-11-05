part of 'bloc.dart';

@immutable
sealed class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
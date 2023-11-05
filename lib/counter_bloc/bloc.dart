import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<IncrementEvent>((event, emit) => emit(UpdateState(state.counter + 1)));
    on<DecrementEvent>((event, emit) => emit(UpdateState(state.counter - 1)));
  }
}

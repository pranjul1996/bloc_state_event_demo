import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterEvent>(_init);
    on<UpdateCounterOnClick>(_updateCounter);
  }

  void _init(CounterEvent event, Emitter<CounterState> emit) {}

  void _updateCounter(UpdateCounterOnClick event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterUpdate: (event.counterUpdate) + 1));
  }
}

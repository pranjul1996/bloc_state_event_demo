part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  int counterUpdate;

  CounterState({this.counterUpdate=0});

  @override
  List<Object> get props => [counterUpdate];

  CounterState copyWith({required int? counterUpdate}) =>
      CounterState(counterUpdate: counterUpdate ?? this.counterUpdate);
}

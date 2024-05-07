part of 'counter_bloc.dart';

 class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class UpdateCounterOnClick extends CounterEvent {
   int counterUpdate;
   UpdateCounterOnClick(this.counterUpdate);

  @override
  List<Object> get props => [counterUpdate];
}

part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent{
  @override

  List<Object?> get props => [];
}

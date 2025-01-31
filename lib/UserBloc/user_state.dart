part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  List<UserModel> users;

  UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  String error;

  UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}

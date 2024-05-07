import 'package:bloc/bloc.dart';
import 'package:bloc_demo/user_model.dart';
import 'package:bloc_demo/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoadingState()) {
    on<LoadUserEvent>(_loadUserList);
  }

  _loadUserList(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final apiResult = await UserRepository().getUsers();

      emit(UserLoadedState(apiResult));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}

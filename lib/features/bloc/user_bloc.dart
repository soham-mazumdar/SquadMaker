import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/src/domain/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepository) : super(UserState.initial()) {
    on<GetUsers>(_getUsers);
    on<AddToTeam>(_addToTeam);
    on<RemoveFromTeam>(_removeFromTeam);
    on<SelecteUser>(_selecteUser);
    on<UnselectUser>(_unselectUser);
  }

  final UserRepository userRepository;

  FutureOr<void> _unselectUser(event, emit) {
    emit(state.copyWith(selectedUser: null));
  }

  FutureOr<void> _selecteUser(event, emit) {
    emit(state.copyWith(selectedUser: event.userModel));
  }

  FutureOr<void> _removeFromTeam(event, emit) {
    final myTeam = state.myTeam.where((element) => true).toList();
    myTeam.removeWhere((element) => element.id == event.userModel.id);
    emit(state.copyWith(myTeam: myTeam));
  }

  FutureOr<void> _addToTeam(event, emit) async {
    final myTeam = state.myTeam.where((element) => true).toList();
    myTeam.add(event.userModel);
    emit(state.copyWith(myTeam: myTeam));
  }

  FutureOr<void> _getUsers(event, emit) async {
    emit(state.copyWith(
        apiStatus: state.users.isNotEmpty ? null : ApiStatus.loading));
    final (_, data) = await userRepository.getUsers(event.count.toString(), '');
    if (data != null) {
      log(data.first.name.toString());
      final users = state.users.where((element) => true).toList();
      users.addAll(data);
      emit(state.copyWith(users: users, apiStatus: ApiStatus.success));
    } else {
      emit(state.copyWith(apiStatus: ApiStatus.error));
    }
  }
}

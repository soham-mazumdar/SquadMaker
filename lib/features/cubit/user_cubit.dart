import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/src/domain/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserState.initial());

  final UserRepository userRepository;

  unselectUser() {
    emit(state.copyWith(selectedUser: null));
  }

  selecteUser({required UserModel userModel}) {
    emit(state.copyWith(selectedUser: userModel));
  }

  removeFromTeam({required UserModel userModel}) {
    final myTeam = state.myTeam.where((element) => true).toList();
    myTeam.removeWhere((element) => element.id == userModel.id);
    emit(state.copyWith(myTeam: myTeam));
  }

  addToTeam({required UserModel userModel}) async {
    final myTeam = state.myTeam.where((element) => true).toList();
    myTeam.add(userModel);
    emit(state.copyWith(myTeam: myTeam));
  }

  getUsers({required int count}) async {
    emit(state.copyWith(
        apiStatus: state.users.isNotEmpty ? null : ApiStatus.loading));
    final (_, data) = await userRepository.getUsers('$count', '');
    if (data != null) {
      final users = state.users.where((element) => true).toList();
      users.addAll(data);
      emit(state.copyWith(users: users, apiStatus: ApiStatus.success));
    } else {
      emit(state.copyWith(apiStatus: ApiStatus.error));
    }
  }
}

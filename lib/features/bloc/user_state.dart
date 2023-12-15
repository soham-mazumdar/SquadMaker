part of 'user_bloc.dart';

enum ApiStatus { notInitiated, loading, success, error }

class UserState extends Equatable {
  const UserState({
    required this.users,
    required this.myTeam,
    required this.apiStatus,
    required this.user,
    this.selectedUser,
  });

  final List<UserModel> users;
  final List<UserModel> myTeam;
  final UserModel user;
  final UserModel? selectedUser;
  final ApiStatus apiStatus;

  @override
  List<Object?> get props => [
        myTeam,
        users,
        apiStatus,
        user,
        selectedUser,
      ];

  factory UserState.initial() {
    return UserState(
      users: const [],
      myTeam: const [],
      apiStatus: ApiStatus.notInitiated,
      user: UserModel(),
    );
  }

  UserState copyWith({
    List<UserModel>? users,
    List<UserModel>? myTeam,
    ApiStatus? apiStatus,
    UserModel? user,
    UserModel? selectedUser,
  }) {
    return UserState(
      users: users ?? this.users,
      myTeam: myTeam ?? this.myTeam,
      apiStatus: apiStatus ?? this.apiStatus,
      user: user ?? this.user,
      selectedUser: selectedUser,
    );
  }
}

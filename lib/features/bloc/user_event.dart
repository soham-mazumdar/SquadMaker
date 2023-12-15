part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UserEvent {
  const GetUsers({this.count = 10});

  final int count;
}

class AddToTeam extends UserEvent {
  const AddToTeam({required this.userModel});

  final UserModel userModel;
}

class RemoveFromTeam extends UserEvent {
  const RemoveFromTeam({required this.userModel});

  final UserModel userModel;
}

class SelecteUser extends UserEvent {
  const SelecteUser({required this.userModel});

  final UserModel userModel;
}

class UnselectUser extends UserEvent {}
